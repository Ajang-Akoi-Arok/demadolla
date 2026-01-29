#!/bin/bash

# Person 3: Log Archival System
# Interactive log archival with timestamp naming

LOG_DIR="hospital_data/active_logs"
ARCHIVE_DIR="hospital_data/archives"

# Create archive directories if they don't exist
create_archive_dirs() {
    mkdir -p "$ARCHIVE_DIR/heart_data_archive"
    mkdir -p "$ARCHIVE_DIR/temperature_archive"
    mkdir -p "$ARCHIVE_DIR/water_archive"
}

# Generate timestamp for archive naming
get_timestamp() {
    date +"%Y-%m-%d_%H:%M:%S"
}

# Archive heart rate logs
archive_heart_rate() {
    local source_file="$LOG_DIR/heart_rate_log.log"
    
    if [[ ! -f "$source_file" ]]; then
        echo "Error: Heart rate log file not found!"
        return 1
    fi
    
    local timestamp=$(get_timestamp)
    local archive_file="$ARCHIVE_DIR/heart_data_archive/heart_rate_$timestamp.log"
    
    mv "$source_file" "$archive_file"
    touch "$source_file"  # Create new empty log file
    
    echo "Heart rate logs archived to: $archive_file"
    echo "Archive completed at: $(date)"
}

# Archive temperature logs
archive_temperature() {
    local source_file="$LOG_DIR/temperature_log.log"
    
    if [[ ! -f "$source_file" ]]; then
        echo "Error: Temperature log file not found!"
        return 1
    fi
    
    local timestamp=$(get_timestamp)
    local archive_file="$ARCHIVE_DIR/temperature_archive/temperature_$timestamp.log"
    
    mv "$source_file" "$archive_file"
    touch "$source_file"
    
    echo "Temperature logs archived to: $archive_file"
    echo "Archive completed at: $(date)"
}

# Archive water usage logs
archive_water() {
    local source_file="$LOG_DIR/water_usage_log.log"
    
    if [[ ! -f "$source_file" ]]; then
        echo "Error: Water usage log file not found!"
        return 1
    fi
    
    local timestamp=$(get_timestamp)
    local archive_file="$ARCHIVE_DIR/water_archive/water_usage_$timestamp.log"
    
    mv "$source_file" "$archive_file"
    touch "$source_file"
    
    echo "Water usage logs archived to: $archive_file"
    echo "Archive completed at: $(date)"
}

# Main menu
show_menu() {
    echo "=================================="
    echo "    LOG ARCHIVAL SYSTEM"
    echo "=================================="
    echo "1) Archive Heart Rate Logs"
    echo "2) Archive Temperature Logs"
    echo "3) Archive Water Usage Logs"
    echo "4) Archive All Logs"
    echo "5) Exit"
    echo "=================================="
}

# Main execution
main() {
    create_archive_dirs
    
    while true; do
        show_menu
        read -p "Select an option (1-5): " choice
        
        case $choice in
            1)
                echo "Archiving heart rate logs..."
                archive_heart_rate
                ;;
            2)
                echo "Archiving temperature logs..."
                archive_temperature
                ;;
            3)
                echo "Archiving water usage logs..."
                archive_water
                ;;
            4)
                echo "Archiving all logs..."
                archive_heart_rate
                archive_temperature
                archive_water
                ;;
            5)
                echo "Exiting archival system."
                exit 0
                ;;
            *)
                echo "Invalid option. Please select 1-5."
                ;;
        esac
        
        echo ""
        read -p "Press Enter to continue..."
        clear
    done
}

main