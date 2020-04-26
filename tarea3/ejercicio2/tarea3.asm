org 100h

mov di, 0d
mov cx, 11d
mov ax, 2d
mov bx, 2d
lupi: mul bx;
cmp ah, 0d;
mov [di+210h], ax
ja mayor
inc di
jmp last


mayor: inc di
inc di
jmp last


last: loop lupi

int 20