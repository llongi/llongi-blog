---
title: New Propel db structure on its way!
categories: SysCP
author: Luca Longinotti
date: 2006/11/19 21:56:41
updated: 2006/11/19 21:56:41
---
The new database structure for SysCP 1.4 is taking form, I'd say it's almost complete, only the foreign-key
definitions are still missing, something I intend to rectify in a day or two.  
While changing towards this new structure, we've also changed to use Propel to connect and work with the
database, it will thus replace the old DatabaseHandler.  
Starting with SysCP 1.4, thanks to all this, we'll also support using SysCP on a PostgreSQL database,
and there will also be a module to let your customers create and administrate PostgreSQL databases,
just like you can now with MySQL.  
Only thing that deluded me a little is that the Propel generated classes change when built with MySQL or
PgSQL, which is kinda "WTF?", as we're speaking about a database abstraction layer to an extent... Oh well,
the changes are tiny and we'll then decide how to approach this... Either distributing two SysCP tarballs,
one with PgSQL classes and one with the MySQL ones, or just supplying a diff against the MySQL ones to
support PgSQL... Once we're more into the whole thing we'll be able to decide!
