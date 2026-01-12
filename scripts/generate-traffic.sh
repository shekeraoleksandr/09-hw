#!/bin/bash
echo "=== Generating test traffic ==="

# Generate successful requests
for i in {1..5}; do
    curl -s http://localhost/ > /dev/null
    echo "Request $i: 200 OK"
done

# Generate 404 errors
for i in {1..3}; do
    curl -s http://localhost/nonexistent-page-$i 2>/dev/null || true
    echo "Request for nonexistent page $i: 404 Not Found"
done

# Generate 403 error
curl -s http://localhost/.htaccess 2>/dev/null || true
echo "Request for forbidden resource: 403 Forbidden"

sleep 2
echo "Test traffic generation completed"
