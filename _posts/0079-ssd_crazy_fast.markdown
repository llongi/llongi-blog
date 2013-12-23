---
title: SSD crazy fast!
categories: Hardware, Rig, Software
author: Luca Longinotti
date: 2011/05/13 10:10:00
updated: 2011/05/13 17:51:41
---
Finally replaced the old HD with a SSD I bought in January on my workstation, an OCZ Vertex 2 in 3.5" format,
so that it fits in the hot-swap trays I've got.  
It's actually surprising that so few vendors have 3.5" editions, as that's what practically all desktops,
workstations and servers do have, especially considering hot-swap trays and similar drive bays.  
Sure, with 2.5" you can pack more stuff into new-generation servers, but those are still incredibly expensive,
and it makes sense on laptops, but that's pretty much it.  
Anyway, the results are there: disk operations are crazy fast compared to before. Boot is incredibly fast,
actually with OpenRC now, so fast that getting an IP via DHCP was the dominant factor, and changing to a static
IP eliminated that one too.  
I'm very satisfied with this, and ext4 with the 'discard' option (TRIM support) seems to work perfectly fine.

On the Rig front, I've not done much: some more work went into testing, the typeinfo stuff was completely
removed, and a few more checks with regards to sizes and permitted flags were added.

Another project that I'll probably tackle soon is writing a build system that doesn't suck, and that tries to
really be minimal, and not support the world and more, it just needs to generate Makefiles (and Visual
Studio/Eclipse support probably too). The build itself is left to the relevant tools, this just really needs
to gather info about where we're running and the features we want, make that info available to the user (some
header file), and generate appropriate Makefiles, which don't depend back on the generator itself, so that you
can also just generate generic Makefiles and not need to have the generator installed on every system with all
its dependencies. I mostly want to get rid of CMake and its horrible mess of half-baked modules. Anyone wants
to help here? It's going to be in Python, and it should support only C/C++ builds.
