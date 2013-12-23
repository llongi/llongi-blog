---
title: FOSDEM 07, here we come!
categories: Longi, Gentoo, SysCP, PHP
author: Luca Longinotti
date: 2007/02/22 22:12:25
updated: 2010/01/19 00:30:22
---
Tomorrow to FOSDEM 07 /me goes, along with hansmi, KillerFox and blubb from the swiss crowd!  
Later on both flo and EleRas will join us too, so for me not only will it be "the great Gentoo dev gathering",
but also "the great SysCP dev gathering", will all three of us present. As flo correctly guessed, I'll be
sporting the black Gentoo t-shirt, which is amazingly comfortable, but flo's SysCP t-shirt intrigues me...
Is it possible to have more of those @ flo? In black? /me loves black! We'll be able to discuss that at FOSDEM
I suppose...  
Now off to bed, as I have to get up early (~4AM) to catch the first train to get to Basel, where the others
await, and from there off to Bruxelles. Lugano-Basel-Frankfurt Am Main-Köln-Bruxelles is the exact route,
almost 1000 Km, for a total en-route time of about 11 hours, yay!

On the PHP front, I've finally put PHP 5.2.1 and PHP 4.4.5, with all the needed patches and, of course,
Suhosin support, into the [PHP Overlay][]. I'll test it all during the next days and hopefully commit to the
tree on Monday at the latest. Many bugs are fixed with the latest releases, concurrentmodphp support was
greatly improved and fixed (especially wrt 64bit arches), and the new MySQL extension patches are included
to have the connection charset configurable per-SAPI, for each PHP version, using php.ini, instead of my.cnf.

Work on [VCD][1] is also going steady, we should be near feature-completion soon, so expect some form of
pre-release in the next two weeks... Poke Hollow on #gentoo-vserver for more info.

[1]: http://svn.linux-vserver.org/projects/vcd/timeline "VCD project page"
[PHP Overlay]: https://overlays.gentoo.org/proj/php/timeline "Gentoo PHP Overlay"
