.MODEL small
.STACK 100h
.DATA
    mensagem DB 'Digite algo', 13, 10,'$'
    buffer BYTE  100 DUP(0)

.CODE
    mov ax,@data
    mov ds,ax

             ; funcao ah=9 da int 21h

    ; primerio tipo de acesso a um vetor
    ; usando lea
    lea     bx, offset mensagem
    mov     BYTE ptr [bx], 'd'   ; a diretiva BYTE é usando por ser um vetor de BYTES

    mov     dx, bx ; escreve uma frase na tela 
    mov     ah,9                ; a frase deve terminar com $
    int     21h     

    ; usando lea
    MOV     bx, offset mensagem
    mov     BYTE ptr [bx], 'd'
    mov     di, 2
    mov     BYTE ptr [bx + di], 'G'
    mov     si, 3
    mov     BYTE ptr [bx + si], 'I'

    mov     dx, bx ; escreve uma frase na tela 
    mov     ah,9                ; a frase deve terminar com $
    int     21h     

; usando o nome da variavel mais um indice em [] para acesso do valor
    sub     bx,bx
    ;
    mov     al, 'F'
    mov     mensagem[bx], al   
    mov     si, 8
    mov     mensagem[si], 'G'

    mov     dx, offset mensagem
    mov     ah,9                ; a frase deve terminar com $
    int     21h     


    mov ah,4Ch
    int 21h
    ;http://spike.scu.edu.au/~barry/interrupts.html
END 