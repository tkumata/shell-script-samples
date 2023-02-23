#!/bin/bash

export EDITOR=vim
export VIEWER=less

bind '"\e[A":history-search-backward'
bind '"\e[0A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\e[0B":history-search-forward'

# ls colors
export CLICOLOR=1
export LSCOLORS=CxBxhxDxfxhxhxhxhxcxcx
