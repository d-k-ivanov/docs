### ORA-00845: MEMORY_TARGET not supported
Not enough of shared memory
```bash
umount tmpfs
mount -t tmpfs shmfs -o size=1024m /dev/shm
```