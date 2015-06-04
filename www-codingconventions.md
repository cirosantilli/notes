# wwwdocs PATCH Move part of gcc/README.Portability to codingconventions.html

This is mentioned as a FIXME under gcc/doc/sourcebuild.texi

I was not able to submit the patch with CVS (never used it before). At https://gcc.gnu.org/about.html#cvs it says:

> cvs -q -d :ext:username@gcc.gnu.org:/cvs/gcc checkout -P wwwdocs where username is your user name at gcc.gnu.org

but I could not find know how to obtain such username.

This is the diff -u:

--- htdocs/codingconventions.html    2014-07-09 02:03:05.000000000 +0200
+++ codingconventions2.html    2015-05-16 11:49:39.000000000 +0200
@@ -30,8 +30,13 @@
         <ul>
         <li><a href="#Assertions">Assertions</a></li>
         <li><a href="#Character">Character Testing</a></li>
+        <li><a href="#Empty_Macro_Arguments">Empty Macro Arguments</a></li>
         <li><a href="#Error">Error Node Testing</a></li>
+        <li><a href="#Free_NULL_Check">Free NULL Check</a></li>
+        <li><a href="#Long_Integer_Literal_Suffix">Long Integer Literal Suffix</a></li>
         <li><a href="#Generated">Parameters Affecting Generated Code</a></li>
+        <li><a href="#Parenthesis_Around_String_Initializers">Parenthesis Around String Initializers</a></li>
+        <li><a href="#Trigraphs">Trigraphs</a></li>
         <li><a href="#C_Inlining">Inlining Functions</a></li>
         </ul>
     </li>
@@ -708,6 +713,24 @@
 language accepted.</p>
 
 
+<h4><a name="Empty_Macro_Arguments">Empty Macro Arguments</a></h4>
+
+<p>ISO C (6.8.3 in the 1990 standard) specifies the following:</p>
+
+<blockquote>If (before argument substitution) any argument consists of no
+preprocessing tokens, the behavior is undefined.</blockquote>
+
+<p>This was relaxed by ISO C99, but some older compilers emit an error,
+so code like:</p>
+
+<blockquote><pre><code>
+#define foo(x, y) x y
+foo (bar, )
+</code></pre></blockquote>
+
+<p>needs to be coded in some other way.</p>
+
+
 <h4><a name="Error">Error Node Testing</a></h4>
 
 <p>Testing for <code>ERROR_MARK</code>s should be done by comparing
@@ -716,12 +739,67 @@
 href="https://gcc.gnu.org/ml/gcc-patches/2000-10/msg00792.html">message</a>.</p>
 
 
+<h4><a name="Free_NULL_Check">Free NULL Check</a></h4>
+
+<p>Don't check if a pointer is <code>NULL</code> before freeing it.</p>
+
+<p>Since SunOS 4 stopped being a reasonable portability target,
+(which happened around 2007) there has been no need to guard
+against <code>free (NULL)</code>.  Thus, any guard like the following
+constitutes a redundant test:</p>
+
+<blockquote><pre><code>
+if (P)
+  free (P);
+</code></pre></blockquote>
+
+<p>However, if your profiling exposes a test like this in a
+performance-critical loop, say where P is nearly always <code>NULL</code>, and
+the cost of calling free on a <code>NULL</code> pointer would be prohibitively
+high, consider using <code>__builtin_expect</code>, e.g., like this:</p>
+
+<blockquote><pre><code>
+if (__builtin_expect (ptr != NULL, 0))
+  free (ptr);
+</code></pre></blockquote>
+
+
+<h4><a name="Long_Integer_Literal_Suffix">Long Integer Literal Suffix</a></h4>
+
+<p>Never use lower case <code>l</code> since it can be confused
+with the number <code>1</code>.  Use upper case <code>L</code> instead.</p>
+
+
 <h4><a name="Generated">Parameters Affecting Generated Code</a></h4>
 
 <p>Internal numeric parameters that may affect generated code should
 be controlled by <code>--param</code> rather than being hardcoded.</p>
 
 
+<h4><a name="Parenthesis_Around_String_Initializers">Parenthesis Around String Initializers</a></h4>
+
+<p>Don't use parenthesis around string initializers.<p>
+
+<p>Irix6 <code>cc -n32</code> and OSF4 <code>cc</code> have problems with
+constant string initializers with parenthesis around it, e.g.:</p>
+
+<blockquote><pre><code>
+const char string[] = ("A string");
+</code></pre></blockquote>
+
+<p>This is unfortunate since this is what the GNU gettext macro <code>N_</code>
+produces.  You need to find a different way to code it.<p>
+
+<p>Some compilers like MSVC++ have fairly low limits on the maximum
+length of a string literal; 509 is the lowest we've come across.  You
+may need to break up a long printf statement into many smaller ones. </p>
+
+
+<h4><a name="Trigraphs">Trigraphs</a></h4>
+
+<p>Don't use trigraphs because some compilers do not accept them.<p>
+
+
 <h4><a name="C_Inlining">Inlining Functions</a></h4>
 
 <p>
