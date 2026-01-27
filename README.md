# Hospital Data Monitoring & Archival System

An automated log management system that collects real-time patient health metrics and resource usage data, provides controlled log archiving, and generates analytical reports.

## Project Structure

```
hospital_data/
├── active_logs/                    # Active log files
│   ├── heart_rate.log
│   ├── temperature.log
│   └── water_usage.log
├── archives/                       # Archived logs with timestamps
│   ├── heart_data_archive/
│   ├── temperature_archive/
│   └── water_archive/
├── reports/                        # Analysis reports
│   └── analysis_report.txt
├── heart_rate_monitor.py          # Heart rate simulator
├── temperature_recorder.py        # Temperature sensor simulator
├── water_consumption.py           # Water usage simulator
├── archive_logs.sh                # Interactive archival script
├── analyze_logs.sh                # Log analysis script
└── README.md                      # This file
```

## System Components

### 1. Data Simulators

#### Heart Rate Monitor (`heart_rate_monitor.py`)
- Simulates 2 heart rate monitors (HeartRate_Monitor_A, HeartRate_Monitor_B)
- Generates heart rate data between 60-100 BPM
- Logs data every second to `active_logs/heart_rate.log`

#### Temperature Recorder (`temperature_recorder.py`)
- Simulates 2 temperature sensors (Temp_Recorder_A, Temp_Recorder_B)
- Generates temperature data between 36.0-39.5°C
- Logs data every second to `active_logs/temperature.log`

#### Water Consumption Meter (`water_consumption.py`)
- Simulates 1 water usage meter (Water_Consumption_Meter)
- Generates usage data between 1-10 units
- Logs data every second to `active_logs/water_usage.log`

### 2. Management Scripts

#### Archive Script (`archive_logs.sh`)
Interactive script that:
- Presents a numbered menu of log types
- Archives selected log file with timestamp naming
- Creates new empty log file for continued monitoring
- Includes error handling for invalid input and missing files

#### Analysis Script (`analyze_logs.sh`)
Interactive script that:
- Analyzes selected log files
- Counts device occurrences
- Records first/last entry timestamps
- Appends results to `reports/analysis_report.txt`

## Usage Instructions

### 1. Initialize System

Start the monitoring devices (run each in separate terminals):

```bash
python3 heart_rate_monitor.py start
python3 temperature_recorder.py start
python3 water_consumption.py start
```

Verify data collection:
```bash
tail -f active_logs/heart_rate.log
```

### 2. Archive Logs

Run the interactive archival script:

```bash
./archive_logs.sh
```

Example interaction:
```
Select log to archive:
1) Heart Rate
2) Temperature
3) Water Usage
Enter choice (1-3): 1

Archiving heart_rate_log.log...
Successfully archived to archives/heart_data_archive/heart_rate_log_2024-01-25_14:30:15.log
```

### 3. Analyze Logs

Run the analysis script:

```bash
./analyze_logs.sh
```

Example interaction:
```
Select log file to analyze:
1) Heart Rate (heart_rate_log.log)
2) Temperature (temperature_log.log)
3) Water Usage (water_usage_log.log)
Enter choice (1-3): 1

Analysis completed for Heart Rate
```

### 4. Stop Monitoring

Stop the monitoring processes:

```bash
python3 heart_rate_monitor.py stop
python3 temperature_recorder.py stop
python3 water_consumption.py stop
```

## Features

- **Real-time Data Collection**: Continuous monitoring with 1-second intervals
- **Interactive Archival**: User-friendly menu system for selective archiving
- **Timestamp Management**: Automatic timestamp naming for archived files
- **Device Analytics**: Statistical analysis of device performance
- **Error Handling**: Robust error checking and user input validation
- **Automated Reporting**: Cumulative analysis reports with device statistics

## Technical Implementation

### Key Technologies
- **Shell Scripting**: Interactive menus using select/case statements
- **File Operations**: mv, touch, awk, grep, sort, uniq commands
- **Process Management**: Background process handling with PID files
- **Data Analysis**: Text processing and statistical analysis

### Error Handling
- Input validation for user menu selections
- File existence checks before operations
- Directory creation with proper permissions
- Process management with PID tracking

## Learning Objectives Achieved

1. **Shell Scripting Proficiency**: Interactive scripts with user menus and error handling
2. **Log Management & Automation**: Structured archival systems with timestamping
3. **Data Analysis with CLI Tools**: Extract insights using awk, sort, uniq for formatted reports