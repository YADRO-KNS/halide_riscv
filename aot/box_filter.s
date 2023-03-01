	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.text.box_filter,"ax",@progbits
	.globl	box_filter                      # -- Begin function box_filter
	.p2align	1
	.type	box_filter,@function
box_filter:                             # @box_filter
# %bb.0:                                # %entry
	addi	sp, sp, -80
	sd	s0, 72(sp)                      # 8-byte Folded Spill
	sd	s1, 64(sp)                      # 8-byte Folded Spill
	sd	s2, 56(sp)                      # 8-byte Folded Spill
	sd	s3, 48(sp)                      # 8-byte Folded Spill
	sd	s4, 40(sp)                      # 8-byte Folded Spill
	sd	s5, 32(sp)                      # 8-byte Folded Spill
	sd	s6, 24(sp)                      # 8-byte Folded Spill
	ld	a2, 40(a1)
	ld	t2, 16(a0)
	ld	s3, 16(a1)
	lw	a6, 0(a2)
	lw	t0, 16(a2)
	lw	t1, 24(a2)
	bnez	t2, .LBB0_2
# %bb.1:                                # %_halide_buffer_is_bounds_query.exit
	ld	a3, 0(a0)
	beqz	a3, .LBB0_5
.LBB0_2:                                # %after_bb
	bnez	s3, .LBB0_6
.LBB0_3:                                # %_halide_buffer_is_bounds_query.exit45
	ld	a3, 0(a1)
	bnez	a3, .LBB0_6
# %bb.4:                                # %then_bb2
	sd	zero, 16(a1)
	sd	zero, 8(a1)
	sd	zero, 0(a1)
	lui	a3, 512
	addiw	a3, a3, 17
	slli	a3, a3, 12
	addi	a3, a3, 1
	sd	a3, 32(a1)
	sw	zero, 0(a2)
	li	a3, 1918
	sw	a3, 4(a2)
	li	a4, 1
	sw	a4, 8(a2)
	sw	zero, 12(a2)
	sw	zero, 16(a2)
	li	a4, 1078
	sw	a4, 20(a2)
	sw	a3, 24(a2)
	sw	zero, 28(a2)
	sd	zero, 24(a1)
	j	.LBB0_6
.LBB0_5:                                # %then_bb
	ld	a3, 40(a0)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a4, 512
	addiw	a4, a4, 17
	slli	a4, a4, 12
	addi	a4, a4, 1
	sd	a4, 32(a0)
	sw	zero, 0(a3)
	li	a4, 1920
	sw	a4, 4(a3)
	li	a5, 1
	sw	a5, 8(a3)
	sw	zero, 12(a3)
	sw	zero, 16(a3)
	li	a5, 1080
	sw	a5, 20(a3)
	sw	a4, 24(a3)
	sw	zero, 28(a3)
	sd	zero, 24(a0)
	beqz	s3, .LBB0_3
.LBB0_6:                                # %after_bb1
	beqz	t2, .LBB0_9
# %bb.7:
	li	a0, 0
	beqz	s3, .LBB0_10
.LBB0_8:
	li	a1, 0
	or	a0, a0, a1
	beqz	a0, .LBB0_11
	j	.LBB0_23
.LBB0_9:                                # %land.rhs.i52
	ld	a0, 0(a0)
	seqz	a0, a0
	bnez	s3, .LBB0_8
.LBB0_10:                               # %land.rhs.i57
	ld	a1, 0(a1)
	seqz	a1, a1
	or	a0, a0, a1
	bnez	a0, .LBB0_23
.LBB0_11:                               # %"produce box_filter"
	li	t6, 0
	lui	a0, 1
	addiw	a7, a0, -276
	add	t3, t2, a7
	add	a7, a7, s3
	vsetvli	a0, zero, e16, m1
	vmv.v.i	v8, 0
	li	s4, 8
	mv	a4, sp
	li	a2, 3
	lui	a0, 1048574
	addiw	a0, a0, 911
	vmv.v.x	v9, a0
	li	s2, 239
	li	t4, 15
	slli	t4, t4, 8
	li	t5, 1078
.LBB0_12:                               # %"for box_filter.s0.y"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
                                        #       Child Loop BB0_14 Depth 3
                                        #         Child Loop BB0_15 Depth 4
                                        #     Child Loop BB0_19 Depth 2
                                        #       Child Loop BB0_20 Depth 3
	li	a0, 0
	subw	a1, t6, t0
	mulw	a1, a1, t1
	subw	s5, a1, a6
	mv	a1, t2
.LBB0_13:                               # %"for box_filter.s0.x.x"
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_14 Depth 3
                                        #         Child Loop BB0_15 Depth 4
	li	a3, 0
	vsetvli	zero, s4, e16, m1
	vsh.v	v8, (a4)
	slli	s6, a0, 3
	mv	a5, a1
.LBB0_14:                               # %"for sum$1.s1.r60$y"
                                        #   Parent Loop BB0_12 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_15 Depth 4
	li	s0, 3
	mv	s1, a5
.LBB0_15:                               # %"for sum$1.s1.r60$x"
                                        #   Parent Loop BB0_12 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        #       Parent Loop BB0_14 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vlhu.v	v10, (a4)
	vlhu.v	v11, (s1)
	vadd.vv	v10, v10, v11
	vsh.v	v10, (a4)
	addi	s0, s0, -1
	addi	s1, s1, 2
	bnez	s0, .LBB0_15
# %bb.16:                               # %"end for sum$1.s1.r60$x"
                                        #   in Loop: Header=BB0_14 Depth=3
	addi	a3, a3, 1
	addi	a5, a5, 2047
	addi	a5, a5, 1793
	bne	a3, a2, .LBB0_14
