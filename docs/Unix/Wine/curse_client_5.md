## How to install curse client on Linux 

### What works
	- Adding games. Well, at least World of Warcraft is recognized.
	- Installing, updating & deleting addons for WoW. Installed addons were automatically recognized.

### What was not tested
	- Premium features.
	- Anything not WoW related.

### Installastion steps
As you can suspect from other tests, it doesn't really work out of the box. These are the steps I followed :

- Create a clean 32bits prefix.
- winetricks dotnet35sp1
- winetricks windowscodecs
- winetricks wininet
- See https://github.com/Winetricks/winetricks/issues/600 for wininet install failures.
- Install the app here.
- Symlinked my wow folder from its prefix to this prefix.

Reasons :

- The 32bits prefix is needed to install .NET 2.0 (does not work on 64bits).
- The installer tries to install .NET profile and will fail if .NET 3.5sp1 is not installed.
- The app will crash right after login if you don't install windowscodecs. The debug logs were full of "fixme" about wincodecs.
-	The app buttons will be unclickable and you can't even go past the 1st screen if you don't install wininet.

Here is a command line to start the app which you might not need, depends where you install it :
- WINEPREFIX=/home/wine/curse wine explorer "file:///c:/users/USER/Start Menu/Programs/Curse/Curse Client.appref-ms"

Credit to https://archimedesden.wordpress.com/2013/05/11/running-rebtel-one-click-application-in-wine/ for the explorer trick.

