## nmap__automation_scipt
## Usage: ./nmap_script.sh < ip-addr >
## Else before running the script, you can set export IP=< ip-addr > in the terminal ; Then u dont have to specify the ip while running the script.


## The main goal of this tool is to avoid manual nmap enumeration.
## This tool at first checks whether the host is alive or not.
## Then creates an nmap directory if it doesnt exists to save the output of the scan result


## This script runs Aggresive Scan with version enumeration, [nmap -T4 -A -sV -sC -oN nmap/initial < ip-addr >]
## After the first scan it runs port scan, which can take some time depending on the Machine we are testing on. [nmap -p- -oN nmap/all_ports < ip-addr >]


## It took me 4 hours to do this code; if you guys find any bug or would love to modify it, please feel free to do so.
## Thank you for checking my code!!
