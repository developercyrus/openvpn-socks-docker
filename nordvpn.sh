#/etc/init.d/ssh restart

echo "$USERNAME\n$PASSWORD" > /etc/openvpn/auth.txt
echo 'auth-user-pass /etc/openvpn/auth.txt' >> "/etc/openvpn/ovpn_tcp/$REGION.nordvpn.com.tcp.ovpn"
#echo 'script-security 2 system' >> "/etc/openvpn/ovpn_tcp/$REGION.nordvpn.com.tcp.ovpn"
#echo 'up /usr/local/bin/sockd.sh' >> "/etc/openvpn/ovpn_tcp/$REGION.nordvpn.com.tcp.ovpn"
#echo 'up "/usr/sbin/danted -D"' >> "/etc/openvpn/ovpn_tcp/$REGION.nordvpn.com.tcp.ovpn"
#openvpn --config "/etc/openvpn/ovpn_tcp/$REGION.nordvpn.com.tcp.ovpn" --script-security 2 --up "/usr/sbin/danted -D -f /etc/danted.conf" 
openvpn --config "/etc/openvpn/ovpn_tcp/$REGION.nordvpn.com.tcp.ovpn"

#sleep 20

# tun0 appear after vpn connection is established
#sockd -f /etc/danted.conf -D
#systemctl start danted.service
#systemctl restart danted.service

