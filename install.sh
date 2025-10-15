#!/bin/bash
set -e
sudo apt-get update
sudo apt-get install -y python3 python3-pip nginx docker.io ss
pip3 install tabulate
sudo mkdir -p /opt/devopsfetch/logs
sudo cp devopsfetch.py /opt/devopsfetch/
sudo chmod +x /opt/devopsfetch/devopsfetch.py

# Deploy service unit
sudo cp service/devopsfetch.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable devopsfetch.service
sudo systemctl start devopsfetch.service

# Set up logrotate
sudo cp service/logrotate.conf /etc/logrotate.d/devopsfetch

