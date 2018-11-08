## Generate keys

```bash
ssh-keygen -t rsa -b 4096 -C "your_email_or_username" [-f output_keyfile]
```

## Public key authentication

```bash
# On remote:
mkdir ~/.ssh
chmod 755 ~/.ssh

# On local
cat ~/.ssh/id_rsa.pub > /tmp/pubkeytmp
scp /tmp/pubkeytmp <username>@<hostname>:~/.ssh/authorized_keys
rm /tmp/pubkeytmp
```

## Avoid checking rsa key of remote host

```bash
ssh -o StrictHostKeyChecking=no -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null <IP ADDRESS>
```
