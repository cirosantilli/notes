Originally for <http://stackoverflow.com/questions/16703886/where-do-static-local-variables-go> until I read the question better.

GCC 4.8 implements static on ELF object files with the `STB_LOCAL` binding.

`static` does not seem to affect the segment the variable is on: it remains on the same segment as it would be if it were not `static`: be it `.data`, `.bss`, `.rodata`, etc.

**ELF spec**

`STB_LOCAL` is documented on the ELF spec at http://www.sco.com/developers/gabi/2003-12-17/ch4.symtab.html:

> STB_LOCAL Local symbols are not visible outside the object file containing their definition. Local symbols of the same name may exist in multiple files without interfering with each other

which makes it a perfect choice to represent `static`.

Variables without static are `STB_GLOBAL`, and the spec says:

> When the link editor combines several relocatable object files, it does not allow multiple definitions of STB_GLOBAL symbols with the same name. 

which is coherent with the link errors on multiple non static definitions.

**GCC test**

We can observe GCC by compiling:

    int i = 0
    static int i = 0;

and disassembling the symbol table with:

    readelf -s main.o

The output contains:

    Num:    Value          Size Type    Bind   Vis      Ndx Name
      5: 0000000000000004     4 OBJECT  LOCAL  DEFAULT    4 si
     10: 0000000000000000     4 OBJECT  GLOBAL DEFAULT    4 i

so the binding is the only significant difference between them.

`Value` is just their offset into the `.bss` section, so we expect it to differ.
