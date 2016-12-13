> This section describes work with RHEL-based Linux distributives like:
> Red Hat Enterprise Linux, Oracle Linux, CentOS Linux, Scientific Linux, Fermi Linux, ROSA Linux, CERN Linux

### Yum
```bash
# Search for software
yum search <pattern>
# Install package
yum install <package_name>
# Repair "Error: database disk image is malformed"
yum clean dbcache
# Clean all yum cache
yum clean all

# Remove packages with dependencies:
#add "clean_requirements_on_remove=1" to /etc/yum.conf
```

### EPEL repository
```bash
# RHEL-based version 7 (two options)
rpm -hUv https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum insall epel-release

# RHEL-based version 6
rpm -hUv https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

# RHEL-based version 5
rpm -hUv https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm
```

