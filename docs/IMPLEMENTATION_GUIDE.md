# Hospital Data Monitoring System - Implementation Guide

## Step-by-Step Implementation for 5-Person Team

### PHASE 1: Project Setup & Individual Development (Days 1-3)

#### Step 1: Project Lead Setup (Member 1)
```bash
# 1. Create GitHub repository named "Coding-lab_Group{nbr}"
# 2. Clone repository locally
git clone https://github.com/your-team/Coding-lab_Group{nbr}.git
cd Coding-lab_Group{nbr}

# 3. Create directory structure
mkdir -p hospital_data/active_logs
mkdir -p hospital_data/archives/heart_data_archive
mkdir -p hospital_data/archives/temperature_archive  
mkdir -p hospital_data/archives/water_archive
mkdir -p hospital_data/reports

# 4. Create initial commit
git add .
git commit -m "[Setup] Initial project structure"
git push origin main
```

#### Step 2: Heart Rate System (Member 1)
```bash
# Create heart_monitor.py and heart_rate_monitor.py
# Test with:
python3 heart_monitor.py start
tail -f hospital_data/active_logs/heart_rate_log.log
python3 heart_monitor.py stop

# Commit changes
git add heart_monitor.py heart_rate_monitor.py
git commit -m "[Heart Monitor] Add heart rate simulation system"
git push origin main
```

#### Step 3: Temperature System (Member 2)
```bash
# Pull latest changes
git pull origin main

# Create temp_sensor.py and temperature_recorder.py
# Test with:
python3 temp_sensor.py start
tail -f hospital_data/active_logs/temperature_log.log
python3 temp_sensor.py stop

# Commit changes
git add temp_sensor.py temperature_recorder.py
git commit -m "[Temperature] Add temperature sensor simulation"
git push origin main
```

#### Step 4: Water System (Member 3)
```bash
# Pull latest changes
git pull origin main

# Create water_meter.py and water_consumption.py
# Test with:
python3 water_meter.py start
tail -f hospital_data/active_logs/water_usage_log.log
python3 water_meter.py stop

# Commit changes
git add water_meter.py water_consumption.py
git commit -m "[Water Meter] Add water consumption monitoring"
git push origin main
```

#### Step 5: Archive System (Member 4)
```bash
# Pull latest changes
git pull origin main

# Create archive_logs.sh
chmod +x archive_logs.sh

# Test archival functionality
./archive_logs.sh
# Select option 1, 2, or 3 to test

# Commit changes
git add archive_logs.sh
git commit -m "[Archive] Add interactive log archival system"
git push origin main
```

#### Step 6: Analysis System (Member 5)
```bash
# Pull latest changes
git pull origin main

# Create analyze_logs.sh
chmod +x analyze_logs.sh

# Test analysis functionality
./analyze_logs.sh
# Select option 1, 2, or 3 to test

# Create README.md
# Commit changes
git add analyze_logs.sh README.md
git commit -m "[Analysis] Add log analysis and reporting system"
git push origin main
```

### PHASE 2: Integration Testing (Days 4-5)

#### Step 7: Complete System Test
```bash
# 1. Start all simulators
python3 heart_monitor.py start
python3 temp_sensor.py start  
python3 water_meter.py start

# 2. Let run for 2-3 minutes to generate data

# 3. Test archive functionality
./archive_logs.sh
# Test each option (1, 2, 3)

# 4. Test analysis functionality
./analyze_logs.sh
# Test each option (1, 2, 3)

# 5. Verify reports
cat hospital_data/reports/analysis_report.txt

# 6. Stop all simulators
python3 heart_monitor.py stop
python3 temp_sensor.py stop
python3 water_meter.py stop
```

#### Step 8: Fix Integration Issues
- Each member fixes issues in their component
- Test again until all functionality works
- Update documentation as needed

### PHASE 3: Final Testing & Documentation (Days 6-7)

#### Step 9: Final Validation
```bash
# Verify all required files exist:
ls -la archive_logs.sh
ls -la analyze_logs.sh
ls -la README.md
ls -la temperature_recorder.py
ls -la heart_rate_monitor.py
ls -la water_consumption.py

# Test complete workflow one final time
```

#### Step 10: Documentation Review
- Review README.md for completeness
- Ensure all usage instructions are clear
- Add troubleshooting section if needed
- Verify all team members are credited

#### Step 11: Final Submission
```bash
# Final commit from each member
git add .
git commit -m "[Final] Ready for submission"
git push origin main

# Submit GitHub repository URL
```

## Individual Member Responsibilities

### Member 1 (Project Lead - Heart Rate System)
**Files to create:**
- `heart_monitor.py`
- `heart_rate_monitor.py`
- Initial directory structure

**Key tasks:**
- Repository setup and management
- Heart rate simulation (2 devices, 60-100 BPM)
- Team coordination and integration

### Member 2 (Temperature System)
**Files to create:**
- `temp_sensor.py`
- `temperature_recorder.py`

**Key tasks:**
- Temperature simulation (2 devices, 36.0-39.5°C)
- Temperature logging functionality
- Integration testing

### Member 3 (Water System)
**Files to create:**
- `water_meter.py`
- `water_consumption.py`

**Key tasks:**
- Water usage simulation (1 device, 1-10 units)
- Water logging functionality
- System validation

### Member 4 (Archive System)
**Files to create:**
- `archive_logs.sh`

**Key tasks:**
- Interactive menu system
- Timestamp-based archiving
- Error handling implementation

### Member 5 (Analysis & Documentation)
**Files to create:**
- `analyze_logs.sh`
- `README.md`

**Key tasks:**
- Log analysis with device statistics
- Report generation
- Comprehensive documentation

## Testing Checklist

### Functionality Tests:
- [ ] All simulators start and generate data
- [ ] Log files created in correct format
- [ ] Archive script moves files with timestamps
- [ ] Analysis script counts devices correctly
- [ ] Reports generated properly
- [ ] All simulators stop cleanly

### File Structure Tests:
- [ ] All required files present
- [ ] Correct directory structure
- [ ] Proper file permissions (scripts executable)
- [ ] No missing dependencies

### Collaboration Tests:
- [ ] Multiple commits from each member
- [ ] Meaningful commit messages
- [ ] No merge conflicts
- [ ] Clean Git history

## Common Issues & Solutions

### Issue 1: Permission Denied
```bash
chmod +x archive_logs.sh analyze_logs.sh
```

### Issue 2: Directory Not Found
```bash
mkdir -p hospital_data/active_logs
mkdir -p hospital_data/archives/heart_data_archive
mkdir -p hospital_data/archives/temperature_archive
mkdir -p hospital_data/archives/water_archive
mkdir -p hospital_data/reports
```

### Issue 3: Process Already Running
```bash
python3 heart_monitor.py stop
python3 temp_sensor.py stop
python3 water_meter.py stop
```

### Issue 4: Log Files Not Generated
- Check if simulators are running
- Verify directory permissions
- Check for error messages

## Success Criteria

### Technical Requirements ✅
- Interactive shell scripts with menus
- Timestamp-based archiving
- Device statistics analysis
- Error handling and validation
- Proper file organization

### Collaboration Requirements ✅
- 5 team members with distinct contributions
- Multiple meaningful commits
- Well-documented code
- Successful integration

### Submission Requirements ✅
- GitHub repository with correct name
- All 6 required files present
- Working scripts and documentation
- Clean project structure

This implementation guide ensures systematic development and successful collaboration for your 5-person team!