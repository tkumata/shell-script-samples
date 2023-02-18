#!/bin/bash

export EDITOR=vim
export VIEWER=less

bind '"\e[A":history-search-backward'
bind '"\e[0A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\e[0B":history-search-forward'
