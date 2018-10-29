## Using GPG4Win with git

```ps1
gpg --full-generate-key
git config --global gpg.program "C:\Program Files (x86)\Gpg4win\..\GnuPG\bin\gpg.exe"
gpg --list-secret-keys --keyid-format LONG
git config --global user.signingkey {YourKeyID}
```
