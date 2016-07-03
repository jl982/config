#!/bin/sh

# caps lock to ctrl
if [ $1 = "c" ]
then
    xmodmap -e 'remove Lock = Caps_Lock'
    xmodmap -e 'keysym Caps_Lock = Control_L'
    xmodmap -e 'add Control = Control_L'
elif [ $1 = "d" ]
then
    xset dpms force off
elif [ $1 = "dl" ]
then
    gnome-screensaver-command -l && xset dpms force off
elif [ $1 = "s" ]
then
    gnome-screensaver-command -l && dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend
elif [ $1 = "so" ]
then
    dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend
fi
