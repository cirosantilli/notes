# What is the purpose of stage3 in GCC's bootstrap?

I understand that when you compile GCC it compiles the source with:

1. your system's GCC
2. the compiled compiler of step 1
3. the compiled compiler of step 1 again

as mentioned in https://gcc.gnu.org/onlinedocs/gccint/Makefile.html:

> This means that GCC is built three times—once with the native compiler, once with the native-built compiler it just built, and once with the compiler it built the second time.

and then compares compilation results for stages 2 and 3, for which the compiler should be almost the same, except for things like:

- `__TIME__` and `__DATE__` that could be present during the build
- non deterministic might make those tests harder: http://stackoverflow.com/questions/14653874/deterministic-binary-output-with-g

What is the purpose of comparing stages 2 and 3? How could those 2 stages possibly differ in a meaningful way? Of course, the system could break because of things like `__TIME__`, but isn't that too unlikely? Are ther eothe

The fact that the GCC output is 
