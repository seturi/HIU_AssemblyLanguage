! %fp로부터의 변위
        .section ".text"
        a_s = -4		! int
        b_s = -5		! char
        c_s = -8		! short
        d_s = -12		! int
        e_s = -14		! short
        total_s = -20	! int
prtfmt1:.asciz	"int, char, short, int, short 타입순으로 값을 입력하시오 "
prtfmt2:.asciz	"total = %d\n"
scffmt:	.asciz	"%d %hhd %hd %d %hd"
        .align	4
        .global	main
main:	save	%sp,        -104,	%sp
        set	    prtfmt1,    %o0
        call	printf
        nop

        set	    scffmt,	%o0
        add	    %fp,	a_s,	%o1
        add	    %fp,	b_s,	%o2
        add	    %fp,	c_s,	%o3
        add	    %fp,	d_s,	%o4
        add     %fp,	e_s,	%o5
        call	scanf
        nop

        ld  	[%fp + a_s],	%l0
        ldsb	[%fp + b_s],	%l1
        add	    %l0,	        %l1,	%l0	    ! a + b
        ldsh	[%fp + c_s],	%l1
        add	    %l0,	        %l1,	%l0	    ! a + b + c
        ld	    [%fp + d_s],	%l1
        add	    %l0,	        %l1,	%l0	    ! a + b + c + d
        ldsh    [%fp + e_s],	%l1
        add	    %l0,	        %l1,	%l0	    ! a + b + c + d + e
        st      %l0,	        [%fp + total_s]	! total = a + b + c + d + e

        set     prtfmt2,        %o0
        ld  	[%fp + total_s],	    %l1
        mov     %l1,	        %o1
        call	printf
        nop

        ret
        restore