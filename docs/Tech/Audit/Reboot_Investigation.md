### Why is my server rebooted?
```
last reboot 
sudo lastcomm | egrep 'reboot|shutdown'
who -b
sa
crontab -e
less /var/log/secure
last -x | less
last -x | grep shutdown | less
less /var/log/messages
journalctl
utmpdump /var/log/wtmp | egrep 'shutdown|reboot|runlevel'
journalctl --since="2016-6-28 12:00:00"
```


