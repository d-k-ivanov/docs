### Public key authentication
```bash
# On remote:
mkdir ~/.ssh
chmod 755 ~/.ssh

# On local
cat ~/.ssh/id_rsa.pub > /tmp/pubkeytmp
scp /tmp/pubkeytmp <username>@<hostname>:~/.ssh/authorized_keys
rm /tmp/pubkeytmp
```