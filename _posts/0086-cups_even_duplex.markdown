---
title: CUPS EvenDuplex
categories: Hardware, Software
author: Luca Longinotti
date: 2011/11/01 18:04:00
updated: 2011/11/01 18:04:00
---
Another remind-myself blog-post.  
If you've got a printer like mine, which accepts PCL6, and expects there to always be an even number of pages
when doing duplex printing, CUPS has a very easy solution for you. Open-source software usually always has.

$$code(lang=ini)
*cupsEvenDuplex: True
$$/code

Add that to your PPD file, and voilà, enjoy duplex working also when submitting three pages for printing!
