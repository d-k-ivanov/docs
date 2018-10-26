# Using GPG4Win

## With git

```ps1
gpg --full-generate-key
git config --global gpg.program "C:\Program Files (x86)\Gpg4win\..\GnuPG\bin\gpg.exe"
gpg --list-secret-keys --keyid-format LONG
git config --global user.signingkey {YourKeyID}
```

## Export

```ps1
# Get key ID
gpg --list-secret-keys --keyid-format LONG
gpg --armor --export <KEY_ID> > key.pub
gpg --armor --export-secret-keys <KEY_ID> > private.key
gpg --export-ownertrust > otrust.txt
```

## Emport

```ps1
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

```ps1
# Get key ID
gpg --list-secret-keys --keyid-format LONG
gpg --delete-secret-keys <KEY_ID>
```

## GitHub key

```ps1
wget https://github.com/web-flow.gpg
gpg --import .\web-flow.gpg
rm .\web-flow.gpg
```