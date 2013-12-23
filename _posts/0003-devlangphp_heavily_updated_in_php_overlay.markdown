---
title: dev-lang/php heavily updated in PHP Overlay
categories: Gentoo, PHP
author: Luca Longinotti
date: 2005/10/27 22:02:35
updated: 2005/10/27 22:02:35
---
The [PHP Overlay][] was updated this evening with a lot of new changes, especially all dev-lang/php ebuilds were
revbumped to -r2 (for the ones considered "stable" by upstream, not the RC's or beta's/alpha's).  
-r2 releases contain various fixes, regarding issues with open_basedir, safe_mode and some problems in the
Apache2 SAPI, and will go into Portage tomorrow evening if all goes well, if possible please test it directly
from the [PHP Overlay][] and report problems there if you find any before we go into Portage with the new packages.  
Those also include a new "oci8-instant-client" USE flag to support dev-db/oracle-instantclient-basic as Oracle
provider for the OCI8 extensions, a new "pic" USE flag to enable/disable PIC code build of PHP (we for now
solved it this way since PIC has a relatively big impact on PHP's performance, but it should/must be used on
certain Hardened-Gentoo configurations, so since the Hardened profile has the "pic" USE flag enabled by default,
this seemed like the best solution, that still gives the user choice over what he wants), also the usage of
elibtoolize was fixed, wich should eventually help out on Gentoo/ALT systems (uClibc etc.), this should be all,
please test! :)

Ah, I also changed the way extensions get enabled by default: now each extension has its own .ini file, that
gets inserted into /etc/php/\*/ext/, and a symlink gets created at /etc/php/\*/ext-active/, and PHP searches there
for .ini files, so to enable/disable an extension you just need to create/delete a symlink, there will be a tool
to handle this easily in the future.  
This change will atm only be available in the [PHP Overlay][], the -r2 ebuilds that will go into Portage tomorrow
won't include it yet, we want some feedback from users on this, do you like it?  
Do you think it's a good idea?  
Let us know, either here as comment or at [php-bugs@gentoo.org][1], thanks!

[1]: mailto:php-bugs@gentoo.org "Gentoo PHP email"
[PHP Overlay]: https://overlays.gentoo.org/proj/php/timeline "Gentoo PHP Overlay"
