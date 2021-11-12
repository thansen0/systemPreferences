#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# alias vi to vim
alias vi=vim

# at \u@\h == user@host, number before is color
# 01;36 light cyan, 01;34 light blue (same as ls) 00;34 blue
PS1='[\[\033[01;34m\]\u@\h\[\033[00m\] \W]\$ '
# https://bashrcgenerator.com/
