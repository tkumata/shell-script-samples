#!/bin/bash
#
#
#

function common_linux {
  alias ls='ls -F --color=auto'
  alias grep='grep --color=auto'
  alias free='free -h -l -t'

  # get top process eating memory
  alias psmem='ps auxf | sort -nr -k 4'
  alias psmem10='ps auxf | sort -nr -k 4 | head -10'

  # get top process eating cpu
  alias pscpu='ps auxf | sort -nr -k 3'
  alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

  # Get server cpu info
  alias cpuinfo='lscpu'

  # older system use /proc/cpuinfo
  alias cpuproc='cat /proc/cpuinfo'
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
}

# Mac
function mac {
  export CLICOLOR=1
  export LSCOLORS=CxFxCxDxBxegedabagacad

  alias ls='ls -FG'
  alias brew-update='brew update && brew upgrade'
  alias brew-clean='brew cleanup && brew cleanup --prune 7 && brew autoremove'
}

# Detect Linux distribution
function linux {
  common_linux

  if [ -n "$(command -v yum)" ]; then
    redhat
  elif [ -n "$(command -v apt)" ]; then
    debian
  fi

  if [ -n "$(command -v vcgencmd)" ]; then
    raspberrypi
  fi
}

# Detect OS
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)     linux;;
  Darwin*)    mac;;
  *)          echo "Unknown"
esac


##################
# common settings
##################
export EDITOR=vim
export VIEWER=less

# golang
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export GOPATH="$GOROOT/bin"

# key bindings
bind '"\e[A":history-search-backward'
bind '"\e[0A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\e[0B":history-search-forward'

# get storage remaining
alias df='df -H'
alias du='du -ch'
