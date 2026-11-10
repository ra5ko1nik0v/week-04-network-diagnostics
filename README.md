# Week 04 - Network Diagnostics

A bash script that performs basic network diagnostics on Linux systems

Part of my Linux DevOps learning journey

## Features

- Displays the system hostname
- Lists network interfaces and IP addresses
- Diplays the routing tables
- Tests network connectivity using ping
- Tests DNS resolution using resolvectl
- Reports diagnostic failures using exit codes

## Requirements

- linux
- bash
- iproute2
- ping
- systemd-resolved (resolvectl)

## Usage

run the script

```bash
bash network-check.sh
```
Check the exit status

```bash
echo $?
```

Exit codes:
- `0`- all checks passed
- `1` - one or more checks failed

## Example output

```text
=== Network Diagnostics ===
Hostname: stavrogin
===Network Interfaces ===
lo         UNKNOWN     127.0.0.1/8
wlp3s0     UP          192.168.1.10/24
```

## What I've learned

- inspecting linux network interfaces using ip
- understanding routing tables and default gateways
- testing connectivity with ping
- checking DNS resolution
- using bash conditionals and functions
- handling failures through exit codes
- testing scripts by simulating command failures

## Limitations

- connectivity is tested against 1.1.1.1
- DNS resolution is tested against google.com
- DNS checks require resolvectl
- the script is intended for linux environemnts


