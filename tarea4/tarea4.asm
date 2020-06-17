org 100h

section .main
call texto
call cursor
call pal1
call kbwait
int 20h






promedio:
push cx
push ax
push bx
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
mov bx, 3d;
cmp ax, bx
je equal
;aqui iban las otras comparaciones
equal: 
pop bx
pop ax
pop cx
ret


texto: mov ah, 00h
mov	al, 03h
int 10h
ret


cursor: mov ah, 01h
mov ch, 00000000b
mov cl, 00001110b
int 10h

m_cursor: mov ah, 02h
mov dx, di
mov dh, 17d ; fila
mov bh, 0h
int 10h
ret

m_char: mov ah, 09h
mov al, cl
mov bh, 0h 
mov bl, 40h
mov cx, 1h
int 10h 
ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

pal1:	mov di, 25d
lupi:	mov cl, [comnt1+di-25d]
	call    m_cursor
	call 	m_char
	inc	di
	cmp di, len1
	jb	lupi
	ret





section .data
comnt1 db "hay salud"
len1 equ $-comnt1+25d
