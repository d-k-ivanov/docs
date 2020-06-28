
## Remove unused or wrong layout

1. Use regedit to navigate to following registry keys, where you will find there the list of keyboards that are preloaded at boot.
    * HKEY_USERS\.DEFAULT\Keyboard Layout\Preload
    * HKEY_CURRENT_USER\Keyboard Layout\Preload
    * HKEY_USERS\.DEFAULT\Control Panel\International\User Profile
    * HKEY_USERS\.DEFAULT\Control Panel\International\User Profile System Backup
2. Find the keyboard identifier among the list of [Keyboard Identifiers](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-language-pack-default-values)
3. Delete the key.

```txt
# Some record examples
# 00000409 - United States - English
# 00000419 - Russian
# 00000809 - United Kingdom
# 00000c0a - Spanish(Spain)
```
