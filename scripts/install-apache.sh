#!/bin/bash

echo "=== Installing Apache2 ==="

sudo apt update
sudo apt install apache2 -y

sudo systemctl start apache2
sudo systemctl enable apache2

echo "Apache2 installation completed"