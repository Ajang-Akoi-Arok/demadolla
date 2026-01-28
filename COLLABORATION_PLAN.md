# Hospital Data Monitoring System - Team Collaboration Plan

## Team Structure (5 Members)

### Member 1: Project Lead & Heart Rate System
**Responsibilities:**
- Create and maintain `heart_monitor.py` and `heart_rate_monitor.py`
- Set up initial project structure and directories
- Coordinate team activities and ensure code integration
- Handle GitHub repository setup and main branch management

**Tasks:**
1. Initialize project directory structure
2. Implement heart rate monitoring simulator
3. Test heart rate data generation (60-100 BPM range)
4. Create initial commit with project structure
5. Review and merge team member contributions

**Files to Create/Maintain:**
- `heart_monitor.py`
- `heart_rate_monitor.py`
- Initial directory structure
- `.gitignore` file

---

### Member 2: Temperature Monitoring System
**Responsibilities:**
- Develop temperature sensor simulation system
- Implement temperature data logging functionality
- Test temperature sensor integration with main system

**Tasks:**
1. Create `temp_sensor.py` with 2 temperature sensors
2. Create `temperature_recorder.py` for GitHub submission
3. Implement temperature range validation (36.0-39.5°C)
4. Test temperature logging to `temperature_log.log`
5. Document temperature system functionality

**Files to Create/Maintain:**
- `temp_sensor.py`
- `temperature_recorder.py`
- Temperature system documentation

---

### Member 3: Water Usage Monitoring System
**Responsibilities:**
- Develop water consumption monitoring system
- Implement water usage data collection
- Test water meter integration

**Tasks:**
1. Create `water_meter.py` with water consumption meter
2. Create `water_consumption.py` for GitHub submission
3. Implement usage range (1-10 units)
4. Test water usage logging to `water_usage_log.log`
5. Validate water meter functionality

**Files to Create/Maintain:**
- `water_meter.py`
- `water_consumption.py`
- Water system documentation

---

### Member 4: Archive Management System
**Responsibilities:**
- Develop interactive archival script
- Implement log file archiving with timestamp naming
- Create error handling for archival operations

**Tasks:**
1. Create `archive_logs.sh` with interactive menu
2. Implement timestamp-based file naming (heart_rate_YYYY-MM-DD_HH:MM:SS.log)
3. Add error handling for missing files and invalid input
4. Test archival functionality for all log types
5. Document archival process and usage

**Files to Create/Maintain:**
- `archive_logs.sh`
- Archive system documentation
- Test archival scenarios

---

### Member 5: Analysis & Reporting System
**Responsibilities:**
- Develop log analysis script
- Implement device statistics and reporting
- Create comprehensive project documentation

**Tasks:**
1. Create `analyze_logs.sh` with interactive analysis menu
2. Implement device occurrence counting using awk, sort, uniq
3. Add first/last timestamp analysis (bonus feature)
4. Create reporting functionality to `analysis_report.txt`
5. Write comprehensive `README.md`

**Files to Create/Maintain:**
- `analyze_logs.sh`
- `README.md`
- Analysis system documentation
- Final project documentation

---

## Collaboration Workflow

### Phase 1: Individual Development (Days 1-3)
- Each member develops their assigned components
- Regular communication via team chat/email
- Daily progress updates

### Phase 2: Integration Testing (Days 4-5)
- Integrate all components
- Test complete system functionality
- Fix integration issues

### Phase 3: Final Testing & Documentation (Days 6-7)
- Complete system testing
- Finalize documentation
- Prepare GitHub submission

## Git Workflow

### Branch Strategy:
- `main` branch for stable code
- Feature branches for each component:
  - `feature/heart-monitor`
  - `feature/temperature-sensor`
  - `feature/water-meter`
  - `feature/archive-system`
  - `feature/analysis-system`

### Commit Guidelines:
- Use meaningful commit messages
- Format: `[Component] Description of changes`
- Examples:
  - `[Heart Monitor] Add heart rate simulation with 2 devices`
  - `[Archive] Implement timestamp-based file naming`
  - `[Analysis] Add device statistics counting`

### Code Review Process:
1. Create pull request for feature branch
2. At least one team member reviews code
3. Project lead approves and merges
4. Delete feature branch after merge

## Communication Plan

### Daily Standups (15 minutes):
- What did you complete yesterday?
- What will you work on today?
- Any blockers or issues?

### Weekly Team Meetings (30 minutes):
- Review progress against timeline
- Discuss integration challenges
- Plan next week's activities

### Communication Channels:
- Primary: Team WhatsApp/Slack group
- Code Reviews: GitHub pull requests
- Documentation: Shared Google Doc
- Emergency: Phone/SMS

## Quality Standards

### Code Quality:
- Follow Python PEP 8 style guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Include error handling

### Shell Script Standards:
- Use proper error handling with exit codes
- Validate user input
- Include usage instructions
- Test all menu options

### Documentation Requirements:
- Clear installation instructions
- Usage examples with expected output
- Troubleshooting section
- System requirements

## Testing Strategy

### Individual Testing:
- Each member tests their component thoroughly
- Create test data and validate functionality
- Document test cases and results

### Integration Testing:
- Test complete workflow: start → generate data → archive → analyze
- Verify file paths and permissions
- Test error scenarios

### Final Acceptance Testing:
- Run complete system test
- Verify all requirements are met
- Test on clean environment

## Deliverables Checklist

### Required Files:
- [ ] `archive_logs.sh`
- [ ] `analyze_logs.sh`
- [ ] `README.md`
- [ ] `temperature_recorder.py`
- [ ] `heart_rate_monitor.py`
- [ ] `water_consumption.py`

### Additional Files:
- [ ] `heart_monitor.py`
- [ ] `temp_sensor.py`
- [ ] `water_meter.py`
- [ ] Directory structure with sample data

### GitHub Repository:
- [ ] Repository name: `Coding-lab_Group{nbr}`
- [ ] All required files committed
- [ ] Multiple commits from different members
- [ ] Meaningful commit messages
- [ ] Working scripts and documentation

## Success Metrics

### Technical Requirements:
- All simulators generate correct data format
- Archive script creates timestamped files
- Analysis script produces device statistics
- All scripts handle errors gracefully

### Collaboration Requirements:
- Multiple commits from each team member
- Clear commit messages showing individual contributions
- Well-documented code and README
- Successful integration of all components

This collaboration plan ensures each team member has clear responsibilities while maintaining good communication and code quality standards.