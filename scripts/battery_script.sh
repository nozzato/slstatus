#! /bin/bash

cap=$(cat /sys/class/power_supply/BAT0/capacity)
stat=$(cat /sys/class/power_supply/BAT0/status)

if (( $cap == 100 )); then"
    if [[ $stat == "Charging" ]]; then
        echo " MAX"
    else
        echo " MAX"
    fi
elif (( $cap > 80 && $cap < 100 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap > 60 && $cap <= 80 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap > 40 && $cap <= 60 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap > 30 && $cap <= 40 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap > 20 && $cap <= 30 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap >= 10 && $cap <= 20 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    else
        echo " $cap%"
    fi
elif (( $cap > 5 && $cap < 10 )); then
    if [[ $stat == "Charging" ]]; then
        echo "  $cap%"
    else
        echo "  $cap%"
    fi
else
    if (( $(( $(date +%s) % 2 )) == 0 )); then
        if [[ $stat == "Charging" ]]; then
            echo "  $cap%"
        else
            echo "  $cap%"
        fi
    else
        if [[ $stat == "Charging" ]]; then
            echo " LOW"
        else
            echo " LOW"
        fi
    fi
fi
