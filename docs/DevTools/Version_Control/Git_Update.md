## Debian and Ubuntu

```bash
sudo wget https://github.com/git/git/archive/v2.20.1.tar.gz -O git.tar.gz
sudo apt update
sudo apt install make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
sudo tar -xf git.tar.gz
cd git-2.20.1/
sudo make prefix=/usr all
sudo make prefix=/usr install
```