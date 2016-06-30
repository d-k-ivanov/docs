###  TCPDUMP (with all commands use '| head' optionally)
```bash
# Capture bunch of packets
tcpdump -w capture.pcap
# Show list of unique tcp or udp connections ip addresses
tcpdump -nn -r capture.pcap 'tcp or udp' | cut -f 3 -d " " | cut -f 1-4 -d "." | sort | uniq | sort -nr
# Show list of unique destinations with SYN flag(‘tcp[13]=2’)
tcpdump -nn -r capture.pcap 'tcp[13]=2' | cut -f 5 -d " " | sort | uniq -c | sort -nr
# Show list of unique sources with SYN flag(‘tcp[13]=2’)
tcpdump -nn -r capture.pcap 'tcp[13]=2' | cut -f 3 -d " " | cut -f 1-4 -d "." | sort | uniq -c | sort -nr
# Search for plain texts (-A)
tcpdump -Ann -r capture.pcap 'dst port 25 or dst port 514 or dst port 110 or dst port 21 or dst port 53 or dst port 80'
# Search for top level domains (optiolally for names only: | grep -E '[a-z]')
tcpdump -nn -r capture.pcap 'port 53' | grep -Ev '(com|ru|net|org|gov|mil|arpa)' | cut -f 9 -d " "  
# Investigate HTTP traffic
tcpdump -Ann -r capture.pcap 'port 80' | grep 'HTTP' | grep -Ev '(GET|HEAD)'
# Search HTTP traffic for user-agent list
tcpdump -Ann -r capture.pcap 'port 80' | grep -Ei 'user-agent' | sort | uniq -c | sort -n
tcpdump -Ann -r capture.pcap 'port 80' | sed -n '/Mozilla/,$p'
# Pcap repository (-C filesize in MBytes, -W number of files, -G time in seconds, %s timestamp)
sudo -b tcpdump -nn -i eth0 -w capture.pcap -C 1 -W 5         
sudo -b tcpdump -nn -i eth0 -w capture-%s.pcap -G 600 -W 5    
# Dealing with pcap files
for capfile in $(ls *.pcap); do tcpdump -nnr $capfile 'dst port 53'; done  
```
### NetworkManager: show connection info
```bash
nmcli device show eth0
```
### Check own IP address
```bash
curl -s checkip.dyndns.org
```
### Share current folder over HTTP
```bash
python2 -m SimpleHTTPServer 8080
python3 -mhttp.server 8080
```

