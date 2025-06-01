// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

(LOOP)
    @8192
    D=A
    @i
    M=D

    @j
    M=0

    @24576
    D=M
    
    @CLEAN_SCREEN
    D;JEQ

    (FILL_SCREEN)
        @i
        D=M
        @LOOP
        D;JEQ

        @j
        D=M

        @SCREEN
        A=D+A
        M=-1
        // i--
        @i 
        M=M-1
        @j 
        M=M+1
        @FILL_SCREEN
        0;JMP


    (CLEAN_SCREEN)
        @i
        D=M
        @LOOP
        D;JEQ

        @j
        D=M

        @SCREEN
        A=D+A
        M=0
        // i--
        @i 
        M=M-1
        @j 
        M=M+1
        @CLEAN_SCREEN
        0;JMP

