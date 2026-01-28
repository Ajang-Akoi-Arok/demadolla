
#!/bin/bash

echo "Starting all hospital monitoring systems..."
echo ""

echo "1. Starting Heart Rate Monitor..."
python3 heart_rate_monitor.py start
sleep 2

echo ""
echo "2. Starting Temperature Recorder..."
python3 temperature_recorder.py start
sleep 2

echo ""
echo "3. Starting Water Consumption Monitor..."
python3 water_consumption.py start
sleep 2

echo ""
echo "========================================"
echo "✅ All monitoring systems are now running!"
echo "========================================"
echo ""
echo "To view logs in real-time:"
echo "  tail -f hospital_data/active_logs/heart_rate.log"
echo "  tail -f hospital_data/active_logs/temperature.log"
echo "  tail -f hospital_data/active_logs/water_usage.log"
echo ""
echo "To stop all monitors: ./stop_all_monitors.sh"
