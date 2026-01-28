#!/bin/bash

echo "🚀 Performing COMPLETE fresh setup..."
echo ""

# Backup existing log data
echo "1. Backing up existing data..."
mkdir -p backup_data
cp -r hospital_data/active_logs/*.log backup_data/ 2>/dev/null || true
cp -r hospital_data/archived_logs/* backup_data/ 2>/dev/null || true
cp hospital_data/reports/analysis_report.txt backup_data/ 2>/dev/null || true

# Remove everything
echo "2. Removing old structure..."
rm -rf hospital_data

# Create fresh structure
echo "3. Creating fresh directory structure..."
mkdir -p hospital_data/active_logs
mkdir -p hospital_data/archived_logs
mkdir -p hospital_data/archived_logs/heart_data_archive
mkdir -p hospital_data/archived_logs/temperature_data_archive
mkdir -p hospital_data/archived_logs/water_usage_data_archive
mkdir -p hospital_data/reports

# Create empty files with CORRECT names
echo "4. Creating log files with correct names..."
touch hospital_data/active_logs/heart_rate.log
touch hospital_data/active_logs/temperature.log
touch hospital_data/active_logs/water_usage.log
touch hospital_data/reports/analysis_report.txt

# Restore backed up data
echo "5. Restoring backed up data..."
cp backup_data/*.log hospital_data/active_logs/ 2>/dev/null || true
cp -r backup_data/*_archive/* hospital_data/archived_logs/*_archive/ 2>/dev/null || true
cp backup_data/analysis_report.txt hospital_data/reports/ 2>/dev/null || true

# Clean up backup
rm -rf backup_data

echo ""
echo "✅ FRESH SETUP COMPLETE!"
echo ""
echo "Current structure:"
tree hospital_data/
