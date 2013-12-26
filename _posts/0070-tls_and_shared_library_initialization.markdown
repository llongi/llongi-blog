---
title: TLS and shared library initialization
categories: C99, Programming
author: Luca Longinotti
date: 2011/02/24 18:00:00
updated: 2011/06/09 19:20:23
---
For my work on Rig, the ability for variables to be thread-local is of critical importance.  
Both Pthreads in the POSIX world and Windows offer ways to allocate a thread-local key, from which to get/set
a pointer(-sized) value.  
Using this you can easily make any piece of data thread-local, you'd just allocate it on the heap and store
the address in the thread-local key variable. This is usually called thread-local data or run-time TLS
(thread-local-storage).  
But several compilers and operating systems support extensions to the C language, so that one can declare a
variable, with [some restrictions][1], thread-local, and access it as one usually would, without the need to
use any specific library functions or API. This is what people normally refer to as TLS (or load-time TLS if
one wants to be more precise).  
If TLS is available, it clearly is the preferred alternative, as it's much easier to use, doesn't need any
special kind of initialization, and is usually faster (due to possible compiler optimizations) or at the very
least as-fast as thread-local data.  
Following is a table of which OSes support TLS, using which compilers (in their minimum version) and what
keyword is exactly needed.

<table border="1">
	<tr>
		<th>OS</th>
		<th>load-time TLS</th>
		<th>supported compilers</th>
		<th>run-time TLS</th>
	</tr>
	<tr>
		<th>Windows</th>
		<td>__declspec(thread)</td>
		<td>MSVC 2005, ICC 9.0</td>
		<td>Tls{Alloc,Free}</td>
	</tr>
	<tr>
		<th>Linux</th>
		<td>__thread</td>
		<td>GCC 4.1.X, Clang 2.8, ICC 9.0, Solaris Studio 12</td>
		<td>pthread_key_{create,delete}</td>
	</tr>
	<tr>
		<th>FreeBSD</th>
		<td>__thread</td>
		<td>GCC 4.1.X, Clang 2.8</td>
		<td>pthread_key_{create,delete}</td>
	</tr>
	<tr>
		<th>MacOS X</th>
		<td>None</td>
		<td>None (unsupported)</td>
		<td>pthread_key_{create,delete}</td>
	</tr>
	<tr>
		<th>Solaris</th>
		<td>__thread</td>
		<td>GCC 3.4.X, Solaris Studio 12</td>
		<td>pthread_key_{create,delete}</td>
	</tr>
	<tr>
		<th>OpenBSD</th>
		<td>None</td>
		<td>None (unsupported)</td>
		<td>pthread_key_{create,delete}</td>
	</tr>
	<tr>
		<th>NetBSD</th>
		<td>None</td>
		<td>None (segfaults)</td>
		<td>pthread_key_{create,delete}</td>
	</tr>
	<tr>
		<th>AIX</th>
		<td>__thread</td>
		<td>IBM XL C 11.X</td>
		<td>pthread_key_{create,delete}</td>
	</tr>
</table>

GCC, [ICC][2] and [Solaris Studio][3] all support \_\_thread, Clang does so as well.  
IBM's XL C compiler on AIX [supports \_\_thread with the -qtls option][4].  
On Windows, VC++ and ICC both support \_\_declspec(thread).  
Support is needed in both the compiler, the linker and the C library/thread library for this to correctly work.  
[Here][5] a snippet of code, a few C defines that try to safely tell if TLS is available.

