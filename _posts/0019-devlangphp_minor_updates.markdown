---
title: dev-lang/php minor updates
categories: Gentoo, PHP
author: Luca Longinotti
date: 2006/04/18 15:03:42
updated: 2006/04/18 15:03:42
---
I've just committed some updates to dev-lang/php, two of which may interest you:

1) the "nls" USE flag, which previously enabled the gettext extension, the mbstring extension and the sqlite-utf8
support, now only enables the gettext extension.  
The mbstring extension and sqlite-utf8 support were moved to the "unicode" USE flag. Affected ebuilds are already
up to date.

2) the EXTRA_ECONF variable was added to dev-lang/php, that way you can easily pass your own configure parameters
to the ebuild if you want to try out some crazy stuff, just do:

$$code(lang=bash)
EXTRA_ECONF="--with-whatever-I-want" emerge dev-lang/php
$$/code

Two little notes: the variable doesn't get saved between emerges, so you have to add it to the command line every
time, and anything you do that way is **totally unsupported**, so don't ever file bugs about it, thanks.

UPDATE: it was now changed to EXTRA_ECONF instead of MY_CONF, to follow what a lot of other ebuilds already do.
