
### WPA Supplicant
```
wpa_supplicant -Dnl80211 -iwlp2s0 -c/etc/wpa_supplicant/wpa_supplicant.conf &

cat /etc/wpa_supplicant/wpa_supplicant.conf
# This network configuration was written by net-setup
modules="wpa_supplicant"
wpa_supplicant_wlp2s0="-Dnl80211"
config_wlp2s0="dhcp" 

ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=0
ap_scan=1
network={
   ssid="MTS_2140184"
   psk="0000000000"
   priority=5
}

```