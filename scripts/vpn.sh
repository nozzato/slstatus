#!/bin/bash

vpn=$(protonvpn-cli status)

if [[ $(wc -l <<< $vpn) == 2 ]]; then
    echo " "
else
    echo "  $(awk 'NR == 6 {print $2}' <<< $vpn)  "
fi
