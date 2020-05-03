mov ax, 120d ; 10.0
mov [200h], ax
mov ax, 60; 3.25 
mov [210h], ax
call func2
;hasta aqui primera parte del ejercicios
call rand10
mov ax, cx
mov [200h], ax
call rand10
mov ax, cx
mov [210h], ax
call func2
;hasta aqui parte 2 - 1
call rand10
mov ax, cx
mov [200h], ax
call rand10
mov ax, cx
mov [210h], ax
call func2
;parte 2-2 terminada
int 20h
;fin del programa
rand10:
mov ax, 4d ; a
mul cx
add ax, 1d ; c
mov bx, 20d ; m
div bx; dx resultado
mov cx, dx
xor dx,dx
add cx, 1d
ret

func2:
mov ax, [200h]
mov bx, [210h]
div bx
xor dx,dx
mov [220h], ax
ret

