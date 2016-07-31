### Enabling in FreeBSD kernel
```bash
device pf
device pflog
device pfsync

options         ALTQ
options         ALTQ_CBQ        # Class Bases Queuing (CBQ)
options         ALTQ_RED        # Random Early Detection (RED)
options         ALTQ_RIO        # RED In/Out
options         ALTQ_HFSC       # Hierarchical Packet Scheduler (HFSC)
options         ALTQ_PRIQ       # Priority Queuing (PRIQ)
options         ALTQ_NOPCC      # Required for SMP build
```

### FreeBSD rc.conf all PF options
```bash
pf_enable="NO"
pf_rules="/etc/pf.conf"
pf_program="/sbin/pfctl"
pf_flags=""
pflog_enable="NO"
pflog_logfile="/var/log/pf.log"
pflog_program="/sbin/pflogd"
pflog_flags=""
pfsync_enable="NO"
pfsync_syncdev=""
pfsync_ifconfig=""
```

### Sample config
```bash
# PF.CONF // BEGIN CONFIG
#---------------------------

#---------------------------
# Macros
#---------------------------

#---------------------------
# Network Interfaces
#---------------------------
ext_if="em1" # External
int_if="em0" # Internal

#---------------------------
# ICMP allowed
#---------------------------
icmp_types="{ echoreq, unreach}"

#---------------------------
# Networks and hosts
#---------------------------
lan="192.168.10.0/24" 		# internal network
sec="10.10.30.0/24"		# secured network
loop="127.0.0.0/8" 		# loopback

iis1="192.168.10.45/32" 	# Development IIS server 1
iis2="192.168.10.46/32" 	# Development IIS server 1
redmine="192.168.10.48/32"	# Redmine - internal team site

publicated_services="{ 192.168.10.45/32, 192.168.10.46/32, 192.168.10.48/32, }"
allowed_inbound_ports="{ 22, 80, 90, 91 }"

#---------------------------
# Global options
#---------------------------
set block-policy return 	# Default block polycy: return, drop
set skip on lo0 		# Loopback exception
scrub in all 			# Normalise packets: build full packet before send to receiver; drop uncorrectly flagged packages

#---------------------------
# ALTQ
#---------------------------

#---------------------------
# NAT and Port Forwarding
#---------------------------
nat on $ext_if from $lan to any -> ($ext_if)

rdr on $ext_if proto { tcp, udp } from any to $ext_if port 90 -> $iis1 port 90		# Development IIS server 1 port forwarding
rdr on $ext_if proto { tcp, udp } from any to $ext_if port 91 -> $iis1 port 91		# Development IIS server 2 port forwarding
rdr on $ext_if proto { tcp, udp } from any to $ext_if port http -> $redmine port http	# Redmine port forwarding

#---------------------------
# FIREWALL RULES
#---------------------------
antispoof quick for $ext_if 	# Antispoofing - drop all packets if sender addr=$ext_if addr. Key "quick" means that pf must aplly this rule and stop script (like IPFW works)

# For future: full antispoofing:
# block drop in quick on ! tun0 inet from tun0 to any
# block drop in quick inet from tun0 to any
# RFC 1918 и 3330 block packets from 127.0.0.0/8, 240.0.0.0/4, 169.254.0.0/16 и т.д.

block all 			# Block all traffic by default

#---------------------------
# Local rules
# --------------------------
pass out on $ext_if from $ext_if to any keep state
pass in log on $ext_if from any port 22 to $ext_if port 22 keep state

#---------------------------
# Internal network rules
#---------------------------
pass out on $ext_if from $lan to any keep state

#---------------------------
# External network rules
#---------------------------
pass in log on $ext_if proto { tcp, udp } from any to $publicated_services port $allowed_inbound_ports keep state


pass log inet proto icmp all icmp-type $icmp_types

#---------------------------
# PF.CONF // END CONFIG
```