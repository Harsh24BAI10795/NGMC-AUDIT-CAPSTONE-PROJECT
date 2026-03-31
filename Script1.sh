#!/bin/bash
# Script 1: System Identity Report
# Displays basic system information using variables and command substitution

# Assigning command outputs to variables
OS_NAME=$(cat /etc/os-release | grep "^PRETTY_NAME" | cut -d= -f2 | tr -d '"')
KERNEL_VER=$(uname -r)
CURRENT_USER=$USER
HOME_DIR=$HOME
UPTIME_INFO=$(uptime -p)
CURRENT_DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Displaying the report
echo "========================================"
echo "       SYSTEM IDENTITY REPORT           "
echo "========================================"
echo "Operating System : $OS_NAME"
echo "Kernel Version   : $KERNEL_VER"
echo "Logged-in User   : $CURRENT_USER"
echo "Home Directory   : $HOME_DIR"
echo "System Uptime    : $UPTIME_INFO"
echo "Current Date/Time: $CURRENT_DATE"
echo "OS License       : GNU GPL (Linux Kernel)"
echo "========================================"