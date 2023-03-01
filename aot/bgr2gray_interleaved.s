	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.text.bgr2gray_interleaved,"ax",@progbits
	.globl	bgr2gray_interleaved            # -- Begin function bgr2gray_interleaved
	.p2align	1
	.type	bgr2gray_interleaved,@function
bgr2gray_interleaved:                   # @bgr2gray_interleaved
# %bb.0:                                # %entry
	lui	a2, 1
	addiw	a2, a2, 1680
	sub	sp, sp, a2
	ld	a2, 40(a1)
	ld	t0, 16(a1)
	lw	a6, 0(a2)
	lw	a5, 16(a2)
	lw	a7, 24(a2)
	ld	a4, 16(a0)
	bnez	t0, .LBB0_2
# %bb.1:                                # %_halide_buffer_is_bounds_query.exit
	ld	a3, 0(a1)
	beqz	a3, .LBB0_5
.LBB0_2:                                # %after_bb
	bnez	a4, .LBB0_6
.LBB0_3:                                # %_halide_buffer_is_bounds_query.exit36
	ld	a2, 0(a0)
	bnez	a2, .LBB0_6
# %bb.4:                                # %then_bb2
	ld	a2, 40(a0)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a3, 768
	addiw	a3, a3, 17
	slli	a3, a3, 12
	addi	a3, a3, -2047
	sd	a3, 32(a0)
	sw	zero, 0(a2)
	li	a3, 1920
	sw	a3, 4(a2)
	li	t1, 3
	sw	t1, 8(a2)
	sw	zero, 12(a2)
	sw	zero, 16(a2)
	li	a3, 1080
	sw	a3, 20(a2)
	lui	a3, 1
	addiw	a3, a3, 1664
	sw	a3, 24(a2)
	sw	zero, 28(a2)
	sw	zero, 32(a2)
	sw	t1, 36(a2)
	li	a3, 1
	sw	a3, 40(a2)
	sw	zero, 44(a2)
	sd	zero, 24(a0)
	j	.LBB0_6
.LBB0_5:                                # %then_bb
	sd	zero, 16(a1)
	sd	zero, 8(a1)
	sd	zero, 0(a1)
	lui	a3, 512
	addiw	a3, a3, 17
	slli	a3, a3, 12
	addi	a3, a3, -2047
	sd	a3, 32(a1)
	sw	zero, 0(a2)
	li	t1, 1920
	sw	t1, 4(a2)
	li	a3, 1
	sw	a3, 8(a2)
	sw	zero, 12(a2)
	sw	zero, 16(a2)
	li	a3, 1080
	sw	a3, 20(a2)
	sw	t1, 24(a2)
	sw	zero, 28(a2)
	sd	zero, 24(a1)
	beqz	a4, .LBB0_3
.LBB0_6:                                # %after_bb1
	beqz	t0, .LBB0_9
# %bb.7:
	li	a1, 0
	beqz	a4, .LBB0_10
.LBB0_8:
	li	a0, 0
	or	a0, a0, a1
	beqz	a0, .LBB0_11
	j	.LBB0_17
.LBB0_9:                                # %land.rhs.i43
	ld	a1, 0(a1)
	seqz	a1, a1
	bnez	a4, .LBB0_8
.LBB0_10:                               # %land.rhs.i48
	ld	a0, 0(a0)
	seqz	a0, a0
	or	a0, a0, a1
	bnez	a0, .LBB0_17
.LBB0_11:                               # %"for bgr2gray.s0.y.preheader"
	li	t3, 0
	addi	t4, a4, 2
	addi	t1, sp, 1936
	mulw	a0, a7, a5
	negw	a1, a6
	subw	t5, a1, a0
	li	a3, 16
	li	a0, -106
	vsetvli	a2, zero, e8, m1
	vmv.v.x	v8, a0
	li	a0, 29
	vmv.v.x	v9, a0
	li	a0, 77
	vmv.v.x	v10, a0
	lui	a0, 1
	addiw	t2, a0, 1664
	li	a6, 1080
.LBB0_12:                               # %"for bgr2gray.s0.y"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
                                        #     Child Loop BB0_15 Depth 2
	add	a5, t0, t5
	li	a0, 1920
	mv	a2, t1
	mv	a4, t4
.LBB0_13:                               # %"for planar.s0.x"
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lb	a1, -2(a4)
	sb	a1, -1920(a2)
	lb	a1, -1(a4)
	sb	a1, 0(a2)
	lb	a1, 0(a4)
	sb	a1, 1920(a2)
	addi	a0, a0, -1
	addi	a4, a4, 3
	addi	a2, a2, 1
	bnez	a0, .LBB0_13
