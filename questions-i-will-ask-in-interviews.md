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

Evil:

-   how many `char` types are there? Is `signed char` the same as `char`? Is `signed int` the same as `int`?

-   `assert(sizeof('a') == sizeof(int));` in C and C++? http://stackoverflow.com/questions/433895/why-are-c-character-literals-ints-instead-of-chars

## Java

- string pool and Integer pool
- constructors: the first line is magical, cannot self call...
- What is serializableUUID?
- internals
    - bytecode
    - memory

## x86

Why does `ESP` exist? Answer: allow debugger to find the current stack frame, `alloca` and VLA http://stackoverflow.com/questions/579262/what-is-the-purpose-of-the-ebp-frame-pointer-register
