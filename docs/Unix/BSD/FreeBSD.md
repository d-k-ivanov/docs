
### Build own kernel
```
# /usr/src/sys/i386/conf  - kernel config
cd /usr/src
make buildkernel KERNCONF=MYKERNEL
make installkernel KERNCONF=MYKERNEL
```