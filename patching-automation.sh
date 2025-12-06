#!/bin/bash
#
# patching-automation.sh
# Automate OS patching with logging
# Author: Adil

LOGFILE="/var/log/patching-$(date +%F).log"

echo "Starting patching at $(date)" | tee -a "$LOGFILE"

if command -v dnf &>/dev/null; then
    PKG_MGR="dnf"
elif command -v yum &>/dev/null; then
    PKG_MGR="yum"
else
    echo "No yum/dnf found. Exiting." | tee -a "$LOGFILE"
    exit 1
fi

echo "Using package manager: $PKG_MGR" | tee -a "$LOGFILE"
sudo $PKG_MGR -y update >> "$LOGFILE" 2>&1

echo "Patching completed at $(date)" | tee -a "$LOGFILE"
echo "Reboot may be required."
