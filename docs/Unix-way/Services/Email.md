## Telnet commands
### How to send email using telnet
Original at [Mediatemple](https://mediatemple.net/community/products/dv/204404584/sending-or-viewing-emails-using-telnet)
> TIP: We use the domain example.com as an example. Be sure to replace with your own domain.

* Open your command prompt. Now, connect with telnet using the following command:
```bash
telnet example.com 25
```
* Type ehlo example.com. Some servers also accept helo in place of ehlo.
```bash
ehlo example.com
```
* Type mail from: username@example.com:
```bash
mail from: username@example.com
````
* Type rcpt to: friend@hotmail.com, friend2@yahoo.com (replace with your actual recipient name):
```bash
rcpt to: friend@hotmail.com, friend2@yahoo.com
```
* To write the message - type data, followed by your subject and message. To end the message, put a period on a line by itself and press enter:
```bash
data
Subject: My Telnet Test Email

Hello,

This is an email sent by using the telnet command.

Your friend,
Me

.
```
* Type quit to exit telnet.
```bash
quit
```

### How to check or read email with telnet
Original at  [Mediatemple](https://mediatemple.net/community/products/dv/204404584/sending-or-viewing-emails-using-telnet)
* Open your command prompt. At the command prompt, type in
```bash
telnet example.com 110
```
* Type user and the email address (username@example.com) of the user for which you wish to view emails:
```bash
user username@example.com
```
* Then type in pass followed by your password:
```bash
pass yourpasswordgoeshere
```
* Type list to bring up a list of your emails:
```bash
list
```
* You will see a list of items with labels like "1 897" and "2 5136." Here is an example:
```bash
list
+OK POP3 clients that break here, they violate STD53.
1 897
2 5136
3 1884
4 2973
5 2595
6 3063
7 3509
8 2283
9 1926
10 2763
11 1795
12 2780
13 2342
14 2342
15 2342
16 3833
17 2211
18 793
19 797
20 2599
.
```
* If you wish to read an email message such as 2 5136, you can type the following:
```bash
retr 2 
```
* If you want to delete a message such as 1 897, type dele 1:
```bash
dele 1
```
* When you are done checking your email, type quit.
```bash
quit
```
