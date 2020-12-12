export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export PATH=/home/cjh/anaconda3/bin:$PATH

export JULIA_PKG_SERVER=https://mirrors.tuna.tsinghua.edu.cn/julia

export ZSH="/home/cjh/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='nerdfont-complete'
prompt_zsh_battery_level() {
  local percentage1=`acpi | grep -o '[0-9]*%'`
  local percentage=`echo "${percentage1//\%}"`

  local color='%F{red}'
  local symbol="\uf00d"
  acpi | grep "Discharging" > /dev/null
  if [ $? -eq 0 ]; then
    local charging="false";
  else
    local charging="true";
  fi
  if [ $percentage -le 20 ]
  then symbol='\uf579' ; color='%F{red}' ;
    #10%
  elif [ $percentage -gt 19 ] && [ $percentage -le 30 ]
  then symbol="\uf57a" ; color='%F{red}' ;
    #20%
  elif [ $percentage -gt 29 ] && [ $percentage -le 40 ]
  then symbol="\uf57b" ; color='%F{yellow}' ;
    #35%
  elif [ $percentage -gt 39 ] && [ $percentage -le 50 ]
  then symbol="\uf57c" ; color='%F{yellow}' ;
    #45%
  elif [ $percentage -gt 49 ] && [ $percentage -le 60 ]
  then symbol="\uf57d" ; color='%F{blue}' ;
    #55%
  elif [ $percentage -gt 59 ] && [ $percentage -le 70 ]
  then symbol="\uf57e" ; color='%F{blue}' ;
    #65%
  elif [ $percentage -gt 69 ] && [ $percentage -le 80 ]
  then symbol="\uf57f" ; color='%F{blue}' ;
    #75%
  elif [ $percentage -gt 79 ] && [ $percentage -le 90 ]
  then symbol="\uf580" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 89 ] && [ $percentage -le 99 ]
  then symbol="\uf581" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 98 ]
  then symbol="\uf578" ; color='%F{green}' ;
    #100%
  fi
  if [ $charging = "true" ];
  then color='%F{green}'; if [ $percentage -gt 98 ]; then symbol='\uf584'; fi
  fi
  echo -n "%F{white}\uE0B3 %{$color%}$symbol %F{white}$percentage%% " ;
}

prompt_zsh_internet_signal(){
  local symbol="\uf7ba"
  local strength=`iwconfig wlp7s0 | grep -i "link quality" | grep -o "[0-9]*/[0-9]*"`
  
  echo -n "%F{white}\uE0B3 $symbol $strength"
}


prompt_codetalk() {
    local content='\uF17C Pop!os'
    $1_prompt_segment "$0" "$2" "black" "white" "$content" "#"
}



POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%I:%M  \UF133  %m.%d.%y}"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='orange'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_HIDE_TAGS='false'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='white'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
POWERLEVEL9K_CUSTOM_BATTERY_STATUS="prompt_zsh_battery_level"
POWERLEVEL9K_CUSTOM_BATTERY_STATUS_BACKGROUND='blue'
POWERLEVEL9K_CUSTOM_BATTERY_STATUS_BACKGROUND='black'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(codetalk context custom_internet_signal  ssh root_indicator dir dir_writable vcs)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context custom_internet_signal  ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time  status  custom_battery_status_joined zsh_internet_signal time)
HIST_STAMPS="dd/mm/yyyy"
DISABLE_UPDATE_PROMPT=true
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='purple'

POWERLINE9K_CODETALK_DEFAULT_BACKGROUND='black'
POWERLINE9K_CODETALK_DEFAULT_FOREGROUND='red'

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias add="sudo apt install"
alias yF="youtube-dl -F"
alias yf="youtube-dl -f"
alias yd="youtube-dl"
alias ui="sudo apt remove"
alias in="sudo apt dpkg -i"
