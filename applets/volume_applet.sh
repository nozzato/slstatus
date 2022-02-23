#! /bin/bash

vol=$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | sed 's/%//')

if (($vol == 0)); then
    echo "  $vol%"
elif (($vol > 0 && $vol < 10)); then
    echo "  $vol%"
elif (($vol >= 10 && $vol < 50)); then
    echo " $vol%"
elif (($vol >= 50)); then
    echo " $vol%"
fi

