# Section vs segment

http://stackoverflow.com/questions/14361248/whats-the-difference-of-section-and-segment-in-elf-file-format

**Theory**

-   sections live in object files (`.o` extension)

-   segments live in executable files (usually no extension)

    Executables can also contain sections, but that information is only useful for debugging: it can be stripped and it will still run just fine.

When you link multiple objects together to make an executable, sections get put into segments.

When Linux runs the executable, it reads segments (which are marked as allocatable) from the ELF file in the hard disk into RAM memory.

**Practice**

Russian showed the disassembly, now let me show the assembly :-)

The GNU Binutils linker uses a *linker script* that determines how sections are placed inside segments in, and many other properties of the executable output.

Linker scripts are documented at: http://sourceware.org/binutils/docs/ld/Scripts.html

You can currently used linker script with:

    ld --verbose

and set a custom one with the `-T` option.

OS development is a case where such scripts are useful in practice, [here is simple example](https://github.com/cirosantilli/x86-bare-metal-examples/blob/d217b180be4220a0b4a453f31275d38e697a99e0/linker.ld).

**Minimal Linux IA-32 example**

hello_world.S:

    /* mydata section, allocatable. */
    .section .mydata, "a"
        s:
            .ascii "hello world\n"
            len = . - s
    /* mytext section, allocatable and executable. */
    .section .mytext, "ax"
        .global _start
        _start:

            /* Write syscall. */
            mov $4, %eax
            mov $1, %ebx
            mov $s, %ecx
            mov $len, %edx
            int $0x80

            /* Exit syscall. */
            mov $1, %eax
            mov $0, %ebx
            int $0x80

We used weird section names to prevent the toolchain from automatically giving properties to certain sections, e.g. `.text` and `.data`: this way we can better control what is going on.

hello_world.ld:

    ENTRY(_start);
    SECTIONS
    {
        /*
        Set where the text segment will be loaded into memory by Linux.

        Linux segfaults us if the .text is too low.

        If this were not present, it would be 0, and that is too low and segfaults. See also:

        - http://stackoverflow.com/questions/2187484/why-is-the-elf-execution-entry-point-virtual-address-of-the-form-0x80xxxxx-and-n
        - http://stackoverflow.com/questions/2966426/why-do-virtual-memory-addresses-for-linux-binaries-start-at-0x8048000?lq=1
        */
        . = 0x400000;

        /* Text segment. */
        .mytextsegment :
        {
            /* Crump every `.text` section from every object file (`*`) into here. */
            *(.mytext)
        }

        . = 0x600000;
        .mydatasegment :
        {
            *(.mydata)
        }
    }

Compile and run:

    as --32 -o 'hello_world.o' 'hello_world.S'
    ld --gc-sections -m elf_i386 -o 'hello_world.out' -T hello_world.ld 'hello_world.o'
    ./hello_world

Output:

    hello world

Examine the sections of the object file:

    readelf -S hello_world.o

Output:

    There are 10 section headers, starting at offset 0xa4:

    Section Headers:
      [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
      [ 0]                   NULL            00000000 000000 000000 00      0   0  0
      [ 1] .text             PROGBITS        00000000 000034 000000 00  AX  0   0  1
      [ 2] .data             PROGBITS        00000000 000034 000000 00  WA  0   0  1
      [ 3] .bss              NOBITS          00000000 000034 000000 00  WA  0   0  1
      [ 4] .mydata           PROGBITS        00000000 000034 00000c 00   A  0   0  1
      [ 5] .mytext           PROGBITS        00000000 000040 000022 00  AX  0   0  1
      [ 6] .rel.mytext       REL             00000000 0002d4 000008 08      8   5  4
      [ 7] .shstrtab         STRTAB          00000000 000062 000040 00      0   0  1
      [ 8] .symtab           SYMTAB          00000000 000234 000090 10      9   8  4
      [ 9] .strtab           STRTAB          00000000 0002c4 00000e 00      0   0  1
    Key to Flags:
      W (write), A (alloc), X (execute), M (merge), S (strings)
      I (info), L (link order), G (group), T (TLS), E (exclude), x (unknown)
      O (extra OS processing required) o (OS specific), p (processor specific)

Note how `as` also added several sections which we did not explicitly create:

- `.text`, `.data` and `.bss` are usual segment names which we choose not to use. GAS seems to create them always, even if empty? TODO required by the standard?
- `.rel.mytext`, `.shstrtab`, `.symtab` and `.strtab` have special meanings defined by the ELF standard: <http://stackoverflow.com/a/30648229/895245>

Examine the segments of the executable:

    readelf -l hello_world.oout

Output:

    Elf file type is EXEC (Executable file)
    Entry point 0x400000
    There are 2 program headers, starting at offset 52

    Program Headers:
      Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
      LOAD           0x001000 0x00400000 0x00400000 0x00022 0x00022 R E 0x1000
      LOAD           0x002000 0x00600000 0x00600000 0x0000c 0x0000c RW  0x1000

     Section to Segment mapping:
      Segment Sections...
       00     .text
       01     .data

The `Program Headers:` part lists all the segments (each segment is specified by a program header): there are two.

`Section to Segment mapping:` then tells us that:

- segment 0 contains section `.text`
- segment 1 contains section `.data`

We can now play with the linker script and see what happens. E.g., if we had used instead:

    .text :
    {
        *(.text)
        *(.data)
    }

or:

    .text :
    {
        *(*)
    }

`readelf -l` would give:
