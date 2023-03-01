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
	addi	sp, sp, -2032
	sd	s0, 2024(sp)                    # 8-byte Folded Spill
	sd	s1, 2016(sp)                    # 8-byte Folded Spill
	sd	s2, 2008(sp)                    # 8-byte Folded Spill
	sd	s3, 2000(sp)                    # 8-byte Folded Spill
	lui	a2, 2
	addiw	a2, a2, 1344
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
	li	a3, 3
	sw	a3, 8(a2)
	sw	zero, 12(a2)
	sw	zero, 16(a2)
	li	s1, 1080
	sw	s1, 20(a2)
	lui	s1, 1
	addiw	s1, s1, 1664
	sw	s1, 24(a2)
	sw	zero, 28(a2)
	sw	zero, 32(a2)
	sw	a3, 36(a2)
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
	li	a3, 1920
	sw	a3, 4(a2)
	li	s1, 1
	sw	s1, 8(a2)
	sw	zero, 12(a2)
	sw	zero, 16(a2)
	li	s1, 1080
	sw	s1, 20(a2)
	sw	a3, 24(a2)
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
	li	t1, 0
	addi	t2, a4, 1
	mulw	a0, a7, a5
	negw	a1, a6
	subw	a6, a1, a0
	lui	t5, 2
	li	a3, 16
	li	t6, 29
	li	a0, 15
	slli	a0, a0, 9
	li	s2, 77
	li	s3, 150
	lui	a2, 1
	addiw	t3, a2, 1664
	li	t4, 1080
.LBB0_12:                               # %"for bgr2gray.s0.y"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
                                        #     Child Loop BB0_15 Depth 2
	add	a5, t0, a6
	li	a2, 1920
	addi	s0, sp, 16
	mv	s1, t2
.LBB0_13:                               # %"for planar.s0.x"
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lbu	a4, -1(s1)
	sh	a4, 0(s0)
	lbu	a4, 0(s1)
	addi	a1, s0, 2047
	sh	a4, 1793(a1)
	lbu	a1, 1(s1)
	add	a4, s0, t5
	sh	a1, -512(a4)
	addi	a2, a2, -1
	addi	s0, s0, 2
	addi	s1, s1, 3
	bnez	a2, .LBB0_13
# %bb.14:                               # %"consume planar"
                                        #   in Loop: Header=BB0_12 Depth=1
	li	a2, 120
	addi	s0, sp, 16
.LBB0_15:                               # %"for bgr2gray.s0.x.x"
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vsetvli	zero, a3, e16, m2
	add	a1, s0, a0
	vlhu.v	v8, (a1)
	addi	a1, s0, 2047
	vlhu.v	v10, (s0)
	addi	a1, a1, 1793
	vlhu.v	v12, (a1)
	vmul.vx	v10, v10, t6
	vmadd.vx	v8, s2, v10
	vmacc.vx	v8, s3, v12
	vsrl.vi	v8, v8, 8
	vsetvli	a1, zero, e8, m1
	vnsrl.vi	v10, v8, 0
	vsetvli	zero, a3, e8, m1
	vsb.v	v10, (a5)
	addi	a2, a2, -1
	addi	a5, a5, 16
	addi	s0, s0, 32
	bnez	a2, .LBB0_15
# %bb.16:                               # %"end for bgr2gray.s0.x.x"
                                        #   in Loop: Header=BB0_12 Depth=1
	addi	t1, t1, 1
	add	t2, t2, t3
	addw	a6, a6, a7
	bne	t1, t4, .LBB0_12
.LBB0_17:                               # %destructor_block
	li	a0, 0
	lui	a1, 2
	addiw	a1, a1, 1344
	add	sp, sp, a1
	ld	s0, 2024(sp)                    # 8-byte Folded Reload
	ld	s1, 2016(sp)                    # 8-byte Folded Reload
	ld	s2, 2008(sp)                    # 8-byte Folded Reload
	ld	s3, 2000(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 2032
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
