#!/bin/bash

# Log Archiver CLI Tool
# Author: YOUR NAME
# Description: This script compresses logs from the provided directory into a timestamped archive and stores them in a designated archive directory.
# Usage: ./log-archive.sh <log-directory>

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

# Get the directory from the command-line argument
LOG_DIR=$1

# Check if the provided directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory $LOG_DIR does not exist."
    exit 1
fi

# Define variables
ARCHIVE_DIR="$HOME/log_archives"  # Directory to store the archive
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")  # Current date and time
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"  # Archive file name
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"  # Log file for storing operation details

# Create the archive directory if it doesn't exist
if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir -p "$ARCHIVE_DIR"
fi

# Compress the logs into a tar.gz file and move to archive directory
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" . 2>/dev/null

# Check if the tar command succeeded
if [ $? -ne 0 ]; then
    echo "Error: Failed to archive logs from $LOG_DIR."
    exit 1
fi

# Log the operation details
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Archived logs from $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_NAME" >> "$LOG_FILE"

# Print success message
echo "Logs have been successfully archived to $ARCHIVE_DIR/$ARCHIVE_NAME"
echo "Details logged in $LOG_FILE"
