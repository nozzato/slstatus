#! /bin/bash

vol=$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | sed 's/%//')
mute=$(pacmd list-sinks | awk '/muted/ { print $2 }' | head -n 1)

if [[ $mute == "no" ]]; then
    if (( $vol == 0 )); then
        echo "  $vol%"
    elif (( $vol > 0 && $vol < 10  )); then
        echo "  $vol%"
    elif ((  $vol >= 10 && $vol < 50  )); then
        echo " $vol%"
    else
        echo " $vol%"
    fi
else
    if (( $vol < 10 )); then
        echo "  $vol%"
    else
        echo " $vol%"
    fi
fi