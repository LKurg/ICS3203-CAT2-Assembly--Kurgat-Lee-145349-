section .data
    sensor_value db 0            ; Simulated sensor value
    motor_status db 0            ; Motor status: 0 = off, 1 = on
    alarm_status db 0            ; Alarm status: 0 = off, 1 = triggered
    high_threshold db 7          ; Threshold for triggering the alarm
    low_threshold db 3           ; Threshold for turning on the motor
    prompt_msg db 'Enter sensor value (0-9): ', 0
    prompt_len equ $ - prompt_msg
    motor_on_msg db 'Motor turned ON', 10, 0
    motor_on_len equ $ - motor_on_msg
    motor_off_msg db 'Motor turned OFF', 10, 0
    motor_off_len equ $ - motor_off_msg
    alarm_msg db 'ALARM TRIGGERED!', 10, 0
    alarm_len equ $ - alarm_msg

section .bss
    input resb 2                 ; Buffer for input

section .text
    global _start

_start:
    ; Step 1: Print prompt message
    mov eax, 4                   ; syscall: write
    mov ebx, 1                   ; stdout
    mov ecx, prompt_msg          ; Address of prompt message
    mov edx, prompt_len          ; Length of prompt message
    int 0x80                     ; Call kernel

    ; Step 2: Read input
    mov eax, 3                   ; syscall: read
    mov ebx, 0                   ; stdin
    mov ecx, input               ; Address of input buffer
    mov edx, 2                   ; Read 2 bytes (digit + newline)
    int 0x80                     ; Call kernel

    ; Step 3: Convert input to integer
    movzx eax, byte [input]      ; Get first byte of input
    sub eax, '0'                 ; Convert ASCII to integer
    mov [sensor_value], al       ; Store sensor value

    ; Step 4: Control logic
    mov al, [sensor_value]       ; Load sensor value
    cmp al, [high_threshold]     ; Compare with high threshold
    jg trigger_alarm             ; If greater, trigger alarm

    cmp al, [low_threshold]      ; Compare with low threshold
    jl turn_on_motor             ; If less, turn on motor

turn_off_motor:
    ; Turn off the motor
    mov byte [motor_status], 0   ; Motor OFF
    mov eax, 4                   ; syscall: write
    mov ebx, 1                   ; stdout
    mov ecx, motor_off_msg       ; Address of motor OFF message
    mov edx, motor_off_len       ; Length of motor OFF message
    int 0x80                     ; Call kernel
    jmp exit_program             ; Exit program

turn_on_motor:
    ; Turn on the motor
    mov byte [motor_status], 1   ; Motor ON
    mov eax, 4                   ; syscall: write
    mov ebx, 1                   ; stdout
    mov ecx, motor_on_msg        ; Address of motor ON message
    mov edx, motor_on_len        ; Length of motor ON message
    int 0x80                     ; Call kernel
    jmp exit_program             ; Exit program

trigger_alarm:
    ; Trigger the alarm
    mov byte [alarm_status], 1   ; Alarm triggered
    mov eax, 4                   ; syscall: write
    mov ebx, 1                   ; stdout
    mov ecx, alarm_msg           ; Address of alarm message
    mov edx, alarm_len           ; Length of alarm message
    int 0x80                     ; Call kernel
    jmp exit_program             ; Exit program

exit_program:
    ; Exit program
    mov eax, 1                   ; syscall: exit
    xor ebx, ebx                 ; Exit code 0
    int 0x80
