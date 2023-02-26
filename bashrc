#!/bin/bash

export EDITOR=nvim
export VIEWER=less
export CLICOLOR=1
export LSCOLORS=CxFxCxDxBxegedabagacad

bind '"\e[A":history-search-backward'
bind '"\e[0A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\e[0B":history-search-forward'
