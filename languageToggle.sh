#!/bin/bash
if setxkbmap -print | grep "de(neo)" ; then
    setxkbmap de neo_qwertz;
    id1=$(dunstify -p "neo")
    dunstify -r $id1 "neo_qwertz"
elif setxkbmap -print | grep "de(neo_qwertz)" ; then
    setxkbmap de;
    id2=$(dunstify -p "neo_qwertz")
    dunstify -r $id2 "de"
else
    setxkbmap de neo;
    id3=$(dunstify -p "de")
    dunstify -r $id3 "neo"
fi