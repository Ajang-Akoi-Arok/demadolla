#!/usr/bin/env python3
import time
import random
import sys
import os
import signal
from datetime import datetime

class WaterMonitor:
    def __init__(self):
        self.log_file = "hospital_data/active_logs/water_usage_log.log"
        self.pid_file = "hospital_data/water.pid"
        self.device_id = "WATER_METER_001"
        
    def generate_water_usage(self):
        return random.randint(1, 10)
    
    def log_data(self, device_id, usage):
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"{timestamp} [{device_id}] {usage} units\n"
        
        with open(self.log_file, "a") as f:
            f.write(log_entry)
    
    def start_monitoring(self):
        with open(self.pid_file, "w") as f:
            f.write(str(os.getpid()))
        
        print("Water usage monitoring started...")
        try:
            while True:
                usage = self.generate_water_usage()
                self.log_data(self.device_id, usage)
                time.sleep(10)  # Log every 10 seconds
        except KeyboardInterrupt:
            self.stop_monitoring()
    
    def stop_monitoring(self):
        if os.path.exists(self.pid_file):
            os.remove(self.pid_file)
        print("Water monitoring stopped.")
        sys.exit(0)

def main():
    monitor = WaterMonitor()
    
    if len(sys.argv) != 2:
        print("Usage: python3 person2_water_monitor.py [start|stop]")
        sys.exit(1)
    
    command = sys.argv[1]
    
    if command == "start":
        monitor.start_monitoring()
    elif command == "stop":
        if os.path.exists(monitor.pid_file):
            with open(monitor.pid_file, "r") as f:
                pid = int(f.read().strip())
            os.kill(pid, signal.SIGTERM)
            print("Water monitoring stopped.")
        else:
            print("No water monitoring process found.")

if __name__ == "__main__":
    main()