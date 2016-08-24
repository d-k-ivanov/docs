
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

