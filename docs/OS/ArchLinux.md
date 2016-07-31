
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
