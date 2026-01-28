
#!/bin/bash

# setup_directories.sh - Creates the correct directory structure

echo "========================================"
echo "  Setting up Hospital Log Management System"
echo "========================================"
echo ""

# Remove any existing incorrect directories
echo "Cleaning up old structure..."
rm -rf active_logs archives reports 2>/dev/null

# Create the CORRECT structure inside hospital_data
echo "Creating correct directory structure..."
mkdir -p hospital_data/active_logs
mkdir -p hospital_data/archived_logs  # NOTE: archived_logs NOT archives
mkdir -p hospital_data/archived_logs/heart_data_archive
mkdir -p hospital_data/archived_logs/temperature_data_archive
mkdir -p hospital_data/archived_logs/water_usage_data_archive
mkdir -p hospital_data/reports

# Create empty log files
touch hospital_data/active_logs/heart_rate.log
touch hospital_data/active_logs/temperature.log
touch hospital_data/active_logs/water_usage.log

# Create empty report file
touch hospital_data/reports/analysis_report.txt

# Fix any existing 'archives' directory to 'archived_logs'
if [ -d "hospital_data/archives" ]; then
    echo "Renaming 'archives' to 'archived_logs'..."
    mv hospital_data/archives hospital_data/archived_logs
fi

# Fix archive subdirectory names
if [ -d "hospital_data/archived_logs/temperature_archive" ]; then
    mv hospital_data/archived_logs/temperature_archive hospital_data/archived_logs/temperature_data_archive
fi
if [ -d "hospital_data/archived_logs/water_archive" ]; then
    mv hospital_data/archived_logs/water_archive hospital_data/archived_logs/water_usage_data_archive
fi

# Set permissions
chmod +x *.sh 2>/dev/null

echo ""
echo "✅ Directory structure created successfully!"
echo ""
echo "Final structure:"
echo "hospital_data/"
echo "├── active_logs/"
echo "│   ├── heart_rate.log"
echo "│   ├── temperature.log"
echo "│   └── water_usage.log"
echo "├── archived_logs/"
echo "│   ├── heart_data_archive/"
echo "│   ├── temperature_data_archive/"
echo "│   └── water_usage_data_archive/"
echo "└── reports/"
echo "    └── analysis_report.txt"
echo ""
echo "Setup complete!"
