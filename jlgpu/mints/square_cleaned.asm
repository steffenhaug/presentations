square:
	mov	rax, qword ptr [rdi + 8]
  test rax, rax
	je	.LBB0_7
	mov	rcx, qword ptr [rdi]
	mov	edx, 1
	cmp	rax, 16
	jb	.LBB0_5
	mov	rsi, rax
	and	rsi, -16
	lea	rdx, [rsi + 1]
	xor	edi, edi
.LBB0_3:
	vmovups	xmm0, xmmword ptr [rcx + 8*rdi]
	vmovups	xmm1, xmmword ptr [rcx + 8*rdi + 32]
	vmovups	xmm2, xmmword ptr [rcx + 8*rdi + 64]
	vmovups	xmm3, xmmword ptr [rcx + 8*rdi + 96]
	vinsertf128	ymm0, ymm0, xmmword ptr [rcx + 8*rdi + 16], 1
	vinsertf128	ymm1, ymm1, xmmword ptr [rcx + 8*rdi + 48], 1
	vinsertf128	ymm2, ymm2, xmmword ptr [rcx + 8*rdi + 80], 1
	vinsertf128	ymm3, ymm3, xmmword ptr [rcx + 8*rdi + 112], 1
	vmulpd	ymm0, ymm0, ymm0
	vmulpd	ymm1, ymm1, ymm1
	vmulpd	ymm2, ymm2, ymm2
	vmulpd	ymm3, ymm3, ymm3
	vextractf128	xmmword ptr [rcx + 8*rdi + 16], ymm0, 1
	vmovupd	xmmword ptr [rcx + 8*rdi], xmm0
	vextractf128	xmmword ptr [rcx + 8*rdi + 48], ymm1, 1
	vmovupd	xmmword ptr [rcx + 8*rdi + 32], xmm1
	vextractf128	xmmword ptr [rcx + 8*rdi + 80], ymm2, 1
	vmovupd	xmmword ptr [rcx + 8*rdi + 64], xmm2
	vextractf128	xmmword ptr [rcx + 8*rdi + 112], ymm3, 1
	vmovupd	xmmword ptr [rcx + 8*rdi + 96], xmm3
	add	rdi, 16
	cmp	rsi, rdi
	jne	.LBB0_3
	cmp	rax, rsi
	je	.LBB0_7
.LBB0_5:
	dec	rdx
.LBB0_6:
	vmovsd	xmm0, qword ptr [rcx + 8*rdx]
	vmulsd	xmm0, xmm0, xmm0
	vmovsd	qword ptr [rcx + 8*rdx], xmm0
	inc	rdx
	cmp	rdx, rax
	jb	.LBB0_6
.LBB0_7:
	vzeroupper
	ret
