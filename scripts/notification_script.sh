#! /bin/bash

input="//BATTERY-LOW//"
inputLength=${#input}
window=$(xdotool getactivewindow getwindowname)
windowLength=${#window}
left="$HOME/sources/slstatus/scripts/var/temp1"
right="$HOME/sources/slstatus/scripts/var/temp2"
space="$HOME/sources/slstatus/scripts/var/temp3"

reset() {
    echo 1 > $left
    echo 0 > $right
    echo 1 > $space
}

if [[ $1 != "reset" ]]; then
    if (( $(cat $right) < $inputLength )); then
        # Stage 1
        if (( $(cat $right) == 0 )); then
            echo $input | cut -c 1
            echo 1 > $right
        else
            echo $(( $(cat $right) + 1 )) > $right
            echo $input | cut -c$(cat $left)-$(cat $right)
        fi
    elif (( $(cat $right) == $inputLength )); then
        # Stage 2 
        if (( $(cat $space) == 0 )); then
            echo $input
            echo 1 > $space
        else
            echo -n $input
            for (( n=0; n<$(cat $space); n++ )); do
                echo -n " "
            done
            if (( $(cat $space) < $(( 60 - $windowLength)) )); then
                echo $(( $(cat $space) + 1 )) > $space    
            else
                reset
            fi
        fi
    fi
else
    reset
fi

