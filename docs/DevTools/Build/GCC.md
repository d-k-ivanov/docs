### Ubuntu: GCC-5 and GCC-6
```bash
# It could be useful to remove old gcc alternatives
sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++

# Alternatives for GCC 5 and 6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 100 --slave /usr/bin/g++ g++ /usr/bin/g++-6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50 --slave /usr/bin/g++ g++ /usr/bin/g++-5
sudo update-alternatives --config gcc
```
