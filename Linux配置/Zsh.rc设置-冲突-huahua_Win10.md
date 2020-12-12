## Zsh.rc设置

```
sudo apt install -y zsh
sudo usermod -s /usr/bin/zsh $(whoami)
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
plugins=(git zsh-autosuggestions)

export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export PATH=/home/cjh/anaconda3/bin:$PATH

alias apdate="sudo apt update"
alias upgrade="sudo apt upgrade"
alias add="sudo apt install"
alias yF="youtube-dl -F"
alias yf="youtube-dl -f"
alias yd="youtube-dl"
alias ui="sudo apt remove"
alias in="sudo apt dpkg -i"
```

