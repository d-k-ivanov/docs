```sh
cd ~
wget http://s.sudre.free.fr/Software/files/Packages.dmg
sudo hdiutil attach ./Packages.dmg
ls -al "/Volumes/Packages 1.2.4"
sudo installer -package "/Volumes/Packages 1.2.4/Install Packages.pkg" -target /
sudo hdiutil unmount "/Volumes/Packages 1.2.4/"
```