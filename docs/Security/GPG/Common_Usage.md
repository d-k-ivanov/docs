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

## Import

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

## Renew

```sh
gpg --list-secret-keys --keyid-format LONG
gpg --edit-key <KEY_ID>
    gpg> list
    gpg> key [subkey]
    gpg> expire
    gpg> trust
    gpg> save


## Update key in global pool
gpg --keyserver hkp://hkps.pool.sks-keyservers.net --send-keys <KEY_ID>

## Update key in Ubuntu pool
gpg --keyserver keyserver.ubuntu.com --send-keys <KEY_ID>

## Update key in MIT pool
gpg --keyserver pgp.mit.edu --send-keys <KEY_ID>
```

## Publish

```sh
## Publish key in global pool
gpg --keyserver hkp://hkps.pool.sks-keyservers.net --send-keys <KEY_ID>

## Publish key in Ubuntu pool
gpg --keyserver keyserver.ubuntu.com --send-keys <KEY_ID>

## Publish key in MIT pool
gpg --keyserver pgp.mit.edu --send-keys <KEY_ID>
```

## Search

```sh
## Search key in global pool
gpg --keyserver hkp://hkps.pool.sks-keyservers.net --search-key email@address

## Search key in Ubuntu pool
gpg --keyserver keyserver.ubuntu.com --search-key email@address

## Search key in MIT pool
gpg --keyserver pgp.mit.edu --search-key email@address
```

## Delete

```sh
# Get key ID
gpg --list-secret-keys --keyid-format LONG
gpg --delete-secret-keys <KEY_ID>
gpg --delete-keys <KEY_ID>

```

## Multiple UID

```sh
gpg --list-secret-keys --keyid-format LONG
gpg --edit-key <KEY_ID>
    gpg> adduid
    gpg> uid <N>
    gpg> trust
    gpg> quit
```

## Revoke

```sh
gpg --list-secret-keys --keyid-format LONG
gpg --output revoke.asc --gen-revoke <KEY_ID>
gpg --import revoke.asc

## Revoke key in global pool
gpg --keyserver hkp://hkps.pool.sks-keyservers.net --send-keys <KEY_ID>

## Revoke key in Ubuntu pool
gpg --keyserver keyserver.ubuntu.com --send-keys <KEY_ID>

## Revoke key in MIT pool
gpg --keyserver pgp.mit.edu --send-keys <KEY_ID>
```

## GitHub key

```sh
wget https://github.com/web-flow.gpg
gpg --import .\web-flow.gpg
rm .\web-flow.gpg
```
