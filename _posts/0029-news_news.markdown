---
title: News, news, news!
categories: Gentoo, MySQL, PgSQL, PHP
author: Luca Longinotti
date: 2006/11/06 01:00:30
updated: 2006/11/06 01:09:45
---
Hi all, /me is back, since a few days now, and I've been working on updating stuff...

Today, together with vivo, MySQL 5.0.X stabilization was agreed on, and [bug 144999][1] updated accordingly.
x86 already responded and stabled dev-db/mysql-5.0.26-r1, the other arches will soon follow. The upgrade
from 4.1.X should be painless, just remember to read [the MySQL upgrading guide][2] for instructions on how
to backup your data before the upgrade, and be sure to run revdep-rebuild from gentoolkit after the upgrade,
as all things linking to MySQL will need to be recompiled.

New PostgreSQL ebuilds are also coming up, those are the first of the new generation of PostgreSQL ebuilds,
done together with dev-zero, that will fix up a lot of issues and ease maintainance of PostgreSQL a lot,
as well as permitting some exciting new things in the future. ETA for those new ebuilds to enter Portage
is this evening (UTC timezone).

PHP 5.2.0 is also finally out, congrats to the PHP Team, expect an ebuild for the final version in the
[PHP Overlay][] by Wednesday and in Portage by Saturday at most.

Samhain will also be updated soon to the newest versions, so if you use that, stay tuned.

[1]: https://bugs.gentoo.org/144999 "Gentoo bug #144999"
[2]: http://www.gentoo.org/doc/en/mysql-upgrading.xml "Gentoo MySQL Upgrading Guide"
[PHP Overlay]: https://overlays.gentoo.org/proj/php/timeline "Gentoo PHP Overlay"
