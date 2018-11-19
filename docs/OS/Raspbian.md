## Default credentials

* username: **pi**
* password: **raspberry**

## Stay awake

```bash
sudo vim.tiny /etc/lightdm/lightdm.conf

# Uncomment xserver-command option in [Seat:*] and add params
xserver-command=X -s 0 dpms
```