# %bb.17:                               # %"consume sum$1"
                                        #   in Loop: Header=BB0_13 Depth=2
	vlhu.v	v10, (a4)
	vwmulu.vv	v12, v10, v9
	vsetvli	zero, zero, e32, m2
	vsrl.vi	v10, v12, 16
	vsetvli	a3, zero, e16, m1
	vnsrl.vi	v12, v10, 0
	vsetvli	zero, s4, e16, m1
	vsrl.vi	v10, v12, 3
	add	s6, s6, s5
	slli	s6, s6, 1
	add	s6, s6, s3
	vsh.v	v10, (s6)
	addi	a0, a0, 1
	addi	a1, a1, 16
	bne	a0, s2, .LBB0_13
# %bb.18:                               # %"produce sum$17"
                                        #   in Loop: Header=BB0_12 Depth=1
	li	a0, 0
	vsh.v	v8, (a4)
	mv	a1, t3
.LBB0_19:                               # %"for sum$1.s1.r60$y8"
                                        #   Parent Loop BB0_12 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_20 Depth 3
	li	a3, 3
	mv	a5, a1
.LBB0_20:                               # %"for sum$1.s1.r60$x11"
                                        #   Parent Loop BB0_12 Depth=1
                                        #     Parent Loop BB0_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vlhu.v	v10, (a4)
	vlhu.v	v11, (a5)
	vadd.vv	v10, v10, v11
	vsh.v	v10, (a4)
	addi	a3, a3, -1
	addi	a5, a5, 2
	bnez	a3, .LBB0_20
# %bb.21:                               # %"end for sum$1.s1.r60$x12"
                                        #   in Loop: Header=BB0_19 Depth=2
	addi	a0, a0, 1
	addi	a1, a1, 2047
	addi	a1, a1, 1793
	bne	a0, a2, .LBB0_19
# %bb.22:                               # %"consume sum$114"
                                        #   in Loop: Header=BB0_12 Depth=1
	vlhu.v	v10, (a4)
	vwmulu.vv	v12, v10, v9
	vsetvli	zero, zero, e32, m2
	vsrl.vi	v10, v12, 16
	vsetvli	a0, zero, e16, m1
	vnsrl.vi	v12, v10, 0
	vsetvli	zero, s4, e16, m1
	vsrl.vi	v10, v12, 3
	sub	a0, t6, t0
	mul	a0, a0, t1
	sub	a0, a0, a6
	slli	a0, a0, 1
	add	a0, a0, a7
	vsh.v	v10, (a0)
	addi	t6, t6, 1
	add	t2, t2, t4
	add	t3, t3, t4
	bne	t6, t5, .LBB0_12
.LBB0_23:                               # %destructor_block
	li	a0, 0
	ld	s0, 72(sp)                      # 8-byte Folded Reload
	ld	s1, 64(sp)                      # 8-byte Folded Reload
	ld	s2, 56(sp)                      # 8-byte Folded Reload
	ld	s3, 48(sp)                      # 8-byte Folded Reload
	ld	s4, 40(sp)                      # 8-byte Folded Reload
	ld	s5, 32(sp)                      # 8-byte Folded Reload
	ld	s6, 24(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	box_filter, .Lfunc_end0-box_filter
                                        # -- End function
	.section	.text.box_filter_argv,"ax",@progbits
	.globl	box_filter_argv                 # -- Begin function box_filter_argv
	.p2align	1
	.type	box_filter_argv,@function
box_filter_argv:                        # @box_filter_argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a2, 0(a0)
	ld	a1, 8(a0)
	mv	a0, a2
	call	box_filter@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	box_filter_argv, .Lfunc_end1-box_filter_argv
                                        # -- End function
	.section	.text.box_filter_metadata,"ax",@progbits
	.globl	box_filter_metadata             # -- Begin function box_filter_metadata
	.p2align	1
	.type	box_filter_metadata,@function
box_filter_metadata:                    # @box_filter_metadata
# %bb.0:                                # %entry
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.Lbox_filter_metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	ret
.Lfunc_end2:
	.size	box_filter_metadata, .Lfunc_end2-box_filter_metadata
                                        # -- End function
	.type	.Lstr,@object                   # @str
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr:
	.asciz	"b472"
	.size	.Lstr, 5

	.type	.L__unnamed_1,@object           # @0
	.p2align	3, 0x0
.L__unnamed_1:
	.quad	0                               # 0x0
	.size	.L__unnamed_1, 8

	.type	.L__unnamed_2,@object           # @1
	.p2align	3, 0x0
.L__unnamed_2:
	.quad	1918                            # 0x77e
	.size	.L__unnamed_2, 8

	.type	.L__unnamed_3,@object           # @2
	.p2align	3, 0x0
.L__unnamed_3:
	.quad	0                               # 0x0
	.size	.L__unnamed_3, 8

	.type	.L__unnamed_4,@object           # @3
	.p2align	3, 0x0
.L__unnamed_4:
	.quad	1078                            # 0x436
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
	.asciz	"box_filter"
	.size	.Lstr.4, 11

	.type	.L__unnamed_6,@object           # @5
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_6:
	.quad	.Lstr
	.word	1                               # 0x1
	.word	2                               # 0x2
	.byte	1                               # 0x1
	.byte	16                              # 0x10
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
	.byte	16                              # 0x10
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

	.type	.Lbox_filter_metadata_storage,@object # @box_filter_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lbox_filter_metadata_storage:
	.word	1                               # 0x1
	.word	2                               # 0x2
	.quad	.L__unnamed_6
	.quad	.Lstr.5
	.quad	.Lstr.4
	.size	.Lbox_filter_metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.section	".note.GNU-stack","",@progbits
