# Project ideas

This is a selection of big / hard / interesting projects from my TODO list.

## Data mining

### Stack overflow google rank rep

- http://meta.stackexchange.com/questions/28874/applying-pagerank-like-algorithm-to-stack-overflow-votes
- http://meta.stackexchange.com/questions/98141/ranking-users-similar-to-page-rank
- http://meta.stackexchange.com/questions/64938/doesnt-science-have-a-better-reputation-system-than-stack-overflow
- http://meta.stackexchange.com/questions/103735/modified-h-index-for-questions-and-answers

A Google rank like (engenvalue) rep metric for stack overflow that takes into account tags:

- if someone with high rep on a given tag upvotes you, you get a lot of rep on that tag
- take into account a new property of tags: people can upvote tags if they think a tag fits a question well. Votes of people with more rep on a tag have more weight.
- if you upvote a given person multiple times, each upvote has less effect on their rep

This should be implemented as an Stack Overflow http://stackapps.com/ and on GitHub for languages with either GitHub API or http://ghtorrent.org/

We could still have the current linear rep, but the overall ranking would be a nice complement. I wonder how much it would differ from linear rep.

- https://github.com/networkx/networkx Python, does a lot of other graph things
- https://github.com/louridas/pagerank C++
- https://github.com/dcadenas/rankable_graph Ruby
- https://github.com/dcadenas/pagerank/ Go, port of rankable_graph

StackApps:

- http://stackapps.com/questions/6520/skillrep-experiment-in-computing-a-skill-focused-reputation
- http://stackapps.com/questions/6298/stackrating-tracks-skill-of-stack-overflow-users

### Stack overflow question Google rank

Apply Google rank to stack overflow questions.

Consider question links only, simple stuff.

Hard part is getting the data. Possibilities:

- <http://neo4j.com/blog/import-10m-stack-overflow-questions/>

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
