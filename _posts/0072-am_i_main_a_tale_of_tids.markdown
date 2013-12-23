---
title: Am I main?, a tale of TIDs
categories: C99, Programming
author: Luca Longinotti
date: 2011/02/09 17:00:00
updated: 2011/02/09 17:02:32
---
During my work on Rig, which will also include thread abstraction, I stumbled upon the problem of getting some
kind of ID to identify a running thread, I wanted to be able to do something akin to getpid() (or
GetCurrentProcessId() for Windows), but for threads, not processes. Solving this on Windows was easy, the Unix
world is another story.  
Now, the Pthreads API doesn't offer this functionality, the closest is pthread_self(), which returns an opaque
type pthread_t, which can't (safely) be used directly to differentiate between threads. Which means that to
solve this, I needed to enter the world of non-portable, OS-specific functionality: one of the reasons I wanted
to use VMs in my previous post was in fact to try this out.  
After reading a lot of documentation and trying out a few things, it became clear that each OS had a different
way of getting this information.  
Coincidentally, the next day someone on [StackOverflow][1] asked an interesting question that turned out to be
related: ["How to determine if the current thread is the main one?"][2], which I set out to answer. My answer
already contains a good explanation of how to approach that problem, so I won't reiterate it here, and simply
offer a helpful reference of my overall findings.

<table border="1">
	<tr>
		<th>OS</th>
		<th>Thread ID</th>
		<th>Is thread main?</th>
	</tr>
	<tr>
		<th>Windows</th>
		<td><a href="http://msdn.microsoft.com/en-us/library/ms683183.aspx" title="MSDN Documentation">tid = GetCurrentThreadId();</a></td>
		<td><a href="http://stackoverflow.com/questions/1969579/getting-a-handle-to-the-processes-main-thread" title="Possible Approach">???</a></td>
	</tr>
	<tr>
		<th>Linux</th>
		<td>tid = syscall(SYS_gettid);</td>
		<td>tid == getpid()</td>
	</tr>
	<tr>
		<th>FreeBSD</th>
		<td>long lwpid;<br />thr_self(&amp;lwpid);<br />tid = lwpid;</td>
		<td>pthread_main_np() != 0</td>
	</tr>
	<tr>
		<th>MacOS X</th>
		<td>tid = pthread_mach_thread_np(pthread_self());</td>
		<td>pthread_main_np() != 0</td>
	</tr>
	<tr>
		<th>Solaris</th>
		<td>tid = pthread_self();</td>
		<td>tid == 1</td>
	</tr>
	<tr>
		<th>OpenBSD</th>
		<td>Not available.</td>
		<td>pthread_main_np() != 0</td>
	</tr>
	<tr>
		<th>NetBSD</th>
		<td>tid = _lwp_self();</td>
		<td>tid == 1</td>
	</tr>
</table>

[1]: http://stackoverflow.com/ "StackOverflow"
[2]: http://stackoverflow.com/questions/4867839/how-can-i-tell-if-pthread-self-is-the-main-first-thread-in-the-process/ "SO Question"
