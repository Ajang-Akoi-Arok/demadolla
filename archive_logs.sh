#!/bin/bash

# archive_logs.sh
# Interactive script to archive log files with timestamp

LOG_DIR="hospital_data/active_logs"
ARCHIVE_BASE="hospital_data/archived_logs"

# Create timestamp for filename
TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")

# Display menu
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature" 
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

# Validate input
if [[ ! "$choice" =~ ^[1-3]$ ]]; then
    echo "Error: Invalid choice. Please enter 1, 2, or 3."
    exit 1
fi

# Process choice
case $choice in
    1)
        LOG_FILE="heart_rate.log"
        ARCHIVE_DIR="${ARCHIVE_BASE}/heart_data_archive"
        ARCHIVE_NAME="heart_rate_${TIMESTAMP}.log"
        LOG_TYPE="Heart Rate"
        ;;
    2)
        LOG_FILE="temperature.log"
        ARCHIVE_DIR="${ARCHIVE_BASE}/temperature_data_archive"
        ARCHIVE_NAME="temperature_${TIMESTAMP}.log"
        LOG_TYPE="Temperature"
        ;;
    3)
        LOG_FILE="water_usage.log"
        ARCHIVE_DIR="${ARCHIVE_BASE}/water_usage_data_archive"
        ARCHIVE_NAME="water_usage_${TIMESTAMP}.log"
        LOG_TYPE="Water Usage"
        ;;
esac

# Check if source log file exists
if [ ! -f "${LOG_DIR}/${LOG_FILE}" ]; then
    echo "Error: ${LOG_FILE} not found in ${LOG_DIR}"
    exit 1
fi

# Check if archive directory exists, create if not
if [ ! -d "${ARCHIVE_DIR}" ]; then
    echo "Creating archive directory: ${ARCHIVE_DIR}"
    mkdir -p "${ARCHIVE_DIR}"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create archive directory"
        exit 1
    fi
fi

# Archive the log file
echo "Archiving ${LOG_FILE}..."
mv "${LOG_DIR}/${LOG_FILE}" "${ARCHIVE_DIR}/${ARCHIVE_NAME}"

if [ $? -eq 0 ]; then
    echo "Successfully archived to ${ARCHIVE_DIR}/${ARCHIVE_NAME}"
else
    echo "Error: Failed to archive ${LOG_FILE}"
    exit 1
fi

# Create new empty log file
touch "${LOG_DIR}/${LOG_FILE}"
if [ $? -eq 0 ]; then
    echo "Created new empty ${LOG_FILE} for continued monitoring"
else
    echo "Warning: Could not create new log file, but archive was successful"
fi
