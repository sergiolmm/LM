.MODEL small
.STACK 100h
.DATA
    mensagem DB 'Alo Mundo', 13, 10,'$'
    buffer BYTE  100 DUP(0)

.CODE
    mov ax,@data
    mov ds,ax

    mov dx, OFFSET mensagem

    mov bx,dx
    mov byte ptr [bx+3], 'R' ; ha necessidade do byte ptr senao assume 2 posicoes na memoria
    mov ah,9
    int 21h

    sub bx,bx
    .REPEAT
    mov     ah, 01h
    int     21h
    mov     buffer[bx], al 
    inc     bx
    .UNTIL (al == 13)

    mov     buffer[bx], '$' 

    mov dx, OFFSET buffer
    mov ah,9
    int 21h

    mov ah,4Ch
    int 21h
END

;when you are editing assembly files ,you can right click at the editor panel,then you will see several choices listed below:
;
;
;Open Emulator: Open the dosbox, prepare the environment
;
;Run ASM code: Assemble,link and Run the program
;
;Debug ASM code: Assemble,link and Debug the program
;
;NOTE:
;
;If your files path is not workable for emulator. The extension will copy your file in active editor to a separate workspace and operate it there.
;Default is using DOSBox and TASM,you can change them in preference->settings like the second gif(using MASM via msdos player).
;If you use include to include another file or use extern, please use dosbox here(see demo2)
