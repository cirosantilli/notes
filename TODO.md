# TODO

-   create an `x86-bare-metal-examples` repo on GitHub. Add the following examples:

    - minimal
    - hello world
    - shutdown

-   how to mount a dump of `dd /dev/sda`? No better solution than `offset`: <https://major.io/2010/12/14/mounting-a-raw-partition-file-made-with-dd-or-dd_rescue-in-linux/> Update `# loop` in Linux cheat.

-   what is a `+` sign on the output of `ls -l`? E.g.: `ls -l /dev/sr0`?

-   fdisk what is `boot` column? What is boot partition? Can it not be the first one?

-   http://stackoverflow.com/questions/20099235/who-is-the-user-with-the-longest-streak-on-github/27742165?noredirect=1#comment52117777_27742165

-   http://stackoverflow.com/questions/22054578/run-a-program-without-an-operating-system

-   list functions GDB python walk

-   trustinsoft

-   http://stackoverflow.com/questions/8878716/what-is-the-difference-between-hardware-and-software-breakpoints

    - create hardware breakpoints manually
    - example of hardware and software breakpoints (ptrace and hardware in assembly)
    - cpuinfo that enables hardware

- bare metal x86

- play with ARM cross compile

- libisl example

- libcc1 example

- gdb python my tree walk improvement

- https://breaz.io/

- PR gas doc .data vs .section

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

- https://github.com/scality/RestBlockDriver

## Pings

Friday:

-   https://sourceware.org/ml/gdb-patches/2015-07/threads.html#00932 Testsuite docs: explain ptrace_scope and core_pattern requirements

    Add latest prelink.

-   http://www.spinics.net/lists/linux-newbie/ make config

## GCC

-   http://stackoverflow.com/questions/10483544/stopping-at-the-first-machine-code-instruction-in-gdb

    Use actual kernel RIP as starting point.

-   http://stackoverflow.com/questions/4060565/how-to-script-gdb-with-python-example-add-breakpoints-run-what-breakpoint-d

    http://stackoverflow.com/questions/14698086/gdb-python-scripting-any-samples-iterating-through-c-c-struct-fields

    http://stackoverflow.com/questions/764382/how-to-print-the-next-n-executed-lines-automatically-in-gdb?lq=1

    http://stackoverflow.com/questions/763891/print-complete-control-flow-through-gdb-including-values-of-variables?lq=1

    http://stackoverflow.com/questions/6517423/do-specific-action-when-certain-breakpoint-hits-in-gdb

    http://stackoverflow.com/questions/13935443/gdb-scripting-execute-commands-at-selected-breakpoint?lq=1

    http://stackoverflow.com/questions/17893554/printing-current-line-of-source-at-breakpoint-in-gdb

    http://stackoverflow.com/questions/30013252/get-all-global-variables-local-variables-in-gdbs-python-interface

    http://stackoverflow.com/questions/30443227/in-the-gdb-debugger-is-it-possible-to-get-the-function-to-source-file-mapping

    http://stackoverflow.com/questions/14031930/break-on-instruction-with-specific-opcode-in-gdb

    Function calls

    -   http://stackoverflow.com/questions/311840/tool-to-trace-local-function-calls-in-linux?lq=1

    -   http://stackoverflow.com/questions/9549693/gdb-list-of-all-function-calls-made-in-an-application

    -   http://stackoverflow.com/questions/311948/make-gdb-print-control-flow-of-functions-as-they-are-called

    http://stackoverflow.com/questions/5480868/how-to-call-assembly-in-gdb

    http://stackoverflow.com/questions/17522307/getting-the-addresses-of-all-currently-used-variables-with-gdb?rq=1 consider .so variables

-   http://stackoverflow.com/questions/7346929/why-do-we-use-builtin-expect-when-a-straightforward-way-is-to-use-if-else

-   arithmetic simplifications: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=30475

    TODO find a "x + 10 > x" SO question I've seen once

    i = time % 10;
    if (i == 11)

