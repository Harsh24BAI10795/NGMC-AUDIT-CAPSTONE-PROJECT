#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Interactively creates a text file based on user input

OUTPUT_FILE="manifesto.txt"

echo "========================================"
echo "  OPEN SOURCE MANIFESTO GENERATOR"
echo "========================================"
echo "Please answer the following three questions:"

# Interactive read commands
read -p "1. What is your favorite open-source software? " FOSS_NAME
read -p "2. Why do you believe software should be free/open? " REASON
read -p "3. How do you plan to contribute to FOSS in the future? " CONTRIBUTION

# String concatenation
FINAL_TEXT="MY OPEN SOURCE MANIFESTO\n\nI believe the best software is $FOSS_NAME because it represents community power. Software must remain open because $REASON. As a developer, my pledge is to support the FOSS ecosystem by $CONTRIBUTION."

# Writing to file using >
echo -e "$FINAL_TEXT" > "$OUTPUT_FILE"

echo "----------------------------------------"
echo "Success! Your manifesto was written to $OUTPUT_FILE."
echo "Here is what was saved inside the file:"
echo "----------------------------------------"
cat "$OUTPUT_FILE"