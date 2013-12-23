---
title: 'Software patents: WTF?'
categories: Rig, CompSci, Software
author: Luca Longinotti
date: 2011/07/08 11:57:00
updated: 2011/07/08 11:58:28
---
Disclaimer: I am not a lawyer, the following depicts my understanding of the issues at hand and my opinion.
It is not legal counsel.  
A [discussion on StackOverflow][1] I was having with the author of [liblfds][2] quickly went from technical
to commercial/legal: software patents were mentioned, and the world became a little less clear...  
Basically it boils down to the possibility that maybe, some algorithms/techniques/technologies implemented
by Rig may be patented, and thus there might be legal questions about the usability of Rig in the US.
I specify US here, because the EU doesn't recognize software patents to the extent of US patent law, where
you can theoretically patent anything, which continuously results in totally bogus patents, like [this one][3],
if we're talking about data-structures and algorithms. As a Swiss citizen living in Switzerland I didn't even
really ever think about this, since here software patents do not exists at all in the form possible in the US,
anything purely algorithmic is [hardly patentable][4].  
As here we simply don't care about this possibility, if you want to code something, you do, also being part
of the academic community, it's almost taken for granted that working on and off others research, improving,
implementing etc. is possible and even encouraged, especially in an open-source fashion. So no, I wasn't
trying to deceive anyone here, it just never entered my mind as a real concern that needs significant time
dedicated to it. But I'm doing that now, so let's address Mr. Douglass' concerns:

**A) the BSD license is incompatible with possible patents, meaning the license of code is related to possible
patent claims**

This is incorrect. License, copyright and patents are different things, even if somewhat related. It is
perfectly possible to create code and license it, even if it knowingly violates granted patents, see the
[LAME][5] case for an obvious example. Usually the license has nothing at all to do with possible patents
that said code may be infringing, a code's license attributes the copyright and distribution as well as usage
constraints upon the specific code in question. Patents are about ideas and techniques, especially the software
ones, they usually just describe a procedure, which can be implemented in many a different way.  
Conclusion: licenses relate to the particular code of the particular implementation, they just tell you what
kind of restrictions I, as the author of the code, pose upon the code itself, with regards to distribution,
use and re-use, linkage, etc.. There are licenses, like the GPL v3.0 and the Apache License, that do have
extra bits and pieces that also regulate patent claims. The GPL v2.0, LGPL, BSD and most others don't give
you any special rights regarding patents whatsoever, unless the code is specifically released by the owner
of the patents in the first place, which may then forbid later patent infringement suits on compliant
derivative works. This again very much depends on the exact wording of the license, and the patent still
remains an independent entity.

**B) [RCU][6] is okay to use and there will be no possible patent-related problems, because it's LGPL**

I have no idea where this comes from. The [LGPL][7] paragraphs 11 and 12 specifically do not grant you any
right whatsoever regarding patents held over what the code ([liburcu][8] in this case) does, it actually says
that, if faced with patent infringement suits, you must try to comply with both the suit, as well as the
license concerning distribution, meaning you either geographically restrict the software in such a case or
stop distributing it altogether. Just because there are LGPL implementations of RCU (and others exist under
various other licenses, like in the Linux kernel under the GPL v2.0), doesn't automatically mean that you're
granted full usage of the patents on the RCU technique, patents which are fully filed, existing and valid,
from [Wikipedia][9]: "The technique is covered by U.S. software patent 5,442,758, issued August 15, 1995
and assigned to Sequent Computer Systems, as well as by 5,608,893, 5,727,528, 6,219,690, and 6,886,162.
The now-expired US Patent 4,809,168 covers a closely related technique."  
As such, the fact an LGPL implementation of RCU exists, doesn't automatically grant you any right upon the
RCU patents themselves, nor does it make them automatically freely usable for other implementations.  
The fact that Paul McKenney provides a GPL implementation in the kernel may be of help here, as the main
patent holder, his offering a GPL licensed implementation does protect users of said GPL implementation
and derivatives, again under what the GPL defines as such, from any patent claims.  
[Regarding the GPL][10]: "This means that a patent holder who distributes a software package incorporating
his patent can no longer assert that patent against people who distribute that package further or incorporate
the package in their own product. Asserting a patent restricts the rights granted by the GPL and therefore
is not permitted. This means that a competitor is now free to incorporate that package in his own product
without having to pay any royalty to the patent holder. Of course that part of the product (and all other
parts based on that part) will have to be made available under the GPL."  
If such then directly translates to the LGPL user-space implementation is unclear, but given the involved
parties it's very likely. It still doesn't mean any other, new RCU implementation has any rights on the
RCU patents, those are still there and valid. You either need to base your work directly on the available
GPL/LGPL code and release it under the same license, or get explicit permission from the patent holders.

**C) There may be a patent on the non-blocking list or its delete-bit**

Harris actually patented the [whole thing][11]. I'm not sure at all about the delete-bit alone, it can
trivially be shown that the technique of using the unused bits of a pointer to store information  was
widely known and used before the 2000 patent. Just take a look at [Lisp machines][12] and
[Tagged pointers][13]. Several implementations exist, work on extending this was done by various sources,
there is code and books on this (*"The Art of Multiprocessor Programming"*). I have no idea what this means
from a legal point of view. Non-profit use and research seem to be fully okay. My own code is not a 1:1
implementation of what Harris describes, I use a two-dimensional list, providing KeyNodes at intervals
to start re-traversal from a shorter, guaranteed point, and I handle restart of traversal differently,
trying a tighter path first.

