---
title: New PHP revisions in the tree
categories: Gentoo, PHP
author: Luca Longinotti
date: 2006/07/14 20:11:57
updated: 2006/07/14 20:11:57
---
For all those who wondered, PHP in Gentoo is definitely not dead. ;)

Just put new revisions in the tree (dev-lang/php-4.4.2-r6 and dev-lang/php-5.1.4-r4), that fix various bugs
and security issues. On that note, a big thanks to Stefan Esser from Hardened-PHP.net for all his patches
and work on securing PHP (and of course the Hardened-PHP patch itself)!  
The new PHP revisions also introduce a better separation between eclasses and ebuilds, making their management
and the addition of new features easier.

One of these new additions for now is the "concurrentmodphp" USE flag.  
It enables building mod_php4 and mod_php5 in a way that both can be loaded at the same time into the same
Apache2 instance, each mod_php then has its own mime-types (application/x-httpd-php4{-source} for PHP4 and
application/x-httpd-php5{-source} for PHP5) and configuration modifiers (php4_admin_value/php4_admin_flag for
PHP4 and php5_admin_value/php5_admin_flag for PHP5 and so on). This feature is **highly** experimental, I
could confirm it working on my x86 system and partially on an x86_64 system, but I'd very much like for
users to try it out on systems where breakage is allowed (developement systems or test systems) and report
back the results to me, thanks!  
To try it, do the following:

$$code(lang=bash)
emerge --sync
echo dev-lang/php >> /etc/portage/package.keywords
USE="apache2 concurrentmodphp" emerge =php-4* =php-5*
$$/code

then don't forget to "etc-update" and re-emerge **all** of your installed PHP modules/extensions
(such as dev-php4/pecl-zip). Also all this does **not** work with the "java-internal" (PHP4) and
"sharedext" (PHP4/5) USE flags enabled, so be sure to disable them when you emerge php.
