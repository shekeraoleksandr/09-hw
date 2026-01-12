#!/bin/bash

echo "=== Verifying Apache2 installation ==="

apache2 -v
echo ""

if sudo systemctl is-active --quiet apache2; then
    echo "Apache2 service is running"
else
    echo "Apache2 service is not running"
    exit 1
fi

if curl -s http://localhost/ | grep -q "Apache"; then
    echo "Apache2 is responding to HTTP requests"
else
    echo "Apache2 is not responding correctly"
    exit 1
fi

echo "Verification completed successfully"