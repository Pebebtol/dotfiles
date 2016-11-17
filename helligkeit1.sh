#!/bin/zsh
var=$(xbacklight)
int=${var%.*}
if [ "$int" -lt 8 ]
then
	xbacklight -set 50
else
	xbacklight -set 5
fi
