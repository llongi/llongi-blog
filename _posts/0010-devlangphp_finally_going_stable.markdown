---
title: dev-lang/php finally going stable
categories: Gentoo, PHP
author: Luca Longinotti
date: 2006/01/18 23:32:30
updated: 2006/01/18 23:32:30
---
Today, after about 7 months of work, we finally opened the bugs requesting the stabilization of dev-lang/php
version 4.3.11-r5, 4.4.1-r3 and 5.0.5-r5, you can follow the progress at [the main bug][1].

PHP 5.1.1 will never go stable, we're working on getting PHP 5.1.2 in the tree as soon as possible and that
one will then be (along with PHP 4.4.2) the candidate for stabling after the customary 30 days a package
has to remain in the tree before being marked as stable.  
PHP 4.4.2 and PHP 5.1.2 are on their way and should be available in Portage in about a week, if you want
to try them out, we already have PHP 5.1.2 in our [PHP Overlay][].

There was also movement on the PEAR front of things: dev-php/PEAR-PEAR was updated to 1.3.6-r4 wich should
fix a few bugs and be collision-protect safe. The new dev-php/PEAR-PEAR now directly includes the old
dev-php/PEAR-Archive_Tar, dev-php/PEAR-Console_Getopt and dev-php/PEAR-XML_RPC packages, so there's no need
to emerge them anymore, in fact you have to uninstall them (emerge -C) to be able to install the new
dev-php/PEAR-PEAR-1.3.6-r4, so if Portage complains about blockers and such, just emerge -C the three packages
mentioned above.

A couple of bugs were closed today too, concerning pecl-pdo-pgsql compile failures, and some new packages
were added recently to the [PHP Overlay][]: odbtp and pecl-odbtp, an alternative to freetds and the PHP mssql
extension to access MSSQL databases.

The PHP Herd will also soon hold a meeting, I'll blog about the definitive date once it's decided.  
Things are looking good for PHP on Gentoo imo, and I really wanted to thank all the PHP Herd members and
all the other people involved in this, especially Stuart, Sebastian, Jakub, Andreask, Wendall911 and Kloeri,
for their great help and amazing work and contribution, thanks guys!

[1]: https://bugs.gentoo.org/119461 "Gentoo bug #119461"
[PHP Overlay]: https://overlays.gentoo.org/proj/php/timeline "Gentoo PHP Overlay"
