#!/bin/bash

# Polybar module name
MODULE_NAME="wlan"

# Get the current module status
STATUS=$(polybar-msg hook $MODULE_NAME 2>&1 | jq -r '.[0].text')

# Toggle between SSID and network information
if [ "$STATUS" == "ssid" ]; then
    polybar-msg hook $MODULE_NAME 1
else
    polybar-msg hook $MODULE_NAME 2
fi
