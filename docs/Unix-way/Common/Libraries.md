### Add global library path
```bash
echo '/path/to/library/dir' >> /etc/ld.so.conf.d/<your-custom-name>.conf
ldconfig
```