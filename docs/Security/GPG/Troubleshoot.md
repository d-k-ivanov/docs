## Inappropriate ioctl for device

To get rid of the completely usless misleading "Inappropriate ioctl for device" error, starting with gpg 2.1.0, you have to:

```bash
export GPG_TTY=$(tty)
```

and for using --passphrase-fd and --passphrase-file arguments (possibly used by keybase, which by the way I don't use and never heard of before, but this is the only relevant thing I found online, so I'm leaving this here to help others), you also need to supply the --pinentry-mode loopback argument (without that it'll give you another vague error).

and for loopback to work, you need to start gpg-agent with --allow-loopback-pinentry which is not the default, and you must have gpg-agent running, which no longer is only for caching, but also this loopback thing and more.

And so all your problems are likely caused by these insane badly documented UI changes, plus no output from gpg will tell you of these solutions.
