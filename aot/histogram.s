	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.text.histogram,"ax",@progbits
	.globl	histogram                       # -- Begin function histogram
	.p2align	1
	.type	histogram,@function
histogram:                              # @histogram
# %bb.0:                                # %entry
	ld	a5, 40(a1)
	ld	t1, 16(a0)
	ld	a3, 16(a1)
	lw	a6, 0(a5)
	lw	a7, 16(a5)
	lw	t0, 24(a5)
	bnez	t1, .LBB0_2
# %bb.1:                                # %_halide_buffer_is_bounds_query.exit
	ld	a2, 0(a0)
	beqz	a2, .LBB0_5
.LBB0_2:                                # %after_bb
	bnez	a3, .LBB0_6
.LBB0_3:                                # %_halide_buffer_is_bounds_query.exit39
	ld	a2, 0(a1)
	bnez	a2, .LBB0_6
# %bb.4:                                # %then_bb2
	lui	a2, 256
	addiw	a2, a2, 9
	slli	a2, a2, 13
	sd	a2, 32(a1)
	sd	zero, 0(a1)
	sd	zero, 8(a1)
	sd	zero, 16(a1)
	sw	zero, 0(a5)
	li	a2, 256
	sw	a2, 4(a5)
	li	a4, 1
	sw	a4, 8(a5)
	sw	zero, 12(a5)
	sw	zero, 16(a5)
	li	a4, 3
	sw	a4, 20(a5)
	sw	a2, 24(a5)
	sw	zero, 28(a5)
	sd	zero, 24(a1)
	j	.LBB0_6
.LBB0_5:                                # %then_bb
	ld	a2, 40(a0)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a4, 768
	addiw	a4, a4, 17
	slli	a4, a4, 12
	addi	a4, a4, -2047
	sd	a4, 32(a0)
	sw	zero, 0(a2)
	li	a4, 1920
	sw	a4, 4(a2)
	li	t2, 3
	sw	t2, 8(a2)
	sw	zero, 12(a2)
	sw	zero, 16(a2)
	li	a4, 1080
	sw	a4, 20(a2)
	lui	a4, 1
	addiw	a4, a4, 1664
	sw	a4, 24(a2)
	sw	zero, 28(a2)
	sw	zero, 32(a2)
	sw	t2, 36(a2)
	li	a4, 1
	sw	a4, 40(a2)
	sw	zero, 44(a2)
	sd	zero, 24(a0)
	beqz	a3, .LBB0_3
.LBB0_6:                                # %after_bb1
	beqz	t1, .LBB0_9
# %bb.7:
	li	a0, 0
	beqz	a3, .LBB0_10
.LBB0_8:
	li	a1, 0
	or	a0, a0, a1
	beqz	a0, .LBB0_11
	j	.LBB0_21
.LBB0_9:                                # %land.rhs.i46
	ld	a0, 0(a0)
	seqz	a0, a0
	bnez	a3, .LBB0_8
.LBB0_10:                               # %land.rhs.i51
	ld	a1, 0(a1)
	seqz	a1, a1
	or	a0, a0, a1
	bnez	a0, .LBB0_21
.LBB0_11:                               # %"produce hist"
	mulw	a1, t0, a7
	addw	a7, a1, a6
	slli	a1, a7, 2
	sub	a2, a3, a1
	slli	t2, t0, 2
	vsetvli	a1, zero, e32, m2
	vmv.v.i	v8, 0
	li	a4, 8
	li	a6, 3
.LBB0_12:                               # %"for hist.s0.c"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
	li	a5, 32
	mv	a1, a2
.LBB0_13:                               # %"for hist.s0.i.i"
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vsetvli	zero, a4, e32, m2
	vsw.v	v8, (a1)
	addi	a5, a5, -1
	addi	a1, a1, 32
	bnez	a5, .LBB0_13
# %bb.14:                               # %"end for hist.s0.i.i"
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	a0, a0, 1
	add	a2, a2, t2
	bne	a0, a6, .LBB0_12
# %bb.15:                               # %"for hist.s1.c.preheader"
	li	t2, 0
	lui	a0, 1
	addiw	t4, a0, 1664
	li	t3, 1080
	li	a6, 3
.LBB0_16:                               # %"for hist.s1.c"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_17 Depth 2
                                        #       Child Loop BB0_18 Depth 3
	li	t5, 0
	mulw	a1, t0, t2
	subw	a2, a1, a7
	mv	t6, t1
.LBB0_17:                               # %"for hist.s1.r4$y"
                                        #   Parent Loop BB0_16 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_18 Depth 3
	li	a4, 1920
	mv	a5, t6
