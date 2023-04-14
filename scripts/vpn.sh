#!/bin/bash

vpn=$(protonvpn-cli status)

if [[ $(wc -l <<< $vpn) == 2 ]]; then
    echo " "
else
    echo "  $(awk 'NR == 6 {for (i=2; i<NF; i++) printf $i " "; print $NF}' <<< $vpn)  "
fi
