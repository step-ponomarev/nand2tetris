// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

//прочитать символ
// если 0, то установить пиксель для записи в 0
// если не 0, то устанавливаем 1

// от 255 до 0 //строки
// от 512 до 0 //столбцы
    
@255
D=A
@rows
M=D

@512
D=A
@columns
M=D

@color
M=0

(LOOP)
//--SELECT-COLOR---
@KBD
D=M

@WHITE
D;JEQ

(BLACK)
@color
M=1

@DRAW
0;JMP

(WHITE)
@color
M=0
//--SELECT-COLOR---

(DRAW)
//---init-row
@rows
D=M-1
@row
M=D
//---init-row

@SCREEN
D=A

@offset
M=D

(ROWS)
//---init-columnb
@columns
D=M-1
@column
M=D
//---init-columnb

(COLUMNS)

//---FILL PIXEl---
@color
D=M

@offset
A=M
M=D
//---FILL PIXEl---

@offset
M=M+1

@column
M=M-1

@COLUMNS
M;JNE

@row
M=M-1

@ROWS
M;JNE


@LOOP
0;JMP

(END)

@SCREEN
D=A

@offset
M=D

(LOOP)
@offset
A=M
M=1

@offset
M=M+1
@LOOP
0;JMP