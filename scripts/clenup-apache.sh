#!/bin/bash

echo "=== Cleaning up existing Apache installation ==="

if command -v apache2 &> /dev/null; then
    echo "Apache2 is installed. Removing..."

    sudo systemctl stop apache2 2>/dev/null || true
    sudo systemctl disable apache2 2>/dev/null || true

    sudo apt purge apache2 apache2-utils apache2-bin apache2.2-common -y
    sudo apt autoremove -y
    sudo apt autoclean

    sudo rm -rf /etc/apache2
    sudo rm -rf /var/log/apache2
    sudo rm -rf /var/www/html

    echo "Apache2 has been completely removed"
else
    echo "Apache2 is not installed. Nothing to clean up."
fi

echo "=== Cleanup completed ==="
