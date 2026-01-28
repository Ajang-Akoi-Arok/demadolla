#!/bin/bash

# Archive logs script with interactive menu
LOG_DIR="hospital_data/active_logs"
HEART_ARCHIVE="hospital_data/archived_logs/heart_data_archive"
TEMP_ARCHIVE="hospital_data/archived_logs/temperature_data_archive"
WATER_ARCHIVE="hospital_data/archived_logs/water_usage_data_archive"

# Function to create archive directories if they don't exist
create_archive_dirs() {
    mkdir -p "$HEART_ARCHIVE" "$TEMP_ARCHIVE" "$WATER_ARCHIVE"
}

# Function to archive a log file
archive_log() {
    local log_file="$1"
    local archive_dir="$2"
    local log_type="$3"
    
    # Check if log file exists
    if [ ! -f "$LOG_DIR/$log_file" ]; then
        echo "Error: $log_file not found in $LOG_DIR"
        return 1
    fi
    
    # Generate timestamp
    timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
    
    # Create archive filename (remove _log.log and add timestamp)
    base_name=$(echo "$log_file" | sed 's/_log\.log$//')
    archive_name="${base_name}_${timestamp}.log"
    
    echo "Archiving $log_file..."
    
    # Move log file to archive with timestamp
    if mv "$LOG_DIR/$log_file" "$archive_dir/$archive_name"; then
        # Create new empty log file
        touch "$LOG_DIR/$log_file"
        echo "Successfully archived to $archive_dir/$archive_name"
        return 0
    else
        echo "Error: Failed to archive $log_file"
        return 1
    fi
}

# Main script
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
echo -n "Enter choice (1-3): "
read choice

# Create archive directories
create_archive_dirs

case $choice in
    1)
        archive_log "heart_rate.log" "$HEART_ARCHIVE" "Heart Rate"
        ;;
    2)
        archive_log "temperature.log" "$TEMP_ARCHIVE" "Temperature"
        ;;
    3)
        archive_log "water_usage.log" "$WATER_ARCHIVE" "Water Usage"
        ;;
    *)
        echo "Error: Invalid choice. Please enter 1, 2, or 3."
        exit 1
        ;;
esac