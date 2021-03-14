SECTION .data

Number:       dq 1
FizzText:     db "Fizz", 0
BuzzText:     db "Buzz", 0
FizzBuzzText: db "FizzBuzz", 0
NumberFormat: db "%d", 10, 0

SECTION .bss

SECTION .text

global main

extern puts   ; https://linux.die.net/man/3/puts
extern printf ; https://linux.die.net/man/3/printf

main:
    mov rcx, 100 ; set loop counter
    loop:
        ifDivisibleBy15:
            ; divide number
            mov rdx, 0        ; set dividend high part
            mov rax, [Number] ; set dividend low part
            mov r8, 15        ; set divisor
            div r8            ; divide
            ; process result
            cmp rdx, 0            ; compare remainder with zero
            jne ifDivisibleBy3    ; if not zero go to next condition
            push rcx              ; stash loop counter
            mov rdi, FizzBuzzText ; set text address
            call puts             ; display text
            pop rcx               ; unstash loop counter
            jmp endIf             ; exit from condition
        ifDivisibleBy3:
            ; divide number
            mov rdx, 0        ; set dividend high part
            mov rax, [Number] ; set dividend low part
            mov r8, 3         ; set divisor
            div r8            ; divide
            ; process result
            cmp rdx, 0         ; compare remainder with zero
            jne ifDivisibleBy5 ; if not zero go to next condition
            push rcx           ; stash loop counter
            mov rdi, FizzText  ; set text address
            call puts          ; display text
            pop rcx            ; unstash loop counter
            jmp endIf          ; exit from condition
        ifDivisibleBy5:
            ; divide number
            mov rdx, 0        ; set dividend high part
            mov rax, [Number] ; set dividend low part
            mov r8, 5         ; set divisor
            div r8            ; divide
            ; process result
            cmp rdx, 0        ; compare remainder with zero
            jne else          ; if not zero go to next condition
            push rcx          ; stash loop counter
            mov rdi, BuzzText ; set text address
            call puts         ; display text
            pop rcx           ; unstash loop counter
            jmp endIf         ; exit from condition
        else:
            mov rdi, NumberFormat ; set message format
            mov rsi, [Number]     ; set message data
            push rcx              ; stash loop counter
            call printf           ; display message
            pop rcx               ; unstash loop counter
        endIf:
            inc qword [Number] ; increment number
            dec rcx            ; decrement loop counter
            jnz loop           ; go to next iteration if necessary
            ret                ; exit from program
