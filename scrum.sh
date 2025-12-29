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
echo "🚀 Updates from the last 30 days"
echo "==========================================="


# List updates from the last 30 days, grouped by date, from all local and remote branches, only unique commits, sorted by date
git -C "$REPO1_PATH" log --all --author="$AUTHOR" --since="30 days ago" --pretty=format:"%H	%ad	%s" --abbrev-commit --no-merges --date=short |
    sort -k2,2 -k1,1 | uniq |
    awk -F'\t' '
    {
        if (date != $2) {
            if (NR != 1) print "";
            date = $2;
            print "\n📅 " date;
            print "----------------------";
        }
        print "- " $3;
    }'

echo "\n==========================================="
echo "✅ **End of Update**"
