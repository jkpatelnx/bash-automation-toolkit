#!/bin/bash

# Disk Usage Check Script
# Purpose: Log disk usage above a defined threshold with timestamp

THRESHOLD=80
LOG_FILE="/var/log/disk-usage-check.log"

echo "------------------------------------------" | tee -a "$LOG_FILE"
echo "Disk Usage Check - $(date)" | tee -a "$LOG_FILE"
echo "Threshold: ${THRESHOLD}%" | tee -a "$LOG_FILE"
echo "------------------------------------------" | tee -a "$LOG_FILE"

# Print header and filesystems with usage >= threshold
df -h | awk -v t="$THRESHOLD" 'NR==1 || $5+0 >= t' | tee -a "$LOG_FILE"

echo | tee -a "$LOG_FILE"
echo "Disk check completed." | tee -a "$LOG_FILE"