#!/bin/bash

# Get the current time in UTC and format it
current_time=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
update_message="Updated $current_time UTC with magic 🪄"

# Remove the last line if it contains an old update message
# Check if the last line is an old update message
last_line=$(tail -n 1 README.md)
echo "Pehle Last Line : $last_line"
if [[ "$last_line" == Updated\ *\ UTC\ with\ magic\ 🪄 ]]; then
    # Remove the last line from README.md
    sed -i '$ d' README.md
    last_line2=$(tail -n 1 README.md)
    echo "badme Last Line : $last_line2"
fi

# Add the new update message to the end of the README.md file
echo "$update_message" >> README.md

# Stage the changes
git add README.md

# Commit the changes
git commit -m "Automated update at $current_time UTC"

# Push the changes
git push origin main
