#! /bin/bash

temp=$(sensors | awk 'FNR == 3 {print $2}' | cut -c 2-3)

if (( $temp > 0 && $temp < 40 )); then
    echo " 0$temp°"
elif (( $temp >= 40 && $temp < 50 )); then
    echo " 0$temp°"
elif (( $temp >= 50 && $temp < 60 )); then
    echo " 0$temp°"
elif (( $temp >= 60 && $temp < 70 )); then
    echo " 0$temp°"
elif (( $temp >= 70 && $temp <= 100 )); then
    echo " 0$temp°" 
else
    if (( $(echo $temp | grep "^-\?[0-9]+$") != "" )); then
        echo " OoR°"
    else
        echo " NaN°"
    fi
fi

