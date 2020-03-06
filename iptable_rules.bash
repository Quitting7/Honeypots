iptables -t nat -A POSTROUTING -o enp0s25 --source 192.168.56.0/24 -j MASQUERADE
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD --source 192.168.56.0/24 -j ACCEPT
iptables -A FORWARD --source 192.168.56.0/24 --destination 192.168.56.0/24 -j ACCEPT

sysctl -w net.ipv4.ip_forward=1
echo "1" > /proc/sys/net/ipv4/ip_forward


# Rules for cuckoo web service
iptables -A INPUT -p tcp -s 193.11.188.228 --dport 8777 -j ACCEPT
iptables -A INPUT -p tcp -s 0.0.0.0/0 --dport 8777 -j DROP
