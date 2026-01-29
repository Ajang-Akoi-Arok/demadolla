#!/bin/bash

# Person 5: System Integration & Master Control
# Coordinates all monitoring systems

PYTHON_SCRIPTS=(
    "person1_heart_monitor.py"
    "person2_temp_monitor.py"
    "person2_water_monitor.py"
)

PID_FILES=(
    "hospital_data/heart_rate.pid"
    "hospital_data/temperature.pid"
    "hospital_data/water.pid"
)

# Setup directory structure
setup_directories() {
    echo "Setting up hospital data directories..."
    
    mkdir -p hospital_data/active_logs
    mkdir -p hospital_data/archives/heart_data_archive
    mkdir -p hospital_data/archives/temperature_archive
    mkdir -p hospital_data/archives/water_archive
    mkdir -p hospital_data/reports
    
    # Create empty log files
    touch hospital_data/active_logs/heart_rate_log.log
    touch hospital_data/active_logs/temperature_log.log
    touch hospital_data/active_logs/water_usage_log.log
    
    echo "Directory structure created successfully."
}

# Start all monitoring systems
start_all_monitors() {
    echo "Starting all monitoring systems..."
    
    for script in "${PYTHON_SCRIPTS[@]}"; do
        if [[ -f "$script" ]]; then
            echo "Starting $script..."
            python3 "$script" start &
            sleep 2
        else
            echo "Warning: $script not found!"
        fi
    done
    
    echo "All monitoring systems started."
    echo "Use 'tail -f hospital_data/active_logs/*.log' to view real-time data."
}

# Stop all monitoring systems
stop_all_monitors() {
    echo "Stopping all monitoring systems..."
    
    for script in "${PYTHON_SCRIPTS[@]}"; do
        if [[ -f "$script" ]]; then
            echo "Stopping $script..."
            python3 "$script" stop
        fi
    done
    
    # Clean up any remaining PID files
    for pid_file in "${PID_FILES[@]}"; do
        [[ -f "$pid_file" ]] && rm "$pid_file"
    done
    
    echo "All monitoring systems stopped."
}

# Check system status
check_status() {
    echo "=== SYSTEM STATUS ==="
    
    for i in "${!PID_FILES[@]}"; do
        local pid_file="${PID_FILES[$i]}"
        local script="${PYTHON_SCRIPTS[$i]}"
        
        if [[ -f "$pid_file" ]]; then
            local pid=$(cat "$pid_file")
            if ps -p "$pid" > /dev/null 2>&1; then
                echo "✓ $script: RUNNING (PID: $pid)"
            else
                echo "✗ $script: STOPPED (stale PID file)"
                rm "$pid_file"
            fi
        else
            echo "✗ $script: STOPPED"
        fi
    done
    
    echo ""
    echo "=== LOG FILE STATUS ==="
    for log_file in hospital_data/active_logs/*.log; do
        if [[ -f "$log_file" ]]; then
            local line_count=$(wc -l < "$log_file")
            echo "$(basename "$log_file"): $line_count entries"
        fi
    done
}

# Show system menu
show_menu() {
    echo "=================================="
    echo "  HOSPITAL MONITORING SYSTEM"
    echo "=================================="
    echo "1) Setup System Directories"
    echo "2) Start All Monitors"
    echo "3) Stop All Monitors"
    echo "4) Check System Status"
    echo "5) View Real-time Logs"
    echo "6) Archive Logs"
    echo "7) Analyze Logs"
    echo "8) Exit"
    echo "=================================="
}

# View real-time logs
view_logs() {
    echo "Viewing real-time logs (Press Ctrl+C to stop)..."
    tail -f hospital_data/active_logs/*.log
}

# Main execution
main() {
    while true; do
        show_menu
        read -p "Select an option (1-8): " choice
        
        case $choice in
            1)
                setup_directories
                ;;
            2)
                start_all_monitors
                ;;
            3)
                stop_all_monitors
                ;;
            4)
                check_status
                ;;
            5)
                view_logs
                ;;
            6)
                if [[ -f "person3_archive_logs.sh" ]]; then
                    ./person3_archive_logs.sh
                else
                    echo "Archive script not found!"
                fi
                ;;
            7)
                if [[ -f "person4_analyze_logs.sh" ]]; then
                    ./person4_analyze_logs.sh
                else
                    echo "Analysis script not found!"
                fi
                ;;
            8)
                echo "Exiting system."
                exit 0
                ;;
            *)
                echo "Invalid option. Please select 1-8."
                ;;
        esac
        
        echo ""
        read -p "Press Enter to continue..."
        clear
    done
}

main