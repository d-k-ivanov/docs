### Find all broken links

```bash
find /path -type l | while read link; do [ -e `readlink $link` ] || echo $link; done
```
