---
title: New-style PHP status
categories: Gentoo, PHP, MySQL
author: Luca Longinotti
date: 2005/10/24 19:49:55
updated: 2005/10/24 19:49:55
---
Well, Stuart mentioned what is holding us up some time ago, here is the updated edition:

* Create dev-php/php-toolkit
* Fixing deps in the Portage tree
* lib64 Patch
* PaX support patch
* Some safe_mode issues

We're well on track I think, for the dev-php/php-toolkit package we already have the concepts, it only needs
to be implemented, it will be a collection of BASh scripts to help you update and maintain your PHP packages
and extensions, and also symlink the correct PHP binaries, as we dropped the idea of using eselect for that
and will retire app-admin/eselect-php as soon as we have a working alternative for our needs.  
The deps in the Portage tree also are making progress, iirc the last time I checked only 4-5 ebuilds still
had wrong dependencies that were not compatible with the new-style PHP.  
The lib64 patch still needs to be reviewed, I'll try to do that this week.  
PaX support... Well, we have ideas on how to fix the TEXTREL issues, but it slows PHP down considerably so
we'll probably go for the USE-flag solution: who needs it enableds it and has a TEXTREL-free PHP wich is
slower, who doesn't need it, can have his PHP with some TEXTREL around and have it as fast as it always was.  
Also safe_mode creates some troubles in some configurations it seems, one of them was fixed now in the PHP
Overlay and the other I'll try to do ASAP.

MySQL 4.1 now is finally stable, a "great work!" to the Gentoo MySQL devs, as it works really well and
permits us to go stable with dev-lang/php-5* in the future. ;)
