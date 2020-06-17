org 100h

section .main
    call texto	
	call cursor
	call pal1
    call kbwait
    call pal2
    xor 	si, si 	;lo mimso que: mov si, 0000h
lupp:	call 	kb
    mov	[300h+si], al ; CS:0300h en adelante
	cmp 	si, 4h ;   "h o l a $"
			;si; 0 1 2 3 4
	je	mostrar
	
	inc 	si
	jmp 	lupp
    

    int 20h ; fin

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

m_cursor2: mov ah, 02h
mov dx, di
mov dh, 16d ; fila
mov bh, 0h
int 10h
ret

m_char2: mov ah, 09h
mov al, cl
mov bh, 0h 
mov bl, 40h
mov cx, 1h
int 10h 
ret

m_cursor3: mov ah, 02h
mov dx, di
mov dh, 17d ; fila
mov bh, 0h
int 10h
ret

m_char3: mov ah, 09h
mov al, cl
mov bh, 0h 
mov bl, 64h
mov cx, 1h
int 10h 
ret


kbwait: mov 	ax, 0000h
	int 	16h
	ret

pal1:	mov di, 43d
lupi:	mov cl, [comnt1+di-43d]
	call    m_cursor
	call 	m_char
	inc	di
	cmp di, len1
	jb	lupi
	ret

pal2:	mov di, 43d
lupi2:	mov cl, [comnt2+di-43d]
	call    m_cursor2
	call 	m_char2
	inc	di
	cmp di, len2
	jb	lupi2
	ret


mostrar: call pal3
	call kb	; solo detenemos la ejecución
	ret

pal3:	mov di, 43d
lupi3:	mov cl, [300h+di-43d]
	call m_cursor3
	call m_char3
	inc	di
	cmp di, 48d
	jb	lupi3
	ret




kb:	mov	ah, 00h ;subrutina que detiene la ejecución hasta recibir
	int 	16h	;algun carácter en el buffer del teclado
	ret		;este carácter lo guarda en el registro AL


section .data
comnt1 db "GATO"
len1 equ $-comnt1+43d

comnt2 db "Ingrese una palabra de 5 letras"
len2 equ $-comnt1+43d