-   Builtin function stuff

    -   http://stackoverflow.com/questions/21106801/why-is-memcmp-so-much-faster-than-a-for-loop-check http://stackoverflow.com/questions/20734934/why-is-strcmp-so-much-faster-than-my-function

    -   http://stackoverflow.com/questions/2049412/do-math-functions-of-constant-expressions-get-pre-calculated-at-compile-time

    -   http://stackoverflow.com/questions/30340787/undefined-reference-to-pow-when-the-exponent-is-changed?lq=1

    -   http://stackoverflow.com/questions/9920789/literal-constant-vs-variable-in-math-library

    -   gcc memcmp http://stackoverflow.com/questions/855895/intrinsic-memcmp/6334452#6334452

    - http://stackoverflow.com/questions/2284860/how-does-c-compute-sin-and-other-math-functions

-   http://stackoverflow.com/questions/14067547/how-switch-case-statement-implemented-or-works-internally

- http://stackoverflow.com/questions/8841865/how-does-gcc-optimize-a-simple-loop answer with intermediate optimization pass steps

-   GCC read source of `-fomit-frame-pointer` and answer <http://stackoverflow.com/questions/14666665/trying-to-understand-gcc-option-fomit-frame-pointer>

-   how malloc works

    http://stackoverflow.com/questions/1119134/how-do-malloc-and-free-work

    http://www.quora.com/How-do-the-brk-and-mmap-system-calls-work-in-the-Linux-kernel interpreting glibc

- gcc custom glibc answer

- GDB multi-thread

- VLA overhead <http://stackoverflow.com/questions/18848537/can-a-const-variable-be-used-to-declare-the-size-of-an-array-in-c/30312817#comment48721475_30312817> <http://stackoverflow.com/questions/2034712/overhead-of-using-variable-length-arrays>

-   x86 instruction encoding

    - LEA http://stackoverflo.com/questions/1658294/whats-the-purpose-of-the-lea-instruction explain why different from MOV on encoding level
    - http://reverseengineering.stackexchange.com/questions/2627/what-is-the-meaning-of-movabs-in-gas-x86-att-syntax
    - http://stackoverflow.com/questions/19415184/load-from-a-64-bit-address-into-other-register-than-rax
    - http://stackoverflow.com/questions/4182210/x86-64-assembly
    - The reason why GCC uses a different name is likely linked to an encoding deviation in that case from the 32 bit. Understand what exactly.

## C++

http://comments.gmane.org/gmane.comp.gcc.help/38052

## Java

- java remove from list

#### Some day

-   Ask why ignoring can lead to errors. Link to <http://stackoverflow.com/questions/1654923/in-the-13-years-that-java-has-been-around-are-there-any-specific-examples-of-ba> in the process

-   <http://stackoverflow.com/questions/313584/what-is-the-concept-of-erasure-in-generics-in-java>, <http://stackoverflow.com/questions/339699/java-generics-type-erasure-when-and-what-happens?lq=1>

### Read

- <http://research.microsoft.com/en-us/people/mickens/thenightwatch.pdf>
- <http://www.softpanorama.org/index.shtml>, in particular Linux vs Solaris and the creator.

### C

### Java

- weak reference
- JMM http://zeroturnaround.com/rebellabs/concurrency-torture-testing-your-code-within-the-java-memory-model/

### Hardware

- http://stackoverflow.com/questions/3928995/how-do-cache-lines-work
- http://en.wikipedia.org/wiki/Branch_predictor

### Eclipse

- Eclim redo with count
- multiple shortcuts per action
- EGit issue: turn off blame should be the same as turn it on!
- debug go to breakpoint after the first one
- Vrapper very magic search
- add word under cursor to dictionary

### Vim

### Git

- automatically set upstream on new branches to be the same as to the current branch
- understand `autosetuprebase`

### Misc

- Krusader: focus second item (not the `..`) by default if one exists. Amazing when there is a single directory inside a directory.
- Guake rename tab not working

1.9, 2.1, 2.3, 9.5, 9.6, 9.7, 11, 11.2, 11.6
