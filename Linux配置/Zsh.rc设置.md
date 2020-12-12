## Zsh.rc设置

```
sudo apt install -y zsh
sudo usermod -s /usr/bin/zsh $(whoami)
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```
sudo apt install acpi
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```
POWERLEVEL9K_MODE='nerdfont-complete'
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export PATH=/home/cjh/anaconda3/bin:$PATH

alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias add="sudo apt install"
alias yF="youtube-dl -F"
alias yf="youtube-dl -f"
alias yd="youtube-dl"
alias ui="sudo apt remove"
alias in="sudo apt dpkg -i"

export ZSH="/home/cjh/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
```

