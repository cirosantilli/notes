# TODO

## http:// stackoverflow.com/questions/2841762/why-wont-extern-link-to-a-static-variable

Let's interpret the [C99 N1256 standard draft](http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf) to answer the question.

First some clarifications:

- each file does compile (`gcc -c`), the problem is that when linking all the compiled object files (`.o`) together the symbol is not defined
- it it not a question of scope (= where identifiers are visible), but rather linkage (what data does each identifier point to) and the *number of definitions* (there must be exactly one external definition for each external linkage identifier)

Summary:

- each identifier with external linkage must have exactly one definition with external linkage (6.9/5) **TODO**: I cannot find the "with external definition quote" part.
- `extern int n;` has external linkage (6.2.2/4), but is not a definition, only a declaration (nowhere is it said)
- `static int n;` has internal linkage (6.2.2/3)
- `int n;` has external linkage (6.2.2/5) and is a definition (6.9.2/2)

So with `static int n` there would be 0 external definitions for `extern int n` (which is not itself a definition). With `int n;`

**6.2.2/3 "Linkage of identifiers"**:

> If the declaration of a file scope identifier for an object or a function contains the storage- class specifier static, the identifier has internal linkage.

"Object" is basically variable in the standard (as opposed to a function). 

**6.2.2/4**:

> For an identifier declared with the storage-class specifier `extern` [...] If no prior declaration is visible, or if the prior declaration specifies no linkage, then the identifier has external linkage.

We suppose here that there was no previous declaration, e.g.:

    static int i;
    extern int i;

**6.2.2/5**:

> If the declaration of an identifier for an object has file scope and no storage-class specifier, its linkage is external.

**6.9/5 "External definitions"**:

> An external definition is an external declaration that is also a definition of a function (other than an inline definition) or an object. If an identifier declared with external linkage is used in an expression (other than as part of the operand of a sizeof operator whose result is an integer constant), somewhere in the entire program there shall be exactly one external definition for the identifier; otherwise, there shall be no more than
one.

where an "external declaration" is a file-scope declaration.

**6.9.2/2 External object definitions"**:

> A declaration of an identifier for an object that has file scope without an initializer, and without a storage-class specifier or with the storage-class specifier static, constitutes a tentative definition. If a translation unit contains one or more tentative definitions for an identifier, and the translation unit contains no external definition for that identifier, then
the behavior is exactly as if the translation unit contains a file scope declaration of that identifier, with the composite type as of the end of the translation unit, with an initializer equal to 0.

Translation unit is a basically a file.

`int n;` does not have a storage-class specifier, so the tentative definition applies. `extern int n` does have the `extern` storage-class specifier, so it is not a definition.
