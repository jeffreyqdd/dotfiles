#!/usr/bin/env sh
# Linux cpu/memory status for tmux (uses /proc)

cpu_avg=$(awk '{printf " %.2f/1.00", $1}' /proc/loadavg)
mem_avg=$(awk '/MemTotal/ {total=$2} /MemAvailable/ {avail=$2} END {used=(total-avail)/1024/1024; printf " %.2fG", used}' /proc/meminfo)

echo "$cpu_avg $mem_avg"
