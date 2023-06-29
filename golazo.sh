#!/usr/bin/env bash

# separator - will be placed between title and info
sep=" . "

# text which will be colored randomly at the start of each line
pre=">>"

# colors you want to include - comment out any you dont want
declare -a colors=(
	# "\e[0;1;30m" # black
	"\e[0;1;31m" # red
	"\e[0;1;32m" # green
	"\e[0;1;33m" # blue
	"\e[0;1;34m" # yellow
	"\e[0;1;35m" # pink
	"\e[0;1;36m" # magenta
	# "\e[0;1;37m" # white
)

# get random code and apply it to pre
random_color() {
	size=${#colors[@]}
	index=$(($RANDOM % $size))
	echo "${colors[$index]}${pre}\e[0m"
}

# comment out stuff you don't want to appear and adjust order as you see fit
declare -a order=(
	"user"
	"host"
	# "uptime" # uses uptime command
	"kernel"
	"distro"
	"shell"
	# "de"
	# "terminal"
	# "editor"
	# "ip" # uses host command
	# "cpu"
	# "memory" # uses free command
	# "swap" # uses free also
	# "root" # uses df command
	# "battery"
	# "display" # uses xrandr so will only work with X
)

# things to be fetched
declare -A fetch=(
	[user]="$USER"
	[host]="$(cat /etc/hostname)"
	# [uptime]="$(cat /proc/uptime | awk '{print $1}' | awk '{printf "%dd %dh %dm %ds", $1/86400, $1%86400/3600, ($1/60)%60, $1%60}')"
	[kernel]="$(awk '{print $3}' /proc/version)"
	[distro]="$(sed -n 's/^PRETTY_NAME="//p' /etc/os-release | sed 's/"//')"
	[shell]="$(basename $SHELL)"
	# [de]="$DESKTOP_SESSION"
	# [terminal]="$TERM"
	# [editor]="$EDITOR"
	# [root]="$(df -Th / | tail -n 1 | awk '{print $6}'), $(df -Th / | tail -n 1 | awk '{print $2}')"
	# [ip]="$(host myip.opendns.com resolver1.opendns.com | tail -n 1 | awk '{print $4}')"
	# [battery]="$(cat /sys/class/power_supply/BAT0/capacity)%"
	# [cpu]="$(sed -n 5p /proc/cpuinfo | cut -d: -f2)"
	# [memory]="$(free -h | sed -n 2p | awk '{print $3}' | sed 's/Gi/G/') / $(free -h | sed -n 2p | awk '{print $2}' | sed 's/Gi/G/')"
	# [swap]="$(free -h | sed -n 3p | awk '{print $3}') / $(free -h | sed -n 3p | awk '{print $2}')"
	# [display]="$(xrandr | grep '*' | awk '{print $1}'), $(xrandr | grep '*' | awk '{print $2}' | sed 's/*/Hz/ ; s/+//')"
)

main() {
	for info in "${order[@]}"; do
		echo -e "$(random_color) \e[0;1;3m$info\e[0m${sep}${fetch[$info]}"
	done
}

main
