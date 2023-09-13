#!/bin/bash

brightness_output=$(brightnessctl | grep "Current brightness" | awk '{gsub(/[()%]/, "", $4); print $4}')
echo "$brightness_output"
