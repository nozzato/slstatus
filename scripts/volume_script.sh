#! /bin/bash

vol=$(amixer -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $2}' | sed 's/%//')
mute=$(pacmd list-sinks | awk '/muted/ {print $2}' | head -n 1)
eq=$(pulseaudio-equalizer status | awk '/Equalizer status/{print $3}' | tr -d '[]')

if [[ $eq == "enabled" ]]; then
    icon_up=""
    icon_down=""
    icon_mute=""
    icon_off=""
else
    icon_up="ﱜ"
    icon_down="ﱜ"
    icon_mute="ﱜ"
    icon_off="ﱜ"
fi

if [[ $mute == "no" ]]; then
    if (( $vol == 0 )); then
        echo "$icon_off 00$vol%"
    elif (( $vol > 0 && $vol < 10  )); then
        echo "$icon_down 00$vol%"
    elif (( $vol >= 10 && $vol < 50  )); then
        echo "$icon_down 0$vol%"
    elif (( $vol >= 50 && $vol < 100 )); then
        echo "$icon_up 0$vol%"
    else
        echo "$icon_up $vol%"
    fi
elif [[ $mute == "yes" ]]; then
    if (( $vol >= 0 && $vol < 10 )); then
        echo "$icon_mute 00$vol%"
    elif (( $vol >= 10 && $vol < 100 )); then
        echo "$icon_mute 0$vol%"
    else
        echo "$icon_mute $vol%"
    fi
else
    if (( $(echo $vol | grep "^-\?[0-9]+$") != "" )); then
        echo " OoR°"
    else
        echo " NaN°"
    fi
fi
