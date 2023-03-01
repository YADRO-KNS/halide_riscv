	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.text.bgr2gray_planar,"ax",@progbits
	.globl	bgr2gray_planar                 # -- Begin function bgr2gray_planar
	.p2align	1
	.type	bgr2gray_planar,@function
bgr2gray_planar:                        # @bgr2gray_planar
# %bb.0:                                # %entry
	addi	sp, sp, -80
	sd	s0, 72(sp)                      # 8-byte Folded Spill
	sd	s1, 64(sp)                      # 8-byte Folded Spill
	sd	s2, 56(sp)                      # 8-byte Folded Spill
	sd	s3, 48(sp)                      # 8-byte Folded Spill
	sd	s4, 40(sp)                      # 8-byte Folded Spill
	sd	s5, 32(sp)                      # 8-byte Folded Spill
	sd	s6, 24(sp)                      # 8-byte Folded Spill
	sd	s7, 16(sp)                      # 8-byte Folded Spill
	sd	s8, 8(sp)                       # 8-byte Folded Spill
	sd	s9, 0(sp)                       # 8-byte Folded Spill
	ld	a3, 40(a1)
	ld	s8, 16(a0)
	ld	t0, 16(a1)
	lw	t1, 0(a3)
	lw	t6, 4(a3)
	lw	a6, 16(a3)
	lw	a7, 20(a3)
	lw	t2, 24(a3)
	bnez	s8, .LBB0_2
# %bb.1:                                # %_halide_buffer_is_bounds_query.exit
	ld	a4, 0(a0)
	beqz	a4, .LBB0_9
.LBB0_2:                                # %after_bb
	bnez	t0, .LBB0_10
.LBB0_3:                                # %_halide_buffer_is_bounds_query.exit42
	ld	a4, 0(a1)
	bnez	a4, .LBB0_10
# %bb.4:                                # %then_bb2
	li	a5, 16
	mv	a4, t6
	blt	a5, t6, .LBB0_6
# %bb.5:                                # %then_bb2
	li	a4, 16
.LBB0_6:                                # %then_bb2
	mv	s1, t6
	blt	t6, a5, .LBB0_8
# %bb.7:                                # %then_bb2
	li	s1, 16
.LBB0_8:                                # %then_bb2
	add	s1, s1, t1
	addiw	s1, s1, -16
	sd	zero, 16(a1)
	sd	zero, 8(a1)
	sd	zero, 0(a1)
	lui	a5, 512
	addiw	a5, a5, 17
	slli	a5, a5, 12
	addi	a5, a5, -2047
	sd	a5, 32(a1)
	sw	s1, 0(a3)
	sw	a4, 4(a3)
	li	a5, 1
	sw	a5, 8(a3)
	sw	zero, 12(a3)
	sw	a6, 16(a3)
	sw	a7, 20(a3)
	sw	a4, 24(a3)
	sw	zero, 28(a3)
	sd	zero, 24(a1)
	j	.LBB0_10
.LBB0_9:                                # %then_bb
	ld	a4, 40(a0)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a5, 768
	addiw	a5, a5, 17
	slli	a5, a5, 12
	addi	a5, a5, -2047
	sd	a5, 32(a0)
	sw	zero, 0(a4)
	li	a5, 1920
	sw	a5, 4(a4)
	li	s1, 1
	sw	s1, 8(a4)
	sw	zero, 12(a4)
	sw	zero, 16(a4)
	li	s1, 1080
	sw	s1, 20(a4)
	sw	a5, 24(a4)
	sw	zero, 28(a4)
	sw	zero, 32(a4)
	li	a5, 3
	sw	a5, 36(a4)
	lui	a5, 506
	addiw	a5, a5, 1024
	sw	a5, 40(a4)
	sw	zero, 44(a4)
	sd	zero, 24(a0)
	beqz	t0, .LBB0_3
.LBB0_10:                               # %after_bb1
	beqz	s8, .LBB0_13
# %bb.11:
	li	a0, 0
	beqz	t0, .LBB0_14
