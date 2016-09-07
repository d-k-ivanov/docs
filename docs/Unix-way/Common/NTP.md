### ntp.conf 
```bash
driftfile /var/lib/ntp/ntp.drift

{% for ntp_server in net_ntp_servers %}
server {{ ntp_server }} burst iburst minpoll 4 maxpoll 6
{% endfor %}

restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery

---
net_ntp_servers:
  - 0.ru.pool.ntp.org
  - 1.ru.pool.ntp.org
  - 2.ru.pool.ntp.org
  - 3.ru.pool.ntp.org
```