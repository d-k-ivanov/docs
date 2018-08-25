## About me
* [Dmitry Ivanov](https://d-k-ivanov.github.io)
* [GitHub repo](https://github.com/d-k-ivanov)
* [Facebook](https://www.facebook.com/a1231239849)
* [VK.com](https://vk.com/d.k.ivanov)
* [LinkedIn](https://www.linkedin.com/in/dmitriy-ivanov-5b9275b3/)

---

## Useful links
* [Rob van der Woude's Scripting Page](http://www.robvanderwoude.com/)
* [VbsEdit](http://www.vbsedit.com/) - VBS scripts 
* [Morgan's Library](http://www.morganslibrary.org/) - Dan Morgan's Oracle Library
* [Adminer](https://www.adminer.org/) - simple database management php console
* [Global DNS record check](https://www.whatsmydns.net/) - Site to get responce from many DNS servers around the world

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

