---
title: net-www/apache-1* masked
categories: Gentoo, Apache
author: Luca Longinotti
date: 2007/05/12 15:44:29
updated: 2007/05/12 15:47:58
---
This I just wrote to gentoo-dev and gentoo-server, finally ending Apache-1* support in Gentoo.

> Hi all!  
> As announced in the 30 April 2007 edition of [GWN][1], net-www/apache-1* as well as all packages depending/using
> it were masked, pending removal on 12 June 2007.  
> I fixed all packages, dependencies, etc. I could find to work correctly after the masking (generally removing
> Apache 1.X support from them).  
> If you find any issue still, please open a bug about it, assign it to [apache-bugs@gentoo.org][2] and make it
> block [bug 178189][3].  
> If you use or plan on using the apache-module or depend.apache eclasses, be aware that the need_apache function
> doesn't anymore export the apache2 USE flag to IUSE, since now it directly depends on Apache 2.X, so be sure to
> declare it in your ebuilds IUSE (I fixed the few cases where this wasn't already done).  
> Thanks and happy upgrading to Apache 2.X!

[1]: http://www.gentoo.org/news/en/gwn/20070430-newsletter.xml "GWN 2007.04.30"
[2]: mailto:apache-bugs@gentoo.org "Gentoo Apache email"
[3]: https://bugs.gentoo.org/178189 "Gentoo bug #178189"
