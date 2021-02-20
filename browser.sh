# This program is a shell web browser
# Run on Linux
# Author: (Patrick) Peiyuan Chen

# ***Start of the program***

echo "Input an url:" # Prompt to input the URL
read url

ip=`host $url | sed '2,20 d'` # Ask DNS server for IP address
IP=`echo $ip | awk '{print$4}'` # And trim the received information 

echo "$url has IP address: $IP" # Print the IP of the URL

echo "Input the server port:" #Ask to input a port number
read port

echo "Input the server directory:" # Input the directory to access the file
read directory

echo "Input a file name for saving new file:" # Create a name for saving new file
read fileName

# Establish TCP connection and send HTTP GET request
echo "GET $directory \n\n" | nc $IP $port > $fileName # Write the received data to a file

echo "Opening \"$fileName\" ..."
xdg-open $fileName # Open the file with default application

echo "End of the program"

exit

# ***End of the program***
