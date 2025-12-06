#!/bin/bash
#
# system-health-check.sh
# Simple Linux health check script
# Author: Adil

echo "====================================="
echo "   SYSTEM HEALTH REPORT - $(hostname)"
echo "   Run at: $(date)"
echo "====================================="
echo

echo "[1] UPTIME"
uptime
echo

echo "[2] CPU LOAD"
grep 'model name' /proc/cpuinfo | head -1
echo
echo "Load average (1/5/15 min):"
cat /proc/loadavg
echo

echo "[3] MEMORY USAGE (MB)"
free -m
echo

echo "[4] DISK USAGE"
df -hT | egrep 'xfs|ext4'
echo

echo "[5] TOP 10 MEMORY-HUNGRY PROCESSES"
ps aux --sort=-%mem | head -11
echo

echo "[6] TOP 10 CPU-HUNGRY PROCESSES"
ps aux --sort=-%cpu | head -11
echo

echo "[7] OPEN NETWORK CONNECTIONS (summary)"
ss -tuna | wc -l | awk '{print "Total connections: " $1}'
echo

echo "Health check completed."
