#!/bin/bash
# Script 2: FOSS Package Inspector
# Checks if MySQL is installed, grabs the version, and prints a description

PACKAGE="mysql"

echo "Checking status of FOSS package: $PACKAGE..."

# Check if the command exists (silencing the output)
if command -v $PACKAGE >/dev/null 2>&1; then
    echo "[SUCCESS] $PACKAGE is installed on this system."
    
    # Extract version using grep and awk
    VERSION=$($PACKAGE --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    echo "Version Installed: $VERSION"
    
    # Case statement to provide software details
    case $PACKAGE in
        "mysql")
            echo "Description: MySQL is a GPL-licensed open-source relational database engine."
            ;;
        "apache2")
            echo "Description: Apache is a robust open-source web server."
            ;;
        *)
            echo "Description: Unrecognized open-source package."
            ;;
    esac
else
    echo "[ERROR] $PACKAGE is NOT installed on this system."
    echo "Hint: You can install it using 'sudo apt install mysql-server'"
fi