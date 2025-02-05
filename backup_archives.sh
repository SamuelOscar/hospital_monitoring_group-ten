#!/bin/bash

# Define archive directory
group_id=1  # Change this to your actual group number
archive_dir="archived_logs_group$group_ten"

# Remote backup details
remote_host="your_sandbox_host"
remote_user="your_sandbox_username"
remote_backup_dir="/home/"

# Create archive directory if it doesn't exist
mkdir -p "$archive_dir"

# Move all archived logs to the directory
mv heart_rate_log_*.txt "$archive_dir" 2>/dev/null

# Check if there are files to move
if [ "$(ls -A $archive_dir)" ]; then
    echo "Moved archived logs to $archive_dir."

    # Securely copy to remote server
    scp -r "$archive_dir" "$remote_user@$remote_host:$remote_backup_dir"

    if [ $? -eq 0 ]; then
        echo "Backup to remote server successful."
    else
        echo "Backup failed. Check SSH credentials."
    fi
else
    echo "No archived logs to move."
fi
