# Connect through Bastion host on Windows

On Windows OpenSSH works as fine as on Linux hosts, but most of people using PyTTY as SSH client. So to connect via Bastion host which work as SSH Proxy with PuTTY, you need a litle bit complicated config.

## PyTTY config

1. Create new session

2. Go to **Connection -> Data** and set **Auto-Login username** to your remote username on hosts behind bastion

![Data](putty1.png)

3. Go to **Connection -> Proxy** and set up local proxy:

```
Proxy type: Local
Proxy hostname: sshproxy.example.com
Port: 22
Username: ec2-user
Telnet command:
plink.exe -i "<path_to_your_key>" %user@%proxyhost -nc %host:%port
```

![Proxy](putty1.png)

4. Go to **Connection -> SSH -> Auth** and set up ssh key and auth params:

```
+ Allow agen forwarding = True
+ Allow attemted changes of username in SSH-2 = Tue
+ Private key = <path_to_your_key>
```

![Auth](putty3.png) 

5. Thats all. Now you could use this session as template to your connections
