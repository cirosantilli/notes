# Questions I will ask in interviews

First give a book that covers all questions, and say about what you are going to ask.

Ask a lot of small questions. Deepen them as the candidate shows knowledge on a domain.

What matters is how deep he understands at least one of those domains: if he can do so, he can also do it for other domains as needed.

## C

-   <http://stackoverflow.com/questions/5481579/whats-the-difference-between-function-prototype-and-declaration>

    Why:

        int func();

        int func(float f) {
            printf("%f", f);
            return 0;
        }

    does not compile?

-   <http://stackoverflow.com/questions/1597405/what-happens-to-a-declared-uninitialized-variable-in-c-does-it-have-a-value>

-   how is switch implemented? How would you do it in C if you could use variables for `goto` labels? http://stackoverflow.com/questions/6805026/is-switch-faster-than-if

Evil:

-   how many `char` types are there? Is `signed char` the same as `char`? Is `signed int` the same as `int`?

-   `assert(sizeof('a') == sizeof(int));` in C and C++? http://stackoverflow.com/questions/433895/why-are-c-character-literals-ints-instead-of-chars

-   is NULL a pointer or an integer?

## C++

What are the `.*` and `->*` operators? http://stackoverflow.com/questions/1485983/calling-c-class-methods-via-a-function-pointer

## Java

-   string pool and Integer pool

        "ab" + "cd" == "abcd"
        "ab" == new String("ab")
        new Integer(1) == new Integer(1)
        new Integer(128) == new Integer(128)

-   constructors: the first line is magical, cannot self call...

-   What is serializableUUID?

-   internals

    -   bytecode

        -   why do we write:

                String.length() // method

            but:

                Array.length // field

        http://stackoverflow.com/questions/9297899/where-is-arrays-length-property-defined

        JLS and arraylength bytecode instruction

    -   memory

## x86

Why does `ESP` exist? Answer: allow debugger to find the current stack frame, `alloca` and VLA http://stackoverflow.com/questions/579262/what-is-the-purpose-of-the-ebp-frame-pointer-register

## Linux

-   how does the shebang work? Interpreter vs ELF executable? Can you make Jar files executable in Linux? http://stackoverflow.com/questions/1667830/running-a-jar-file-without-directly-calling-java

-   what system calls are likely called when you do *from Bash*, including the Bash part of:

        /usr/bin/echo a

    fork + exec + wait + write + exit
