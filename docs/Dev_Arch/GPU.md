### How to calc max resolution to MB

A graphics card actually requires relatively little memory to function as a simple framebuffer (2D graphics) device:

For example - the framebuffer requirements for 1920x1080 in 32 bit colour would be:

```txt
    1920 x 1080 = 2073600 pixels
    2073600 x 32 = 66355200 bits
    66355200 / 8 = 8294400 bytes
    8294400 / 1024 = 8100 kilobytes
    8100 / 1024 = 7.91015625 megabytes
```

So even at that high resolution an 8MB card would be able to display an image.

You can double, or even triple that amount if you are using double or triple buffering (display one image while rendering another then switch to that new image while you render a third, etc).

All the rest of the memory is used when the card is working with 3D graphics to store internal copies (and transformed copies) of textures for rendering. The more memory you have the more and higher resolution textures the card can hold internally, so it won't need to be repeatedly sent the same textures over and over again by the gaming engine.

So basically the more memory you have the better it will be for 3D gaming.

### UHD 8K

```txt
7680 × 4320 = 33177600 px
33177600 x 48 = 1592524800 bits
1592524800 / 8 = 199065600 byte
199065600 / 1024 = 194400 KB
194400 / 1024 = 189,84375 MB
```
