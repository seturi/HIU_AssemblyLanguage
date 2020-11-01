        SIZE = 5
        name = 0	! 구조체 이름속성 크기 :10 바이트
        id = 12		! 구조체 id 크기 : 8 바이트
        salary = 20	! 봉급 크기 : 4 바이트 정수
        emp = -120	!  emp [5] : (구조체 크기) * 5(구조체배열크기) = 120 바이트
scffmt:	.asciz	"%s %s %d"
prtfmt1:.asciz	">>직원의 정보 이름, ID, 급여를 입력하세요. <<\n"
prtfmt2:.asciz	"%d번 : "
prtfmt3:.asciz	"급여가 %d만원(평균) 이상인 직원 정보"
prtfmt4:.asciz	"\t%s\t%d만원\n"
prtln1:	.asciz	"\n---------------------------------\n"
prtln2:	.asciz	"-----------------------------------\n"
	    .align	4
	    .global	main

main:	save	%sp,	-(94+120+8)&-8,	 %sp
	    mov	    %g0,	%l1		    ! 급여 평균
	    mov	    %g0,    %l2		    ! 급여 합계

        ! printf(">>직원의 정보 이름, ID, 급여 를 입력하세요 . <<\n");
        set	    prtfmt1,    %o0
        call	printf

        set	    emp,	%l5		    ! %l5 는 구조체 크기 24 씩 줄어드는 변수
        add	    %fp,	emp,	%l5
        ba	    forInputTest		! emp[i]
        mov	    %g0,	%l0		    ! i = 0

forInputLoop:
        ! printf("%d번 : ", i + 1);
        set	    prtfmt2,	%o0
        add	    %l0,	1,	%o1
        call	printf
        nop

        ! scanf ("%s %s %d", emp[i].name, emp[i].id, &emp[i].salary);
        set 	scffmt,	%o0
        add 	%l5, 	name,	%o1
        add	    %l5,	id,	%o2
        call	scanf
        add	    %l5,	salary,	%o3
        ld	    [%o2],	%o2
        ld	    [%l5+salary],	%o0
        add	    %l2,	%o0,	%l2 ! 급여 합계 계산

inc_i:
        inc	    %l0
        add	    %l5,	24,	%l5 	! 예) emp[3] ----> emp [4]

forInputTest:
        cmp	    %l0,	SIZE		!  i  <  SIZE
        bl	    forInputLoop
        nop
        
        mov	    %g0,	%l0		    ! i 초기화
        add	    %l5,	emp,	%l5	! %l5 초기화
        mov	    %l2,	%o0
        mov	    SIZE,	%o1
        call	.div			! 급여 평균 계산
        nop
        mov	    %o0,	%l1

        set	    prtln1,	%o0
        call	printf
        nop
        ! printf("급여가 %d만원(평균) 이상인 직원 정보", average);
        set	    prtfmt3,	%o0
        mov	    %l1,	%o1
        call	printf
        nop
        set	    rtln1,	%o0
        call	printf
        nop

        ba	    forOutputTest
        nop

check:
        ld	    [%l5+salary],	%o0
        cmp	    %o0,	%l1		    ! if 급여 < 평균
        bl	    exitIf			    ! pass
        nop

forOutputLoop:
        ! printf("\t%s\t%d만원\n", employee[i].id, employee[i].salary);
        set	    prtfmt4,	%o0
        add	    %l5,	id,	%o1
        add	    %l5,	salary,	%o2
        call	printf
        ld      [%o2],	%o2

exitIf:
        inc	    %l0			        ! i++
        add	    %l5,	24,	%l5 	! 다음 emp [3] ----> emp [4]

forOutputTest:
        cmp	    %l0,	SIZE        !  i  <  SIZE
        bl	    check
        nop

        set	    prtln2,	%o0
        call	printf

exit:
        ret
        restore