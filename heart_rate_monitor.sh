#!/bin/bash

# Prompt for device name
read -p "Enter the device name: " device_name

# Log file
log_file="heart_rate_log.txt"

# Run in the background and display process ID
echo "Recording heart rate for $device_name..."
echo "Process ID: $$"

# Infinite loop to generate heart rate data every second
while true; do
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    heart_rate=$((RANDOM % 50 + 50))  # Generates a random heart rate between 50-99
    echo "$timestamp $device_name $heart_rate" >> "$log_file"
    sleep 1
done &

