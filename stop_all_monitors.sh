#!/bin/bash

echo "Stopping all hospital monitoring systems..."
echo ""

echo "1. Stopping Heart Rate Monitor..."
python3 heart_rate_monitor.py stop
sleep 1

echo ""
echo "2. Stopping Temperature Recorder..."
python3 temperature_recorder.py stop
sleep 1

echo ""
echo "3. Stopping Water Consumption Monitor..."
python3 water_consumption.py stop
sleep 1

echo ""
echo "========================================"
echo "✅ All monitoring systems have been stopped!"
echo "========================================"
