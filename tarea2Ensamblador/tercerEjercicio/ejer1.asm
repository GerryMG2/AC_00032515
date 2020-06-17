org 100h



section .main
    call texto	
	call cursor
	call pal1
    call kbwait
	mov [200h], al
    call pal2
	call kbwait
	mov dx, "+"
	mov [201h], dx
	mov [202h], al
	call pal3
	call pal4
	again: call kbwait
	cmp al,"s"
	je end
	jmp again
	end:
	mov al, 0h
	mov dx, "="
	mov [203h], dx
	
	call pal5
	mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	cmp dl,9h
	jg mayor
	call menor
    int 20h ; fin



texto: mov ah, 00h
mov	al, 03h
int 10h
ret

addls: add dl, 7h
ret


cursor: mov ah, 01h
mov ch, 00000000b
mov cl, 00001110b
int 10h
ret

m_cursor: mov ah, 02h
mov dx, di
mov dh, 14d ; fila
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
mov dh, 15d ; fila
mov bh, 0h
int 10h
ret

m_char2: mov ah, 09h
mov al, cl
mov bh, 0h 
mov bl, 26h
mov cx, 1h
int 10h 
ret




kbwait: mov ax, 0000h
	int 	16h
	ret

pal1:	mov di, 30d
lupi:	mov cl, [comnt1+di-30d]
	call    m_cursor
	call 	m_char
	inc	di
	cmp di, len1
	jb	lupi
	ret

pal2:	mov di, 30d
lupi2:	mov cl, [200h]
	call    m_cursor2
	call 	m_char2
	inc	di
	cmp di, 31d
	jb	lupi2
	ret



pal3: mov di, 31d
mov cl, [201h]
call m_cursor2
call m_char2
ret

pal4: mov di, 32d
	mov cl, [202h]
	call m_cursor2
	call m_char2
	ret



pal5:	mov di, 33d
	mov cl, [203h]
	call m_cursor2
	call m_char2
	ret


pa6:mov di, 34d
	mov cl, dl
	call m_cursor2
	call m_char2
	ret


mayor: 
mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh

	cmp dl, 10d	
	je diez

	mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	cmp dl, 11d
	je once

	mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	cmp dl,12d
	je doce

	mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	cmp dl, 13d
	je trece

	mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	cmp dl, 14d
	je catorce

	mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	cmp dl,15d
	je quince

	mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	cmp dl, 16d
	je diezseis

	mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	cmp dl,17d
	je diezsiete

	mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	cmp dl,18d
	je diezocho

	jmp ending
	;mov dh,0h
	;add dl, 37h

	diez:
	mov dl,"1"
	call pa6
	mov dl,"0"
	call pa7
	jmp ending
	once:
	mov dl,"1"
	call pa6
	mov dl,"1"
	call pa7
	jmp ending
	doce:
	mov dl,"1"
	call pa6
	mov dl,"2"
	call pa7
	jmp ending
	trece:
	mov dl,"1"
	call pa6
	mov dl,"3"
	call pa7
	jmp ending
	catorce:
	mov dl,"1"
	call pa6
	mov dl,"4"
	call pa7
	jmp ending
	quince:
	mov dl,"1"
	call pa6
	mov dl,"5"
	call pa7
	jmp ending
	diezseis:
	mov dl,"1"
	call pa6
	mov dl,"6"
	call pa7
	jmp ending
	diezsiete:
	mov dl,"1"
	call pa6
	mov dl,"7"
	call pa7
	jmp ending
	diezocho:
	mov dl,"1"
	call pa6
	mov dl,"8"
	call pa7
	jmp ending

	ending:

ret

menor: 
mov dh, [200h]
	sub dh,30h
	mov dl, [202h]
	sub dl,30h
	add dl, dh
	mov dh,0h
	add dl, 30h
	call pa6
ret


pa7:mov di, 35d
	mov cl, dl
	call m_cursor2
	call m_char2
	ret


section .data
comnt1 db "Ingrese Un digito"
len1 equ $-comnt1+30d



