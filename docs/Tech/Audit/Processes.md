### Wait until proceses will gone
```
while true; do clear; ps -ef | grep <process>; sleep 5; done
```

### Kill all proesses with certain name
```bash
ps ax | grep http | awk '{print $1}' | xargs kill
```