#! /bin/bash

vol=$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')
echo $vol
