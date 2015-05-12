# Job

- airbus http://www.airbusgroup.com/int/en/people-careers/jobs-and-applications/search-for-vacancies.html
- thaleo https://thales.taleo.net
- https://www.linkedin.com/edu/alumni?id=12398&facets=CN.13&keyword=&dateType=attended&startYear=&endYear=&incNoDates=true&start=0&count=10&filters=off&companyCount=3&functionCount=3&unadopted=false&trk=edu-cp-com-CC-title
- https://orange.jobs , https://orange.jobs/jobs/offer.do?joid=38154&lang=ENu
- soge: https://careers.stackoverflow.com/jobs/82079/software-craftswoman-craftsman-passionn%C3%A9-e-soci%C3%A9t%C3%A9-g%C3%A9n%C3%A9rale
- google
    Sylvain Le Gal https://www.linkedin.com/profile/view?id=5910344&authType=NAME_SEARCH&authToken=nxpR&locale=en_US&srchid=1851484281430811921767&srchindex=3&srchtotal=7&trk=vsrp_people_res_name&trkInfo=VSRPsearchId%3A1851484281430811921767%2CVSRPtargetId%3A5910344%2CVSRPcmpt%3Aprimary%2CVSRPnm%3A
    Marc Lacoste https://www.linkedin.com/profile/view?id=37844716&authType=NAME_SEARCH&authToken=l4ln&locale=fr_FR&srchid=1851484281430770512608&srchindex=8&srchtotal=34&trk=vsrp_people_res_name&trkInfo=VSRPsearchId%3A1851484281430770512608%2CVSRPtargetId%3A37844716%2CVSRPcmpt%3Aprimary%2CVSRPnm%3A
- CEA
    https://www.linkedin.com/profile/view?id=1196098&authType=NAME_SEARCH&authToken=q478&locale=en_US&srchid=1851484281430809876677&srchindex=1&srchtotal=9&trk=vsrp_people_res_name&trkInfo=VSRPsearchId%3A1851484281430809876677%2CVSRPtargetId%3A1196098%2CVSRPcmpt%3Aprimary%2CVSRPnm%3A
-   misys GPU
    - http://on-demand.gputechconf.com/gtc/2015/video/S5249.html
    - http://on-demand.gputechconf.com/gtc/2015/presentation/S5249-Bram-Leehouwers.pdf
    - https://www.linkedin.com/profile/view?id=171209770&goback=
    - http://www.gputechconf.com/

- http://www.scality.com/partners/

- processing

    - intel 100k

    - AMD 10k

    - nvidia 9k

        -   Cyril Zeller https://www.linkedin.com/profile/view?id=58195052&goback=

            Bonjour, je suis X09 informaticien, et j'ai très envie de travailler dans des applications low-level, proches du hardware et Linux, d'où mon intérêt pour NVIDIA. Avez vous d’opportunités pour les récemment diplômés?

        -   Olivier Marco https://www.linkedin.com/profile/view?id=21648320&authType=OUT_OF_NETWORK&authToken=9Nko

            Bonjour, je suis X09 informaticien, et j'ai très envie de travailler dans des technologies low-level, proches du hardware, et Linux, d'où mon intérêt pour NVIDIA. Je voudrais savoir votre impression sur NVIDIA, et en quoi consiste le travail en gros. -- Ciro

    -   https://en.wikipedia.org/wiki/Freescale_Semiconductor

    -   ARM 3k

        http://careers.peopleclick.com/careerscp/client_arm/external/jobDetails.do?functionName=getJobDetail&jobPostId=18940&localeCode=en-us

    -   Renesas Electronics

    -   https://en.wikipedia.org/wiki/Freescale_Semiconductor (motorola)

-   Networking

    -   Cisco 70k

    -   Qualcomm 31k

    -   Broadcom 10k

    -   QLogic 1k

-   distros

    redhat

