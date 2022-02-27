#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='grep --color=auto'
alias egrep='grep --color=auto'

# open images with feh scaled properly
alias feh='feh --scale-down --auto-zoom'

# alias vi to vim
alias vi=vim

# 01;36 light cyan, 01;34 light blue (same as ls) 00;34 blue
# https://bashrcgenerator.com/
PS1='[\[\033[01;34m\]\u@\h\[\033[00m\] \W]\$ '

alias shutdown='shutdown now'

# Added a mkcd function
function mkcd {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]; then
    echo "Enter a directory name"
  elif [ -d $last ]; then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}
