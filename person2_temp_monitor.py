#!/usr/bin/env python3
import time
import random
import sys
import os
import signal
from datetime import datetime

class TemperatureMonitor:
    def __init__(self):
        self.log_file = "hospital_data/active_logs/temperature_log.log"
        self.pid_file = "hospital_data/temperature.pid"
        self.devices = ["TEMP_SENSOR_001", "TEMP_SENSOR_002"]
        
    def generate_temperature(self):
        return round(random.uniform(36.0, 39.5), 1)
    
    def log_data(self, device_id, temperature):
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"{timestamp} [{device_id}] {temperature}°C\n"
        
        with open(self.log_file, "a") as f:
            f.write(log_entry)
    
    def start_monitoring(self):
        with open(self.pid_file, "w") as f:
            f.write(str(os.getpid()))
        
        print("Temperature monitoring started...")
        try:
            while True:
                for device in self.devices:
                    temperature = self.generate_temperature()
                    self.log_data(device, temperature)
                time.sleep(8)  # Log every 8 seconds
        except KeyboardInterrupt:
            self.stop_monitoring()
    
    def stop_monitoring(self):
        if os.path.exists(self.pid_file):
            os.remove(self.pid_file)
        print("Temperature monitoring stopped.")
        sys.exit(0)

def main():
    monitor = TemperatureMonitor()
    
    if len(sys.argv) != 2:
        print("Usage: python3 person2_temp_monitor.py [start|stop]")
        sys.exit(1)
    
    command = sys.argv[1]
    
    if command == "start":
        monitor.start_monitoring()
    elif command == "stop":
        if os.path.exists(monitor.pid_file):
            with open(monitor.pid_file, "r") as f:
                pid = int(f.read().strip())
            os.kill(pid, signal.SIGTERM)
            print("Temperature monitoring stopped.")
        else:
            print("No temperature monitoring process found.")

if __name__ == "__main__":
    main()