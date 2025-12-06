#!/bin/bash
#
# nfs-mount-check.sh
# Check if important NFS mounts are available
# Author: Adil

# List of NFS mount points to check
MOUNTS=(
    "/mnt/nfs_backup"
    "/mnt/nfs_shared"
)

echo "NFS MOUNT CHECK - $(date)"
echo "--------------------------------"

for m in "${MOUNTS[@]}"; do
    if mountpoint -q "$m"; then
        echo "[OK]  $m is mounted"
    else
        echo "[ERR] $m is NOT mounted!"
    fi
done

echo
echo "Check complete."
