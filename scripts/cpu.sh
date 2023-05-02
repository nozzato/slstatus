#!/bin/bash
# Code modified from original script by David C. Rankin

# read /proc/stat file (for first datapoint)
read cpu user nice system idle iowait irq softirq steal guest < /proc/stat

# compute active and total utilizations
cpuActivePrev=$((user + system + nice + softirq + steal))
cpuTotalPrev=$((user + system + nice + softirq + steal + idle + iowait))

sleep 0.05

# read /proc/stat file (for second datapoint)
read cpu user nice system idle iowait irq softirq steal guest < /proc/stat

# compute active and total utilizations
cpuActiveCur=$((user + system + nice + softirq + steal))
cpuTotalCur=$((user + system + nice + softirq + steal + idle + iowait))

# compute CPU utilization (%)
cpuUtil=$((100 * (cpuActiveCur - cpuActivePrev) / (cpuTotalCur - cpuTotalPrev) ))

if (($cpuUtil >= 0 && $cpuUtil < 10)); then
    printf "00$cpuUtil%% "
elif (($cpuUtil >= 10 && $cpuUtil < 100)); then
    printf "0$cpuUtil%% "
elif (($cpuUtil == 100)); then
    printf "$cpuUtil%% "
fi
