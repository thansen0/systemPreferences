#! /usr/bin/zsh

BRIGHTGET=$(brightnessctl get)
# brightnessctl max => 255
CUR=$(($BRIGHTGET*100/255))

print -P "%B%F{166}Screen ${CUR}%%%f%b"
print -P "%B%F{166}SCRN ${CUR}%%%f%b"

