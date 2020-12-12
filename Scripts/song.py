# 获取歌曲详情 http://localhost:3000/song/detail?ids=5392305
# 获取歌词 http://localhost:3000/lyric?id=60263
# 获取歌单详情 http://localhost:3000/playlist/detail?id=557581476
# 歌曲url http://localhost:3000/song/url?id=29769021
# 音乐是否可用 http://localhost:3000/check/music?id=557581476

import aiohttp
from aiofile import async_open
import asyncio
from mutagen.mp3 import MP3
from mutagen.id3 import ID3, APIC, error, TIT2, TPE1, TALB
import datetime

store_path = './music/'
id = 769897720
url = f'http://127.0.0.1:3000/playlist/detail?id={id}'

#  [歌曲ID，]
async def get_songs_ls(url):
    async with aiohttp.ClientSession() as session, session.get(url) as response:
        response = await response.json()
        return [song_id['id'] for song_id in response['playlist']['trackIds']]



# (歌曲ID，文件名，歌曲名，歌手，专辑名，专辑图片地址)
async def get_song_info(song_id):
    url = f'http://localhost:3000/song/detail?ids={song_id}'
    async with aiohttp.ClientSession() as session, session.get(url) as response:
        response = await response.json()
        name = response['songs'][0]['name']
        ar = '、'.join([ar['name'] for ar in response['songs'][0]['ar']])
        album = response['songs'][0]['al']['name']
        album_url = response['songs'][0]['al']['picUrl']
        filename = name + ' - ' + ar
        return song_id, filename, name, ar, album, album_url


# 完成歌词格式转换、保存
async def lyric_dl(info):
    song_id, filename = info[0], info[1]
    url = f'http://localhost:3000/lyric?id={song_id}'
    async with aiohttp.ClientSession() as session, session.get(url) as response,\
        async_open(store_path+filename+'.lrc', 'w') as fo:
        response = await response.json()
        lyric = '\n'.join([l[:9]+l[10:] if (l[9:10]!=']') else l for l in response['lrc']['lyric'].split('\n')])
        lyric = '\n'.join([l[:6] + '.' + l[7:] if l[6:7] != '.' else l for l in lyric.split('\n')])
        await fo.write(lyric)

# [歌曲地址，文件名，歌曲名，歌手，专辑名，专辑图片地址]
async def get_song_url(info):
    song_id = info[0]
    url = f'http://localhost:3000/song/url?id={song_id}'
    async with aiohttp.ClientSession() as session, session.get(url) as response:
        response = await response.json()
        song_url = response['data'][0]['url']
        return song_url, *info[1:]


# [文件名，歌曲名，歌手，专辑名，专辑图片地址]
async def music_dl(info):
    url, filename, album_url = info[0], info[1], info[-1]
    if url != None:
        async with aiohttp.ClientSession() as session, session.get(url) as response,\
        async_open(store_path+filename+'.mp3', 'wb') as fo:
            music = await response.read()
            await fo.write(music)
            return info[1:]


# 完成专辑嵌入
async def set_cover(info):
    if info != None:
        filename, name, ar, album, album_url = info
        async with aiohttp.ClientSession() as session:
            async with session.get(album_url) as response:
                picture = await response.read()
        audio = MP3(store_path + filename+'.mp3', ID3=ID3)
        try:
            audio.add_tags()
        except error:
            pass
        audio.tags.add(
            APIC(
                encoding = 3,           # 3 is for utf-8
                mime     = 'image/png', # image/jpeg or image/png
                type     = 3,           # 3 is for the cover image
                desc     = u'Cover',
                data     = picture
            )
        )
        audio.tags.add(
            TIT2(
                encoding=3, 
                text=name)
        )
        audio.tags.add(
            TPE1(
                encoding=3, 
                text=ar
                )
        )
        audio.tags.add(
            TALB(encoding=3, 
            text=album)
        )
        audio.save()
    
start = datetime.datetime.now()
async def main(url):
    song_ls = await get_songs_ls(url)
    song_info = await asyncio.gather(*[get_song_info(song_id) for song_id in song_ls])
    song_url_ls = await asyncio.gather(*[get_song_url(info) for info in song_info])
    await asyncio.gather(*[lyric_dl(info) for info in song_info])
    cover_info_ls = await asyncio.gather(*[music_dl(info) for info in song_url_ls])
    await asyncio.gather(*[set_cover(info) for info in cover_info_ls])

asyncio.run((main(url)))




end = datetime.datetime.now()
print(f'Running time: {end-start} Seconds')