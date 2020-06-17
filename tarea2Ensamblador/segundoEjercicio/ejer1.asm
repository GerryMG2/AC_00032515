org 100h

section .main
	call pass
    call texto	
	call cursor
again: call pal1
    xor si, si 	;lo mimso que: mov si, 0000h
lupp: call kb
	cmp al, "e" ;   "h o l a $"
			;si; 0 1 2 3 4
	je	end
	
    mov	[300h+si], al ; CS:0300h en adelante
	inc si

	jmp lupp
    
	end:
	call mostrar
	mov ch,[310h]
	cmp ch,4h
	je fin
	
	; call cursor
	call pal2
	call kbwait
	jmp again
	

	fin:
	call pal3
	call kbwait
    int 20h ; fin

texto: mov ah, 00h
mov	al, 03h
int 10h
ret

pass: mov ax, "p" 
mov [200h], ax
mov ax, "a"
mov [201h], ax
mov ax, "s"
mov [202h], ax
mov ax, "s"
mov [203h], ax
mov ax, "w"
mov [204h], ax
ret 

cursor: mov ah, 01h
mov ch, 00000000b
mov cl, 00001110b
int 10h
ret 

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
mov dh, 18d ; fila
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
mov dh, 16d ; fila
mov bh, 0h
int 10h
ret

m_char3: mov ah, 09h
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


mostrar: 
	mov ch, 0
	mov [310h], ch
	mov dh,[300h]
	mov cl, [200h]
	cmp cl,dh
	je val
	mov dh,[301h]
	mov cl, [201h]
	cmp cl,dh
	je val
	mov dh,[302h]
	mov cl, [202h]
	cmp cl,dh
	je val
	mov dh,[303h]
	mov cl, [203h]
	cmp cl,dh
	je val
	mov dh,[304h]
	mov cl, [204h]
	cmp cl,dh
	je val
	

	ret

val: mov ch,[310h]
	add ch,1h
	mov [310h], ch
ret

pal2: mov di, 25d
lupi2: mov cl, [comnt2+di-25d]
	call m_cursor2
	call m_char2
	inc	di
	cmp di, len2
	jb	lupi2
	ret

pal3:	mov di, 25d
lupi3:	mov cl, [comnt3+di-25d]
	call    m_cursor3
	call 	m_char3
	inc	di
	cmp di, len3
	jb	lupi3
	ret






kb:	mov	ah, 00h ;subrutina que detiene la ejecución hasta recibir
	int 	16h	;algun carácter en el buffer del teclado
	ret		;este carácter lo guarda en el registro AL


section .data
comnt1 db "Ingrese contrasennia, y presiones E para validar"
len1 equ $-comnt1+25d

comnt2 db "Incorrecta Ingrese nuevamente"
len2 equ $-comnt2+25d

comnt3 db "Bienvenido"
len3 equ $-comnt3+25d

