#!/bin/bash

# Get the current time in UTC and format it
current_time=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
update_message="Updated $current_time UTC with magic 🪄"

# Check if the update message for the current time period is already in the file
if ! grep -qF "$current_time UTC" README.md; then
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
