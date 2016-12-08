### Setup core dumps
```bash
# Set core pattern to get files named like: core-bash-sig11-user0-group0-pid28808-time1481235929
echo "core-%e-sig%s-user%u-group%g-pid%p-time%t" > /proc/sys/kernel/core_pattern

# Set limits for all users:
vim /etc/security/limits.d/core.conf
# --- contents ---
*       hard        core        unlimited
*       soft        core        unlimited
# ----------------

# Enable DefaultCoreLimits for all systemd services:
vim /etc/systemd/system.conf
# Uncoment DefaultLimitCORE and set it to infinity:
DefaultLimitCORE=infinity

# (optional) Update only that service that you intersted in:
vim /etc/systemd/system/service-you-intersted-in.service
# --- Add following in [Service] section ---
LimitCORE=infinity
# ------------------------------------------

# And don't forget to disable core dumpind when you don't need dumps any more
```