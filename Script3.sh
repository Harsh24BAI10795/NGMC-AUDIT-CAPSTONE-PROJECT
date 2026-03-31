#!/bin/bash
# Script 3: Disk and Permission Auditor
# Iterates through system directories to report permissions and ownership

# Array of directories to check
DIRECTORIES=("/etc" "/var/lib/mysql" "/var/log" "/tmp" "$HOME")

echo "============================================="
echo "      DISK AND PERMISSION AUDITOR            "
echo "============================================="

# Show overall disk space usage using df and awk
echo "Root File System Disk Space:"
df -h / | tail -n 1 | awk '{print "Size: "$2" | Used: "$3" | Available: "$4}'
echo "---------------------------------------------"

# For-loop to check specific directories
for DIR in "${DIRECTORIES[@]}"; do
    if [ -d "$DIR" ]; then
        # Use ls -ld and awk to extract permissions (column 1) and owner (columns 3 & 4)
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3":"$4}')
        
        echo "Directory : $DIR"
        echo "Owner     : $OWNER"
        echo "Perms     : $PERMS"
        echo "---------------------------------------------"
    else
        echo "Directory : $DIR [NOT FOUND OR NO ACCESS]"
        echo "---------------------------------------------"
    fi
done