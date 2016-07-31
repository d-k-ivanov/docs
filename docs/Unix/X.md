
### Start full-screen application in different X server
```bash
/usr/bin/xinit <path_to_fullscreen_application> -- :1
```

### Export X display to current ssh connection
```bash
export DISPLAY="${SSH_CLIENT%% *}"
```