	.file	"code.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 16
	call	___main
	fld1
	fstp	DWORD PTR [esp+12]
	fld	DWORD PTR LC1
	fstp	DWORD PTR [esp+8]
	fld	DWORD PTR [esp+12]
	fadd	DWORD PTR [esp+8]
	fstp	DWORD PTR [esp+4]
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE0:
	.section .rdata,"dr"
	.align 4
LC1:
	.long	1073741824
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
