[TOC]

# Fusuma设置

## 安装

### 一键安装

```
sudo gpasswd -a $USER input && sudo apt-get install libinput-tools && sudo apt-get install ruby && sudo apt-get install xdotool && sudo gem install fusuma && mkdir ~/.config/fusuma 
cp config_pop.yml ~/.config/fusuma/config.yml	#pop!os系统
重启系统
```



```
sudo gpasswd -a $USER input
#重启系统
sudo apt-get install libinput-tools
sudo apt-get install ruby
sudo apt-get install xdotool
sudo gem install fusuma
mkdir ~/.config/fusuma
vim ~/.config/fusuma/config.yml

创建桌面图标
cd /usr/share/applications &&
sudo touch fusuma.desktop
cd /usr/share/applications &&
sudo gedit fusuma.desktop

#文件内容
[Desktop Entry]
Encoding=UTF-8
Name=fusuma
Comment=fusuma
# 你的fusuma的路径，可通过终端命令 `which fusuma`找到
Exec=/usr/local/bin/fusuma
# 这里是你的fusuma的图标，随便找一个就行
Icon=/usr/share/icons/fusuma.png
# 软件打开时是否启动终端，这里选择false
Terminal=false  
StartupNotify=false
Type=Application
Categories=Application;Development;
```

## Pop!os配置

```
swipe:
  4:
    up:
      command: 'xdotool key ctrl+super+Up'
    down:
      command: 'xdotool key ctrl+super+Down'
    right:
      command: 'xdotool key super+x'
  3:
    up:
      command: 'xdotool key Shift+super+Up'
    down:
      command: 'xdotool key Shift+super+Down'
    left:
      command: 'xdotool key super+a'
    right:
      command: 'xdotool key super+d'
pinch:
    in:
      command: 'xdotool key ctrl+plus'  
    out:
      command: 'xdotool key ctrl+minus'
rotate:
  3:
    clockwise:
      command: 'xdotool key alt+u'
    counterclockwise:
      command: 'xdotool key alt+d'
  4:
    clockwise:
      command: 'xdotool key function+F6'
    counterclockwise:
      command: 'xdotool key function+F5'

```


## Manjaro配置

```
swipe:
  4:
    up:
      command: 'xdotool key ctrl+Shift+Right'
    down:
      command: 'xdotool key ctrl+Shift+Left'
    left:
      command: 'xdotool key super+ctrl+Left'
    right:
      command: 'xdotool key super+ctrl+Right'
  3:
    up:
      command: 'xdotool key Alt+Right'
    down:
      command: 'xdotool key Alt+Left'
    left:
      command: 'xdotool key super+Shift+Left'
    right:
      command: 'xdotool key super+Shift+Right'
pinch:
    in:
        command: 'xdotool key ctrl+plus'
        threshold: 0.1     
    out:
        command: 'xdotool key ctrl+minus'
        threshold: 0.1
threshold:
  swipe: 0.8
  pinch: 1
interval:
  swipe: 0.8
  pinch: 1
```