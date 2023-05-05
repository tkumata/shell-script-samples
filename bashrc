#!/bin/bash
#
# cd ~/Developer
# git clone git@github.com:tkumata/shell-script-samples.git
# vi ~/.bashrc
# ---
# source $HOME/shell-script-samples/bashrc
# ---
#

function common_linux {
  alias ls='ls -F --color=auto'
  alias free='free -h -l -t'

  # get top process eating memory
  alias psmem='ps auxf | sort -nr -k 4'
  alias psmem10='ps auxf | sort -nr -k 4 | head -10'

  # get top process eating cpu
  alias pscpu='ps auxf | sort -nr -k 3'
  alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

  # get server cpu info
  alias cpuinfo='lscpu'

  # older system use /proc/cpuinfo
  alias cpuproc='cat /proc/cpuinfo'

  # pip update
  alias pip-update='sudo pip-review --auto'
}

# RedHat system
function redhat {
  alias pkg-update='sudo yum update && sudo yum upgrade'
}

# Debian system
function debian {
  alias pkg-update='sudo apt -y update && sudo apt upgrade'
  alias pkg-clean='sudo apt -y autoclean && sudo apt -y autoremove'
}

# Raspberry Pi
function raspberrypi {
  alias gputemp='vcgencmd measure_temp'
  alias cputemp='cat /sys/class/thermal/thermal_zone0/temp'
  alias goenvup='cd ~/.goenv && git fetch --all && git pull && cd'
}

# Mac
function mac {
  export CLICOLOR=1
  export LSCOLORS=CxFxCxDxBxegedabagacad

  alias ls='ls -FG'
  alias pkg-update='brew update && brew upgrade'
  alias pkg-clean='brew cleanup && brew cleanup --prune 7 && brew autoremove'
  alias brewsl='brew services list'
  alias brewlv='brew leaves'
  alias sim='open -a Simulator'
  alias reset-pad='defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'
  alias reset-show='defaults write com.apple.dock show-recent-count -int 3; killall Dock'
  alias reset-dock='defaults delete com.apple.dock; killall Dock'
  alias reset-dns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
}

# Detect Linux distribution
function linux {
  common_linux

  if [ -n "$(command -v yum)" ]; then
    redhat
  fi

  if [ -n "$(command -v apt)" ]; then
    debian
  fi

  if [ -n "$(command -v vcgencmd)" ]; then
    raspberrypi
  fi
}

# Detect OS
unameOut="$(uname -s)"
case "${unameOut}" in
Linux*) linux ;;
Darwin*) mac ;;
*) echo "Unknown" ;;
esac

###################
# common settings
###################
export EDITOR=vim
export VIEWER=less

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
if [ -n "$(command -v goenv)" ]; then
  eval "$(goenv init -)"
fi
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export GO111MODULE=on

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [ -n "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# completes host name when using ssh
if [ -f "$HOME/.ssh/config" ]; then
  complete -W "$(<~/.ssh/config)" ssh
fi

# key bindings
bind '"\e[A":history-search-backward'
bind '"\e[0A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\e[0B":history-search-forward'

# get storage remaining
alias df='df -H'
alias du='du -ch'
alias grep='grep --color=auto'
