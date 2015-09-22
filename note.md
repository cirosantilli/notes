# Note


Currently I am in the midst of learning x86 assembly for fun, I'm love microcontroller programming, so I'm familiar with assembly.

Currently I've been searching high and low for the answer to this question, but can't seem to find it...the DS register, I know it's supposed to point to the global data in my program, but I don't know how it works exactly. I'm using Nasm, and in most simple programs I see the following:

    [org 0x7C00]
    [bits 16]

    main:
    mov ax, 0x0000 ; (1)
    mov ds, ax     ; (2)
    mov al, [msg]
    mov ah, 0x0E
    mov bx, 0x0007
    int 0x10
    jmp $

    msg db 'X'

    times 510-($-$$) db 0
    dw 0xAA55

and that works perfectly (even if I omit lines (1) and (2) ), but how? Does the CPU automagically load the global variables starting at 0x0000? or is there something intrinsic here that I'm missing?Thanks for your time in advance!
