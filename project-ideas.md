# Project ideas

This is a selection of big / hard / interesting projects from my TODO list.

## GCC

- GCC code injection on breakpoint conditions *and* action
- GCC as a library-based syntax highlight
- add identifier hyperlink capabilities to GitLab like lxr.free-electrons.com https://github.com/isaacs/github/issues/292

## QEMU

Use QEMU to test an OS with assertions, like Selenium for browsers

## Small

-   https://en.wikipedia.org/wiki/Poincar%C3%A9_disk_model in JavaScript

    Possibilities:

    - draw circles around the mouse
    - straight lines that cross two points: http://demonstrations.wolfram.com/TrianglesInThePoincareDisk/ Could also show distance.
    - really slow but great demo: http://jsxgraph.uni-bayreuth.de/wiki/index.php/Poincare_disc_model

    Maybe: https://github.com/cirosantilli/hyperbolic-canvas

-   https://en.wikipedia.org/wiki/Real_projective_plane in JavaScript

    Show it on a flat circle.

## GDB

-   https://sourceware.org/bugzilla/show_bug.cgi?id=13984#add_comment

-   GDB feature requests:

    - disassemble with binutils as a library
    - gdb up arrow history bug

    - gdb python continue until a breakpoint that prints only exactly what I tell it to.
    - rbreak full path, resolve path e.g. `./a.c`
    - rbreak Regex for file to break in directory
    - List all symbols
    - Python get instruction memory from disassemble without an extra read
    - Python breakpoint without message. `internal` has other side effects like not being able to list it. 

    patches:

    - add `if` to call
    - compiled break condition
    - compiled break action
    - http://www.gnu.org/prep/maintain/maintain.html#Legal-Matters in GDB contribute update link

## Hardware

### plug and play

Understand everything that happens between plugging in an USB and seeing `/dev/sdb` appear.

## Stack Overflow statistics

How to do statistics on ratios:

- high reputation / total posts
- high profile views / reputation

But consider users who have say, one post with a ton of upvotes as not significative.
