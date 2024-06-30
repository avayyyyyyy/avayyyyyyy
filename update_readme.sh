#!/bin/bash

# Get the current time in UTC and format it
current_time=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
update_message="Updated $current_time UTC with magic 🪄"

# Check if the last line of the README.md file is the same as the new update message
last_line=$(tail -n 1 README.md)
if [ "$last_line" != "$update_message" ]; then
    # Add the update message to the end of the README.md file
    echo "$update_message" >> README.md

    # Stage the changes
    git add README.md

    # Commit the changes
    git commit -m "Automated update at $current_time UTC"

    # Push the changes
    git push origin main
else
    echo "README.md already updated for the current time period."
fi
