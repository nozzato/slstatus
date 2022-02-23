#! /bin/bash

cap=$(cat /sys/class/power_supply/BAT0/capacity)
stat=$(cat /sys/class/power_supply/BAT0/status)

if (( $cap == 100 )); then
    if [[ $stat == "Charging" ]]; then
        echo " MAX%"
    else
        echo " MAX"
    fi
elif (( $cap > 75 && $cap < 100 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap > 50 && $cap <= 75 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap > 25 && $cap <= 50 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap >= 10 && $cap <= 25 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap > 5 && $cap < 10 )); then
    echo "  $cap%"
else
    if (( $(( $(date +%s) % 2 )) == 0 )); then
        if [[ $stat == "Charging" ]]; then
            echo " $cap%"
        else
            echo "  $cap%"
        fi
    else
        if [[ $stat == "Charging" ]]; then
            echo " $cap%"
        else
            echo " LOW"
        fi
    fi
fi
