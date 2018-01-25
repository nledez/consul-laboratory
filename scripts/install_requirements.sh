#!/bin/bash
sudo apt-get update
sudo apt-get install -qqy python

for interface in $(cd /sys/class/net ; ls); do
	if [ "${interface}" != "lo" ]; then
		if [ ! -f /etc/network/interfaces.d/${interface}.cfg ]; then
			echo "auto ${interface}" | sudo tee -a /etc/network/interfaces.d/${interface}.cfg
			echo "iface ${interface} inet dhcp" | sudo tee -a /etc/network/interfaces.d/${interface}.cfg
			sudo ifup ${interface}
		fi
	fi
done
