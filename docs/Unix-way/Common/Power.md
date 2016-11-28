### Disable suspend laptop on lid close
```bash
sudo vim /etc/systemd/logind.conf
# Add next line:
HandleLidSwitch=ignore
# Restart systemd-logind.service
sudo systemctl restart systemd-logind.service
```