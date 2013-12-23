---
title: Nouveau ++ and HAL --
categories: Gentoo, Software
author: Luca Longinotti
date: 2011/01/04 17:29:00
updated: 2011/01/04 19:21:01
---
I finally did it: I tried out [Nouveau][1], the open-source driver for Nvidia graphics cards, and everything
went well, my dual head setup works as before, thanks also to [XMonad][2], which is one of the few
window-managers that implements virtual desktop management and multi-head setups the right way.  
I've waited this long to be sure it all worked and got tested by lots of other people before me, as I simply
can't have the main workstation not displaying anything and spend days getting stuff from Git repositories to
try out fixes.  
Needed a moment to get how XRandr wants the position of monitors specified in xorg.conf, but in the end
everything worked out well, and I managed to also massively slim down my Xorg configuration.  
So now I have a kernel with no proprietary drivers, and that also means I can finally build a monolithic
hardened kernel, without any modules. Works great!  
2.6.37 will also bring Temperature Sensors support to Nouveau from what I'm told, I'm waiting on that!  
This also brings a fully hardened desktop a little bit closer, as every binary piece of software gone is a
problem less there.

I also got fully rid of HAL, since it's being deprecated, and thanks to [uam][3] and [pmount][4] I can still
mount/unmount USB drives, having only udev running, and I also don't need any of the Policy/Console/Udisk-Kit
stuff, that I hope never to have to install.  
And I'm taking [Midori][5] for a test-drive, looking for a good alternative browser to Firefox, maybe it will
be, maybe it won't.

[1]: http://nouveau.freedesktop.org/wiki/ "Nouveau"
[2]: http://xmonad.org/ "XMonad"
[3]: https://github.com/mgorny/uam/ "uam"
[4]: http://pmount.alioth.debian.org/ "pmount"
[5]: http://www.twotoasts.de/index.php?/pages/midori_summary.html "Midori"
