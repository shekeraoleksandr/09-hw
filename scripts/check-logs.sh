#!/bin/bash

echo "=== Analyzing Apache logs for 4xx and 5xx errors ==="

ACCESS_LOG="/var/log/apache2/access.log"
ERROR_LOG="/var/log/apache2/error.log"

echo ""
echo "--- 4xx Client Errors ---"
ERRORS_4XX=$(sudo grep -E " 4[0-9]{2} " $ACCESS_LOG 2>/dev/null || true)
if [ -z "$ERRORS_4XX" ]; then
    echo "No 4xx errors found"
else
    echo "$ERRORS_4XX" | tail -20
    COUNT_4XX=$(echo "$ERRORS_4XX" | wc -l)
    echo "Total 4xx errors: $COUNT_4XX"
fi

echo ""
echo "--- 5xx Server Errors ---"
ERRORS_5XX=$(sudo grep -E " 5[0-9]{2} " $ACCESS_LOG 2>/dev/null || true)
if [ -z "$ERRORS_5XX" ]; then
    echo "No 5xx errors found"
else
    echo "$ERRORS_5XX" | tail -20
    COUNT_5XX=$(echo "$ERRORS_5XX" | wc -l)
    echo "Total 5xx errors: $COUNT_5XX"
fi

echo ""
echo "--- Summary ---"
echo "4xx errors: ${COUNT_4XX:-0}"
echo "5xx errors: ${COUNT_5XX:-0}"

echo ""
echo "--- Last 10 access log entries ---"
sudo tail -10 $ACCESS_LOG

echo ""
echo "--- Recent error log entries ---"
sudo tail -10 $ERROR_LOG 2>/dev/null || echo "No error log entries"