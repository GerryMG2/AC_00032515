# Ejercicio 1
Codigo:
```
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


```
Capturas:
![](https://i.ibb.co/7yKP7XQ/image.png)
![](https://i.ibb.co/L61LJxF/image2.png)
![](https://i.ibb.co/nms6mH8/image3.png)

# Ejercicio 2
Diagrama:
![](https://i.ibb.co/yq0pQLQ/Untitled-Diagram.png)
Código:
```
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


```

Capturas:
![](https://i.ibb.co/LZ88NFf/Capture.png)
![](https://i.ibb.co/qYrh0nV/Capture2.png)
![](https://i.ibb.co/X5bfHp9/ultimosi.png)
# Ejercicio 3
Código:
```
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




```
Capturas:
![](https://i.ibb.co/R45j0YB/ultimo.png)
![](https://i.ibb.co/Y70bJQq/ultimo2.png)
![](https://i.ibb.co/PTF0XrT/ultimo3.png)
![](https://i.ibb.co/QCXqRj7/ultimo4.png)
![](https://i.ibb.co/Wt4Ctf9/ultimo5.png)