-   Not for profits

    - https://en.wikipedia.org/wiki/Linaro

---

Problema na execução de sua solicitação...
SENHA BLOQUEADA. UTILIZE TERM BB (G805-897)  

MIS-8318-DUNM

---

I have checked it with two approaches for NASM: RTFS and empirical.

**RTFS**

Source at: http://repo.or.cz/w/nasm.git

Then:

    git grep -C2 tword

And we [fall upon](http://repo.or.cz/w/nasm.git/blob/3db63b96ecf79344b9c2618616e4be7c99720a18:/assemble.c#l266):

    switch (size) {
    case 1:
        return "byte";
    case 2:
        return "word";
    case 4:
        return "dword";
    case 8:
        return "qword";
    case 10:
        return "tword";
    case 16:
        return "oword";
    case 32:
        return "yword";
    case 64:
        return "zword";
    default:
        return "???";
    }

**Empirical**

`git log -p` and `git tag --contains` tell me that `zword` was added in 2.11, and since I'm on 2.10 and lazy, I'll omit that one.

On our `.asm` file:

    section .bss
    resb1 resb 1
    resw1 resw 1
    resq1 resq 1
    rest1 rest 1
    reso1 reso 1
    resy1 resy 1
    ; Just to read the objdump better.
    resb2 resb 1

Then compile and:

    objdump -D -j main.o

gives:

    00000000 <resb1>:
        ...

    00000001 <resw1>:
        ...

    00000003 <resd1>:
    3:	00 00                	add    %al,(%eax)
        ...

    00000007 <resq1>:
        ...

    0000000f <rest1>:
        ...

    00000019 <reso1>:
        ...

    00000029 <resy1>:
        ...

    00000049 <resb2>:
        ...

If we take the differences between each position, we reach the same conclusion as before.

**zword menemonic**

For the `ZMM` registers added by AVX-512: <https://en.wikipedia.org/wiki/AVX-512>

# String pool

## JLS

Relevant passage from [JLS 7 3.10.5](http://docs.oracle.com/javase/specs/jls/se7/html/jls-3.html#jls-3.10.5):

> Moreover, a string literal always refers to the same instance of class String. This is because string literals - or, more generally, strings that are the values of constant expressions (§15.28) - are "interned" so as to share unique instances, using the method String.intern.

A code example follows:

    package testPackage;
    class Test {
        public static void main(String[] args) {
            String hello = "Hello", lo = "lo";
            System.out.print((hello == "Hello") + " ");
            System.out.print((Other.hello == hello) + " ");
            System.out.print((other.Other.hello == hello) + " ");
            System.out.print((hello == ("Hel"+"lo")) + " ");
            System.out.print((hello == ("Hel"+lo)) + " ");
            System.out.println(hello == ("Hel"+lo).intern());
        }
    }
    class Other { static String hello = "Hello"; }

and the compilation unit:

    package other;
    public class Other { public static String hello = "Hello"; }

produces the output:

    true true true true false true

## Bytecode

It is also instructive to look at the bytecode implementation on OpenJDK 7.

[JVMS 7 5.1 says](https://docs.oracle.com/javase/specs/jvms/se7/html/jvms-5.html#jvms-5.1):

A string literal is a reference to an instance of class String, and is derived from a CONSTANT_String_info structure (§4.4.3) in the binary representation of a class or interface. The CONSTANT_String_info structure gives the sequence of Unicode code points constituting the string literal.

The Java programming language requires that identical string literals (that is, literals that contain the same sequence of code points) must refer to the same instance of class String (JLS §3.10.5). In addition, if the method String.intern is called on any string, the result is a reference to the same class instance that would be returned if that string appeared as a literal. Thus, the following expression must have the value true:

    ("a" + "b" + "c").intern() == "abc"

To derive a string literal, the Java Virtual Machine examines the sequence of code points given by the CONSTANT_String_info structure.

- If the method String.intern has previously been called on an instance of class String containing a sequence of Unicode code points identical to that given by the CONSTANT_String_info structure, then the result of string literal derivation is a reference to that same instance of class String.

- Otherwise, a new instance of class String is created containing the sequence of Unicode code points given by the CONSTANT_String_info structure; a reference to that class instance is the result of string literal derivation. Finally, the intern method of the new String instance is invoked.

ENDQUOTE

---

If we decompile:

    public class StringPool {
        public static void main(String[] args) {
            String a = "abc";
            String b = "abc";
            String c = new String("abc");
            System.out.println(a);
            System.out.println(b);
            System.out.println(a == c);
        }
    }

we have on the constant pool:

    #2 = String             #32            // abc
    [...]
    #32 = Utf8               abc

and `main`:

     0: ldc           #2                  // String abc
     2: astore_1
     3: ldc           #2                  // String abc
     5: astore_2
     6: new           #3                  // class java/lang/String
     9: dup
    10: ldc           #2                  // String abc
    12: invokespecial #4                  // Method java/lang/String."<init>":(Ljava/lang/String;)V
    15: astore_3
    16: getstatic     #5                  // Field java/lang/System.out:Ljava/io/PrintStream;
    19: aload_1
    20: invokevirtual #6                  // Method java/io/PrintStream.println:(Ljava/lang/String;)V
    23: getstatic     #5                  // Field java/lang/System.out:Ljava/io/PrintStream;
    26: aload_2
    27: invokevirtual #6                  // Method java/io/PrintStream.println:(Ljava/lang/String;)V
    30: getstatic     #5                  // Field java/lang/System.out:Ljava/io/PrintStream;
    33: aload_1
    34: aload_3
    35: if_acmpne     42
    38: iconst_1
    39: goto          43
    42: iconst_0
    43: invokevirtual #7                  // Method java/io/PrintStream.println:(Z)V

Note how:

- on `0` and `3` the same `ldc #2` constant is loaded (the literals)
- on `12` a new string instance is created (with `#2`) as argument

---

I'm trying to block Stack Overflow in China: replies and AMA

See: http://stackoverflow.com/users/895245/ciro-santilli-%E5%85%AD%E5%9B%9B%E4%BA%8B%E4%BB%B6-%E6%B3%95%E8%BD%AE%E5%8A%9F

Continuation to: http://v2ex.com/t/182766

Please ping me on Twitter so I can reply next time. Found this with Google Analytics :-)

China is my favorite country in the world, I want you to be even freer and richer than you are today. I don't want any violence.

I'm Brazilian and work in France. My GF is Chinese, she and her mother do (that religion). I don't believe in it at all, but I do believe in freedom of religion and speech.

> 上看到一个丧心病狂的程序员

@lrz0lrz @yuelang85 @nikolai If someone puts your mother in law in jail without trial, and threatens to do the same to your girlfriend for something you think is unjust, wouldn't you also become "丧心病狂"?

> 知道so的还不会翻墙？

@dorentus @phpcxy @letv True, good programmers will definitely be able to climb the wall. But every action we take is statistical: this gives you more trouble, hurts search engines, hurts newbs more, and makes you develop better wall climbing methods.

> 帝国主义果然亡我之心不死啊

@cloudhunter @GeBron Reactionary forces "反动势力" and Imperialism "帝国主义" made me laugh. Are you being ironic? They are pure communist anti-foreign rhetoric that mean nothing is that it?

If not: I'm Brazilian. We've been exploited by the Portuguese, then British, then American. Do you really think I'm an imperialist? I think I'm more left-wing than you are.

> http://program-think.blogspot.com/ 这是他的博客，部分观点比较激进

@chengzhoukun nice link! http://program-think.blogspot.com/ I may add it to my list: https://github.com/cirosantilli/china-dictatorship

> Is this guy so famous?

@secondwtq @KentY unfortunately, I'm not famous, and my rep is low. But always trying to get more rep with good answers.

> 前几天就见过这名字，当时以为是冥晦网派出来的 spammer

@zhengkai I'm a political spammer. I am for freedom of **all** religions, and freedom of speech of **all** countries. I don't believe in (that religion).

If you think I work for (that religion), I can also accuse you of working for your government, and neither of us can prove otherwise.

> 这人我最近经常看见..我一直以为是中国人来着.. 看来我和他的交集蛮大的..

@rianq maybe some day we can work together!

> 可惜SOF支持https……

@wdlth ah, that makes it harder is that so? I know nothing about networking.

> 好可愛！

@Elethom thanks?!

@keeeeymann @mimzy Perapera I did not manage to translate what you've said, if you write in English I may reply

All best to all!

@14 @Elethom @GeBron @GuangXiN @KentY @andrewpsy @andybest @anjianshi @arkilis @chengzhoukun @cjyang1128 @cloudhunter @dorentus @keeeeymann @letv @lrz0lrz @mimzy @nikolai @phpcxy @reeco @riaqn @rwalle @secondwtq @stupidcat @wenLiangcan @wdlth @yuelang85 @zhengkai  https://github.com/cirosantilli/chat/issues/4




See: http://stackoverflow.com/users/895245/ciro-santilli-%E5%85%AD%E5%9B%9B%E4%BA%8B%E4%BB%B6-%E6%B3%95%E8%BD%AE%E5%8A%9F

Continuation to: http://v2ex.com/t/182766

I can't reply there, it requires rep... please answer here instead.

Please ping me on Twitter so I can reply next time. Found this with Google Analytics :-)

China is my favorite country in the world, I want you to be even freer and richer than you are today. I don't want any violence.

I'm Brazilian and work in France. My GF is Chinese, she and her mother do (that religion). I don't believe in it at all, but I do believe in freedom of religion and speech.

> 上看到一个丧心病狂的程序员

lrz0lrz yuelang85 nikolai If someone puts your mother in law in jail without trial, and threatens to do the same to your girlfriend for something you think is unjust, wouldn't you also become "丧心病狂"?

> 知道so的还不会翻墙？

dorentus phpcxy letv True, good programmers will definitely be able to climb the wall. But every action we take is statistical: this gives you more trouble, hurts search engines, hurts newbs more, and makes you develop better wall climbing methods.

> 帝国主义果然亡我之心不死啊

cloudhunter GeBron Reactionary forces "反动势力" and Imperialism "帝国主义" made me laugh. Are you being ironic? They are pure communist anti-foreign rhetoric that mean nothing is that it?

If not: I'm Brazilian. We've been exploited by the Portuguese, then British, then American. Do you really think I'm an imperialist? I think I'm more left-wing than you are.

> http://program-think.blogspot.com/ 这是他的博客，部分观点比较激进

chengzhoukun nice link! http://program-think.blogspot.com/ I may add it to my list: https://github.com/cirosantilli/china-dictatorship

> Is this guy so famous?

secondwtq KentY unfortunately, I'm not famous, and my rep is low. But always trying to get more rep with good answers.

> 前几天就见过这名字，当时以为是冥晦网派出来的 spammer

zhengkai I'm a political spammer. I am for freedom of **all** religions, and freedom of speech of **all** countries. I don't believe in (that religion).

If you think I work for (that religion), I can also accuse you of working for your government, and neither of us can prove otherwise.

> 这人我最近经常看见..我一直以为是中国人来着.. 看来我和他的交集蛮大的..

rianq maybe some day we can work together!

> 可惜SOF支持https……

wdlth ah, that makes it harder is that so? I know nothing about networking.

> 好可愛！

Elethom thanks?!

keeeeymann mimzy Perapera I did not manage to translate what you've said, if you write in English I may reply

All best to all!



## SO prevent garbage collection

The best way is to use [Unsafe](http://stackoverflow.com/questions/16819234/where-is-sun-misc-unsafe-documented), although `ByteBuffer` might be a possible workaround for some cases.

Also search for the keyword `off-heap` memory, 

**Unsafe**

Advantages over `ByteBuffer`:

- allows objects to be represented directly, without for serialization and thus faster
- no bounds checking, so faster
- explicit deallocation control
- can allocate more than the JVM limit

It is not however easy to get working. The method is described in the following articles:

- <http://mishadoff.com/blog/java-magic-part-4-sun-dot-misc-dot-unsafe/>
- <https://highlyscalable.wordpress.com/2012/02/02/direct-memory-access-in-java/>
- <http://java.dzone.com/articles/understanding-sunmiscunsafe>

They all consist of the following steps:

-   we need a `sizeof` operator, which Unsafe does not have. How to make one was asked at: <http://stackoverflow.com/questions/52353/in-java-what-is-the-best-way-to-determine-the-size-of-an-object>. The best options is likely the `instrument` API, but that requires you to create a Jar and use special command line options...

-   once we have `sizeof`, allocate enough memory with `Unsafe#allocateMemory`, which is basically a `malloc` and returns an address

-   create a regular on heap object, copy it to the allocated memory with `Unsafe#copyMemory`. To do this, you need to the address of the on-heap object, and the size of the object

-   set an `Object` to point to the allocated memory, then cast the `Object` to your class.

    It does not seem possible to set the address of a variable directly with Unsafe, so we need to wrap the object into an array or wrapper object, and use `Unsafe#arrayBaseOffset` or `Unsafe#objectFieldOffset`.

-   once you are done, free the allocated memory with `freeMemory`

If I ever get this to not segfault I will post an example :-)

**ByteBuffer**

Advantages over Unsafe:

- stable across Java versions while Unsafe may break
- does bound checking, so safer than... Unsafe, which allows for memory leaks and SIGSEGV

[JLS says](http://docs.oracle.com/javase/7/docs/api/java/nio/ByteBuffer.html):

> The contents of direct buffers may reside outside of the normal garbage-collected heap.

Example of usage with primitives:


    ByteBuffer bb = ByteBuffer.allocateDirect(8);

    bb.putInt(0, 1);
    bb.putInt(4, 2);
    assert bb.getInt(0) == 1;
    assert bb.getInt(4) == 2;

    // Bound chekcs are done.
    boolean fail = false;
    try {
        bb.getInt(8);
    } catch(IndexOutOfBoundsException e) {
        fail = true;
    }
    assert fail;

http://www.quora.com/How-does-BigMemory-hide-objects-from-the-Java-garbage-collector

Bonjour, je suis X09 informaticien. J'ai vu le job posting Consultant junior en Sécurité @https://orange.jobs/jobs/offer.do?joid=38154&lang=ENu Si vouz avez de lien avec cette équipe, j'aimerais bien savoir un peu comment c'est le job. Mon mail perso: ciro.santilli@gmail.com -- Ciro

Bonjour Bram,

I promise that this will be my last spam to you :-)

What kind of things do you expect candidates to learn for the GP-GPU job we were going to interview for?

Guessing from http://on-demand.gputechconf.com/gtc/2015/presentation/S5249-Bram-Leehouwers.pdf , I suppose Groovy, Open CL, Java Bytecode and Parsing ?

Quite honestly, of those I only know Java bytecode, but GPU and parsing are subjects that interest me a lot.

Do you have recommendations of books or other sources on how to learn those subjects to the level you search? Or more generally, how to get into the domain GPU? I am also interested in anything that can be labeled "HPC"

Obviously, I hereby sign a NDA that I will not disclose anything you tell me.

I have been fired from my previous job since the interview. Of course, I started searching a new job in the first place because I felt the situation was bad. I explain exactly what happened at: http://www.cirosantilli.com/

Cheers
