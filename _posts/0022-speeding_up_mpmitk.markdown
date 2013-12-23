---
title: Speeding up MPM-itk
categories: Gentoo, Apache
author: Luca Longinotti
date: 2006/07/11 13:00:58
updated: 2006/07/11 13:00:58
---
A few days ago I added support for MPM-itk ("mpm-itk" USE flag) to our Apache 2.0 packages. MPM-itk is a
user-switching MPM, that is, it switches to an assigned user when processing the requests, instead of
processing everything as user apache (MPM-perchild, metux-MPM and MPM-peruser are other examples of this).  
In its original form it accomplishes this by doing the following:

* apache process as root, interpret the request
* fork() new process and switch (setuid(unprivuid) / setgid(unprivgid)) to unprivileged user for it, process the request
* kill of the setuid/setgid process, with the next request it will redo the process

Now, this is foolproof, but provokes an immense performance hit, especially on static pages. Benchmarks
done with ab2 showed that a normal Apache2 (MPM-prefork) can process about 240 PHP req/sec and 4000 HTML
req/seq, while the MPM-itk patched Apache 2.0 managed about 110 PHP req/sec and 240 HTML req/sec, so you
see, the peformance hit is enormous, and it's obiously due to the overhead of always having to fork() a
new Apache process and then kill it off, for **every** request!  
I managed to successfully change the way the MPM works, and thus managed to bring its speed to normal
Apache levels, by changing the "worfklow" like this:

* apache process as root, interpret the request
* switch (setresuid(unprivuid, unprivuid, 0) / setresgid(unprivgid, unprivgid, 0)) to unprivileged user, process the request
* switch back to root (setresuid(0, 0, 0) / setresgid(0, 0, 0)), with the next request it will redo the process

Now this solves the performance problems, as it doesn't anymore do the extra fork(), and fully reuses the
process with the next request, but it introduces a new problem: a **gaping** security hole. :(  
Since the processed request cannot be trusted, everything in there can simply setuid/setgid to root and
do operations as root! A simple call to, for example, the posix_setuid/posix_setgid functions of the PHP
POSIX extensio are enough to switch the user back to root and let the rest of the PHP script just work as
root... This is totally unacceptable for security. So, now my call for help: has anyone got any idea how
it's possible to realize this in a secure manner??? I can't think of any way to securely switch the process
from root to unpriv user and back to root, without giving the untrusted code executed in the request
processing phase the same ability (that is, to switch back to root).  
Ideas and comments are very appreciated. ;)
