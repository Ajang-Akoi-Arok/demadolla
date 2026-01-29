# Hospital Data Monitoring System - Individual Assignments

## Person 1: Heart Rate Monitoring System
**File:** `person1_heart_monitor.py`

**Responsibilities:**
- Implement heart rate data simulation (60-100 BPM)
- Manage 2 heart rate devices (HR_DEVICE_001, HR_DEVICE_002)
- Handle process management with PID files
- Log data every 5 seconds

**Usage:**
```bash
python3 person1_heart_monitor.py start
python3 person1_heart_monitor.py stop
```

**Testing:**
```bash
tail -f hospital_data/active_logs/heart_rate_log.log
```

---

## Person 2: Temperature & Water Monitoring
**Files:** `person2_temp_monitor.py`, `person2_water_monitor.py`

**Responsibilities:**
- Temperature simulation (36.0-39.5°C) with 2 sensors
- Water usage simulation (1-10 units) with 1 meter
- Consistent logging format across both systems
- Process management for both services

**Usage:**
```bash
python3 person2_temp_monitor.py start
python3 person2_water_monitor.py start
```

**Testing:**
```bash
tail -f hospital_data/active_logs/temperature_log.log
tail -f hospital_data/active_logs/water_usage_log.log
```

---

## Person 3: Log Archival System
**File:** `person3_archive_logs.sh`

**Responsibilities:**
- Interactive menu for log archival
- Timestamp-based archive naming
- Directory management for archives
- File validation and error handling

**Usage:**
```bash
./person3_archive_logs.sh
```

**Features:**
- Archive individual log types
- Archive all logs at once
- Automatic timestamp naming
- Creates new empty log files after archival

---

## Person 4: Data Analysis & Reporting
**File:** `person4_analyze_logs.sh`

**Responsibilities:**
- Statistical analysis of log data
- Device usage statistics
- Temporal pattern analysis
- Report generation and formatting

**Usage:**
```bash
./person4_analyze_logs.sh
```

**Analysis Features:**
- Device statistics (count per device)
- Min/Max/Average calculations
- Temporal analysis (first/last entries)
- Complete report generation

---

## Person 5: System Integration & Master Control
**File:** `person5_master_control.sh`

**Responsibilities:**
- System setup and initialization
- Coordinated start/stop of all monitors
- System status monitoring
- Integration with archival and analysis systems

**Usage:**
```bash
./person5_master_control.sh
```

**Features:**
- Complete system setup
- Unified control interface
- Status monitoring
- Integration with all subsystems

---

## Integration Requirements

### Log Format Standard (All Members):
```
YYYY-MM-DD HH:MM:SS [DEVICE_ID] VALUE UNIT
```

### Directory Structure:
```
hospital_data/
├── active_logs/
│   ├── heart_rate_log.log
│   ├── temperature_log.log
│   └── water_usage_log.log
├── archives/
│   ├── heart_data_archive/
│   ├── temperature_archive/
│   └── water_archive/
└── reports/
    └── analysis_report.txt
```

### Testing Workflow:
1. Person 5: Setup directories
2. Person 1 & 2: Start monitoring systems
3. Person 3: Test archival system
4. Person 4: Test analysis system
5. Person 5: Verify complete integration

### Collaboration Points:
- **Data Format**: All must use identical timestamp and log formats
- **File Paths**: Consistent directory structure across all scripts
- **Process Management**: Standardized PID file handling
- **Error Handling**: Consistent error messages and validation