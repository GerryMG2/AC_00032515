org 100h

mov di, 0d
mov cx, 16d
mov ax, 0d
mov bx, 1d
mov [220h], ax
mov [221h], bx

lupi: mov dx, bx;
add bx, ax
mov ax, dx

cmp bh, 0d;
ja mayor
inc di
jmp last
mayor: inc di
inc di
jmp last


last: mov [di+221h], bx
loop lupi

int 20