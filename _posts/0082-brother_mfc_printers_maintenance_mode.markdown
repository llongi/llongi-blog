---
title: Brother MFC printers Maintenance Mode
categories: Hardware
author: Luca Longinotti
date: 2011/06/17 19:04:11
updated: 2011/06/17 21:13:52
---
Today my Brother MFC-8860DN printer just decided that, after a paper jam in the ADF, which was quickly fixed,
any scanning related functionality would simply be denied...  
Even turning it off and on again, pulling the plug for half an hour, nothing helped: as soon as it booted,
it just displayed "Please wait" on the display and anything scanning related was refused, printing still
worked though.  
After some searching on the awesome Internet, I found out that Brother printers have a Maintenance Mode,
which can be used to reset the printer when its software gets stuck.

1) To enter Maintenance Mode, turn the printer off and turn it on while holding **Menu** pressed, you can
easily recognize if it worked, as it writes *"Maintenance Mode"* in big letters and flashes the display.

2) You can now enter codes using the numerical pad, just entering the code is enough, you don't have to press
anything else but the numbers, there's no confirmation key.  
Here the important codes:

* **01** - Parameter Init
* **91** - Parameter Init
* **77** - Status Page
* **99** - Exit & Reset

Now, surprisingly, even if 01 and 91 have the same name and display the same thing, they don't reset the
printer the same way, at least in my case. 91 seems to be a softer reset than 01, since it didn't work in
my case, whereas 01 did and fully reset the printer. 99 seems to be the exit & reset command.  
So I deduce more or less the following combinations:

* 99 - very soft reset
* 91, 99 - soft reset
* 01, 99 - hard reset

Basically if your printer face-plants, trying 01, 99 should be your safest bet, as it fully resets the
printer; this also means you'll have to set it up again, but other than checking the time and the network
settings, there's not much to do, but alas I don't use the Fax, which needs a few more settings to work.
