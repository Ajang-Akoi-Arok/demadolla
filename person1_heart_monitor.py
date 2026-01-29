#!/usr/bin/env python3
import time
import random
import sys
import os
import signal
from datetime import datetime

class HeartRateMonitor:
    def __init__(self):
        self.log_file = "hospital_data/active_logs/heart_rate_log.log"
        self.pid_file = "hospital_data/heart_rate.pid"
        self.devices = ["HR_DEVICE_001", "HR_DEVICE_002"]
        
    def generate_heart_rate(self):
        return random.randint(60, 100)
    
    def log_data(self, device_id, heart_rate):
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"{timestamp} [{device_id}] {heart_rate} BPM\n"
        
        with open(self.log_file, "a") as f:
            f.write(log_entry)
    
    def start_monitoring(self):
        # Create PID file
        with open(self.pid_file, "w") as f:
            f.write(str(os.getpid()))
        
        print("Heart rate monitoring started...")
        try:
            while True:
                for device in self.devices:
                    heart_rate = self.generate_heart_rate()
                    self.log_data(device, heart_rate)
                time.sleep(5)  # Log every 5 seconds
        except KeyboardInterrupt:
            self.stop_monitoring()
    
    def stop_monitoring(self):
        if os.path.exists(self.pid_file):
            os.remove(self.pid_file)
        print("Heart rate monitoring stopped.")
        sys.exit(0)

def main():
    monitor = HeartRateMonitor()
    
    if len(sys.argv) != 2:
        print("Usage: python3 person1_heart_monitor.py [start|stop]")
        sys.exit(1)
    
    command = sys.argv[1]
    
    if command == "start":
        monitor.start_monitoring()
    elif command == "stop":
        if os.path.exists(monitor.pid_file):
            with open(monitor.pid_file, "r") as f:
                pid = int(f.read().strip())
            os.kill(pid, signal.SIGTERM)
            print("Heart rate monitoring stopped.")
        else:
            print("No heart rate monitoring process found.")
    else:
        print("Invalid command. Use 'start' or 'stop'.")

if __name__ == "__main__":
    main()