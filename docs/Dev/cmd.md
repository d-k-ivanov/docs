
## Cmd scripts

### Ping subnet
```
FOR /L %i IN (1,1,254) DO ping -n 1 192.168.10.%i | FIND /i "Reply">>c:\ipaddresses.txt
```
To change colours in command line console interface you need to add one of following sets of registry keys:

## Cmd Colours
### Default
```
Windows Registry Editor Version 5.00
; Default color scheme
; for Windows command prompt.

; Values stored as 00-BB-GG-RR
[HKEY_CURRENT_USER\Console]
; BLACK DGRAY
"ColorTable00"=dword:00000000
"ColorTable08"=dword:00808080
; BLUE LBLUE
"ColorTable01"=dword:00800000
"ColorTable09"=dword:00ff0000
; GREEN LGREEN
"ColorTable02"=dword:00008000
"ColorTable10"=dword:0000ff00
; CYAN LCYAN
"ColorTable03"=dword:00808000
"ColorTable11"=dword:00ffff00
; RED LRED
"ColorTable04"=dword:00000080
"ColorTable12"=dword:000000ff
; MAGENTA LMAGENTA
"ColorTable05"=dword:00800080
"ColorTable13"=dword:00ff00ff
; YELLOW LYELLOW
"ColorTable06"=dword:00008080
"ColorTable14"=dword:0000ffff
; LGRAY WHITE
"ColorTable07"=dword:00c0c0c0
"ColorTable15"=dword:00ffffff
```

### Monokai
```
Windows Registry Editor Version 5.00
; Monokai color theme for Windows command prompt.

; Values stored as 00-BB-GG-RR
[HKEY_CURRENT_USER\Console]
; BLACK   DGRAY
"ColorTable00"=dword:00222827
"ColorTable08"=dword:00414746
; BLUE    LBLUE
"ColorTable01"=dword:00a64c1d
"ColorTable09"=dword:00ef9566
; GREEN   LGREEN
"ColorTable02"=dword:0000995d
"ColorTable10"=dword:002ee2a6
; CYAN    LCYAN
"ColorTable03"=dword:00746a31
"ColorTable11"=dword:00efd966
; RED     LRED
"ColorTable04"=dword:002900b0
"ColorTable12"=dword:007226f9
; MAGENTA LMAGENTA
"ColorTable05"=dword:00b63865
"ColorTable13"=dword:00ff81ae
; YELLOW  LYELLOW
"ColorTable06"=dword:001f97fd
"ColorTable14"=dword:0074dbe6
; LGRAY   WHITE
"ColorTable07"=dword:008a908f
"ColorTable15"=dword:00f2f8f8
```

### Pastel
```
Windows Registry Editor Version 5.00
; Low-contrast, pastel color scheme
; for Windows command prompt.

; Values stored as 00-BB-GG-RR
[HKEY_CURRENT_USER\Console]
; BLACK DGRAY
"ColorTable00"=dword:00222222
"ColorTable08"=dword:00454545
; BLUE LBLUE
"ColorTable01"=dword:00a69a7c
"ColorTable09"=dword:00bfad8f
; GREEN LGREEN
"ColorTable02"=dword:00557e6c
"ColorTable10"=dword:007db37d
; CYAN LCYAN
"ColorTable03"=dword:00a18e4c
"ColorTable11"=dword:00d0c16b
; RED LRED
"ColorTable04"=dword:0041569e
"ColorTable12"=dword:006d89cc
; MAGENTA LMAGENTA
"ColorTable05"=dword:009d6d95
"ColorTable13"=dword:00cb8fc1
; YELLOW LYELLOW
"ColorTable06"=dword:002bafca
"ColorTable14"=dword:0056b5bf
; LGRAY WHITE
"ColorTable07"=dword:00808080
"ColorTable15"=dword:00cdcdcd
```

### Zenburn
```
Windows Registry Editor Version 5.00
; Zenburn is a low-contrast color scheme
; for Windows command prompt.
; See : http://slinky.imukuppi.org/zenburnpage/

; Values stored as 00-BB-GG-RR
[HKEY_CURRENT_USER\Console]
; BLACK DGRAY
"ColorTable00"=dword:003f3f3f
"ColorTable08"=dword:008080c0
; BLUE LBLUE
"ColorTable01"=dword:00af6464
"ColorTable09"=dword:00ffafaf
; GREEN LGREEN
"ColorTable02"=dword:00008000
"ColorTable10"=dword:007f9f7f
; CYAN LCYAN
"ColorTable03"=dword:00808000
"ColorTable11"=dword:00d3d08c
; RED LRED
"ColorTable04"=dword:00232333
"ColorTable12"=dword:007071e3
; MAGENTA LMAGENTA
"ColorTable05"=dword:00aa50aa
"ColorTable13"=dword:00c880c8
; YELLOW LYELLOW
"ColorTable06"=dword:0000dcdc
"ColorTable14"=dword:00afdff0
; LGRAY WHITE
"ColorTable07"=dword:00ccdcdc
"ColorTable15"=dword:00ffffff
```

