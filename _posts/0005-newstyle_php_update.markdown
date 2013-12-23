---
title: New-style PHP update
categories: Gentoo, PHP
author: Luca Longinotti
date: 2005/11/09 00:44:14
updated: 2005/11/09 00:44:14
---
Current status report:

* Create dev-php/php-toolkit (still needs to be done)
* Fixing deps in the Portage tree (still needs to be done for some packages, not in our influence sphere)
* lib64 Patch (still needs checking)
* PaX support patch (workaround of "pic" USE flag implemented)
* Some safe_mode issues (all fixed along with other security bugs)

So in the end, what we still have to do is dev-php/php-toolkit and review the lib64 patch, both things I didn't
have time to do yet and will try to do as soon as possible. Last week was marked by many PHP revision bumps on
all PHP packages due to a lot of security fixes, and dev-lang/php got its newest addition of version 4.4.1.
Also remember, PHP 5.1.0 is coming soon. ;)  
At the moment we don't really have a definitive date for stabling the new-style PHP, but if all goes well 2-3
weeks should suffice, I hope. Well that's all for the moment, happy Gentooing!
