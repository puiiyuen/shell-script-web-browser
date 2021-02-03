# This program is a shell web browser
# 

echo "Input the url of the server:"
read url

ip=`host $url | sed '2,20 d'`
IP=`echo $ip | awk '{print$4}'`

echo "$url has IP address: $IP"

echo "Input the port:"
read port

echo "Inpute the directory:"
read directory

echo "GET $directory HTTP/1.0\r\n\r\n" | nc $IP $port

# nc $IP $port

echo "End of the program"