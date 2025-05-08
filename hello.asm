[BITS 16]       ; 16-bit real mode
[ORG 0x7C00]    ; BIOS loads bootloader here

start:
    mov si, message
print:
    lodsb
    or al, al
    jz hang
    mov ah, 0x0E
    int 0x10
    jmp print

hang:
    jmp $

message db "Hello! Nifad Here❤️", 0
times 510 - ($ - $$) db 0
dw 0xAA55
