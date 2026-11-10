#!/bin/bash

status=0

## Variables
hostname=$(hostname)
routes=$(ip route)
interfaces=$(ip -br addr)

## Echos
echo "=== Network Diagnostics ==="
echo "Hostname: $hostname"

show_network_interfaces() {
    echo "=== Network Interfaces ==="
    ip -br addr
}

show_network_interfaces

echo "=== Routing Table ==="
echo "Routes: $routes"

echo "=== Connectivity Test ==="
if ping -c 2 -W 2 1.1.1.1 > /dev/null; then
    echo "Connection: OK"
else
    echo "Connection: FAILED"
    status=1
fi

echo "=== DNS Test ==="

if command -v resolvectl > /dev/null; then
    echo "resolvectl installed"

    if resolvectl query google.com > /dev/null; then
        echo "DNS resolution: OK"
    else
        echo "DNS resolution: FAILED"
        status=1
    fi
else
    echo "resolvectl not found"
    status=1
fi

echo "=== Summary ==="

if [ "$status" -eq 0 ]; then
    echo "All diagnostic checks passed"
else
    echo "One or more diagnostic checks failed"
fi

exit "$status"


