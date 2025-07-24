#!/bin/bash

# Paths to both Git repositories
read -p "Enter path to first Git repository: " REPO1_PATH

# Your Git author name or email
# Ensure the script works on both macOS and Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias date="date --date"
fi
AUTHOR=$(git config --get user.email)

# Determine date range
HOUR=$(date +%H)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ "$HOUR" -lt 12 ]; then
        START_DATE=$(date -v -1d "+%Y-%m-%d")
    else
        START_DATE=$(date "+%Y-%m-%d")
    fi
    DAY_OF_WEEK=$(date -d "$START_DATE" "+%u")
else
    if [ "$HOUR" -lt 12 ]; then
        START_DATE=$(date -v -1d "+%Y-%m-%d")
    else
        START_DATE=$(date "+%Y-%m-%d")
    fi
    DAY_OF_WEEK=$(date -j -f "%Y-%m-%d" "$START_DATE" "+%u")
fi

# Weekend adjustments
if [ "$DAY_OF_WEEK" -eq 6 ] || [ "$DAY_OF_WEEK" -eq 7 ]; then
    START_DATE=$(date -v -Fri "+%Y-%m-%d")
fi

# Define start and end timestamps
START_TIMESTAMP="${START_DATE}T00:00:00"
END_TIMESTAMP="${START_DATE}T23:59:59"

echo "🚀 What we did on ${START_DATE}"
echo "==========================================="
echo "Start Timestamp: $START_TIMESTAMP"
echo "End Timestamp: $END_TIMESTAMP"

{
    git -C "$REPO1_PATH" log --author="$AUTHOR" --since="$START_TIMESTAMP" --until="$END_TIMESTAMP" \
        --pretty=format:"- %s" --abbrev-commit --no-merges --date=local
} | sort | uniq

echo "==========================================="
echo "✅ **End of Update**"
