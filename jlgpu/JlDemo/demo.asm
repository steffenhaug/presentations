	.file	"demo.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	dot
	.type	dot, @function
dot:
.LFB0:
	.cfi_startproc
	mov	rcx, rsi
	test	edx, edx
	jle	.L9
	lea	eax, [rdx-1]
	cmp	eax, 2
	jbe	.L10
	mov	esi, edx
	xor	eax, eax
	vxorpd	xmm0, xmm0, xmm0
	shr	esi, 2
	sal	rsi, 5
	.p2align 4,,10
	.p2align 3
.L4:
	vmovupd	ymm4, YMMWORD PTR [rdi+rax]
	vmulpd	ymm1, ymm4, YMMWORD PTR [rcx+rax]
	add	rax, 32
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm2, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
	vaddsd	xmm0, xmm0, xmm2
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm1
	cmp	rsi, rax
	jne	.L4
	mov	eax, edx
	and	eax, -4
	mov	esi, eax
	cmp	edx, eax
	je	.L20
	vzeroupper
.L3:
	sub	edx, esi
	cmp	edx, 1
	je	.L7
	vmovupd	xmm5, XMMWORD PTR [rdi+rsi*8]
	vmulpd	xmm1, xmm5, XMMWORD PTR [rcx+rsi*8]
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm1, xmm0
	test	dl, 1
	je	.L1
	and	edx, -2
	add	eax, edx
.L7:
	cdqe
	vmovsd	xmm1, QWORD PTR [rdi+rax*8]
	vmulsd	xmm1, xmm1, QWORD PTR [rcx+rax*8]
	vaddsd	xmm0, xmm0, xmm1
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	vxorpd	xmm0, xmm0, xmm0
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	vzeroupper
	ret
.L10:
	xor	esi, esi
	xor	eax, eax
	vxorpd	xmm0, xmm0, xmm0
	jmp	.L3
	.cfi_endproc
.LFE0:
	.size	dot, .-dot
	.p2align 4
	.globl	square
	.type	square, @function
square:
.LFB1:
	.cfi_startproc
	mov	rcx, rdi
	test	esi, esi
	jle	.L22
	lea	eax, [rsi-1]
	cmp	eax, 2
	jbe	.L28
	mov	edx, esi
	mov	rax, rdi
	shr	edx, 2
	sal	rdx, 5
	add	rdx, rdi
	.p2align 4,,10
	.p2align 3
.L24:
	vmovupd	ymm1, YMMWORD PTR [rax]
	add	rax, 32
	vmulpd	ymm0, ymm1, ymm1
	vmovupd	YMMWORD PTR [rax-32], ymm0
	cmp	rax, rdx
	jne	.L24
	mov	eax, esi
	and	eax, -4
	mov	edx, eax
	cmp	esi, eax
	je	.L37
	vzeroupper
.L23:
	sub	esi, edx
	cmp	esi, 1
	je	.L26
	lea	rdx, [rcx+rdx*8]
	vmovupd	xmm2, XMMWORD PTR [rdx]
	vmulpd	xmm0, xmm2, xmm2
	vmovupd	XMMWORD PTR [rdx], xmm0
	test	sil, 1
	je	.L22
	and	esi, -2
	add	eax, esi
.L26:
	cdqe
	lea	rax, [rcx+rax*8]
	vmovsd	xmm0, QWORD PTR [rax]
	vmulsd	xmm0, xmm0, xmm0
	vmovsd	QWORD PTR [rax], xmm0
.L22:
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	vzeroupper
	ret
.L28:
	xor	edx, edx
	xor	eax, eax
	jmp	.L23
	.cfi_endproc
.LFE1:
	.size	square, .-square
	.ident	"GCC: (GNU) 12.2.1 20221121 (Red Hat 12.2.1-4)"
	.section	.note.GNU-stack,"",@progbits
