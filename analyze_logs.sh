#!/bin/bash

# analyze_logs.sh
# Interactive script to analyze log files and generate reports

LOG_DIR="hospital_data/active_logs"
REPORT_DIR="hospital_data/reports"
REPORT_FILE="${REPORT_DIR}/analysis_report.txt"

# Display menu
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

# Validate input
if [[ ! "$choice" =~ ^[1-3]$ ]]; then
    echo "Error: Invalid choice. Please enter 1, 2, or 3."
    exit 1
fi

# Process choice
case $choice in
    1)
        LOG_FILE="${LOG_DIR}/heart_rate.log"
        LOG_TYPE="Heart Rate"
        ;;
    2)
        LOG_FILE="${LOG_DIR}/temperature.log"
        LOG_TYPE="Temperature"
        ;;
    3)
        LOG_FILE="${LOG_DIR}/water_usage.log"
        LOG_TYPE="Water Usage"
        ;;
esac

# Check if log file exists
if [ ! -f "${LOG_FILE}" ]; then
    echo "Error: ${LOG_FILE} not found"
    exit 1
fi

# Check if file is empty
if [ ! -s "${LOG_FILE}" ]; then
    echo "Error: ${LOG_FILE} is empty"
    exit 1
fi

# Create reports directory if it doesn't exist
mkdir -p "${REPORT_DIR}"

# Generate analysis
echo "Analyzing ${LOG_TYPE} log..."
echo "========================================" > /tmp/analysis_temp.txt
echo "Analysis Report for ${LOG_TYPE}" >> /tmp/analysis_temp.txt
echo "Generated on: $(date)" >> /tmp/analysis_temp.txt
echo "========================================" >> /tmp/analysis_temp.txt
echo "" >> /tmp/analysis_temp.txt

# Count occurrences of each device
echo "Device Statistics:" >> /tmp/analysis_temp.txt
echo "-----------------" >> /tmp/analysis_temp.txt

# Extract device IDs and count occurrences
case $choice in
    1)  # Heart Rate - format: timestamp,device_id,bpm
        awk -F',' '{print $2}' "${LOG_FILE}" | sort | uniq -c | while read count device; do
            echo "Device $device: $count readings" >> /tmp/analysis_temp.txt
            
            # Get first and last timestamp for this device
            first=$(grep ",${device}," "${LOG_FILE}" | head -1 | cut -d',' -f1)
            last=$(grep ",${device}," "${LOG_FILE}" | tail -1 | cut -d',' -f1)
            echo "  First reading: $first" >> /tmp/analysis_temp.txt
            echo "  Last reading:  $last" >> /tmp/analysis_temp.txt
        done
        ;;
    2)  # Temperature - format: timestamp,device_id,temperature
        awk -F',' '{print $2}' "${LOG_FILE}" | sort | uniq -c | while read count device; do
            echo "Device $device: $count readings" >> /tmp/analysis_temp.txt
            
            # Get first and last timestamp for this device
            first=$(grep ",${device}," "${LOG_FILE}" | head -1 | cut -d',' -f1)
            last=$(grep ",${device}," "${LOG_FILE}" | tail -1 | cut -d',' -f1)
            echo "  First reading: $first" >> /tmp/analysis_temp.txt
            echo "  Last reading:  $last" >> /tmp/analysis_temp.txt
        done
        ;;
    3)  # Water Usage - format: timestamp,meter_id,liters
        awk -F',' '{print $2}' "${LOG_FILE}" | sort | uniq -c | while read count device; do
            echo "Device $device: $count readings" >> /tmp/analysis_temp.txt
            
            # Get first and last timestamp for this device
            first=$(grep ",${device}," "${LOG_FILE}" | head -1 | cut -d',' -f1)
            last=$(grep ",${device}," "${LOG_FILE}" | tail -1 | cut -d',' -f1)
            echo "  First reading: $first" >> /tmp/analysis_temp.txt
            echo "  Last reading:  $last" >> /tmp/analysis_temp.txt
        done
        ;;
esac

echo "" >> /tmp/analysis_temp.txt

# Add total entries count
total_entries=$(wc -l < "${LOG_FILE}")
echo "Total entries in log: $total_entries" >> /tmp/analysis_temp.txt

# Add time range
first_time=$(head -1 "${LOG_FILE}" | cut -d',' -f1)
last_time=$(tail -1 "${LOG_FILE}" | cut -d',' -f1)
echo "Time range: $first_time to $last_time" >> /tmp/analysis_temp.txt

echo "" >> /tmp/analysis_temp.txt
echo "========================================" >> /tmp/analysis_temp.txt

# Append to main report file
cat /tmp/analysis_temp.txt >> "${REPORT_FILE}"

# Display analysis to user
echo ""
echo "Analysis complete!"
echo "Results appended to: ${REPORT_FILE}"
echo ""
echo "=== Analysis Summary ==="
cat /tmp/analysis_temp.txt

# Clean up
rm /tmp/analysis_temp.txtc
