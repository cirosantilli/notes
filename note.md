# Note

**Minimal example that generates the error**

`main.S`: moves an *address* into `%eax` (32-bit):

    _start:
        mov $_start, %eax

`linker.ld`:

    SECTIONS
    {
        . = 0x100000000;
        .text :
        {
            *(*)
        }
    }

Compile on x86-64:

	as -o main.o main.S
	ld -o main.out -T linker.ld main.o

Outcome of `ld`:

    (.text+0x1): relocation truncated to fit: R_X86_64_32 against `.text'

Keep in mind that:

- `as` puts everything on the `.text` if no other section is specified
- `ld` uses the `.text` as the default entry point if `ENTRY`

How to fix it: use this `linker.ld` instead, and subtract 1 from the start:

    SECTIONS
    {
        . = 0xFFFFFFFF;
        .text :
        {
            *(*)
        }
    }

Note: we cannot make `_start` global in this example, otherwise it still fails. I think this happens because global symbols have alignment constraints (`0xFFFFFFFF` works).

Tested on Ubuntu 14.04, Binutils 2.24.

**Explanation**

First you must understand what relocation is with a minimal example: <http://stackoverflow.com/a/30507725/895245>

Next, take a look at `objdump -Sr main.o`:

    0000000000000000 <_start>:
       0:   b8 00 00 00 00          mov    $0x0,%eax
                            1: R_X86_64_32  .text

If we look into how instructions are encoded in the Intel manual, we see that:

- b8 says that this is a `mov` to `%eax`
- `0` is an immediate value to be moved to `%eax`

When moving to 32-bit registers, the immediate must also be 32-bit.

But here, the relocation has to modify those 32-bit to put the address of `_start` into them after linking happens.

`0x100000000` does not fit into 32-bit, but `0xFFFFFFFF` does. Thus the error.
