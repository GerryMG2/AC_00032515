org 100h

section .text

	call 	texto	
	call 	cursor
	call 	pal1
    call    pal2
    call    pal3
	call	kbwait

	int 	20h

m_char: mov ah, 09h
mov al, cl
mov bh, 0h 
mov bl, 00001111b
mov cx, 1h
int 10h 
ret


texto: mov ah, 00h
mov al, 03h
int 10h
ret

cursor: mov ah, 01h
mov ch, 00000000b
mov cl, 00001110b
int 10h
ret

m_cursor: mov ah, 02h
mov dx, di
mov dh, 5d ; fila
mov bh, 0h
int 10h
ret

m_cursor2: mov ah, 02h
mov dx, di
mov dh, 20d ; fila
mov bh, 0h
int 10h
ret
m_cursor3: mov ah, 02h
mov dx, di
mov dh, 15d ; fila
mov bh, 0h
int 10h
ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

pal1:	mov 	di, 29d

lupi:	mov 	cl, [comnt1+di-29d]
	call    m_cursor
	call 	m_char
	inc	di
	cmp 	di, len1
	jb	lupi
	ret

pal2:	mov 	di, 43d

lupi2:	mov 	cl, [comnt2+di-43d]
	call    m_cursor3
	call 	m_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret
pal3:	mov 	di, 20d

lupi3:	mov 	cl, [comnt3+di-20d]
	call    m_cursor2
	call 	m_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret



section .data
comnt1 db "No debo dejar las tareas para el final"
len1 equ $-comnt1+29d
comnt2 db "a menos que sea optativa"
len2 equ $-comnt2+43d
comnt3 db "solo bromeo"
len3 equ $-comnt3+60d



