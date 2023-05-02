#!/bin/bash

memFree=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | awk -F. '{print $1}')

if (($memFree >= 0 && $memFree < 10)); then
    printf "00$memFree%% "
elif (($memFree >= 10 && $memFree < 100)); then
    printf "0$memFree%% "
else
    printf "$memFree%% "
fi

