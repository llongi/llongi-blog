---
title: GCC's __attribute__ ((nonnull (...))) not helpful at all
categories: C99, Programming
author: Luca Longinotti
date: 2010/04/19 21:22:44
updated: 2010/04/20 23:09:30
---
Today I encountered some really interesting and disconcerting GCC behaviour...  
I'm currently writing a library with some data structures in it, and basically have functions such as the
following:

$$code(lang=c)
bool queue_get(QUEUE q, void *item);
$$/code

where item is an address to allocated space on which to operate, this basically is the way you do generics
in pure C, using void pointers to memory locations you copy from/store to, based on some size you know
depending on your usage pattern.  
Now, the first thing any security conscious (and sane) programmer would do is to check that both queue and
item are not NULL and act accordingly, either returning false to the user, or in my case aborting completely
as I'm of the opinion this is a serious error on the programmers part that he must fix, still I digress,
the fact is: there should be some form of NULL check there, for example:

$$code(lang=c)
bool queue_get(QUEUE q, void *item) {
    if (q == NULL || item == NULL) {
        exit(EXIT_FAILURE);
    }
    ...
}
$$/code

This has always worked beautifully. Now the other day I was reading the [GCC manual on function attributes][1]
and stumbled upon attribute "nonnull", documented as such:

> nonnull (arg-index, ...)  
> The nonnull attribute specifies that some function parameters should be non-null pointers. For instance,
> the declaration:
>
>     extern void *
>     my_memcpy (void *dest, const void *src, size_t len)
>     __attribute__ ((nonnull (1, 2)));
>
> causes the compiler to check that, in calls to my_memcpy, arguments dest and src are non-null. If the
> compiler determines that a null pointer is passed in an argument slot marked as non-null, and the -Wnonnull
> option is enabled, a warning is issued. **The compiler may also choose to make optimizations based on
> the knowledge that certain function arguments will not be null.**

Note the bold sentence, we'll come back to it later on.  
Now, I thought this looked quite useful and changed the prototypes of my functions to accordingly hint to the
compiler when I expected a parameter to be nonnull, so for example I changed my queue_get prototype to look
like this:

$$code(lang=c)
bool queue_get(QUEUE q, void *item) __attribute__ ((nonnull (1, 2)));
$$/code

And I then started testing this throughly, and was surprised by what I found:  
GCC's enforcing of this is more or less useless, it only emits a warning if you pass NULL **directly** as a
parameter to the annotated function, meaning only an erroneous call of the form *"queue_get(q, NULL);"* would
for example be detected, anything else, like *"void \*p = NULL; queue_get(q, p);"* or *"queue_get(q, myfunc());"*
where myfunc() may return NULL, are not detected. There is an enhancement bug open at GCC ([bug 17308][2]) to
improve it to handle more cases, but it hasn't seen much activity.  
Still, I thought even if it was only that one warning, annotating the function this way would surely help and
also work as a form of documentation for clients later reading the librarie's header file, so no harm in leaving
it there, because the explicit NULL checks inside the library's functions would anyway correctly catch any
passed NULL pointer and abort, right? WRONG! COMPLETELY WRONG!  
Let's return to that quote from the GCC docs and the last, seemingly innocent line there: *"The compiler may
also choose to make optimizations based on the knowledge that certain function arguments will not be null."*,
what this actually means is that at any meaningful optimization level, such as -O2, any NULL-pointer-checks
against parameters of a function declared with the nonnull attribute will be simply optimized away silently,
so suddenly calling the function while passing NULL during testing always led to a segmentation fault. Whoa,
that's somewhat unexpected! And passing *"-fno-delete-null-pointer-checks"* didn't change anything.  
Searching GCC's bugzilla I found [bug 36166][3], which discussed the exact same thing I was observing, marked
as RESO INVALID... Basically it boils down to the fact GCC does the detection for warnings and the optimization
of code in separate parts, and they don't quite seem to agree, meaning that you only get a warning in one
particular case of passing NULL, and even then only if the appropriate warning level and options are set, while
it ALWAYS optimizes out NULL checks from the code, resulting in quite broken code. The GCC developers seem to
regard this as correct, the reporter disagrees (as do I), [comment 7][4] summarizes the core of the problem quite
well, as well as both positions. RESO INVALID makes it quite clear who won the dispute, and in the end we get a
mostly useless function attribute that silently completely breaks code, based on a somewhat unclear line of
documentation, that was never updated to be clearer (and at least that would have been easy and helpful to do!).  
Conclusion: all the \_\_attribute\_\_ nonnull's have been removed from my code again, and what looked like a great
idea, completely failed in practice in my opinion.

[1]: http://gcc.gnu.org/onlinedocs/gcc/Function-Attributes.html "GCC Function attributes"
[2]: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=17308 "GCC bug #17308"
[3]: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=36166 "GCC bug #36166"
[4]: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=36166#c7 "GCC bug #36166 comment #7"
