org 100h

mov cx, 3d ; primer numero
mov ax, cx 
mov bx, 2d ; segundo numero
add ax, bx ; suma ax + bx
mov cx, 5d ; tercer numero
mov bx, cx ; 
add ax, bx ; suma ax + bx
mov cx, 1d ; cuarto numero
mov bx, cx
add ax, bx ; suma ax + bx
mov cx, 5d; suma quinto numero
mov bx, cx
add ax, bx ; suma ax + bx
mov bx, 5d; 
div bx ; resultado en ax
mov bx, 1d;
cmp ax, bx ; compara ax con 1
je opcion1
mov bx, 2d;
cmp ax, bx ; compara ax con 2
je opcion2
mov bx, 3d;
cmp ax, bx ; compara ax con 3
je opcion3
mov bx, 4d;
cmp ax, bx ; compara ax con 4
je opcion4
mov bx, 5d;
cmp ax, bx ; compara ax con 5
je opcion5
mov bx, 6d;
cmp ax, bx ; compara ax con 6
je opcion6
mov bx, 7d;
cmp ax, bx ; compara ax con 7
je opcion7
mov bx, 8d;
cmp ax, bx ; compara ax con 8
je opcion8
mov bx, 9d;
cmp ax, bx ; compara ax con 9
je opcion9
mov bx, 10d;
cmp ax, bx ; compara ax con 10
je opcion10

opcion1: mov di, 0d
mov cx, len1
lupi1: mov bl, [comnt1+di]
mov [di+200h], bl
inc di
loop lupi1
jmp fin
opcion2: mov di, 0d
mov cx, len2
lupi2: mov bl, [comnt2+di]
mov [di+200h], bl
inc di
loop lupi2
jmp fin
opcion3: mov di, 0d
mov cx, len3
lupi3: mov bl, [comnt3+di]
mov [di+200h], bl
inc di
loop lupi3
jmp fin

opcion4: mov di, 0d
mov cx, len4
lupi4: mov bl, [comnt4+di]
mov [di+200h], bl
inc di
loop lupi4
jmp fin

opcion5: mov di, 0d
mov cx, len5
lupi5: mov bl, [comnt5+di]
mov [di+200h], bl
inc di
loop lupi5
jmp fin

opcion6: mov di, 0d
mov cx, len6
lupi6: mov bl, [comnt6+di]
mov [di+200h], bl
inc di
loop lupi6
jmp fin

opcion7: mov di, 0d
mov cx, len7
lupi7: mov bl, [comnt7+di]
mov [di+200h], bl
inc di
loop lupi7
jmp fin

opcion8: mov di, 0d
mov cx, len8
lupi8: mov bl, [comnt8+di]
mov [di+200h], bl
inc di
loop lupi8
jmp fin

opcion9: mov di, 0d
mov cx, len9
lupi9: mov bl, [comnt9+di]
mov [di+200h], bl
inc di
loop lupi9
jmp fin

opcion10: mov di, 0d
mov cx, len10
lupi10: mov bl, [comnt10+di]
mov [di+200h], bl
inc di
loop lupi10
jmp fin


section .data
comnt1 db "solo necesito el 0"
len1 equ $-comnt1
comnt2 db "aun se pasa"
len2 equ $-comnt2
comnt3 db "hay salud"
len3 equ $-comnt3
comnt4 db "me recupero"
len4 equ $-comnt4
comnt5 db "en el segundo"
len5 equ $-comnt5
comnt6 db "peor es nada"
len6 equ $-comnt6
comnt7 db "muy bien"
len7 equ $-comnt7
comnt8 db "colocho"
len8 equ $-comnt8
comnt9 db "siempre me esfuerzo"
len9 equ $-comnt9
comnt10 db "perfecto solo dios"
len10 equ $-comnt10

fin: int 20h