# %bb.14:                               # %"consume planar"
                                        #   in Loop: Header=BB0_12 Depth=1
	li	a2, 120
	mv	a0, t1
.LBB0_15:                               # %"for bgr2gray.s0.x.x"
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a1, a0, -1920
	vsetvli	zero, a3, e8, m1
	vlbu.v	v11, (a0)
	vlbu.v	v12, (a1)
	addi	a1, a0, 1920
	vlbu.v	v13, (a1)
	vwmulu.vv	v14, v11, v8
	vwmulu.vv	v16, v12, v9
	vwmulu.vv	v18, v13, v10
	vsetvli	zero, zero, e16, m2
	vadd.vv	v12, v16, v18
	vadd.vv	v12, v14, v12
	vsrl.vi	v12, v12, 8
	vsetvli	a1, zero, e8, m1
	vnsrl.vi	v11, v12, 0
	vsetvli	zero, a3, e8, m1
	vsb.v	v11, (a5)
	addi	a2, a2, -1
	addi	a5, a5, 16
	addi	a0, a0, 16
	bnez	a2, .LBB0_15
# %bb.16:                               # %"end for bgr2gray.s0.x.x"
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	t3, t3, 1
	add	t4, t4, t2
	addw	t5, t5, a7
	bne	t3, a6, .LBB0_12
.LBB0_17:                               # %destructor_block
	li	a0, 0
	lui	a1, 1
	addiw	a1, a1, 1680
	add	sp, sp, a1
	ret
.Lfunc_end0:
	.size	bgr2gray_interleaved, .Lfunc_end0-bgr2gray_interleaved
                                        # -- End function
	.section	.text.bgr2gray_interleaved_argv,"ax",@progbits
	.globl	bgr2gray_interleaved_argv       # -- Begin function bgr2gray_interleaved_argv
	.p2align	1
	.type	bgr2gray_interleaved_argv,@function
bgr2gray_interleaved_argv:              # @bgr2gray_interleaved_argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a2, 0(a0)
	ld	a1, 8(a0)
	mv	a0, a2
	call	bgr2gray_interleaved@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	bgr2gray_interleaved_argv, .Lfunc_end1-bgr2gray_interleaved_argv
                                        # -- End function
	.section	.text.bgr2gray_interleaved_metadata,"ax",@progbits
	.globl	bgr2gray_interleaved_metadata   # -- Begin function bgr2gray_interleaved_metadata
	.p2align	1
	.type	bgr2gray_interleaved_metadata,@function
bgr2gray_interleaved_metadata:          # @bgr2gray_interleaved_metadata
# %bb.0:                                # %entry
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.Lbgr2gray_interleaved_metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	ret
.Lfunc_end2:
	.size	bgr2gray_interleaved_metadata, .Lfunc_end2-bgr2gray_interleaved_metadata
                                        # -- End function
	.type	.Lstr,@object                   # @str
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr:
	.asciz	"input"
	.size	.Lstr, 6

	.type	.L__unnamed_1,@object           # @0
	.p2align	3, 0x0
.L__unnamed_1:
	.quad	0                               # 0x0
	.size	.L__unnamed_1, 8

	.type	.L__unnamed_2,@object           # @1
	.p2align	3, 0x0
.L__unnamed_2:
	.quad	1920                            # 0x780
	.size	.L__unnamed_2, 8

	.type	.L__unnamed_3,@object           # @2
	.p2align	3, 0x0
.L__unnamed_3:
	.quad	0                               # 0x0
	.size	.L__unnamed_3, 8

	.type	.L__unnamed_4,@object           # @3
	.p2align	3, 0x0
.L__unnamed_4:
	.quad	1080                            # 0x438
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
	.asciz	"bgr2gray"
	.size	.Lstr.4, 9

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
	.byte	1                               # 0x1
	.byte	8                               # 0x8
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
	.asciz	"bgr2gray_interleaved"
	.size	.Lstr.6, 21

	.type	.Lbgr2gray_interleaved_metadata_storage,@object # @bgr2gray_interleaved_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lbgr2gray_interleaved_metadata_storage:
	.word	1                               # 0x1
	.word	2                               # 0x2
	.quad	.L__unnamed_6
	.quad	.Lstr.5
	.quad	.Lstr.6
	.size	.Lbgr2gray_interleaved_metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.section	".note.GNU-stack","",@progbits