**D) There may be a patent on SMR using Hazard Pointers**

There is a [patent application][14], no patent. No idea here either, it is used and extended in other papers
(RCU+HP, Ref-counts+HP). Several implementations exist, under various licenses, even of the derivative
papers... I am using the concepts too.  
In any case, I have to compliment Maged Michael for his papers, those are awesome, very clear and well written.

**E) I'm intentionally mis-informing and deceiving users of my library**

Hell, NO! As I explained above, software patents are just a non-issue here, it's something you just don't
really think about, other than to laugh at Slashdot, ArsTechnica & co. news about the latest patent granted
in the US on warm water and double-clicking an icon. With this blog post, linked on the library's home-page,
I'm remedying this for the concerned US citizen.

I believe patents on ideas and abstract concepts, especially software, are fundamentally wrong, they
realistically only protect the lazy implementor. Especially with the situation as it is now in the US,
realistically, shut down your computer and search for a new job, maybe something involving nature (but
they're patenting that stuff too...), because I'd really like for you to prove that just glibc, Gnome,
KDE are completely safe from any patent-related question. Even if you own the patent yourself, you can't
be totally sure no-one else has patented something similar before, and even less sure if and what that
means for you. Even the big players have no real idea what's going on, just look at the various browser
vendors and Google on VP8 / H264, or take a look at [this graph][15] and tell me how long it took you to
either explode in laughter, amusedly shake your head, or both.

A few more resources on this:

* [http://www.iusmentis.com/computerprograms/opensourcesoftware/patentrisks/][16]
* [http://producingoss.com/en/patents.html][17]
* [http://www.itwire.com/business-it-news/open-source/38109-ibm-breaks-patent-pledge-to-foss-community][18]
* [http://www.jerf.org/writings/communicationEthics/node6.html][19]
* [http://www.omgubuntu.co.uk/2011/02/swpatents-worse-than-useless/][20]
* [https://fedoraproject.org/wiki/Software_Patents][21]
* [http://www.oss-watch.ac.uk/resources/fossandpatents.xml][22]
* [http://fosspatents.blogspot.com/][23]

In the meantime, I'll happily continue coding on my open-source library, learning new things, experimenting
and benchmarking and having fun. And I hope others find this freely given work useful, and may use the library
themselves, because it's there and works and may make their life easier.

[1]: http://stackoverflow.com/questions/6572714/lock-free-algorithm-library "SO Lock-Free Library"
[2]: http://www.liblfds.org/ "liblfds"
[3]: http://slashdot.org/story/06/11/23/1546218/LSI-Patents-the-Doubly-Linked-List "Doubly-linked-list patent"
[4]: http://www.patentlaw.ch/?sub_id=64&leng=0 "Swiss Patent Law"
[5]: https://secure.wikimedia.org/wikipedia/en/wiki/LAME#Patents_and_legal_issues "LAME MP3 Encoder patent issues"
[6]: https://secure.wikimedia.org/wikipedia/en/wiki/Read-copy-update "Read-Copy-Update"
[7]: http://www.gnu.org/licenses/lgpl-2.1.html "LGPL-2.1"
[8]: http://lttng.org/urcu "liburcu"
[9]: https://secure.wikimedia.org/wikipedia/en/wiki/Read-copy-update#Patents "Some RCU patents"
[10]: http://www.iusmentis.com/computerprograms/opensourcesoftware/patentrisks/ "Patent Risks"
[11]: http://www.google.com/patents?id=AfR6AAAAEBAJ&printsec=abstract#v=onepage&q&f=false "Harris Linked-List patent"
[12]: https://secure.wikimedia.org/wikipedia/en/wiki/Lisp_machine "Lisp Machines"
[13]: https://secure.wikimedia.org/wikipedia/en/wiki/Tagged_pointer "Tagged Pointers"
[14]: http://www.google.com/patents?id=KCqWAAAAEBAJ&printsec=abstract#v=onepage&q&f=false "Hazard Pointers patent application"
[15]: http://bits.blogs.nytimes.com/2010/03/04/an-explosion-of-mobile-patent-lawsuits/ "Explosion of Mobile Patent Lawsuits"
[16]: http://www.iusmentis.com/computerprograms/opensourcesoftware/patentrisks/ "Quick overview of patent risks"
[17]: http://producingoss.com/en/patents.html "Patents Arms Race"
[18]: http://www.itwire.com/business-it-news/open-source/38109-ibm-breaks-patent-pledge-to-foss-community "Even patent guarantees are no such"
[19]: http://www.jerf.org/writings/communicationEthics/node6.html "Software and Software Patents"
[20]: http://www.omgubuntu.co.uk/2011/02/swpatents-worse-than-useless/ "Software patents worse than useless"
[21]: https://fedoraproject.org/wiki/Software_Patents "Fedora on Software Patents"
[22]: http://www.oss-watch.ac.uk/resources/fossandpatents.xml "FOSS and Patents"
[23]: http://fosspatents.blogspot.com/ "FOSS Patents Blog"
