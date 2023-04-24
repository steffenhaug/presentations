	.text
	.file	"square"
	.globl	julia_square_86
	.p2align	4, 0x90
	.type	julia_square_86,@function
julia_square_86:
; ┌ @ REPL[1]:1 within `square`
	.cfi_startproc
; │ @ REPL[1]:2 within `square`
; │┌ @ abstractarray.jl:285 within `eachindex`
; ││┌ @ abstractarray.jl:116 within `axes1`
; │││┌ @ abstractarray.jl:95 within `axes`
; ││││┌ @ array.jl:151 within `size`
	endbr64
	mov	rax, qword ptr [rdi + 8]
; │└└└└
; │┌ @ range.jl:879 within `iterate`
; ││┌ @ range.jl:654 within `isempty`
; │││┌ @ operators.jl:382 within `>`
; ││││┌ @ int.jl:83 within `<`
  test	rax, rax
; │└└└└
	je	.LBB0_7
	mov	rcx, qword ptr [rdi]
	mov	edx, 1
; │ @ REPL[1]:3 within `square`
; │┌ @ array.jl:924 within `getindex`
	cmp	rax, 16
	jb	.LBB0_5
	mov	rsi, rax
	and	rsi, -16
	lea	rdx, [rsi + 1]
	xor	edi, edi
	.p2align	4, 0x90
.LBB0_3:
	vmovups	xmm0, xmmword ptr [rcx + 8*rdi]
	vmovups	xmm1, xmmword ptr [rcx + 8*rdi + 32]
	vmovups	xmm2, xmmword ptr [rcx + 8*rdi + 64]
	vmovups	xmm3, xmmword ptr [rcx + 8*rdi + 96]
	vinsertf128	ymm0, ymm0, xmmword ptr [rcx + 8*rdi + 16], 1
	vinsertf128	ymm1, ymm1, xmmword ptr [rcx + 8*rdi + 48], 1
	vinsertf128	ymm2, ymm2, xmmword ptr [rcx + 8*rdi + 80], 1
	vinsertf128	ymm3, ymm3, xmmword ptr [rcx + 8*rdi + 112], 1
; │└
; │┌ @ intfuncs.jl:321 within `literal_pow`
; ││┌ @ float.jl:385 within `*`
	vmulpd	ymm0, ymm0, ymm0
	vmulpd	ymm1, ymm1, ymm1
	vmulpd	ymm2, ymm2, ymm2
	vmulpd	ymm3, ymm3, ymm3
; │└└
; │┌ @ array.jl:966 within `setindex!`
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
; │└
; │ @ REPL[1]:4 within `square`
	cmp	rax, rsi
	je	.LBB0_7
.LBB0_5:
	dec	rdx
	.p2align	4, 0x90
.LBB0_6:
; │ @ REPL[1]:3 within `square`
; │┌ @ array.jl:924 within `getindex`
	vmovsd	xmm0, qword ptr [rcx + 8*rdx]
; │└
; │┌ @ intfuncs.jl:321 within `literal_pow`
; ││┌ @ float.jl:385 within `*`
	vmulsd	xmm0, xmm0, xmm0
; │└└
; │┌ @ array.jl:966 within `setindex!`
	vmovsd	qword ptr [rcx + 8*rdx], xmm0
; │└
; │ @ REPL[1]:4 within `square`
	inc	rdx
	cmp	rdx, rax
	jb	.LBB0_6
.LBB0_7:                                # %L33
	vzeroupper
	ret
.Lfunc_end0:
	.size	julia_square_86, .Lfunc_end0-julia_square_86
	.cfi_endproc
	.section	".note.GNU-stack","",@progbits
