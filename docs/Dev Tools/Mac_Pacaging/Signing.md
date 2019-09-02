## Requirements

* Register as Apple Developer
* Get your Apple Developer ID
* Generate certificates
* Import certificated to Keychain
* Got to Settings --> Security & Privacy
  * Add your Terminal App to Accessibility
  * Add your Terminal App to Automation: System Events (Request will be appeared)

## List of Apple Identities an their usage

| Name | Identity prefix | Description |
| ---- | --------------- | ----------- |
| iOS Development | iPhone Developer: | Team Member Name Used to run an iOS app on devices and use certain app services during development |
| iOS Distribution| iPhone Distribution: | Team Name Used to distribute your iOS app on designated devices for testing or to submit it to the App Store. |
| Mac Development | Mac Developer: | Team Member Name Used to enable certain app services during development and testing. |
| Mac App Distribution | 3rd Party Mac Developer Application: | Team Name Used to sign a Mac app before submitting it to the Mac App Store. |
| Mac Installer Distribution | 3rd Party Mac Developer Installer: | Team Name Used to sign and submit a Mac Installer Package, containing your signed app, to the Mac App Store. |
| Developer ID Application | Developer ID Application: | Team Name Used to sign a Mac app before distributing it outside the Mac App Store. |
| Developer ID Installer | Developer ID Installer: | Team Name Used to sign and distribute a Mac Installer Package, containing your signed app, outside the Mac App Store |

## Sing Application Code

```bash
codesign --force --verify --verbose --deep --sign "Developer ID Application: YOUR_NAME" "PATH_TO_APP"

# With osascritp
echo '
tell application "Terminal" to activate
tell application "System Events"
    set cmd to "codesign --force --verify --verbose --deep --sign \"Developer ID Application: YOUR_NAME\" \"PATH_TO_APP\""
    set cmd1 to "cd '$RELEASE_PATH'"
    keystroke cmd1
    key code 36
    keystroke cmd
    key code 36
    delay 240
end tell
' | osascript
```

### Sign Installer

```bash
productsign --sign "Developer ID Installer: YOUR_NAME" "PATH_TO_UNSIGNED_PKG" "PATH_TO_PKG"

echo '
tell application "Terminal" to activate
tell application "System Events"
    set cmd to "productsign --sign \"Developer ID Installer: YOUR_NAME\" \"PATH_TO_UNSIGNED_PKG\" \"PATH_TO_PKG\""
    set cmd1 to "cd '$RELEASE_PATH'"
    keystroke cmd1
    key code 36
    keystroke cmd
    key code 36
    delay 60
end tell
' | osascript
```
