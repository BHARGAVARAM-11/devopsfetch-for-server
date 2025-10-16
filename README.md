# DevOpsFetch — Server Information Retrieval & Monitoring Tool

## objective
   DevOpsFetch is a command-line tool designed for DevOps engineers to retrieve, display, and monitor critical server information. It provides real-time insights into active ports, Docker containers, Nginx configurations, and user logins, with integrated logging and 

## Features
| ### Module	            |    ### Description|
|--------------------------|------------------|
|-Port Monitoring	       |   List all active ports & services, or inspect a specific port.|
|-Docker Insights	       |  List Docker images/containers, or check individual container details.|
|-Nginx Viewer	            | Show configured domains, ports, and server blocks.|
|-User Tracking	       |    List users and their last login times.|
|-Time-based Queries       | Display logs for a specific time range.|
|-Continuous Monitoring	  | Run as a systemd service, logging automatically to   /opt/devopsfetch/logs/devopsfetch.log.|
|-Formatted Output         |  Uses tabulate for easy-ommands and options.|
|-Help Flag (-h)	       |    Quick reference for all c|
## Project structure
```
  devopsfetch/
├── devopsfetch.py           # Main CLI tool
├── install.sh               # Optional installation script
├── service/
│   └── devopsfetch.service  # systemd service unit file
└── logs/
    └── devopsfetch.log      # Automatically generated logs
```

   ## Installation
### Clone the Repository
```
    git clone https://github.com/<your-username>/devopsfetch.git
    cd devopsfetch
```

## Install Dependencies

### Ubuntu/Debian
```
sudo apt update
sudo apt install python3 python3-tabulate -y
```

### Using pip (Virtual Environment Recommended)
```
python3 -m venv venv
source venv/bin/activate
pip install tabulate
```
## Make devopsfetch global
```
sudo cp devopsfetch.py /usr/local/bin/devopsfetch
sudo chmod +x /usr/local/bin/devopsfetch
```

Now you can run:
`
devopsfetch -p
`
## Usage Examples
|Command|	|Description|
|-------| |-----------|
|`devopsfetch -p`|	|List all active ports|
|`devopsfetch -p 80`|	|Show details for port 80|
|`devopsfetch -d`|	|List Docker images & containers|
|`devopsfetch -d <container_name>`|	|Inspect a specific container|
|`devopsfetch -n`|	|List all Nginx domains and ports|
|`devopsfetch -n example.com`|	|Show Nginx config for a domain|
|`devopsfetch -u`|	|List all users and last login times|
|`devopsfetch -u`| |username	Show info for a specific user|
|`devopsfetch -t "2025-10-09 10:00:00" "2025-10-09 12:00:00"`|	|Show logs between two timestamps|
  
  ## LOgs

Logs are stored at:
`
/opt/devopsfetch/logs/devopsfetch.log
`

View logs in real-time:
`
tail -f /opt/devopsfetch/logs/devopsfetch.log
`

Sample log entry:
```
2025-10-09T10:45:10 - Ports info queried all ports
2025-10-09T10:45:15 - Docker info queried all containers
2025-10-09T10:45:22 - Users info queried all users
```
## Continuous Monitoring with systemd
Copy Service File
`
sudo cp service/devopsfetch.service /etc/systemd/system/
`
 Enable and Start Service
``` 
sudo systemctl daemon-reload
sudo systemctl enable devopsfetch
sudo systemctl start devopsfetch
```
 Check Status
 `
sudo systemctl status devopsfetch
`
 Optional: Log Rotation

Prevent logs from growing too large using logrotate:
`
sudo nano /etc/logrotate.d/devopsfetch
`

Add:
```
/opt/devopsfetch/logs/devopsfetch.log {
    weekly
    rotate 4
    compress
    missingok
    notifempty
}
```
Help
`
devopsfetch -h
`

Displays full command-line options and usage instructions.

## Summary

DevOpsFetch provides automated system inspection, tabulated output, logging, and optional monitoring via systemd — all designed for quick DevOps server insights.

