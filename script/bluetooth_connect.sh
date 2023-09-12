#!/bin/bash

device_address="E8:D0:3C:85:42:35"

connected=$(bluetoothctl info "$device_address" | grep "Connected: yes")

if [[ -n "$connected" ]]; then
    echo "Device is already connected. Disconnecting..."
    bluetoothctl disconnect "$device_address"
else
    echo "Device is not connected. Connecting..."
    bluetoothctl power on
    sleep 2
    bluetoothctl connect "$device_address"
fi
