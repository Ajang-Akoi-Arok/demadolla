#!/bin/bash

# Person 4: Data Analysis & Reporting System
# Analyzes logs and generates statistical reports

ACTIVE_LOGS="hospital_data/active_logs"
ARCHIVE_LOGS="hospital_data/archives"
REPORT_FILE="hospital_data/reports/analysis_report.txt"

# Create reports directory
mkdir -p "hospital_data/reports"

# Analyze heart rate data
analyze_heart_rate() {
    local log_file="$1"
    
    if [[ ! -f "$log_file" ]]; then
        echo "Error: Log file not found: $log_file"
        return 1
    fi
    
    echo "=== HEART RATE ANALYSIS ===" >> "$REPORT_FILE"
    echo "File: $log_file" >> "$REPORT_FILE"
    echo "Analysis Date: $(date)" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    
    # Device statistics
    echo "Device Statistics:" >> "$REPORT_FILE"
    awk -F'[][]' '{print $2}' "$log_file" | sort | uniq -c | while read count device; do
        echo "  $device: $count readings" >> "$REPORT_FILE"
    done
    
    # Temporal analysis
    local first_entry=$(head -n1 "$log_file" | cut -d' ' -f1-2)
    local last_entry=$(tail -n1 "$log_file" | cut -d' ' -f1-2)
    echo "First Entry: $first_entry" >> "$REPORT_FILE"
    echo "Last Entry: $last_entry" >> "$REPORT_FILE"
    
    # Heart rate statistics
    local avg_hr=$(awk '{print $4}' "$log_file" | awk '{sum+=$1} END {print sum/NR}')
    local max_hr=$(awk '{print $4}' "$log_file" | sort -n | tail -1)
    local min_hr=$(awk '{print $4}' "$log_file" | sort -n | head -1)
    
    echo "Average Heart Rate: ${avg_hr} BPM" >> "$REPORT_FILE"
    echo "Maximum Heart Rate: ${max_hr} BPM" >> "$REPORT_FILE"
    echo "Minimum Heart Rate: ${min_hr} BPM" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

# Analyze temperature data
analyze_temperature() {
    local log_file="$1"
    
    if [[ ! -f "$log_file" ]]; then
        echo "Error: Log file not found: $log_file"
        return 1
    fi
    
    echo "=== TEMPERATURE ANALYSIS ===" >> "$REPORT_FILE"
    echo "File: $log_file" >> "$REPORT_FILE"
    echo "Analysis Date: $(date)" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    
    # Device statistics
    echo "Device Statistics:" >> "$REPORT_FILE"
    awk -F'[][]' '{print $2}' "$log_file" | sort | uniq -c | while read count device; do
        echo "  $device: $count readings" >> "$REPORT_FILE"
    done
    
    # Temperature statistics
    local avg_temp=$(awk '{gsub(/°C/, "", $4); print $4}' "$log_file" | awk '{sum+=$1} END {print sum/NR}')
    local max_temp=$(awk '{gsub(/°C/, "", $4); print $4}' "$log_file" | sort -n | tail -1)
    local min_temp=$(awk '{gsub(/°C/, "", $4); print $4}' "$log_file" | sort -n | head -1)
    
    echo "Average Temperature: ${avg_temp}°C" >> "$REPORT_FILE"
    echo "Maximum Temperature: ${max_temp}°C" >> "$REPORT_FILE"
    echo "Minimum Temperature: ${min_temp}°C" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

# Analyze water usage data
analyze_water() {
    local log_file="$1"
    
    if [[ ! -f "$log_file" ]]; then
        echo "Error: Log file not found: $log_file"
        return 1
    fi
    
    echo "=== WATER USAGE ANALYSIS ===" >> "$REPORT_FILE"
    echo "File: $log_file" >> "$REPORT_FILE"
    echo "Analysis Date: $(date)" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    
    # Device statistics
    echo "Device Statistics:" >> "$REPORT_FILE"
    awk -F'[][]' '{print $2}' "$log_file" | sort | uniq -c | while read count device; do
        echo "  $device: $count readings" >> "$REPORT_FILE"
    done
    
    # Water usage statistics
    local total_usage=$(awk '{print $4}' "$log_file" | awk '{sum+=$1} END {print sum}')
    local avg_usage=$(awk '{print $4}' "$log_file" | awk '{sum+=$1} END {print sum/NR}')
    local max_usage=$(awk '{print $4}' "$log_file" | sort -n | tail -1)
    
    echo "Total Water Usage: ${total_usage} units" >> "$REPORT_FILE"
    echo "Average Usage per Reading: ${avg_usage} units" >> "$REPORT_FILE"
    echo "Maximum Single Usage: ${max_usage} units" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

# Show analysis menu
show_menu() {
    echo "=================================="
    echo "    LOG ANALYSIS SYSTEM"
    echo "=================================="
    echo "1) Analyze Heart Rate Logs"
    echo "2) Analyze Temperature Logs"
    echo "3) Analyze Water Usage Logs"
    echo "4) Generate Complete Report"
    echo "5) View Current Report"
    echo "6) Exit"
    echo "=================================="
}

# Main execution
main() {
    while true; do
        show_menu
        read -p "Select an option (1-6): " choice
        
        case $choice in
            1)
                echo "Analyzing heart rate logs..."
                if [[ -f "$ACTIVE_LOGS/heart_rate_log.log" ]]; then
                    analyze_heart_rate "$ACTIVE_LOGS/heart_rate_log.log"
                    echo "Heart rate analysis completed."
                else
                    echo "No heart rate log file found."
                fi
                ;;
            2)
                echo "Analyzing temperature logs..."
                if [[ -f "$ACTIVE_LOGS/temperature_log.log" ]]; then
                    analyze_temperature "$ACTIVE_LOGS/temperature_log.log"
                    echo "Temperature analysis completed."
                else
                    echo "No temperature log file found."
                fi
                ;;
            3)
                echo "Analyzing water usage logs..."
                if [[ -f "$ACTIVE_LOGS/water_usage_log.log" ]]; then
                    analyze_water "$ACTIVE_LOGS/water_usage_log.log"
                    echo "Water usage analysis completed."
                else
                    echo "No water usage log file found."
                fi
                ;;
            4)
                echo "Generating complete report..."
                echo "HOSPITAL DATA ANALYSIS REPORT" > "$REPORT_FILE"
                echo "Generated: $(date)" >> "$REPORT_FILE"
                echo "==============================" >> "$REPORT_FILE"
                echo "" >> "$REPORT_FILE"
                
                [[ -f "$ACTIVE_LOGS/heart_rate_log.log" ]] && analyze_heart_rate "$ACTIVE_LOGS/heart_rate_log.log"
                [[ -f "$ACTIVE_LOGS/temperature_log.log" ]] && analyze_temperature "$ACTIVE_LOGS/temperature_log.log"
                [[ -f "$ACTIVE_LOGS/water_usage_log.log" ]] && analyze_water "$ACTIVE_LOGS/water_usage_log.log"
                
                echo "Complete report generated."
                ;;
            5)
                if [[ -f "$REPORT_FILE" ]]; then
                    cat "$REPORT_FILE"
                else
                    echo "No report file found. Generate a report first."
                fi
                ;;
            6)
                echo "Exiting analysis system."
                exit 0
                ;;
            *)
                echo "Invalid option. Please select 1-6."
                ;;
        esac
        
        echo ""
        read -p "Press Enter to continue..."
        clear
    done
}

main