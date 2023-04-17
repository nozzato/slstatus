#!/bin/bash

vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
eq=$(pulseaudio-equalizer status | awk '/Equalizer status/{print $3}' | tr -d '[]')


if (( $vol == 0 )); then
    fvol=00$vol
    icon=
elif (( $vol > 0 && $vol < 10  )); then
    fvol=00$vol
    icon=
elif (( $vol >= 10 && $vol < 50 )); then
    fvol=0$vol
    icon=
elif (( $vol >= 50 && $vol < 100 )); then
    fvol=0$vol
    icon=
elif (( $vol >= 100 && $vol < 1000 )); then
    fvol=$vol
    icon=
else
    echo " OoR%"
    exit 1
fi


if [[ $mute == true ]]; then
    echo " $fvol%"
    exit 0
elif [[ $eq = enabled ]]; then
    if (( $(( $(date +%s) % 4 )) == 0 )); then
        echo "󰝝 $fvol%"
    else
        echo "$icon $fvol%"
    fi
    exit 0
else
    echo "$icon $fvol%"
    exit 0
fi
