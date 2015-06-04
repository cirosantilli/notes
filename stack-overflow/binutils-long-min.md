## binutils build from source fails with `error: 'LONG_MIN' undeclared` in libiberty/fibheap.c because of HAVE_LIMITS_H

I want to compile Binutils from source to study and develop it.

This happens if I either:

    git clone git://sourceware.org/git/binutils-gdb.git
    git checkout binutils-2_25
    cd binutils-gdb
    ./configure
    make

or use the Ubuntu specific:

    apt-get source binutils
    cd binutils-*
    dpkg-buildpackage

The failure happens because `libiberty/fibheap.c` contains:

    #ifdef HAVE_LIMITS_H
    #include <limits.h>
    #endif

    #define FIBHEAPKEY_MIN	LONG_MIN

But the build command is:

    gcc -c -DHAVE_CONFIG_H -g -O2 -Wno-format-security  -I. -I../../libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fpic ../../libiberty/fibheap.c -o pic/fibheap.o;

*without* the `-DHAVE_LIMITS_H` flag, which makes `limits.h` missing.

But I do have it installed, and a minimal program like:

    #include <limits.h>

    long l = LONG_MIN

compiles OK.

This happens because the generated `config.h` did not contain `HAVE_LIMITS_H`, even though there is a stub for it:

so likely it's an autoconf related problem.

I'm on Ubuntu 14.04.

Some related discussions at:

- <http://lists.busybox.net/pipermail/buildroot/2008-November/024036.html>
- <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=13334>

## Answer

I had previously installed the latest GCC 5.1 with:

So either I had installed something wrong, or I should have built and installed Binutils first as done on [Linux From Scratch](http://www.linuxfromscratch.org/lfs/view/development/index.html).

If anyone understands the problem more precisely, please make a separate answer and get rep.
