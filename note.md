# Note

We are renting a 2 room 45 m2 apartment at Rue de Lappe close the metro Bastille, ideal for 2 people. Dates from 14 December to 12 January, with some flexibility. Daily price: 60 Euros.

http://stackoverflow.com/questions/4584089/assembler-push-pop-registers

**Where is it pushed on?**

`esp - 4`:

- `esp` gets subtracted by 4
- the value is pushed to esp

Pop reverses this.

Minimal example:

    .data
        val1:
            .long 1
        val2:
            .long 2

    .text

        mov $val2, %esp
        mov $3, %eax

        push %eax
        /*
        %esp == $val1
        val1 == $3
        */

        pop %ebx
        /*
        %esp == $val2
        %ebx == $3
        */

Above [with assertions](https://github.com/cirosantilli/assembly-cheat/blob/55fc1d796faed893f474155756375052abbb0ee5/ia-32/gas/push.S).

**Why is this needed?**

Try coding a lot of assembly by hand.

A major problem is to decide where each variable will be stored.

Ideally, all variables would fit into registers, which is the fastest memory to access.

But of course, we can easily have more variables than registers, so the only solution is to write to memory.

We could write to any memory address, but since the local variables and arguments of function calls and returns fit into a nice stack pattern, which prevents [memory fragmentation](https://en.wikipedia.org/wiki/Fragmentation_%28computing%29), that is the best way to deal with it.

So processors give us instructions to automate the process a bit.

And we let compilers optimize the register allocation for us, since that is NP complete, and one of the hardest parts of writing a compiler. This problem is called [register allocation](https://en.wikipedia.org/wiki/Register_allocation), and it is isomorphic to [graph coloring](https://en.wikipedia.org/wiki/Graph_coloring).

**Does this boil down to a single processor instruction or is it more complex?**

All we know for sure is that Intel documents a `push` and `pop` instruction, so they are one instruction.

Of course, we can guess that internally it will be expanded to multiple microcodes, at least one to modify `esp` and one to do the memory IO, and will take multiple cycles.

But this is all un / under documented:

- http://stackoverflow.com/questions/4366837/what-is-intel-microcode
- http://security.stackexchange.com/questions/29730/processor-microcode-manipulation-to-change-opcodes
- http://stackoverflow.com/questions/692718/how-many-cpu-cycles-are-needed-for-each-assembly-instruction


