.MODEL small
.STACK 100h
.DATA
    mensagem DB 'Alo Mundo', 13, 10,'$'
    buffer BYTE  100 DUP(0)
.DATA?
    buffer2 BYTE  100 DUP(?)

.CODE
    mov ax,@data
    mov ds,ax

    mov dx, OFFSET mensagem
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
