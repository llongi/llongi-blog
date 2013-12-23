---
title: Micro-Lock, MurmurHash 3, ...
categories: Rig, C99
author: Luca Longinotti
date: 2011/04/26 22:00:00
updated: 2011/04/26 22:00:00
---
A quick summary of work done on [Rig][1] in the past weeks since the release of 0.4.0:

* added Micro-Lock, a Mutual Exclusion Lock, based on CAS like MRWLock, with support for ownership checking
  and recursive locking
* added [MurmurHash 3][2], the new version of this well known hash algorithm, even faster than its predecessor,
  especially on older systems
* Atomic_Ops: added support for the [SPARCv9][3] architecture, as well as support for GCC intrinsics (though
  the membar situation still needs some work there), and further support for emulating certain atomic
  primitives using others (there's [a graph][4] of how this works)

[1]: https://dev.longi.li/Rig/ "Rig"
[2]: https://code.google.com/p/smhasher/ "MurmurHash"
[3]: http://developers.sun.com/solaris/articles/sparcv9.pdf "SPARC v9 Manual"
[4]: https://dev.longi.li/Rig/export/962/articles/atomic_ops_graph.jpg "Atomic_Ops graph"
