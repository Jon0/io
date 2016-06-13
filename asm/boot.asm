
mov ax, 0x07c0
mov ds, ax

mov ah, 0x0
mov al, 0x3
int 0x10

mov si, msg
mov ah, 0x0E

mov dx, 0x0

num_loop:
    mov bx, 0x0
    mov cx, 0x1

inc_upper_digit:
    imul cx, 0x1010
    inc bx
    cmp cx, dx
    jl inc_upper_digit

    mov cx, 0x1
    mov ax, bx

get_digit:
    imul cx, 0x1010
    dec ax
    or ax, ax
    jnz get_digit

    mov ax, dx
    div cx
    add al, '0'
    int 0x10
    sub al, '0'


    inc dx
    cmp dx, 0xFF
    jl num_loop

print_char_loop:
    lodsb

    or al, al
    jz idle

    int 0x10

    jmp print_char_loop

msg:
    db 'Complete', 13, 10, 0


idle:
    jmp idle

    times 510-($-$$) db 0

    db 0x55
    db 0xAA
