---
title: Work continues ...
categories: SysCP
author: Luca Longinotti
date: 2006/12/18 02:34:22
updated: 2006/12/18 02:44:33
---
Work on SysCP 1.3 continues, even with Christmas approaching! ;)  
General cleanup in various parts was done, me and EleRas reviewed all the regular expressions of the RegExp
validator now used to validate data coming from the user, now they're much better and precise, and I've also
added a Type validator to check that the type of the passed data is what we expect. Paging was also removed
from the 1.3 codebase, as it was incomplete, outdated and completely broken there... It will be reimplemented
once we've completed other parts of SysCP 1.3 which have priority.  
And the biggest change probably, is that the whole login/logout system was updated and rewritten to conform
to the new structure, the "new way of doing thins". It's still not 100% complete, but you can login and logout,
so the main functionality is there. We've also switched to using Whirlpool as hashing algorithm for the SysCP
account passwords, but we've already decided to later make this configurable by the admin; thanks to the hash
extension present in PHP >=5.1.2 it's really easy to do that, and that extension is really useful.
