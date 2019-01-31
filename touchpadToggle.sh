#!/bin/bash
if xinput list "Elan Touchpad" | grep -q "disabled" ; then
    xinput set-prop "Elan Touchpad" "Device Enabled" 1;
    id1=$(dunstify -p "Touchpad disabled");
    dunstify -r $id1 "Touchpad enabled";
else
    xinput set-prop "Elan Touchpad" "Device Enabled" 0;
    id2=$(dunstify -p "Touchpad enabled");
    dunstify -r $id2 "Touchpad disabled";
fi
