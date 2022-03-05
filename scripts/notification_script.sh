#! /bin/bash

string="// WARNING - BATTERY LOW //"
length=${#string}
left="$HOME/sources/slstatus/scripts/var/temp1"
right="$HOME/sources/slstatus/scripts/var/temp2"
space="$HOME/sources/slstatus/scripts/var/temp3"

eleft() {
    echo $string | cut -c$left-$right
}

echo "Stage 1"
$eleft

echo "Stage 2"


echo "Stage 3"


echo 0 > $stage
echo 0 > $left
echo 0 > $right
echo 0 > $space

