---
title: PHP status
categories: Gentoo, PHP
author: Luca Longinotti
date: 2006/03/03 01:25:55
updated: 2006/03/03 01:25:55
---
PHP is still going strong, you now can find PHP 5.1.2 and PHP 4.4.2 in the [PHP Overlay][], and the eclasses/ebuilds
have seen a lot of work, they are now simpler to use and all that, and all PHP patches were moved to tarballs
(which will allow you to save some bandwidth on emerge --sync's ;) ).  
Work has also started to solve [bug 120088][1], we've got an idea and finally the time to try it out, it should
work and satisfy all parties involved, but will require some good planning when the changes are introduced, more
details on this as soon as I have working code to show people (just follow the Overlay's progress, should appear
there in the experimental/ branch as soon as ready).

[1]: https://bugs.gentoo.org/120088 "Gentoo bug #120088"
[PHP Overlay]: https://overlays.gentoo.org/proj/php/timeline "Gentoo PHP Overlay"
