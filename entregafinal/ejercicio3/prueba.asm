
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
mov ax, 00h
int 33h
cmp ax, 00
je error

mov bx, 4h
mov [200h], bx

call rectR
lopi:
call raton
call dentro
mov bx, [207h]
cmp bx, 04h
je sigo
jmp lopi
sigo:
call compD
mov bx, [205h]
cmp bx, 1h 
je end
call raton
call compI
mov bx, [206h]
cmp bx, 1h 
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

dentro: mov bx,0h 
mov [207],bx
mov bx, [203h]
cmp bx, 10
ja endd
mov bx,1h 
mov [207],bx
mov bx, [203h]
cmp bx, 85
jg endd
mov bx, [207h]
add bx, 1h
mov [207h],bx

mov bx, [204h]
cmp bx, 70d
ja endd
mov bx,1h 
mov [207],bx
mov bx, [204h]
cmp bx, 145d
jg endd
mov bx, [207h]
add bx, 1h
mov [207h],bx

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
mov bx, [201h]
cmp bx, 2h
je term
mov bx, 0h
mov [205h],bx
jmp fin
term: mov bx, 1h
mov [205h], bx
fin:
ret

compI:
mov bx, [201h]
cmp bx, 1h
je term2
mov bx, 0h
mov [206h],bx
jmp fin2
term2: mov bx, 1h 
mov [206h], bx
fin2:
ret






col: mov bx, [200h]
cmp bx, 4h
je verd
mov bx, [200h]
cmp bx, 2h
je azul
mov bx, [200h]
cmp bx, 9h
je rojo



azul:mov bx, 9h
mov [200h], bx
jmp fin3


verd: mov bx, 2h
mov [200h], bx
jmp fin3


rojo: mov bx, 4h
mov [200h], bx
jmp fin3


fin3:
ret


