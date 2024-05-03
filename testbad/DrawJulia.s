       .data



maxwidth: .word 640
maxhigh:  .word 480
mn:     .word 1500
mn2:     .word 480000
mn3:     .word 240000
mn4:     .word 4000000
mn5:     .word 1280
mn6:     .word 0xffff

       .text
.constant:
   .word 255      @.constant+0

    .globl DrawJulia

DrawJulia:  stmfd   sp!,{r4-r11, lr}
        mov   r10,  r0
        mov   r11, r1

        mov   r8, #0
for:    cmp   r8, #640  @ x < 640
        bge   Done
        mov   r9, #0

for1:   cmp   r9, #480  @ y < 480
        bge   for11
        ldr   r1, =mn
        ldr   r1, [r1]
        mul   r1, r1, r8
        ldr   r0, =mn2
        ldr   r0, [r0]
        sub   r0, r1, r0
        mov   r1, #320
        bl    __aeabi_idiv @ r0 / r1
        mov   r5, r0
        mov   r1, #1000
        mul   r1, r1, r9
        ldr   r0, =mn3
        ldr   r0, [r0]
        sub   r0, r1, r0
        mov   r1, #240
        bl    __aeabi_idiv
        mov   r6, r0
        ldr   r7, .constant

        mul   r0, r5, r5
        mul   r1, r6, r6
        add   r2, r0, r1
        ldr   r3, =mn4
        ldr   r3, [r3]
        cmp   r2, r3
        bge   out
        cmp   r7, #0
        ble   out

while:  sub   r0, r0, r1
        mov   r1, #1000
        bl    __aeabi_idiv
        sub   r4, r0, #700
        mul   r0, r5, r6
        mov   r1, #500
        bl    __aeabi_idiv
        add   r6, r0, r10
        mov   r5, r4
        sub   r7, r7, #1      @ i--
        mul   r0, r5, r5
        mul   r1, r6, r6
        add   r2, r0, r1
        ldr   r3, =mn4
        ldr   r3, [r3]
        cmp   r2, r3
        bge   out
        cmplt r7, #0
        ble   out
        b     while


for11:  add   r8, r8, #1      @ x++
        b     for

Done:   mov   r0, #0
        subs   r0, r14, r13
        ldmfd sp!, {r4-r11, lr}
        mov   pc, lr

out:    and   r1, r7, #0xff
        mov   r7, r1, lsl#8
        orr   r7, r7, r1      @ r7 = color
        ldr   r0, =mn6
        ldr   r0, [r0]
        bic   r7, r0, r7

        mov   r0, r11
        ldr   r1, =mn5
        ldr   r1, [r1]
        mul   r1, r1, r9
        add   r2, r8, r8
        add   r0, r0, r1
        add   r0, r0, r2
        strh  r7, [r0]
        add   r9, r9, #1
        b     for1


        @ int zx, zy;  r5 r6
        @ int tmp;     r4
        @ int i;       r7
        @ int x, y;    r8 r9
        @ save cy      r10
        @ save frame   r11

