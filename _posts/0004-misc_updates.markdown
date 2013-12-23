---
title: Misc updates
categories: Gentoo, SysCP, Longi
author: Luca Longinotti
date: 2005/10/30 03:36:31
updated: 2005/10/30 03:36:31
---
dev-lang/php was again updated in the [PHP Overlay][], fixing a bug with Apache1+fastbuild and the uClibc support
for PHP4. Also, PHP 5.1.0_rc4 was added to the overlay, be sure to test it and your code, the final should be
here soon (1-2 weeks) and will then be added to Portage.  
Also, the old-style PHP packages (dev-php/{php,php-cgi,mod_php}) were updated to fix some bugs, as was the old
php-sapi.eclass, tomorrow I'll update all the new-style PHP packages and eclasses to be in sync with the
overlay, that will be fun! :)

Gentoo-SysCP is making progress, a draft readme was written today and I have some more ideas to implement
before I make any more informations public, but an experimental (but working!) ebuild should be ready soon.

On a sidenote, I now finally have a week holidays from school, wich means I can work even more on Gentoo
and enjoy myself during the day, as opposed to sitting in classes. Holidays are always fun! ;)

[PHP Overlay]: https://overlays.gentoo.org/proj/php/timeline "Gentoo PHP Overlay"
