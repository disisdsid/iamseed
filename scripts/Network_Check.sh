#!/bin/bash
echo "Enter the host to ping:"
read host
ping -c 1 "$host" &> /dev/null

if [ $? -eq 0 ]; then
    echo "Host is reachable."
else
    echo "Host is not reachable."
fi
-------------------------------------------
#!/bin/bash
public_ip=$(curl -s ifconfig.me)
echo "Public IP Address: $public_ip"
----------------------------------------
#!/bin/bash
echo "Enter the host to check:"
read host
echo "Enter the port to check:"
read port

(echo >/dev/tcp/$host/$port) &>/dev/null

if [ $? -eq 0 ]; then
    echo "Port $port is open on $host."
else
    echo "Port $port is closed on $host."
fi
-------------------------------------
#!/bin/bash
echo "Enter the URL to download:"
read url
wget "$url"
-------------------------------------
#!/bin/bash
echo "Enter a URL:"
read url

protocol=$(echo $url | sed -e's,^\(.*://\).*,\1,g')
url_no_protocol=$(echo $url | sed -e's,^\(.*://\)\(.*\),\2,g')
host=$(echo $url_no_protocol | cut -d/ -f1)
path=$(echo $url_no_protocol | cut -d/ -f2-)

echo "Protocol: $protocol"
echo "Host: $host"
echo "Path: $path"
-----------------------------------------------
#!/bin/bash
echo "Network traffic details:"
netstat -tuln
------------------------------------------
#!/bin/bash
while true
do
    echo -e "HTTP/1.1 200 OK\r\n\r\n $(date)" | nc -l -p 8080
done
-------------------------------------------
#!/bin/bash
echo "Enter the username:"
read username
echo "Enter the host:"
read host

ssh $username@$host
-----------------------------------------
#!/bin/bash
echo "Enter the host to scan:"
read host
echo "Enter the start port:"
read start_port
echo "Enter the end port:"
read end_port

for ((port=$start_port; port<=$end_port; port++))
do
    (echo >/dev/tcp/$host/$port) &>/dev/null && echo "Port $port is open"
done
--------------------------------------------------
