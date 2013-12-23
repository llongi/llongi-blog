---
title: New SysCP blog and status
categories: SysCP
author: Luca Longinotti
date: 2006/10/14 21:01:47
updated: 2006/10/17 19:40:30
---
This blog post should be my first to also be syndicated on blog.syscp.org, one of the new resources we SysCP
devs will use to better bring news and informations to you, the user.  
First, let me again thank Martin Burchert aka eremit for all the work he's done over the years and the big
help and guidance he has provided to all of us, and the really fantastic work done on SysCP 1.3! Thanks Martin!  
Second, as EleRas said on his previous post, we're working on SysCP 1.3, largely following the proposals of
SysCP EP01. We've already implemented most of the backend changes:

* Modules versioning [CHTEKK]
* Modules dependencies (with &&, || and < =>version support, and reverse-deps) [CHTEKK]
* Modules on/off (and core modules which can't be turned off) [CHTEKK]
* Plugins (modules can plugin frontend parts into eachother basically, extending themselves) [CHTEKK]
* Validation Handler (class to validate and check user input) [EleRas]
* XML-RPC Handler (class to work with a remote XML-RPC server) [CHTEKK]

Also on the frontend side we're going pretty well:

* Modulesmanager done [EleRas]
* Languageeditor done [EleRas]
* Option to change the theme added [CHTEKK]

Also a lot of bugfixes were added, as well as the theme by me and Luca Piona (which is also default in 1.2.14
now, yay!), thanks to EleRas for porting that to the SysCP 1.3 structure!  
We also should now be E_ALL and E_STRICT compliant on PHP 5.1.6 at least (that's what me and EleRas tested
with, no more warnings, yay!).

The PHPBeautifier SysCP filter also was ran over the whole codebase, and yelded very good results and a much
more readable and beautiful code (it's all about beauty today, isn't it? :P).  
And as EleRas also already announced, we're currently working on splitting up all the language files into a
modular structure, it's no difficult job, but a tedious, boring one.  
Plans for the future (future = SysCP 1.4 final release):

* complete the language files split
* integrate some new features (for example prodigy7's very good patches)
* convert SysCP to use Propel for database access, and use a totally new, much more modular and normalized
  database layout
* rewrite most of the modules to be compliant with the new database layout, while adding some features here
  and there, and making extensive use of the new features, like ValidationHandler, ...
* add a module to administrate Vservers (Linux-Vserver based), that's part of a project I have to complete
  for school, so that will probably have priority for me during the next weeks

There's also some talk about adding some type of optional LDAP support sometimes in the future, we'll see about that.  
Ah, and MacOS X support is also planned, again sometimes in the future, this will probably mainly be done by flo,
unless someone buys me a Mac Mini (Intel CPU, at least 1GB ram, contact me for a shipping address ;) ).  
That's it. :) Arrr, I wrote a little bit more than I intended to, but at least this should be a fairly complete
status update and explain what we're going to do next, so... Let's do it!
