### Send message via telnet
```bash
telnet <server> 25

ehlo <your_domain>
mail from: <sender_email>
rcpt to: <recipient1>,<recipient2>, etc.

data
Subject: Test subject
Test body
.
# don't forget <dot> at the and

quit
```