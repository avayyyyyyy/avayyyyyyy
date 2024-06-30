#!/bin/bash

# Get the current time in UTC and format it
current_time=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
update_message="Updated $current_time with magic"

# Add the update message to the end of the README.md file
echo "$update_message" >> README.md

# Stage the changes
git add README.md

# Commit the changes
git commit -m "Automated update at $current_time"

# Push the changes
git push origin main