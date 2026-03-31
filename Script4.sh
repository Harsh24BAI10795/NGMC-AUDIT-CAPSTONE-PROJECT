#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./script4.sh <path_to_log> <keyword>

LOG_FILE=$1
KEYWORD=${2:-"ERROR"} # Defaults to "ERROR" if no second argument is provided
COUNT=0

# Validate that a file argument was provided
if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <path_to_log_file> [keyword]"
    echo "Example: $0 /var/log/mysql/error.log warning"
    exit 1
fi

# Check if the file exists and is readable
if [ ! -r "$LOG_FILE" ]; then
    echo "Error: Cannot read file '$LOG_FILE'. You may need sudo permissions."
    exit 1
fi

echo "Scanning '$LOG_FILE' for the keyword: '$KEYWORD'..."

# While-read loop to process the file line by line
while IFS= read -r line; do
    # If the line contains the keyword (case-insensitive)
    if echo "$line" | grep -qi "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOG_FILE"

echo "===================================="
echo "Analysis Complete."
echo "Keyword '$KEYWORD' appeared $COUNT times."
echo "===================================="