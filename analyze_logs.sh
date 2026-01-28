#!/bin/bash

# Analysis script with interactive menu
LOG_DIR="hospital_data/active_logs"
REPORT_DIR="hospital_data/reports"
REPORT_FILE="$REPORT_DIR/analysis_report.txt"

# Function to create reports directory
create_report_dir() {
    mkdir -p "$REPORT_DIR"
}

# Function to analyze log file
analyze_log() {
    local log_file="$1"
    local log_type="$2"
    
    # Check if log file exists
    if [ ! -f "$LOG_DIR/$log_file" ]; then
        echo "Error: $log_file not found in $LOG_DIR"
        return 1
    fi
    
    echo "Analyzing $log_type logs..."
    
    # Create report header
    echo "========================================" >> "$REPORT_FILE"
    echo "Analysis Report - $log_type" >> "$REPORT_FILE"
    echo "Generated: $(date)" >> "$REPORT_FILE"
    echo "========================================" >> "$REPORT_FILE"
    
    # Count occurrences of each device using awk, sort, uniq
    echo "Device Statistics:" >> "$REPORT_FILE"
    awk '{print $3}' "$LOG_DIR/$log_file" | sort | uniq -c | while read count device; do
        echo "  $device: $count entries" >> "$REPORT_FILE"
    done
    
    # Get first and last timestamps (bonus feature)
    first_entry=$(head -n 1 "$LOG_DIR/$log_file")
    last_entry=$(tail -n 1 "$LOG_DIR/$log_file")
    
    if [ -n "$first_entry" ]; then
        first_timestamp=$(echo "$first_entry" | awk '{print $1, $2}')
        echo "First entry: $first_timestamp" >> "$REPORT_FILE"
    fi
    
    if [ -n "$last_entry" ]; then
        last_timestamp=$(echo "$last_entry" | awk '{print $1, $2}')
        echo "Last entry: $last_timestamp" >> "$REPORT_FILE"
    fi
    
    echo "" >> "$REPORT_FILE"
    echo "Analysis completed for $log_type"
}

# Main script
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
echo -n "Enter choice (1-3): "
read choice

# Validate user input
if [[ ! "$choice" =~ ^[1-3]$ ]]; then
    echo "Error: Invalid choice. Please enter 1, 2, or 3."
    exit 1
fi

# Create report directory
create_report_dir

case $choice in
    1)
        analyze_log "heart_rate.log" "Heart Rate"
        ;;
    2)
        analyze_log "temperature.log" "Temperature"
        ;;
    3)
        analyze_log "water_usage.log" "Water Usage"
        ;;
esac