---
title: Beware of quotes passed to init-scripts!
categories: Gentoo, Software
author: Luca Longinotti
date: 2010/08/27 04:55:05
updated: 2010/08/27 05:27:54
---
Just a quick note in case I or others run into this again...  
I use [Trac][1] to manage a few projects, more specifically Gentoo's www-apps/trac package to ease its deployment.
One feature of the package I take advantage of is the init-script to manage the tracd standalone server.  
I now wanted to enable authentication for my Trac installs, and all guides out there tell you to add:

$$code(lang=bash)
--auth="*,/path/to/digest/auth/file,domain"
$$/code

to your commandline when starting Trac (**notice the quotes!**), I tried this on the shell, and it worked as
expected. I thus changed the TRACD_OPTS variable in */etc/conf.d/tracd* to the following:

$$code(lang=bash)
TRACD_OPTS="--auth=\"*,/path/to/digest/auth/file,domain\"
--env-parent-dir /var/lib/trac/"
$$/code

It started fine but authentication didn't work at all... Somewhat baffling, but after some investigation, I
noticed that the quotes around the *--auth* argument were passed as-is to tracd, which then failed to find
the environment \*, since when splitting the --auth argument apart, "\* would be used as environment name.  
The solution is simply to not set any type of quotes when starting tracd through the provided init-script,
so that TRACD_OPTS looks as follows:

$$code(lang=bash)
TRACD_OPTS="--auth=*,/path/to/digest/auth/file,domain
--env-parent-dir /var/lib/trac/"
$$/code

In hindsight logical, as the TRACD_OPTS variable gets evaluated only once and then passed to start-stop-daemon,
which passes the arguments verbatim to tracd.

[1]: http://trac.edgewall.org/ "Trac"
