# C99 static

http://stackoverflow.com/questions/745870/realistic-usage-of-the-c99-restrict-keyword/30827311#30827311

The [Wikipedia example](https://en.wikipedia.org/wiki/Restrict) is *very* illuminating.

It clearly shows how **it allows to save one assembly instruction**.

Without restrict:

    void f(int *a, int *b, int *x) {
      *a += *x;
      *b += *x;
    }

Pseudo assembly:

    load R1 ← *x    ; Load the value of x pointer
    load R2 ← *a    ; Load the value of a pointer
    add R2 += R1    ; Perform Addition
    set R2 → *a     ; Update the value of a pointer
    ; Similarly for b, note that x is loaded twice,
    ; because a may be equal to x.
    load R1 ← *x
    load R2 ← *b
    add R2 += R1
    set R2 → *b

With restrict:

    void fr(int *restrict a, int *restrict b, int *restrict x);

Pseudo assembly:

    load R1 ← *x
    load R2 ← *a
    add R2 += R1
    set R2 → *a
    ; Note that x is not reloaded,
    ; because the compiler knows it is unchanged
    ; load R1 ← *x
    load R2 ← *b
    add R2 += R1
    set R2 → *b

**Does GCC really do it?**

GCC 4.8 Linux x86-64:

    gcc -g -std=c99 -O0 -c main.c
    objdump -S main.o

With `-O0`, they are the same.

With `-O3`:

    void f(int *a, int *b, int *x) {
        *a += *x;
       0:   8b 02                   mov    (%rdx),%eax
       2:   01 07                   add    %eax,(%rdi)
        *b += *x;
       4:   8b 02                   mov    (%rdx),%eax
       6:   01 06                   add    %eax,(%rsi)  
    
    void fr(int *restrict a, int *restrict b, int *restrict x) {
        *a += *x;
      10:   8b 02                   mov    (%rdx),%eax
      12:   01 07                   add    %eax,(%rdi)
        *b += *x;
      14:   01 06                   add    %eax,(%rsi) 

For the uninitiated, the [calling convention](https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI) is:

- `rdi` = first parameter
- `rsi` = second parameter
- `rdx` = third parameter

GCC output was even clearer than the wiki article: 4 instructions vs 3 instructions.

**Arrays**

So far we have single instruction savings, but if pointer represent arrays to be looped over, a common use case, then a bunch of instructions could be saved, as mentioned by [supercat](http://stackoverflow.com/questions/745870/realistic-usage-of-the-c99-restrict-keyword/30827311?noredirect=1#comment59424338_30827311).

Consider for example:

    void f(char *restrict p1, char *restrict p2) {
         for (int i = 0; i < 50; i++) {
             p1[i] = 4;
             p2[i] = 9;
         }
     }

Because of `restrict`, a smart compiler (or human), could optimize that to:

    memset(p1, 4, 50);
    memset(p2, 9, 50);

which is potentially much more efficient as it may be assembly optimized on a decent libc implementation (like glibc): http://stackoverflow.com/questions/4707012/c-memcpy-vs-stdcopy

**C99**

Let's look at the standard for completeness sake.

`restrict` says that two pointers cannot point to the same memory location. The most common usage is for function arguments.

This restricts how the function can be called, but allows for more compile-time optimizations.

If the caller does not follow the `restrict` contract, undefined behavior.

The [C99 N1256 draft](http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf) 6.7.3/7 "Type qualifiers" says:

> The intended use of the restrict qualifier (like the register storage class) is to promote optimization, and deleting all instances of the qualifier from all preprocessing translation units composing a conforming program does not change its meaning (i.e., observable behavior).

and 6.7.3.1 "Formal definition of restrict" gives the gory details.

**Strict aliasing rule**

The `restrict` keyword only affects pointers of compatible types (e.g. two `int*`) because the strict aliasing rules says that aliasing incompatible types is undefined behavior by default, and so compilers can assume it does not happen and optimize away.

See: http://stackoverflow.com/questions/98650/what-is-the-strict-aliasing-rule

**See also**

- C++14 does not yet have an analogue for `restrict`, but GCC has `__restrict__` as an extension: http://stackoverflow.com/questions/776283/what-does-the-restrict-keyword-mean-in-c
- Many questions that ask: according to the gory details, does this code UB or not?
    - http://stackoverflow.com/questions/12255686/understanding-restrict-qualifier-by-examples?rq=1
    - http://stackoverflow.com/questions/3800940/restricted-pointer-questions?rq=1
    - http://stackoverflow.com/questions/26567078/usage-of-restrict-keyword?rq=1
- A "when to use" question: http://stackoverflow.com/questions/832964/when-to-use-restrict-and-when-not-to?rq=1
- The related GCC `__attribute__((malloc))`, which says that the return value of a function is not aliased to anything: http://stackoverflow.com/questions/18485447/gcc-attribute-malloc
