org 100h

mov di, 0d
mov ax, 1d
mov [230h],ax 

mov cx, 10d
lupi: call rand50
mov ax, [230h]
mov [di + 200h], ax
inc di
loop lupi

mov di, 1d
mov cx,11d;
mov ax, 0d
lupi2: add ax, [di + 200h]
inc di
loop lupi2

mov bx, 10d
div bx
mov [210h], ax

int 20h

rand50:

mov bx, [230h]
mov ax, 4d ; a
mul bx
add ax, 1d ; c
mov bx, 51d ; m
div bx; dx resultado
mov bx, dx
xor dx,dx
mov [230h], bx

ret