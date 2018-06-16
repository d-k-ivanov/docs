# Using GPG4Win

## With git

```ps1
gpg --full-generate-key
git config --global gpg.program "C:\Program Files (x86)\Gpg4win\..\GnuPG\bin\gpg.exe"
gpg --list-secret-keys --keyid-format LONG
git config --global user.signingkey {YourKeyID}
```

## Export and Import

```ps1
gpg --list-secret-keys --keyid-format LONG
gpg --armor --export 21788557EE03EA8E > key.pub
gpg --armor --export-secret-keys 21788557EE03EA8E > private.key
gpg --export-ownertrust > otrust.txt
```

## GitHub key

```ps1
wget https://github.com/web-flow.gpg
gpg --import .\web-flow.gpg
rm .\web-flow.gpg
```