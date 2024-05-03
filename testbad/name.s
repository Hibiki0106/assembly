        .data
msg:    .asciz  "***** Print name *****\n"
msg1:   .asciz  "Team 57\n"
msg2:   .asciz  "tipsymoon\n"
msg3:   .asciz  "octopus\n"
msg4:   .asciz  "redline\n"
msg5:   .asciz  "***** End Print *****\n\n"

        .text
        .globl  name


name:   stmfd   sp!,{r4-r7, lr}

        ldr     r0, =msg
        bl      printf
        ldr     r0, =msg1
        ldr     r4, =msg1

        bl      printf
        ldr     r0, =msg2
        ldr     r5, =msg2
        bl      printf
        ldr     r0, =msg3
        ldr     r6, =msg3
        bl      printf
        ldr     r0, =msg4
        ldr     r7, =msg4
        bl      printf
        ldr     r0, =msg5
        bl      printf

        mov     r0, #0
        ldmfd   sp!,{r4-r7, lr}
        mov     pc, lr

