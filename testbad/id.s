        .data
msg:    .asciz  "***** Print ID *****\n"
str:    .asciz  "%d"
strp:   .asciz  "%s"
strn:   .asciz  "\n"
str1:   .asciz  "** Please Enter Member1 ID **\n"
str2:   .asciz  "** Please Enter Member2 ID **\n"
str3:   .asciz  "** Please Enter Member3 ID **\n"
str4:   .asciz  "** Print Enter Member3 ID **\n"
str5:   .asciz  "** Please Enter Command **\n"
str6:   .asciz  "*****Print Team Member ID and ID Summation*****\n"
str7:   .asciz  "ID Summation = %d\n\n"
str8:   .asciz  "***** End Print *****\n\n"
str9:   .asciz  "Error enter!!!!!\n"

num1:      .word   0
num2:      .word   0
num3:      .word   0
total:     .word   0

n1:     .word   'p'
n2:     .word   '\0'
        .text
        .globl  id
        .globl  num1
        .globl  num2
        .globl  num3
        .globl  total

id:   stmfd   sp!,{r4-r11, lr}
        ldral     r0, =msg
        bl      printf
        ldr     r0, =str1
        bl      printf

        ldr     r0, =str
        ldr     r1, = num1
        bl      scanf
        ldr     r1, =num1
        ldr     r8, [r1]

        ldr     r0, =str2
        bl      printf
        ldr     r0, =str
        ldr     r1, = num2
        bl      scanf
        ldr     r1, =num2
        ldr     r9, [r1]

        ldr     r0, =str3
        bl      printf
        ldr     r0, =str
        ldr     r1, = num3
        bl      scanf
        ldr     r1, =num3
        ldr     r10, [r1]


        ldr     r0, =str5
        bl      printf

        ldr     r0, =strp
        ldr     r1, =n2
        bl      scanf
        ldr     r1, =n2
        ldr     r1, [r1]
        ldr     r11, =n1
        ldr     r11, [r11]

        cmp     r1,r11

        ldrne     r0, =str9
        blne      printf

        cmp     r1,r11

        subeq     r8,r8,#0
        addeq     r0,r8,r9
        addeq     r11,r0,r10
        ldr       r4, =total    @?
        str       r11, [r4]     @?

        ldreq     r0, =str6
        bleq      printf
        ldreq     r0, =str
        moveq     r1,r8
        bleq      printf
        ldreq     r0, =strn
        bleq      printf

        ldreq     r0, =str
        moveq     r1,r9
        bleq      printf
        ldreq     r0, =strn
        bleq      printf

        ldreq     r0, =str
        moveq     r1,r10
        bleq      printf
        ldreq     r0, =strn
        bleq      printf

        ldreq     r0, =strn
        bleq      printf
        ldreq     r0, =str7
        moveq     r1,r11
        bleq      printf
        ldreq     r0, =str8
        bleq      printf


        mov     r0, #0
        ldmfd   sp!,{r4-r11, lr}
        mov     pc, lr

