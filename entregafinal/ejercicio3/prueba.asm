
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
mov ax, 00h
int 33h
cmp ax, 00
je error

mov bl, 4h
mov [200h], bl

call rectR
lopi:
call raton
call dentro
mov bl, [207h]
cmp bl, 04h
je sigo
jmp lopi
sigo:
call compD
mov bl, [205h]
cmp bl, 1h 
je end
call raton
call compI
mov bl, [206h]
cmp bl, 1h 
je color

jmp lopi

color: call col
call rectR
jmp lopi
error:
end:
int 20h
ret


rectR:mov ah,00h
mov al, 12h
int 10h
mov dx, 70d
s3: mov cx, 10d
s1: mov ah, 0ch
mov al, [200h]
mov bh, 00h
int 10h 
inc cx
cmp cx, 85d
jbe s1
inc dx
cmp dx, 145d
jbe s3
ret

dentro: mov bl,0h 
mov [207],bl
mov bl, [203h]
cmp bl, 10
ja endd
mov bl,1h 
mov [207],bl
mov bl, [203h]
cmp bl, 85
jg endd
mov bl, [207h]
add bl, 1h
mov [207h],bl

mov bl, [204h]
cmp bl, 70d
ja endd
mov bl,1h 
mov [207],bl
mov bl, [204h]
cmp bl, 145d
jg endd
mov bl, [207h]
add bl, 1h
mov [207h],bl

endd:
ret



raton:
mov ax, 3h
int 33h
mov [201h], bx
mov [203h], cx
mov [204h], dx
mov ax, 1h
int 33h
ret

compD:
mov bl, [201h]
cmp bl, 2h
je term
mov bl, 0h
mov [205h],bl
jmp fin
term: mov bl, 1h
mov [205h], bl
fin:
ret

compI:
mov bl, [201h]
cmp bl, 1h
je term2
mov bl, 0h
mov [206h],bl
jmp fin2
term2: mov bl, 1h 
mov [206h], bl
fin2:
ret






col: mov bl, [200h]
cmp bl, 4h
je verd
mov bl, [200h]
cmp bl, 2h
je azul
mov bl, [200h]
cmp bl, 9h
je rojo



azul:mov bl, 9h
mov [200h], bl
jmp fin3


verd: mov bl, 2h
mov [200h], bl
jmp fin3


rojo: mov bl, 4h
mov [200h], bl
jmp fin3


fin3:
ret


