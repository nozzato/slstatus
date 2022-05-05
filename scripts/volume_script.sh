#! /bin/bash

vol=$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | sed 's/%//')
mute=$(pacmd list-sinks | awk '/muted/ { print $2 }' | head -n 1)

if [[ $mute == "no" ]]; then
    if (( $vol == 0 )); then
        echo " 00$vol%"
    elif (( $vol > 0 && $vol < 10  )); then
        echo " 00$vol%"
    elif (( $vol >= 10 && $vol < 50  )); then
        echo " 0$vol%"
    elif (( $vol >= 50 && $vol < 100 )); then
        echo " 0$vol%"
    else
        echo " $vol%"
    fi
elif [[ $mute == "yes" ]]; then
    if (( $vol >= 0 && $vol < 10 )); then
        echo " 00$vol%"
    elif (( $vol >= 10 && $vol < 100 )); then
        echo " 0$vol%"
    else
        echo " $vol%"
    fi
else
    if (( $(echo $vol | grep "^-\?[0-9]+$") != "" )); then
        echo " OoR°"
    else
        echo " NaN°"
    fi
fi
