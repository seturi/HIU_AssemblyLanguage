prtfmt1:	.asciz	"두 정수를 입력하시오: "
prtfmt2:	.asciz	"최대공약수는 %d입니다.\n"
scffmt:	.asciz	"%d%d"
	.align	4
	.global	main
main:	save	%sp,	-104,	%sp
	set	prtfmt1,	%o0
	call	printf
	nop
	
	set	scffmt,	%o0
	add	%fp,	-4,	%o1
	add	%fp,	-8,	%o2
	call	scanf
	nop

	ld	[%fp-4],	%l0		! a
	ld	[%fp-8],	%l1		! b
	ba	end
	nop

loop:	cmp	%l0,	%l1		! if(a < b)
	bl	else			! 분기
	nop
	sub	%l0,	%l1,	%l2	! r = a - b
	mov	%l1,	%l0		! a = b
	mov	%l2,	%l1		! b = r
	ba	end
	nop

else:	sub	%l1,	%l0,	%l2	! r = b- a
	mov	%l0,	%l1		! b = a
	mov	%l2,	%l0		! a = r
	ba	end
	nop

end:	subcc	%l0,	%l1,	%g0 	! if(a != b)
	bne	loop			! 분기
	nop

	st	%l0,	[%fp-4]
	st	%l1,	[%fp-8]
	set	prtfmt2,	%o0
	mov	%l0,	%o1
	call	printf
	nop

	ret
	restore