Another question that came up right alongside the availability of TLS was how to correctly have code executed
when a shared library is loaded (at load-time before main() is entered, at run-time when dlopen() or LoadLibrary()
are called) and unloaded (when returning from main(), or calling exit(), or at run-time when calling dlclose()
or FreeLibrary()), so that initialization and destruction code could be safely run, both for miscellaneous
purposes, such as more involved initialization of global data, and to correctly initialize thread-local keys
using the OS/thread library functions, in case TLS wasn't available. At first I used custom synchronization
code, based on atomic operations, to implicitly do this (by checking a shared variable that indicated if
initialization was already done on each call to something that required it), but this is error-prone, hits
performance, and leaves the question of cleanup at unload open. Another way to do it would be to explicitly
require the user to call an initialization routine before he uses any library functionality, and a destruction
one when he's finished, but that approach is tedious and error-prone too; so I figured there must be a better,
standard way to do this, it seemed like such an useful and common functionality requirement, that it would've
been strange that there was no useable solution out there...  
The dlopen(3) man-page got me started, explaining that recent GCC's support the two function attributes
*"constructor"* and *"destructor"* to define initialization and destruction functions, which substitute the
old approach of having functions named \_\_init and \_\_fini. Using function attributes also enables you to define
multiple initialization and destruction functions. Furthermore, with GCC, you can specify a priority to control
the order of execution. Clang does not support this, and I couldn't find anything indicating Solaris Studio or
ICC to support it either, so it's probably better anyway to not depend on the calling order of different
constructor/destructor functions, and keep them independant from eachother.  
Windows provides a similar mechanism using DllMain(), in which you can put code you want called at various
relevant events.  
I also checked if cleanup functions registered with atexit() would be called together with the destructors,
while this is non-standard, it can be useful and is supported by a few, major C libraries.  
The next table summarizes my findings on all this in an easily readable format.

<table border="1">
	<tr>
		<th>OS</th>
		<th>initialization (load&amp;run-time)</th>
		<th>destruction (load&amp;run-time)</th>
		<th>atexit() on process exit</th>
		<th>atexit() on library unload</th>
	</tr>
	<tr>
		<th>Windows</th>
		<td>DllMain<br />(DLL_PROCESS_ATTACH)</td>
		<td>DllMain<br />(DLL_PROCESS_DETACH)</td>
		<td>Yes</td>
		<td>Yes</td>
	</tr>
	<tr>
		<th>Linux</th>
		<td>function __attribute__((constructor))</td>
		<td>function __attribute__((destructor))</td>
		<td>Yes</td>
		<td>Yes (since glibc 2.2.3)</td>
	</tr>
	<tr>
		<th>FreeBSD</th>
		<td>function __attribute__((constructor))</td>
		<td>function __attribute__((destructor))</td>
		<td>Yes</td>
		<td>No</td>
	</tr>
	<tr>
		<th>MacOS X</th>
		<td>function __attribute__((constructor))</td>
		<td>function __attribute__((destructor))</td>
		<td>Yes</td>
		<td>No</td>
	</tr>
	<tr>
		<th>Solaris</th>
		<td>function __attribute__((constructor))</td>
		<td>function __attribute__((destructor))</td>
		<td>Yes</td>
		<td>Yes (since Solaris 8)</td>
	</tr>
	<tr>
		<th>OpenBSD</th>
		<td>function __attribute__((constructor))</td>
		<td>function __attribute__((destructor))</td>
		<td>Yes</td>
		<td>No</td>
	</tr>
	<tr>
		<th>NetBSD</th>
		<td>function __attribute__((constructor))</td>
		<td>function __attribute__((destructor))</td>
		<td>Yes</td>
		<td>No</td>
	</tr>
</table>

GCC, Clang and ICC directly support the \_\_attribute\_\_ syntax, [Solaris Studio 12][6] does too (and seems to
translate it to the corresponding #pragma it supports), older versions or Sun Studio may only support #pragma
init() / #pragma fini() though.  
This necessitates support from both the compiler and the linker to work, on all tested platforms this was
the case.

[1]: http://gcc.gnu.org/onlinedocs/gcc/Thread_002dLocal.html "general TLS restrictions"
[2]: http://software.intel.com/sites/products/documentation/hpc/composerxe/en-us/cpp/lin/bldaps_cls/common/bldaps_tls_comm.htm "ICC TLS"
[3]: http://download.oracle.com/docs/cd/E19205-01/819-5265/bjabi/index.html "Solaris Studio TLS"
[4]: http://publib.boulder.ibm.com/infocenter/comphelp/v111v131/topic/com.ibm.xlc111.aix.doc/language_ref/thread.html "TLS on AIX"
[5]: https://github.com/llongi/rig/blob/master/Rig/include/sys/system_all.h#L62 "TLS defines"
[6]: http://download.oracle.com/docs/cd/E18659_01/html/821-1384/gjzke.html "Solaris Studio const/dest"
