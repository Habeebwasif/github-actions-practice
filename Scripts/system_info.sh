#!/bin/bash

# functionn 1: System info & hostname
sys_info(){
	echo "HostName : $(hostname)"
	echo "Kernel   : $(uname -r)"
	echo "OS       : $(grep -E '^(NAME|VERSION)=' /etc/os-release)"
}

# function 2: Uptime
show_uptime() {
    uptime
}

# Function 3: Disk usage - top 5
disk_usage() {
    df -h | sort -k3 -hr | head -5
}

# Function 4: Memory usage
memory() {
    free -h
}

# Function 5: HIGH CPU-consuming processes
cpu_processes() {
    ps aux --sort=-%cpu | head -6
}

# Main function
main() {

    echo "===== SYSTEM INFORMATION ====="
    sys_info

    echo ""
    echo "===== UPTIME ====="
    show_uptime

    echo ""
    echo "===== DISK USAGE ====="
    disk_usage

    echo ""
    echo "===== MEMORY USAGE ====="
    memory

    echo ""
    echo "===== HIGH CONSUMING CPU PROCESSES ====="
    cpu_processes
}

main