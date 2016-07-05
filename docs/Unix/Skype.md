
### Unable to receive group messages
```
After struggling a bit, I found some useful commands:
    /dumpmsnp - show details about your connection
    /showplaces - show where you are currently connected
You can execute them in any chat window.

*/dumpmsnp* command was showing "LoggedOut", but I was online and talking almost normally (except group chats).

System: MSNP: Connection Data:
 * Status: LoggedOut

A lot of people are/were suffering from this problem.

To solve this "LoggedOut" issue, try this on any chat window:
/msnp24

and restart your Skype.

After restarting, /dumpmsnp output shows the following status:

System: MSNP: Connection Data (MSNP24):
 * Status: LoggedIn

I don't know exactly why, but the /msnp24 command kinds of converted my account to this protocol and now everything works perfectly.
```