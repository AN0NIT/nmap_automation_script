#!/bin/bash


echo "[+]Running the automation script..."
if [ "$1" != '' ]; then
	IP=$1
fi

echo "[+]Checking if host exists [would take a few seconds...]"

touch ping.txt
filename=ping.txt
count=0
ping -c 10 $IP > $filename

while read line; do
   size=8
   str=$(echo $line | grep 64 | cut -c -"$size")
   if [ "$str" == "64 bytes" ]; then
   	break
	echo "WTF"
   elif [ "$count" -gt "5" ]; then
   	echo "Host $IP is unavailable!"
	rm ping.txt
	exit
   else
	count=$((count+1))
   fi
done < $filename

if [ ! -d "nmap" ]; then
	mkdir nmap
fi
rm ping.txt
printf "\n[+]Running nmap Aggressive scan...\n"
nmap -T4 -A -sV -sC -oN nmap/initial $IP
printf "\n[+]Saved the output as nmap/initial "
#sleep 40s;
printf "\n\n[+]Running nmap Port scan...\n"
nmap -p- -oN nmap/all_ports $IP
printf "\nSaved the output as nmap/all_ports\n"
printf "\nBye...\n"




