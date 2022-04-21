.MODEL small
.STACK 100h
.DATA
    mensagem DB 'Digite algo', 13, 10,'$'
    buffer BYTE  100 DUP(0)

.CODE
    mov ax,@data
    mov ds,ax

    mov     dx, OFFSET mensagem ; escreve uma frase na tela 
    mov     ah,9                ; a frase deve terminar com $
    int     21h                 ; funcao ah=9 da int 21h

    mov     ah, 01h   ; le um caracter do teclado (ah=01)
    int     21h       ; em al esta o caracter digitado
    

    mov     dl, al      ; valor a ser escrito em dl
    mov     ah,2        ; funcao ah = 02 da int 21
    int     21h         ; imprime um caracter do teclado 


    mov ah,4Ch
    int 21h
    ;http://spike.scu.edu.au/~barry/interrupts.html
END 