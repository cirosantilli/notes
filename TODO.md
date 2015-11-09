# TODO

-   GDB QEMU SMP

-   how to start SMP in Intel

    -   ask SMP possible with 16-bit real mode

-   minimize OpenGL offscreen example

-   make segmentation base offset work and answer: <http://stackoverflow.com/questions/3819699/what-does-ds40207a-mean-in-assembly>, link to http://stackoverflow.com/questions/4119504/real-mode-memory-addressing-explanation/33581044#33581044

-   how to run UEFI hello world?

-   PIT 32-bit

-   http://stackoverflow.com/questions/15275059/whats-the-purpose-of-x86-cr0-wp-bit

-   http://stackoverflow.com/questions/14361248/whats-the-difference-of-section-and-segment-in-elf-file-format

-   http://stackoverflow.com/questions/11247098/how-to-put-2-sections-in-1-segment-using-ld-scripts?rq=1

    http://stackoverflow.com/questions/7863200/why-data-and-stack-segments-are-executable?rq=1

    http://stackoverflow.com/questions/11884630/segments-within-a-executable-c-program?rq=1

    http://stackoverflow.com/questions/7863200/why-data-and-stack-segments-are-executable?rq=1

-   contact archiv.org, tell them to add article issues

-   https://reverseengineering.stackexchange.com/questions/5/how-are-x86-cpu-instructions-encoded

-   lea 8 and 16 bit

    http://stackoverflow.com/questions/2716142/80x86-16-bit-asm-lea-cx-cx8cx-causes-error-on-nasm-compiling-com-file

    http://stackoverflow.com/questions/8290865/asm-compile-issue

    http://stackoverflow.com/questions/8290987/asm-error-message-rax-edx-4-is-not-a-valid-base-index-expression

-   http://stackoverflow.com/questions/2030366/what-do-the-brackets-mean-in-x86-asm answer with general form s:[a + b*c + d]

    http://stackoverflow.com/questions/10362511/basic-use-of-immediates-square-brackets-in-x86-assembly-and-yasm?lq=1

-   list functions GDB python walk

    - gdb python my tree walk improvement on stack overflow answer

-   http://superuser.com/questions/130955/how-to-install-grub-into-an-img-file

    http://unix.stackexchange.com/questions/163791/place-grub-on-virtual-disk

    http://askubuntu.com/questions/180023/can-i-install-grub-on-an-usb-and-make-it-a-rescue-disk

    http://askubuntu.com/questions/152535/why-cant-i-install-grub-on-my-usb-drive

    https://wiki.archlinux.org/index.php/GRUB#Install_to_external_USB_stick

    -   http://askubuntu.com/questions/10571/how-to-install-grub-on-usb-flash-drive reply comment there

-   implement nslookup with posix

    http://stackoverflow.com/questions/2157592/how-does-getaddrinfo-do-dns-lookup which system call?

-   http://stackoverflow.com/questions/8878716/what-is-the-difference-between-hardware-and-software-breakpoints

    - create hardware breakpoints manually
    - example of hardware and software breakpoints (ptrace and hardware in assembly)
    - cpuinfo that enables hardware

- libcc1 example

- https://breaz.io/

- PR gas doc .data vs .section

-   Answer with minimal examples:

    http://stackoverflow.com/questions/4690300/how-to-make-an-bootable-isonot-cd-or-flash-drive-for-testing-your-own-boot-loa?rq=1

    http://stackoverflow.com/questions/14432260/where-is-the-os-stored-on-disk-and-how-does-the-boot-loader-locate-it?rq=1

    http://stackoverflow.com/questions/24692797/how-does-a-bootstrap-program-do-dual-booting-of-os?rq=1

    http://stackoverflow.com/questions/2058690/what-is-significance-of-memory-at-00007c00-to-booting-sequence?rq=1

    http://stackoverflow.com/questions/3743134/where-is-there-good-information-about-low-level-pc-booting?rq=1


## Kernel

-   http://unix.stackexchange.com/questions/145557/how-does-stack-allocation-work-in-linux

        mm/fault.c:
            do_page_fault
            __do_page_fault
        mm/mmap.c:
            expand_stack.c
            expand_downwards
            acct_stack_growth

                if (actual_size > READ_ONCE(rlim[RLIMIT_STACK].rlim_cur))
                    return -ENOMEM;

http://superuser.com/questions/294681/how-does-a-computer-restart-itself

### Pings

Friday:

-   https://sourceware.org/ml/gdb-patches/2015-07/threads.html#00932 Testsuite docs: explain ptrace_scope and core_pattern requirements

    Add latest prelink.

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

- GDB multi-thread

-   movabs instruction encoding

    - http://reverseengineering.stackexchange.com/questions/2627/what-is-the-meaning-of-movabs-in-gas-x86-att-syntax
    - http://stackoverflow.com/questions/19415184/load-from-a-64-bit-address-into-other-register-than-rax
    - http://stackoverflow.com/questions/4182210/x86-64-assembly

## GDB

-   packet reply is too long kernel debugging https://sourceware.org/bugzilla/show_bug.cgi?id=13984#add_comment

-   don't run <https://sourceware.org/bugzilla/show_bug.cgi?id=18704>

## C++

http://comments.gmane.org/gmane.comp.gcc.help/38052

## Java

- java remove from list

#### Some day

-   Ask why ignoring can lead to errors. Link to <http://stackoverflow.com/questions/1654923/in-the-13-years-that-java-has-been-around-are-there-any-specific-examples-of-ba> in the process

-   <http://stackoverflow.com/questions/313584/what-is-the-concept-of-erasure-in-generics-in-java>, <http://stackoverflow.com/questions/339699/java-generics-type-erasure-when-and-what-happens?lq=1>

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
