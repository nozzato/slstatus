#! /bin/bash

readonly cap=$(cat /sys/class/power_supply/BAT0/capacity)
readonly stat=$(cat /sys/class/power_supply/BAT0/status)

if [ -z $cap ]; then
    cap=0
    stat='Charging'
fi

if (( $cap == 100 )); then
    if [[ $stat == "Charging" ]]; then
        echo " $cap%"
    elif [[ $stat == "Full" ]]; then
        echo " $cap%" 
    else
        echo " $cap%"
    fi
elif (( $cap > 80 && $cap < 100 )); then
    if [[ $stat == "Charging" ]]; then
        echo " 0$cap%"
    else
        echo " 0$cap%"
    fi
elif (( $cap > 60 && $cap <= 80 )); then
    if [[ $stat == "Charging" ]]; then
        echo " 0$cap%"
    else
        echo " 0$cap%"
    fi
elif (( $cap > 40 && $cap <= 60 )); then
    if [[ $stat == "Charging" ]]; then
        echo " 0$cap%"
    else
        echo " 0$cap%"
    fi
elif (( $cap > 30 && $cap <= 40 )); then
    if [[ $stat == "Charging" ]]; then
        echo " 0$cap%"
    else
        echo " 0$cap%"
    fi
elif (( $cap > 20 && $cap <= 30 )); then
    if [[ $stat == "Charging" ]]; then
        echo " 0$cap%"
    else
        echo " 0$cap%"
    fi
elif (( $cap >= 10 && $cap <= 20 )); then
    if [[ $stat == "Charging" ]]; then
        echo " 0$cap%"
    else
        echo " 0$cap%"
    fi
elif (( $cap > 5 && $cap < 10 )); then
    if [[ $stat == "Charging" ]]; then
        echo " 00$cap%"
    else
        echo " 00$cap%"
    fi
elif (( $cap == 0 )); then
    if [[ $stat == "Charging" ]]; then
        echo " 00$cap%" 
    else    
        systemctl hibernate
    fi
else
    if [[ $stat == "Charging" ]]; then
        if [[ $stat == "Charging" ]]; then
            echo " 00$cap%"
        else
            echo " 00$cap%"
        fi
    else
        if (( $(( $(date +%s) % 2 )) == 0 )); then
            echo " 00$cap%"
        else
            echo "^w^ 00$cap%^w^"
        fi
    fi
fi
