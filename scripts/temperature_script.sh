#! /bin/bash

temp=$(sensors | grep -A2 k10temp | awk 'FNR == 3 {print $2}' | cut -c 2-3)

if (( $temp >= 10 && $temp < 40 )); then
    echo " 0$temp°"
elif (( $temp >= 40 && $temp < 50 )); then
    echo " 0$temp°"
elif (( $temp >= 50 && $temp < 60 )); then
    echo " 0$temp°"
elif (( $temp >= 60 && $temp < 70 )); then
    echo " 0$temp°"
elif (( $temp >= 70 && $temp < 80 )); then
    echo " 0$temp°"
elif (( $temp >= 80 && $temp < 100 )); then
    if (( $(( $(date +%s) % 2 )) == 0 )); then
        echo " 0$temp°"
    else
        echo "^w^ 0$temp°^d^"
    fi
elif (( $temp >= 100 && $temp < 200 )); then
    if (( $(( $(date +%s) % 2 )) == 0 )); then
        echo " $temp°"
    else
        echo "^w^ $temp°^d^"
    fi
else
    if [[ $temp =~ ^[0-9]+$ ]]; then
        echo " OoR°"
    else
        echo " NaN°"
    fi
fi

