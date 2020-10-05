prtfmt1:.asciz	"년도를 입력하세요(종료: 음수) "
prtfmt2:.asciz	"%d 윤년입니다.\n"
prtfmt3:.asciz	"%d 평년입니다.\n"
scffmt:	.asciz	"%d"
	.align	4
	.global	main
main:	save	%sp,	-96,	%sp
loop:	set prtfmt1,	%o0
        call    printf
        nop
        set scffmt, 	%o0
        add	%fp,	-4,	%o1
        call	scanf
        nop
        ld  [%fp-4],	%l0

        subcc	%l0,	%g0,	%g0	! if(year < 0)
        bl	end                 	! 루프 이탈, 종료
        nop
        
        ba	if
        nop

if:     mov	%l0,	%o0
        mov	400,	%o1
        call	.rem			! year % 400
        nop
        mov	%o0,	%l1
        subcc	%l1,	%g0,	%g0	! if(year % 400 != 0)
        bne	elseIf1			! 분기
        nop
        set	prtfmt2,	%o0	! (year % 400 == 0)
        mov	%l0,	%o1		! 윤년
        call	printf
        nop

        ba	loop			! 처음으로 돌아가 반복
        nop


elseIf1:mov	%l0,	%o0
        mov	4,	%o1
        call	.rem			! year % 4
        nop
        mov	%o0,	%l1
        subcc	%l1,	%g0,	%g0	! if(year % 4 != 0)
        bne	elseIf2			        ! 분기	
        nop

        mov	%l0,	%o0
        mov	100,	%o1
        call	.rem			! year % 100
        nop
        mov	%o0,	%l2
        subcc	%l2,	%g0,	%g0	! if(year % 100 != 0)
        bne	else			! 분기	
        nop

        set	prtfmt3,	%o0	! (year % 4 == 0) && (year % 100 == 0)
        mov	%l0,	%o1		! 평년
        call	printf
        nop

        ba	loop			! 처음으로 돌아가 반복
        nop

elseIf2:set	prtfmt3,	%o0	! (year % 4 != 0)
        mov	%l0,	%o1		! 평년
        call	printf
        nop

        ba	loop			! 처음으로 돌아가 반복
        nop

else:	set	prtfmt2,	%o0	! (year % 4 == 0) && (year % 100 != 0)
        mov	%l0,	%o1		! 윤년
        call	printf
        nop

        ba	loop			! 처음으로 돌아가 반복
        nop

end:	ret
	    restore