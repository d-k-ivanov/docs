# Connect through Bastion host on Nix

To connect via Bastion host which work as SSH Proxy you need simple ssh config on  your nix client machine:

## Config 1: Masked subnet

```bash
vim ~/.ssh/config

Host <bastion_name>
Hostname <bastion_ip_addrese>
        Port 22
        #  ec2-user is standard for bastion host, of course it can be different
        User ec2-user
        IdentityFile ~/.ssh/<your-key>

# Masked subnet which accessible through bastion only
# Host 10.*
# Host 172.16.0.*
Host 192.168.*
        ProxyCommand ssh -W %h:%p <bastion_name>
        User <username>
        IdentityFile ~/.ssh/<your-key>
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null

```

## Config 2: Host aliases

```bash
Host <bastion_name>
Hostname <bastion_ip_addrese>
        Port 22
        User ec2-user
        IdentityFile ~/.ssh/<your-key>

Host node0
Hostname 192.168.0.1
        ProxyCommand ssh -W %h:%p <bastion_name>
        User <username>
        IdentityFile ~/.ssh/<your-key>
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null

Host node1
Hostname 192.168.0.2
        ProxyCommand ssh -W %h:%p <bastion_name>
        User <username>
        IdentityFile ~/.ssh/<your-key>
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null

Host router0
Hostname 192.168.0.3
        ProxyCommand ssh -W %h:%p <bastion_name>
        User <username>
        IdentityFile ~/.ssh/<your-key>
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null

Host router1
Hostname 192.168.0.4
        ProxyCommand ssh -W %h:%p <bastion_name>
        User <username>
        IdentityFile ~/.ssh/<your-key>
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null

```