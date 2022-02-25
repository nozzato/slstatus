#! /bin/bash

temp=$(sensors | awk 'FNR == 3 {print $2}' | cut -c 2-3)

if (( $temp >= 80 && $temp <= 85 )); then
    echo " $temp"
elif (( $temp >= 70 && $temp < 80 )); then
    echo " $temp"
elif (( $temp >= 60 && $temp < 70 )); then
    echo " $temp"
elif (( $temp >= 50 && $temp < 60 )); then
    echo " $temp"
elif (( $temp >= 40 && $temp < 50 )); then
    echo " $temp"
elif (( $temp >= 0 && $temp < 40 )); then
    echo " $temp"
else
    echo " $temp"
fi
