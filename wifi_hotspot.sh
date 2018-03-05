sudo apt-get autoremove hostapd -Y
wget https://github.com/jenssegers/RTL8188-hostapd/archive/v2.0.tar.gz
tar -zxvf v2.0.tar.gz
cd RTL8188-hostapd-2.0/hostapd
sudo make
sudo make install
ln -s /etc/init.d/hostapd /etc/rc2.d/S02hostapd
sudo apt-get update
sudo apt-get install udhcpd
sudo sed -i -e 's/wpa=3/wpa=2/g' /etc/hostapd/hostapd.conf
echo "start 192.168.42.2
end 192.168.42.20
interface wlan0
remaining yes
opt dns 8.8.8.8 4.2.2.2
opt subnet 255.255.255.0
opt router 192.168.42.1
opt lease 864000">> /etc/udhcpd.conf
sudo sed -i -e 's/DHCPD_ENABLED="no"/#DHCPD_ENABLED="no"/g' /etc/default/udhcpd
sudo ifconfig wlan0 192.168.42.1
echo "iface wlan0 inet static
address 192.168.42.1
netmask 255.255.255.0">> /etc/network/interfaces 
sudo sed -i -e 's/channel=1/channel=6/g'  /etc/hostapd/hostapd.conf
sudo sed -i -e 's/ssid=wifi/ssid=PhotoBooth_hotspot/g' /etc/hostapd/hostapd.conf
sudo sed -i -e 's/wpa_passphrase=YourPassPhrase/wpa_passphrase=12345678/g' /etc/hostapd/hostapd.conf
sudo sh -c "echo 1 > /proc/sys/net/ipv
echo "net.ipv4.ip_forward=1">> /etc/sysctl.conf 
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
echo "up iptables-restore < /etc/iptables.ipv4.nat" >> /etc/network/interfaces 
sudo service hostapd start
sudo service udhcpd start
sudo reboot