.LBB0_12:
	li	a1, 0
	or	a0, a0, a1
	beqz	a0, .LBB0_15
	j	.LBB0_24
.LBB0_13:                               # %land.rhs.i49
	ld	a0, 0(a0)
	seqz	a0, a0
	bnez	t0, .LBB0_12
.LBB0_14:                               # %land.rhs.i54
	ld	a1, 0(a1)
	seqz	a1, a1
	or	a0, a0, a1
	bnez	a0, .LBB0_24
.LBB0_15:                               # %"produce bgr2gray"
	blez	a7, .LBB0_24
# %bb.16:                               # %"for bgr2gray.s0.y.rebased.preheader"
	li	s6, 0
	li	s7, 0
	srliw	a0, t6, 4
	slti	a1, t6, 16
	addi	a1, a1, -1
	and	t5, a1, a0
	addiw	a0, t6, 15
	sraiw	a0, a0, 4
	sub	s4, a0, t5
	addi	t3, t0, -16
	li	t4, 1920
	li	a4, 16
	lui	a0, 506
	addiw	s9, a0, 1024
	li	a1, -106
	vsetvli	a3, zero, e8, m1
	vmv.v.x	v8, a1
	li	a1, 29
	vmv.v.x	v9, a1
	lui	a1, 1013
	addiw	s0, a1, -2048
	li	a1, 77
	vmv.v.x	v10, a1
	addiw	s2, a0, 1008
	lui	a0, 1012
	addiw	s3, a0, 2032
.LBB0_17:                               # %"for bgr2gray.s0.y.rebased"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
                                        #     Child Loop BB0_22 Depth 2
	add	a0, s7, a6
	mul	s5, a0, t4
	blt	t6, a4, .LBB0_20
# %bb.18:                               # %"for bgr2gray.s0.x.x.preheader"
                                        #   in Loop: Header=BB0_17 Depth=1
	li	a2, 0
	add	a0, t0, s6
	add	s1, s5, t1
	mv	a1, t5
.LBB0_19:                               # %"for bgr2gray.s0.x.x"
                                        #   Parent Loop BB0_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a3, s1, a2
	add	a3, a3, s8
	add	a5, a3, s9
	vsetvli	zero, a4, e8, m1
	vlbu.v	v11, (a5)
	vlbu.v	v12, (a3)
	add	a3, a3, s0
	vlbu.v	v13, (a3)
	vwmulu.vv	v14, v11, v8
	vwmulu.vv	v16, v12, v9
	vwmulu.vv	v18, v13, v10
	vsetvli	zero, zero, e16, m2
	vadd.vv	v12, v16, v18
	vadd.vv	v12, v14, v12
	vsrl.vi	v12, v12, 8
	vsetvli	a3, zero, e8, m1
	vnsrl.vi	v11, v12, 0
	vsetvli	zero, a4, e8, m1
	vsb.v	v11, (a0)
	addi	a1, a1, -1
	addi	a0, a0, 16
	addiw	a2, a2, 16
	bnez	a1, .LBB0_19
.LBB0_20:                               # %"end for bgr2gray.s0.x.x"
                                        #   in Loop: Header=BB0_17 Depth=1
	blez	s4, .LBB0_23
# %bb.21:                               # %"for bgr2gray.s0.x.x7.preheader"
                                        #   in Loop: Header=BB0_17 Depth=1
	add	s5, s5, t1
	addw	a0, s5, t6
	mulw	a1, t2, s7
	add	a0, a0, s8
	add	a2, a0, s2
	vsetvli	zero, a4, e8, m1
	vlbu.v	v11, (a2)
	addi	a2, a0, -16
	vlbu.v	v12, (a2)
	add	a0, a0, s3
	vlbu.v	v13, (a0)
	addw	a0, a1, t6
	vwmulu.vv	v14, v11, v8
	vwmulu.vv	v16, v12, v9
	vwmulu.vv	v18, v13, v10
	vsetvli	zero, zero, e16, m2
	vadd.vv	v12, v16, v18
	vadd.vv	v12, v14, v12
	vsrl.vi	v12, v12, 8
	vsetvli	a1, zero, e8, m1
	vnsrl.vi	v11, v12, 0
	add	a0, a0, t3
	mv	a1, s4
