```
    0x0000:  0050 5684 0731 0013 19ff 1343 0800 4500  .PV..1.....C..E.
    0x0010:  0034 448b 4000 7f06 8d9a 0a0a 0a83 0a0a  .4D.@...........
    0x0020:  0b08 d7ec 0050 57bb 1851 0000 0000 8002  .....PW..Q......
    0x0030:  2000 dd28 0000 0204 05b4 0103 0308 0101  ...(............
    0x0040:  0402

0x0000:
0050 5684 0731 - Destination MAC-address 00:50:56:84:07:31
0013 19ff 1343 - Source MAC-address 00:13:19:ff:13:43
0800 - Type (0x0800 - IP)
4500 - IP version, IHL (IP Header Length), Type of service
0x0010:
0034 - Packet Length 52
448b - Packet ID 17547
4000 - Flag DF (Don't fragment) и Fregment Offset
7f06 - TTL and protocol (127 и 6)
8d9a - Header checksum
0a0a 0a83 - Source IP 10.10.10.131
0x0020 - '0000':
0a0a 0b08 - Destination IP 10.10.11.8
d7ec - Source port 55276
0050 - Destination port 80
57bb 1851 - Queue number 1471879249
0000 0000 - Answer number ACK, тут 0
8002 - ТСР Header Length, message type (here: SYN)
0x0030:
2000 - Window 8192
dd28 - CheckSUM
0000 - Urgent pointer
0204 - TCP Options: MSS (max segment size option)
05b4 - TCP Options: MSS (max segment size = 1460)
0103 - TCP Options: nop
0308 - TCP Options: Window Scale 8
0101 - TCP Options: nop, nop
0x0040:
0402 - TCP Options: SackOK
```