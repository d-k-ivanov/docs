## Generate

```sh
# version >= 2.1.17
gpg --full-generate-key
# version < 2.1.17
gpg --default-new-key-algo rsa4096 --gen-key
```

## Export

```sh
# Get key ID
gpg --list-secret-keys --keyid-format LONG
gpg --armor --export <KEY_ID> > key.pub
gpg --armor --export-secret-keys <KEY_ID> > private.key
gpg --export-ownertrust > otrust.txt
```

## Emport

```sh
# Be sure that keys is in UTF-8 (on in powershell defult encoding UTF-16LE)
gpg --import private.key
# Get key ID
gpg --list-secret-keys --keyid-format LONG
gpg --edit-key <KEY_ID>
    gpg> trust
    gpg> Your decision? 5
    gpg> quit

```

## Delete key:

```sh
# Get key ID
gpg --list-secret-keys --keyid-format LONG
gpg --delete-secret-keys <KEY_ID>
```

## GitHub key

```sh
wget https://github.com/web-flow.gpg
gpg --import .\web-flow.gpg
rm .\web-flow.gpg
```