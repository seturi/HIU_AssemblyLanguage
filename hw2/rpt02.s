prtfmt: .asciz	"%dth 문자 = %c\n"
scffmt: .asciz	"%s"
        .align	4
        .global	main
main:   save	%sp,    -96,    %sp
        mov	4,      %l0             ! i = 4
        mov     1,      %l2
        set     scffmt, %o0
        add	%fp,    -4,     %o1
        call    scanf
        nop
        ld	[%fp-4],%l1

loop:   subcc   %l2,    %l0,    %g0     ! if(i < 1)
        bg	next_r                  ! 루프 이탈
        nop
        set     prtfmt, %o0
        mov	%l0,    %o1
        mov	%l1,    %o2
        call	printf
        nop
        sub     %l0,    1,      %l0     !  i = i - 1
        srl	%l1,    8,      %l1     ! 8bit만큼 오른쪽으로 shift
        ba      loop
        nop

next_r: ret
        restore