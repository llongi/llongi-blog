---
title: '''pear'' USE flag removed'
categories: Gentoo, PHP
author: Luca Longinotti
date: 2006/01/23 21:41:55
updated: 2006/01/23 21:41:55
---
Just fyi: the 'pear' USE flag was deleted from the dev-lang/php packages, this was done because the USE flag
was only there to provide a convenient dependency on dev-php/PEAR-PEAR (which still exists and will continue
to exist, and btw: PEAR 1.4.6 was added to the tree today!).  
Now, this dependency needed to be so that PEAR-PEAR was emerged after dev-lang/php (as it needs dev-lang/php
to work), so we used PDEPEND, which is the only depend type that gets emerged after the package specifying
it at the moment in Portage. And this caused all sorts of havoc with other ebuilds that depended on both
PEAR-PEAR and dev-lang/php, messing up the dependency chain, where it for example tried to emerge dev-lang/php,
then the ebuild that needed PEAR-PEAR, and after that PEAR-PEAR, this became especially obvious with the
ezComponents ebuilds. So we fixed it by removing the 'pear' USE and PDEPEND from the dev-lang/php ebuilds:
now all the dependency chains are generated correctly and as expected, and you can still install pear as
usual with an "emerge dev-php/PEAR-PEAR".
