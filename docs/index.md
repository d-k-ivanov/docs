## About me
* [Dmitr Ivanov](https://keepbot.github.io)
* [GitHub repo](https://github.com/keepbot)
* [Facebbok](https://www.facebook.com/dmitry.ivanov.9849)
* [VK.com](https://vk.com/d.k.ivanov)
* [LinkedIn](https://www.linkedin.com/in/dmitry-ivanov-5b9275b3)


---

## Unsorted

### Joining all similarly prefixed files
For example, "_tar.gz.1of2" and "_tar.gz.2of2".
```
# Unix
cat "FileName_tar.gz.1of3" "FileName_tar.gz.2of3" "FileName_tar.gz.3of3" > "FileName.tar.gz"
# Windows
copy /b "FileName_tar.gz.1of3"+"FileName_tar.gz.2of3"+"FileName_tar.gz.3of3" "FileName.tar.gz"
```

### TMUX
```bash
tmux list-sessions
tmux attach -t 2
sudo tmux -2 -S /tmp/tmux-<UID>/default
```

### Cool weather
```bash
curl http://wttr.in/moscow
```
