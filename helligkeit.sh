#!/bin/zsh
var=$(xbacklight)
int=${var%.*}
if [ "$int" -lt 15 ] 
then
	xbacklight -set 100
else
	xbacklight -set 10
fi
