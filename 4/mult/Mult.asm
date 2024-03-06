// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
@i
M=0

@R2
M=0

(LOOP)
// ----- CHECK IF END ------
@i
D=M

@R1
D=M-D

@END // if i - R1 == 0 --> finish
D;JEQ
// ----- CHECK IF END ------

// ----- SUM -------
@R2
D=M //M[A], A=R2

@R0
D=M

@R2
M=M+D
// ----- SUM -------

@i
M=M+1 //M[A] = M[A] + 1

@LOOP
0;JMP

(END)