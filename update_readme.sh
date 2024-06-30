#!/bin/bash

# Get the current time in UTC and format it
current_time=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
update_message="Updated $current_time with magic 🪄"

# Check if the last line already contains the update message for the current time period
if tail -n 1 README.md | grep -qF "$current_time"; then
    echo "README.md already updated for the current time period."
else
    # Add the update message to the end of the README.md file
    echo "$update_message" >> README.md

    # Stage the changes
    git add README.md

    # Commit the changes
    git commit -m "Automated update at $current_time"

    # Push the changes
    git push origin main
fi
