section .data
    arr db 1, 2, 3, 4, 5        ; Original array of integers
    len equ $ - arr             ; Length of the array
    msg db "Reversed Array: ", 0; Message to print before the reversed array
    space db " ", 0             ; Space character for formatting
    newline db 10, 0            ; Newline character

section .bss
    temp resb 1                 ; Temporary storage for swapping values
    output resb 1               ; Buffer for ASCII output

section .text
    global _start

_start:
    ; Print the message "Reversed Array: "
    mov eax, 4                 ; syscall: write
    mov ebx, 1                 ; stdout
    mov ecx, msg               ; Address of the message
    mov edx, 16                ; Length of the message
    int 0x80                   ; Call kernel to write the message

    ; Reverse the array
    mov esi, arr               ; Set ESI to the start of the array
    mov edi, arr + len - 1     ; Set EDI to the end of the array
    mov ecx, len / 2           ; Calculate the number of swaps needed

reverse_loop:
    ; Swap values at ESI and EDI
    mov al, [esi]              ; Load the value at ESI into AL
    mov bl, [edi]              ; Load the value at EDI into BL
    mov [esi], bl              ; Store the value of BL at ESI
    mov [edi], al              ; Store the value of AL at EDI

    ; Update pointers for the next iteration
    inc esi                    ; Move ESI to the next position
    dec edi                    ; Move EDI to the previous position

    loop reverse_loop          ; Repeat until all swaps are done

    ; Print the reversed array
    mov esi, arr               ; Reset ESI to the start of the array
    mov ecx, len               ; Set ECX to the length of the array

print_loop:
    ; Convert the current array value to ASCII
    movzx eax, byte [esi]      ; Load the value at ESI into EAX
    add eax, 48                ; Convert the integer to ASCII
    mov [output], al           ; Store the ASCII character in the output buffer

    ; Print the current value
    mov eax, 4                 ; syscall: write
    mov ebx, 1                 ; stdout
    mov ecx, output            ; Address of the output buffer
    mov edx, 1                 ; Length of one character
    int 0x80                   ; Call kernel to print the character

    ; Print a space after the number (except for the last number)
    cmp esi, arr + len - 1     ; Check if we are at the last element
    je print_end               ; If yes, skip printing a space
    mov eax, 4                 ; syscall: write
    mov ebx, 1                 ; stdout
    mov ecx, space             ; Address of the space character
    mov edx, 1                 ; Length of one character
    int 0x80                   ; Call kernel to print the space

    ; Update pointer for the next value
    inc esi                    ; Move ESI to the next element
    loop print_loop            ; Repeat until all elements are printed

print_end:
    ; Print a newline character
    mov eax, 4                 ; syscall: write
    mov ebx, 1                 ; stdout
    mov ecx, newline           ; Address of the newline character
    mov edx, 1                 ; Length of one character
    int 0x80                   ; Call kernel to print the newline

    ; Exit the program
    mov eax, 1                 ; syscall: exit
    xor ebx, ebx               ; Exit code 0
    int 0x80                   ; Call kernel to terminate the program
