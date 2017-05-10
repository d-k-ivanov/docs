
### Pacman
```sh
# Search for software
pacman -Ss <pattern>
# Install package
pacman -S <package_name>
# Update the system
pacman -Syu
# Remove orphaned packages (Be careful, double check for list of deleted packages)
pacman -Rscn $(pacman -Qtdq)
pacman -Sc
pacman-optimize && sync
# Show all pacages whitc now installed as dependencies
pacman -Qet
```

### AUR package installation
```sh
git clone https://aur.archlinux.org/<packiage_name>
cd <package_name>
makepkg -sri

# In case of error like:
# <package>.tar.gz ... FAILED (unknown public key 0000000000000000)
gpg --recv-key 0000000000000000
# Or manually check key and skip key verification vith makepkg
pacman-key --verify <sig_file>
makepkg --skippgpcheck -sri
```

### Some Python packages exist in filesystem
```bash
# First method:
mv /usr/lib/python2.7/site-packages/<package> /tmp/removed_py/
# Second method:
pip freeze | xargs pip uninstall -y
pip freeze | grep -v "^-e" | xargs pip uninstall -y
# Then you can update your Arch
#yaourt -Syu --aur
pacman -Syu
```

### ca-certificates-utils: /etc/ssl/certs/ca-certificates.crt exists in filesystem
```bash
mv /etc/ssl/certs/ca-certificates.crt /tmp
#yaourt -Syu --aur
pacman -Syu
```

### Sort installed packages by size
```
pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less 
```
