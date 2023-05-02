#!/bin/bash

cap=$(cat /sys/class/power_supply/BAT0/capacity)

if [ -z $cap ]; then
    readonly cap=0
    readonly stat="Charging"
else
    readonly cap=$cap
    readonly stat=$(cat /sys/class/power_supply/BAT0/status)
fi


#function wallpaper_exec() {
#    xwinwrap -g 1920x1080 -ni -fs -un -b -nf -ov -- mpv -wid WID --loop --no-audio --no-input-default-bindings --really-quiet ~/path/to/wallpaper.mp4 &
#}
#
#if [ ! -f /tmp/bs_charging ]; then
#    if [[ $stat == "Charging" ]]; then
#        wallpaper_exec
#        echo 1 > /tmp/bs_charging
#    else
#        echo 0 > /tmp/bs_charging
#    fi
#fi
#
#if (( $(cat /tmp/bs_charging) == 0 )) && [[ $stat == "Charging" || $stat == "Full" ]]; then
#    wallpaper_exec
#    echo 1 > /tmp/bs_charging
#elif (( $(cat /tmp/bs_charging) == 1 )) && [[ $stat != "Charging" && $stat != "Full" ]]; then
#    kill $(pgrep xwinwrap)
#    echo 0 > /tmp/bs_charging
#fi


if (( $cap == 100 )); then
    if [[ $stat == "Charging" ]]; then
        echo "$cap%+"
    elif [[ $stat == "Full" ]]; then
        echo "$cap%+" 
    else
        echo "$cap%+"
    fi
elif (( $cap > 75 && $cap < 100 )); then
    if [[ $stat == "Charging" ]]; then
        echo "0$cap%+"
    else
        echo "0$cap% "
    fi
elif (( $cap > 50 && $cap <= 75 )); then
    if [[ $stat == "Charging" ]]; then
        echo "0$cap%+"
    else
        echo "0$cap% "
    fi
elif (( $cap > 25 && $cap <= 50 )); then
    if [[ $stat == "Charging" ]]; then
        echo "0$cap%+"
    else
        echo "0$cap% "
    fi
elif (( $cap >= 10 && $cap <= 25 )); then
    if [[ $stat == "Charging" ]]; then
        echo "0$cap%+"
    else
        echo "0$cap% "
    fi
elif (( $cap > 5 && $cap < 10 )); then
    if [[ $stat == "Charging" ]]; then
        echo "00$cap%+"
    else
        echo "00$cap% "
    fi
elif (( $cap >= 1 && $cap <= 5 )); then
    if [[ $stat == "Charging" ]]; then
        echo "00$cap%+"
    else
        if (( $(( $(date +%s) % 2 )) == 0 )); then
            echo "00$cap% "
        else
            echo "^w^00$cap% ^w^"
        fi
    fi
elif (( $cap == 0 )); then
    if [[ $stat == "Charging" ]]; then
        echo "00$cap%+"
    else
        systemctl hibernate
    fi
fi
