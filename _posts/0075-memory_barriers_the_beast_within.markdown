---
title: 'Memory barriers: the beast within'
categories: C99, Programming
author: Luca Longinotti
draft: True
date: 2011/08/18 18:59:00
updated: 2011/08/18 19:00:05
---
Working with lock-free algorithms means really going down into the memory models of the various architectures
you're working with, because just making sure the operations are atomic and that the compiler outputs them
more or less in the order you expect them is not really enough: the processor can reorder memory accesses
pretty much as it sees fit, following the architecture's memory ordering and consistency rules, which can
lead to very hard to debug problems and strange unexpected behavior. Still, the processor being able to reorder
this makes quite a bit of sense, in light of performance and efficiency, which are some primary goals for any
CPU design, so, how to strengthen the assumptions we can make about how it will reorder our memory accesses?  
The answer: memory barriers.  
Those are hard kinda hard to understand and even harder to always get right, but I'll try to shed some light on
them here. Memory barriers, also called memory fences, force constraints on how the processors can reorder
memory accesses. They can conceptually be divided into three types:

**acquire barrier**
An acquire barrier boils down to: no memory accesses (whether loads or stores) coming after me in the instruction
stream can be reordered to before me. This says nothing about what came before the barrier, which may be reordered
to be after it, at the processors discretion.

**release barrier**
A release barrier boils down to: no memory accesses (whether loads or stores) coming before me in the instruction
stream can be reordered to after me. This implies that all memory accesses before me must be fully completed and
flushed by the point I finish executing. This says nothing about what comes after the barrier, which may be
reordered to be before it, at the processors discretion.

**full barrier**
A full barrier boils down to: nothing gets reordered around me, everything that is before stays before, and what
is after, stays after. This implies that all memory accesses before me must be fully completed and flushed at
the point I finish executing. Note that this is, maybe contrary to simple intuition, a stronger guarantee than
a simple acquire+release barriers combination!  
Imagine we have the following situation (l = load, s = store, acq = acquire barrier, rel = release barrier):  
l1, s1, acq, rel, l2, s2  
Now, the acquire barrier tells us that everything after it (including the release barrier) shall stay after it,
but it does not prevent l1 and s1 to pass it (but they can't pass the release barrier), so the following is
a valid reordering:  
acq, l1, s1, rel, l2, s2  
Now, the release barrier tells us that everything before it (including the acquire barrier) has to stay and
happen before it, but it says nothing about l2 and s2 having to stay after it, so the following is still valid:  
acq, l1, s1, l2, s2, rel  
And now, we can reorder the loads and stores as we want, and it would still be valid, but FAR from what we
wanted to happen:  
acq, l2, l1, s2, s1, rel  
The same holds for a release+acquire combination, provided different barriers can be reordered between each
other, which is usually the case, and completely architecture dependent anyway.  
A full barrier can thus be seen as a sort of atomic acquire+release/release+acquire combination.

Let's look at how you'd implement this on a few architectures, taking their memory ordering into consideration:

**x86(-64)**


**ia64**


**ppc**


**sparc**


**arm**