.LBB0_22:                               # %"for bgr2gray.s0.x.x7"
                                        #   Parent Loop BB0_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vsetvli	zero, a4, e8, m1
	addiw	a1, a1, -1
	vsb.v	v11, (a0)
	bnez	a1, .LBB0_22
.LBB0_23:                               # %"end for bgr2gray.s0.x.x8"
                                        #   in Loop: Header=BB0_17 Depth=1
	addi	s7, s7, 1
	addw	s6, s6, t2
	bne	s7, a7, .LBB0_17
.LBB0_24:                               # %destructor_block
	li	a0, 0
	ld	s0, 72(sp)                      # 8-byte Folded Reload
	ld	s1, 64(sp)                      # 8-byte Folded Reload
	ld	s2, 56(sp)                      # 8-byte Folded Reload
	ld	s3, 48(sp)                      # 8-byte Folded Reload
	ld	s4, 40(sp)                      # 8-byte Folded Reload
	ld	s5, 32(sp)                      # 8-byte Folded Reload
	ld	s6, 24(sp)                      # 8-byte Folded Reload
	ld	s7, 16(sp)                      # 8-byte Folded Reload
	ld	s8, 8(sp)                       # 8-byte Folded Reload
	ld	s9, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	bgr2gray_planar, .Lfunc_end0-bgr2gray_planar
                                        # -- End function
	.section	.text.bgr2gray_planar_argv,"ax",@progbits
	.globl	bgr2gray_planar_argv            # -- Begin function bgr2gray_planar_argv
	.p2align	1
	.type	bgr2gray_planar_argv,@function
bgr2gray_planar_argv:                   # @bgr2gray_planar_argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a2, 0(a0)
	ld	a1, 8(a0)
	mv	a0, a2
	call	bgr2gray_planar@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	bgr2gray_planar_argv, .Lfunc_end1-bgr2gray_planar_argv
                                        # -- End function
	.section	.text.bgr2gray_planar_metadata,"ax",@progbits
	.globl	bgr2gray_planar_metadata        # -- Begin function bgr2gray_planar_metadata
	.p2align	1
	.type	bgr2gray_planar_metadata,@function
bgr2gray_planar_metadata:               # @bgr2gray_planar_metadata
# %bb.0:                                # %entry
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.Lbgr2gray_planar_metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	ret
.Lfunc_end2:
	.size	bgr2gray_planar_metadata, .Lfunc_end2-bgr2gray_planar_metadata
                                        # -- End function
	.type	.Lstr,@object                   # @str
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr:
	.asciz	"b0"
	.size	.Lstr, 3

	.type	.L__unnamed_1,@object           # @0
	.p2align	4, 0x0
.L__unnamed_1:
	.zero	32
	.size	.L__unnamed_1, 32

	.type	.Lstr.4,@object                 # @str.4
	.p2align	5, 0x0
.Lstr.4:
	.asciz	"bgr2gray"
	.size	.Lstr.4, 9

	.type	.L__unnamed_2,@object           # @1
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_2:
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
	.quad	.L__unnamed_1
	.size	.L__unnamed_2, 128

	.type	.Lstr.5,@object                 # @str.5
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr.5:
	.asciz	"riscv-64-linux-no_asserts-no_runtime-rvv-vector_bits_128"
	.size	.Lstr.5, 57

	.type	.Lstr.6,@object                 # @str.6
	.p2align	5, 0x0
.Lstr.6:
	.asciz	"bgr2gray_planar"
	.size	.Lstr.6, 16

	.type	.Lbgr2gray_planar_metadata_storage,@object # @bgr2gray_planar_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lbgr2gray_planar_metadata_storage:
	.word	1                               # 0x1
	.word	2                               # 0x2
	.quad	.L__unnamed_2
	.quad	.Lstr.5
	.quad	.Lstr.6
	.size	.Lbgr2gray_planar_metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.section	".note.GNU-stack","",@progbits
