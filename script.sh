#/bin/bash
echo "Creating ad-hoc network"
ifconfig wlan0 down
iwconfig wlan0 mode ad-hoc
iwconfig wlan0 key 987654321a #WEP key
iwconfig wlan0 essid pi     #SSID
ifconfig wlan0 up
echo "Ad-hoc network created"
echo "================================="
echo "RPi Network Conf Bootstrapper 0.1"
echo "================================="
echo "Scanning for known WiFi networks"
iw wlan0 scan
sleep 2
ifconfig wlan0 192.168.0.2 netmask 255.255.255.0
sleep 1
service isc-dhcp-server start
sleep 1
dhclient -r wlan0
sleep 2
dhclient wlan0
exit 0