.LBB0_18:                               # %"for hist.s1.r4$x"
                                        #   Parent Loop BB0_16 Depth=1
                                        #     Parent Loop BB0_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lbu	a0, 0(a5)
	addw	a0, a0, a2
	slli	a0, a0, 2
	add	a0, a0, a3
	lw	a1, 0(a0)
	addiw	a1, a1, 1
	sw	a1, 0(a0)
	addi	a4, a4, -1
	addi	a5, a5, 3
	bnez	a4, .LBB0_18
# %bb.19:                               # %"end for hist.s1.r4$x"
                                        #   in Loop: Header=BB0_17 Depth=2
	addi	t5, t5, 1
	add	t6, t6, t4
	bne	t5, t3, .LBB0_17
# %bb.20:                               # %"end for hist.s1.r4$y"
                                        #   in Loop: Header=BB0_16 Depth=1
	addi	t2, t2, 1
	addi	t1, t1, 1
	bne	t2, a6, .LBB0_16
.LBB0_21:                               # %destructor_block
	li	a0, 0
	ret
.Lfunc_end0:
	.size	histogram, .Lfunc_end0-histogram
                                        # -- End function
	.section	.text.histogram_argv,"ax",@progbits
	.globl	histogram_argv                  # -- Begin function histogram_argv
	.p2align	1
	.type	histogram_argv,@function
histogram_argv:                         # @histogram_argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a2, 0(a0)
	ld	a1, 8(a0)
	mv	a0, a2
	call	histogram@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	histogram_argv, .Lfunc_end1-histogram_argv
                                        # -- End function
	.section	.text.histogram_metadata,"ax",@progbits
	.globl	histogram_metadata              # -- Begin function histogram_metadata
	.p2align	1
	.type	histogram_metadata,@function
histogram_metadata:                     # @histogram_metadata
# %bb.0:                                # %entry
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.Lhistogram_metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	ret
.Lfunc_end2:
	.size	histogram_metadata, .Lfunc_end2-histogram_metadata
                                        # -- End function
	.type	.Lstr,@object                   # @str
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr:
	.asciz	"b0"
	.size	.Lstr, 3

	.type	.L__unnamed_1,@object           # @0
	.p2align	3, 0x0
.L__unnamed_1:
	.quad	0                               # 0x0
	.size	.L__unnamed_1, 8

	.type	.L__unnamed_2,@object           # @1
	.p2align	3, 0x0
.L__unnamed_2:
	.quad	256                             # 0x100
	.size	.L__unnamed_2, 8

	.type	.L__unnamed_3,@object           # @2
	.p2align	3, 0x0
.L__unnamed_3:
	.quad	0                               # 0x0
	.size	.L__unnamed_3, 8

	.type	.L__unnamed_4,@object           # @3
	.p2align	3, 0x0
.L__unnamed_4:
	.quad	3                               # 0x3
	.size	.L__unnamed_4, 8

	.type	.L__unnamed_5,@object           # @4
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_5:
	.quad	.L__unnamed_1
	.quad	.L__unnamed_2
	.quad	.L__unnamed_3
	.quad	.L__unnamed_4
	.size	.L__unnamed_5, 32

	.type	.Lstr.4,@object                 # @str.4
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr.4:
	.asciz	"hist"
	.size	.Lstr.4, 5

	.type	.L__unnamed_6,@object           # @5
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_6:
	.quad	.Lstr
	.word	1                               # 0x1
	.word	3                               # 0x3
	.byte	1                               # 0x1
	.byte	8                               # 0x8
	.half	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lstr.4
	.word	2                               # 0x2
	.word	2                               # 0x2
	.byte	0                               # 0x0
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.L__unnamed_5
	.size	.L__unnamed_6, 128

	.type	.Lstr.5,@object                 # @str.5
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr.5:
	.asciz	"riscv-64-linux-no_asserts-no_runtime-rvv-vector_bits_128"
	.size	.Lstr.5, 57

	.type	.Lstr.6,@object                 # @str.6
	.p2align	5, 0x0
.Lstr.6:
	.asciz	"histogram"
	.size	.Lstr.6, 10

	.type	.Lhistogram_metadata_storage,@object # @histogram_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lhistogram_metadata_storage:
	.word	1                               # 0x1
	.word	2                               # 0x2
	.quad	.L__unnamed_6
	.quad	.Lstr.5
	.quad	.Lstr.6
	.size	.Lhistogram_metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.section	".note.GNU-stack","",@progbits
