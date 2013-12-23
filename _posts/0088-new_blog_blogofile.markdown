---
title: New blog based on Blogofile
categories: Website, Gentoo
author: Luca Longinotti
date: 2011/11/09 20:00:00
updated: 2011/11/12 20:40:00
---
As some of you may have noticed already, my blog suddenly looks very different.  
I've abandoned [Serendipity][1] in favor of [Blogofile][2], which is a Python-based static-site generator.
This means I write posts as text-files, they get processed, merged with templates, HTML gets generated, and
a fully static site is the result. In fact the only dynamic thing remaining are the comments, which are now
powered by [Disqus][3] over JavaScript. This allowed me to ditch PHP and MySQL, and reduce the load on the server
quite a bit. Search is powered by [Google][4]. I've also overhauled the template to look nicer and be fully
XHTML 1.0 Strict compliant. Thanks to [Free CSS Templates][5] for the design!  
I've also added a few more parts to the site, now it's not only a pure blog, there's a welcoming page, one
about UZH and one about me. As well as a better media gallery. Everything is available via HTTPS, as usual.
At the bottom I link to my projects, as well as interesting blogs I follow.  
If you find anything not working, be it a link or post, please tell me right away, so I can fix it, thanks!

UPDATE: I've written an [ebuild for Blogofile][6], you can get it from [my overlay][7]. It pulls in all required
dependencies to run. For my own blog, I also needed dev-python/imaging for the gallery controller.

[1]: http://www.s9y.org/ "Serendipity"
[2]: http://www.blogofile.com/ "Blogofile"
[3]: http://www.disqus.com/ "Disqus"
[4]: http://www.google.com/ "Google"
[5]: http://www.freecsstemplates.org/ "Free CSS Templates"
[6]: https://dev.longi.li/Projects/browser/gentoo-ebuilds/dev-python/blogofile/blogofile-0.7.1.ebuild "Blogofile 0.7.1 Gentoo ebuild"
[7]: svn://dev.longi.li/projects/gentoo-ebuilds/ "my Gentoo ebuilds overlay""
