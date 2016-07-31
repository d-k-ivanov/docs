## Command line examples
Inspired by [Joshua Levy](https://github.com/jlevy "Joshua Levy") and his great [The-Art-Of-Command-Line](https://github.com/jlevy/the-art-of-command-line "The Art of Command Line")
> It's only my view on useful commands and this examples are useful for me in first place.

### About
* [Dmitr Ivanov](https://keepbot.github.io)
* [GitHub repo](https://github.com/keepbot)


---

## Unsorted:

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
