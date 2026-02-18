#!/usr/bin/env sh
# macOS cpu/memory status for tmux (uses sysctl + vm_stat)

cpu_avg=$(sysctl -n vm.loadavg | awk '{load_avg=$2} END {la=load_avg/10; printf " %.2f/1.00", la}')
mem_avg=$(vm_stat | awk '/Pages active/ {active=$3} /Pages wired down/ {wired=$4} /Pages inactive/ {innactive=$3} END {used=(active+wired+innactive)*16384/1024/1024/1024; printf " %.2fG", used}')

echo "$cpu_avg $mem_avg"
