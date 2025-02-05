#!/bin/bash

# Log file to be archived
log_file="heart_rate_log.txt"

# Timestamp format
timestamp=$(date +"%Y%m%d_%H%M%S")

# Archived log file name
archive_file="heart_rate_log_$timestamp.txt"

# Check if log file exist
if [ -f "$log_file" ]; then
    mv "$log_file" "$archive_file"
    echo "Log file archived as $archive_file"
else
    echo "No log file found to archive."
fi
