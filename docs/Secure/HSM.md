

### Generate LMK consists of 3 components.
Step-By-Step.
```
0:
Connect to Thales HMS 8000 via common Terminal Client.

1:
Online> FC <Return> 
Insert card and press ENTER: <Return> 
Card already formatted, continue? [Y/N]: Y <Return> 
Format card for HSM settings/LMKs? [H/L]: L <Return> 
Erasing card 
Formatting card . . . 
Enter new PIN for Smart Card: 2134 <Return>
Re-enter new PIN: 2134 <Return> 
Enter time [hhmmss]: 173000 <Return>  - current time
Enter date [ddmmyy]: 081111 <Return> 
Enter User ID: User1 <Return> 
Enter Issuer ID: ITS <Return> 
Format complete 

2:
Online> FC <Return> 
Insert card and press ENTER: <Return> 
Card already formatted, continue? [Y/N]: Y <Return> 
Format card for HSM settings/LMKs? [H/L]: L <Return> 
Erasing card 
Formatting card . . . 
Enter new PIN for Smart Card: 4356 <Return>
Re-enter new PIN: 4356 <Return> 
Enter time [hhmmss]: 173000 <Return> 
Enter date [ddmmyy]: 081111 <Return> 
Enter User ID: User2 <Return> 
Enter Issuer ID: ITS <Return> 
Format complete 

3:
Online> FC <Return> 
Insert card and press ENTER: <Return> 
Card already formatted, continue? [Y/N]: Y <Return> 
Format card for HSM settings/LMKs? [H/L]: L <Return> 
Erasing card 
Formatting card . . . 
Enter new PIN for Smart Card: 5467 <Return>
Re-enter new PIN: 5467 <Return> 
Enter time [hhmmss]: 173000 <Return> 
Enter date [ddmmyy]: 081111 <Return> 
Enter User ID: User3 <Return> 
Enter Issuer ID: ITS <Return> 
Format complete 

4:
Taking HSM into the Secure State

5:
Secure> GK <Return> 
LMKs must be erased before proceeding. 
Erase LMKs? Y <Return> 
LMK component set [1-9]: 1 <Return> 
Enter secret value A: <Return> 
Enter secret value B: <Return> 
Enter value C: <Return> 
Insert blank card and enter PIN: 2134 <Return> 
Writing keys 
Checking keys 
Device write complete, check: XXXX XXXX XXXX XXXX 
Remove the smartcard and store it securely. 
Make another copy? [Y/N]: N <Return> X copies made. 

6:
Secure> GK <Return> 
LMKs must be erased before proceeding. 
Erase LMKs? Y <Return> 
LMK component set [1-9]: 2 <Return> 
Enter secret value A: <Return> 
Enter secret value B: <Return> 
Enter value C: <Return> 
Insert blank card and enter PIN: 4356 <Return> 
Writing keys 
Checking keys 
Device write complete, check: XXXX XXXX XXXX XXXX 
Remove the smartcard and store it securely. 
Make another copy? [Y/N]: N <Return> X copies made. 

7:
Secure> GK <Return> 
LMKs must be erased before proceeding. 
Erase LMKs? Y <Return> 
LMK component set [1-9]: 3 <Return> 
Enter secret value A: <Return> 
Enter secret value B: <Return> 
Enter value C: <Return> 
Insert blank card and enter PIN: 5467 <Return> 
Writing keys 
Checking keys 
Device write complete, check: XXXX XXXX XXXX XXXX 
Remove the smartcard and store it securely. 
Make another copy? [Y/N]: N <Return> X copies made. 

8-9-10:Secure> LK <Return>
LMKs must be erased before proceeding.
Erase LMKs? Y <Return>
Load LMK from components. Insert card and enter PIN: **** <Return>
CHECK: XXXX XXXX XXXX XXXX Load more components? [Y/N]: Y <Return>
Remove the smartcard. Insert the second and subsequent Smartcards and repeat the loading procedure. When all have been loaded and the HSM displays the check value, record the check value.
CHECK: XXXX XXXX XXXX XXXX Load more components? [Y/N]: N <Return>
Use the LO command to load LMKs into key change storage.
Secure>
Use the A command to put the HSM into the Authorised State in order to check the LMK components and passwords or PINs.

11:
Return to online state: remove secure keys and press reset button at least 2 seconds.
```
