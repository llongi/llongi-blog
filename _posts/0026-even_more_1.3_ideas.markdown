---
title: Even more 1.3 ideas
categories: SysCP
author: Luca Longinotti
date: 2006/10/17 19:08:59
updated: 2006/10/18 19:00:19
---
Expanding on EleRas's latests posts...  
Wrt the email question: I agree that having an additional level, where a user which is intended to only have
an email-account, can login and at least modify his own password, is a very good idea. This can then naturally
be extended for antispam/antivirus settings, auto-responders, filters, etc.. But, thinking about it, we suffer
from the same problem with FTP: how can an additional FTP account user change his own password? Another "ftp"
level? No, that's not the solution, as isn't only a new "email" level in my opinion...  
Our best bet probably is to add another level entirely, after admin and customer: enduser, and then set it all
up so that modules can just define that user-level and it will automatically work. The only little challenge
here will be the logins... At the moment we use one login interface for all admins and customers, as it's easy
to identify them... But adding another enduser level, with different types of authentication (mail-address+pw
should send them to the mail module enduser part, ftp-account+pw should send them to the ftp module enduser part
and so on), that may be tricky and requires some more thought, but it should definitely be feasible. Probably
by either offering specialized login urls/masks, or making it so modules can "register" expected auth-types and
claim them for themselves... We'll have to see. :)  
Expanding on the ideas for 1.3:

* Billing module: will be based upon the new user management module that will also include the registration
  date of a user etc. to make this possible, I expect it to initially just work inside the panel and keep track
  of needed stuff, once that's all well&done, expansion to support sending out automatically mails, and even
  generate PDFs are on the TODO list. This will also include a module to define hosting plans and their prices
* concurrentmodphp support: this will be Gentoo-only, but will rule. :P A feature of Gentoo's PHP packages is
  the ability to load  both mod_php4 and mod_php5 into the same Apache2 instance (PHP extensions like eAccelerator,
  Fileinfo, Suhosin etc. work too!), which will enable you to offer both PHP4 and PHP5 easily, with the usual
  performance and configurability of mod_php (examples of this will be choosing of which extensions are managed
  by which PHP version on a per-directory basis, setting stuff like error_display, safe_mode etc. on/off on a
  per-directory/per-virtualhost basis, and so on)
* IPv6 support: well that's relatively easy, just need to make some database fields bigger and some checks will
  have to be expanded to also match the IPv6 notation, still, it's new stuff
* quota support: still need to really hash this out, but there will be some kind of hard-quota support for mail
  (probably using Postfix-VDA or Maildrop), database (hmmm hmmmm any good ideas here?) and webspace (both using
  virtual quotas from the FTP daemons we support (ProFTPd and Pure-FTPd) and using traditional hard fs-quotas
* ticket system: possibility for customers to open tickets with their admins, this will help a lot with support
* improved MySQL management module: will separate the database user from the database itself, allowing for a
  much more flexible setup, and add support for a suffix to the database so that it's partially possible to
  "name" a database to better identify it (prefix will still be fixed and based on customer account data to
  avoid conflicts)
* PostgreSQL management module: so your customers can also work with PostgreSQL users and databases
* Backup module: an official one, based off eremit's work for the 1.2.X backup module, will backup logs,
  webspace, mails and dbs
* Automatic registration module: MAYBE something to allow users to register without having the admin do all the
  work, some kind of automatic registration with some kind of verification, maybe credit-card based... But this
  is just an idea a customer gave me, I haven't really thought about it and how it can be implemented best...
  I'd appreciate your thoughts on this.

That's it for now, can't remember any other particularly exciting features, will blog about them if I get any other cool ideas.
