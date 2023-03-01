	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.text.convolution_nhwc,"ax",@progbits
	.globl	convolution_nhwc                # -- Begin function convolution_nhwc
	.p2align	1
	.type	convolution_nhwc,@function
convolution_nhwc:                       # @convolution_nhwc
# %bb.0:                                # %entry
	addi	sp, sp, -400
	sd	s0, 392(sp)                     # 8-byte Folded Spill
	sd	s1, 384(sp)                     # 8-byte Folded Spill
	sd	s2, 376(sp)                     # 8-byte Folded Spill
	sd	s3, 368(sp)                     # 8-byte Folded Spill
	sd	s4, 360(sp)                     # 8-byte Folded Spill
	sd	s5, 352(sp)                     # 8-byte Folded Spill
	sd	s6, 344(sp)                     # 8-byte Folded Spill
	sd	s7, 336(sp)                     # 8-byte Folded Spill
	sd	s8, 328(sp)                     # 8-byte Folded Spill
	ld	a3, 40(a2)
	ld	t6, 16(a2)
	lw	t0, 0(a3)
	lw	t1, 16(a3)
	lw	a7, 24(a3)
	lw	t2, 32(a3)
	lw	a6, 40(a3)
	lw	t3, 48(a3)
	lw	t4, 56(a3)
	ld	s6, 16(a0)
	mv	t5, t6
	beqz	t6, .LBB0_6
# %bb.1:                                # %after_bb
	ld	s2, 16(a1)
	mv	a3, s6
	beqz	s6, .LBB0_12
.LBB0_2:                                # %after_bb1
	beqz	s2, .LBB0_14
.LBB0_3:
	li	a1, 0
	beqz	t5, .LBB0_16
.LBB0_4:
	li	a2, 0
	beqz	a3, .LBB0_17
.LBB0_5:
	li	a0, 0
	or	a0, a0, a1
	or	a0, a0, a2
	beqz	a0, .LBB0_18
	j	.LBB0_34
.LBB0_6:                                # %_halide_buffer_is_bounds_query.exit
	ld	a4, 0(a2)
	beqz	a4, .LBB0_8
# %bb.7:
	li	t5, 0
	ld	s2, 16(a1)
	mv	a3, s6
	bnez	s6, .LBB0_2
	j	.LBB0_12
.LBB0_8:                                # %then_bb
	sw	zero, 0(sp)
	li	a4, 32
	sw	a4, 4(sp)
	li	a5, 1
	sw	a5, 8(sp)
	sw	zero, 12(sp)
	sw	zero, 16(sp)
	li	s1, 126
	sw	s1, 20(sp)
	sw	a4, 24(sp)
	sw	zero, 28(sp)
	sw	zero, 32(sp)
	sw	s1, 36(sp)
	lui	a4, 1
	addiw	a4, a4, -64
	sw	a4, 40(sp)
	sw	zero, 44(sp)
	sw	zero, 48(sp)
	sw	a5, 52(sp)
	lui	a4, 124
	addiw	a4, a4, 128
	sw	a4, 56(sp)
	sw	zero, 60(sp)
	sd	zero, 16(a2)
	sd	zero, 8(a2)
	sd	zero, 0(a2)
	lui	a4, 512
	addiw	a4, a4, 9
	slli	a4, a4, 13
	addi	a5, a4, 2
	mv	a4, sp
	sd	a5, 32(a2)
	beq	a4, a3, .LBB0_11
# %bb.9:                                # %for.body.i.preheader
	li	a5, 4
	li	s1, 4
.LBB0_10:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a5, e32, m1
	vlwu.v	v8, (a4)
	vsw.v	v8, (a3)
	addi	s1, s1, -1
	addi	a3, a3, 16
	addi	a4, a4, 16
	bnez	s1, .LBB0_10
.LBB0_11:                               # %_halide_buffer_init.exit
	li	t5, 0
	sd	zero, 24(a2)
	ld	s2, 16(a1)
	mv	a3, s6
	bnez	s6, .LBB0_2
.LBB0_12:                               # %_halide_buffer_is_bounds_query.exit86
	ld	a3, 0(a0)
	beqz	a3, .LBB0_35
# %bb.13:
	li	a3, 0
	bnez	s2, .LBB0_3
.LBB0_14:                               # %_halide_buffer_is_bounds_query.exit94
	ld	a4, 0(a1)
	beqz	a4, .LBB0_39
# %bb.15:                               # %land.rhs.i116
	ld	a1, 0(a1)
	seqz	a1, a1
	bnez	t5, .LBB0_4
.LBB0_16:                               # %land.rhs.i121
	ld	a2, 0(a2)
	seqz	a2, a2
	bnez	a3, .LBB0_5
.LBB0_17:                               # %land.rhs.i126
	ld	a0, 0(a0)
	seqz	a0, a0
	or	a0, a0, a1
	or	a0, a0, a2
	bnez	a0, .LBB0_34
.LBB0_18:                               # %"produce convolution_nhwc"
	li	s4, 0
	mulw	a0, a7, t1
	mulw	a1, a6, t2
	mulw	a2, t4, t3
	add	a0, a0, a1
	add	a0, a0, a2
	add	a0, a0, t0
	negw	t0, a0
	vsetvli	a0, zero, e32, m1
	vmv.v.i	v8, 0
	li	t3, 4
	li	a1, 3
	li	t4, 16
	li	t1, 126
.LBB0_19:                               # %"for convolution_nhwc.s0.y"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
                                        #       Child Loop BB0_21 Depth 3
                                        #       Child Loop BB0_23 Depth 3
                                        #         Child Loop BB0_24 Depth 4
                                        #           Child Loop BB0_25 Depth 5
                                        #             Child Loop BB0_26 Depth 6
                                        #       Child Loop BB0_31 Depth 3
	li	s0, 0
	mv	t2, t0
.LBB0_20:                               # %"for convolution_nhwc.s0.x"
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_21 Depth 3
                                        #       Child Loop BB0_23 Depth 3
                                        #         Child Loop BB0_24 Depth 4
                                        #           Child Loop BB0_25 Depth 5
                                        #             Child Loop BB0_26 Depth 6
                                        #       Child Loop BB0_31 Depth 3
	slli	t5, t2, 2
	add	t5, t5, t6
	li	a0, 8
	addi	a2, sp, 192
.LBB0_21:                               # %"for sum.s0.c.c_vo"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vsetvli	zero, t3, e32, m1
	vsw.v	v8, (a2)
	addi	a0, a0, -1
	addi	a2, a2, 16
	bnez	a0, .LBB0_21
# %bb.22:                               # %"for sum.s1.r4$z.preheader"
                                        #   in Loop: Header=BB0_20 Depth=2
	li	s5, 0
	mv	s3, s2
.LBB0_23:                               # %"for sum.s1.r4$z"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_24 Depth 4
                                        #           Child Loop BB0_25 Depth 5
                                        #             Child Loop BB0_26 Depth 6
	li	s8, 0
	mv	s7, s3
.LBB0_24:                               # %"for sum.s1.r4$y"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_23 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB0_25 Depth 5
                                        #             Child Loop BB0_26 Depth 6
	li	a4, 0
	add	a0, s8, s4
	slli	a0, a0, 11
	add	s1, a0, s5
	mv	a3, s7
.LBB0_25:                               # %"for sum.s1.r4$x"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_23 Depth=3
                                        #         Parent Loop BB0_24 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB0_26 Depth 6
	add	a0, a4, s0
	slli	a0, a0, 4
	add	a0, a0, s1
	slli	a0, a0, 2
	add	a0, a0, s6
	flw	ft0, 0(a0)
	li	a5, 8
	addi	a0, sp, 192
	mv	a2, a3
.LBB0_26:                               # %"for sum.s1.c.c_vo"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_23 Depth=3
                                        #         Parent Loop BB0_24 Depth=4
                                        #           Parent Loop BB0_25 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	vlwu.v	v9, (a2)
	vlwu.v	v10, (a0)
	vfmul.vf	v9, v9, ft0
	vfadd.vv	v9, v10, v9
	vsw.v	v9, (a0)
	addi	a5, a5, -1
	addi	a2, a2, 16
	addi	a0, a0, 16
	bnez	a5, .LBB0_26
# %bb.27:                               # %"end for sum.s1.c.c_vo"
                                        #   in Loop: Header=BB0_25 Depth=5
	addi	a4, a4, 1
	addi	a3, a3, 128
	bne	a4, a1, .LBB0_25
# %bb.28:                               # %"end for sum.s1.r4$x"
                                        #   in Loop: Header=BB0_24 Depth=4
	addi	s8, s8, 1
	addi	s7, s7, 384
	bne	s8, a1, .LBB0_24
# %bb.29:                               # %"end for sum.s1.r4$y"
                                        #   in Loop: Header=BB0_23 Depth=3
	addi	s5, s5, 1
	addi	s3, s3, 1152
	bne	s5, t4, .LBB0_23
# %bb.30:                               # %"consume sum"
                                        #   in Loop: Header=BB0_20 Depth=2
	li	a0, 8
	addi	a2, sp, 192
.LBB0_31:                               # %"for convolution_nhwc.s0.c.c_vo"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vlwu.v	v9, (a2)
	vsw.v	v9, (t5)
	addi	a0, a0, -1
	addi	t5, t5, 16
	addi	a2, a2, 16
	bnez	a0, .LBB0_31
# %bb.32:                               # %"end for convolution_nhwc.s0.c.c_vo"
                                        #   in Loop: Header=BB0_20 Depth=2
	addi	s0, s0, 1
	addw	t2, t2, a7
	bne	s0, t1, .LBB0_20
# %bb.33:                               # %"end for convolution_nhwc.s0.x"
                                        #   in Loop: Header=BB0_19 Depth=1
	addi	s4, s4, 1
	addw	t0, t0, a6
	bne	s4, t1, .LBB0_19
.LBB0_34:                               # %destructor_block
	li	a0, 0
	ld	s0, 392(sp)                     # 8-byte Folded Reload
	ld	s1, 384(sp)                     # 8-byte Folded Reload
	ld	s2, 376(sp)                     # 8-byte Folded Reload
	ld	s3, 368(sp)                     # 8-byte Folded Reload
	ld	s4, 360(sp)                     # 8-byte Folded Reload
	ld	s5, 352(sp)                     # 8-byte Folded Reload
	ld	s6, 344(sp)                     # 8-byte Folded Reload
	ld	s7, 336(sp)                     # 8-byte Folded Reload
	ld	s8, 328(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 400
	ret
.LBB0_35:                               # %then_bb2
	ld	a3, 40(a0)
	sw	zero, 64(sp)
	li	a4, 16
	sw	a4, 68(sp)
	li	a5, 1
	sw	a5, 72(sp)
	sw	zero, 76(sp)
	sw	zero, 80(sp)
	li	s0, 128
	sw	s0, 84(sp)
	sw	a4, 88(sp)
	sw	zero, 92(sp)
	sw	zero, 96(sp)
	sw	s0, 100(sp)
	slli	a4, a5, 11
	sw	a4, 104(sp)
	sw	zero, 108(sp)
	sw	zero, 112(sp)
	sw	a5, 116(sp)
	lui	a4, 64
	sw	a4, 120(sp)
	sw	zero, 124(sp)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a4, 512
	addiw	a4, a4, 9
	slli	a4, a4, 13
	addi	a5, a4, 2
	addi	a4, sp, 64
	sd	a5, 32(a0)
	beq	a4, a3, .LBB0_38
# %bb.36:                               # %for.body.i110.preheader
	li	a5, 4
	li	s0, 4
.LBB0_37:                               # %for.body.i110
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a5, e32, m1
	vlwu.v	v8, (a4)
	vsw.v	v8, (a3)
	addi	s0, s0, -1
	addi	a3, a3, 16
	addi	a4, a4, 16
	bnez	s0, .LBB0_37
.LBB0_38:                               # %_halide_buffer_init.exit112
	li	a3, 0
	sd	zero, 24(a0)
	bnez	s2, .LBB0_3
	j	.LBB0_14
.LBB0_39:                               # %then_bb5
	ld	a4, 40(a1)
	sw	zero, 128(sp)
	li	a5, 32
	sw	a5, 132(sp)
	li	s0, 1
	sw	s0, 136(sp)
	sw	zero, 140(sp)
	sw	zero, 144(sp)
	li	s0, 3
	sw	s0, 148(sp)
	sw	a5, 152(sp)
	sw	zero, 156(sp)
	sw	zero, 160(sp)
	sw	s0, 164(sp)
	li	a5, 96
	sw	a5, 168(sp)
	sw	zero, 172(sp)
	sw	zero, 176(sp)
	li	a5, 16
	sw	a5, 180(sp)
	li	a5, 288
	sw	a5, 184(sp)
	sw	zero, 188(sp)
	sd	zero, 16(a1)
	sd	zero, 8(a1)
	sd	zero, 0(a1)
	lui	a5, 512
	addiw	a5, a5, 9
	slli	a5, a5, 13
	addi	a5, a5, 2
	addi	s0, sp, 128
	sd	a5, 32(a1)
	beq	s0, a4, .LBB0_42
# %bb.40:                               # %for.body.i143.preheader
	li	a5, 4
	li	s1, 4
.LBB0_41:                               # %for.body.i143
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a5, e32, m1
	vlwu.v	v8, (s0)
	vsw.v	v8, (a4)
	addi	s1, s1, -1
	addi	a4, a4, 16
	addi	s0, s0, 16
	bnez	s1, .LBB0_41
.LBB0_42:                               # %_halide_buffer_init.exit145
	sd	zero, 24(a1)
	ld	a1, 0(a1)
	seqz	a1, a1
	bnez	t5, .LBB0_4
	j	.LBB0_16
.Lfunc_end0:
	.size	convolution_nhwc, .Lfunc_end0-convolution_nhwc
                                        # -- End function
	.section	.text.convolution_nhwc_argv,"ax",@progbits
	.globl	convolution_nhwc_argv           # -- Begin function convolution_nhwc_argv
	.p2align	1
	.type	convolution_nhwc_argv,@function
convolution_nhwc_argv:                  # @convolution_nhwc_argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a3, 0(a0)
	ld	a1, 8(a0)
	ld	a2, 16(a0)
	mv	a0, a3
	call	convolution_nhwc@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	convolution_nhwc_argv, .Lfunc_end1-convolution_nhwc_argv
                                        # -- End function
	.section	.text.convolution_nhwc_metadata,"ax",@progbits
	.globl	convolution_nhwc_metadata       # -- Begin function convolution_nhwc_metadata
	.p2align	1
	.type	convolution_nhwc_metadata,@function
convolution_nhwc_metadata:              # @convolution_nhwc_metadata
# %bb.0:                                # %entry
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.Lconvolution_nhwc_metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	ret
.Lfunc_end2:
	.size	convolution_nhwc_metadata, .Lfunc_end2-convolution_nhwc_metadata
                                        # -- End function
	.type	.Lstr,@object                   # @str
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr:
	.asciz	"input"
	.size	.Lstr, 6

	.type	.Lstr.4,@object                 # @str.4
	.p2align	5, 0x0
.Lstr.4:
	.asciz	"weights"
	.size	.Lstr.4, 8

	.type	.L__unnamed_1,@object           # @0
	.p2align	3, 0x0
.L__unnamed_1:
	.quad	0                               # 0x0
	.size	.L__unnamed_1, 8

	.type	.L__unnamed_2,@object           # @1
	.p2align	3, 0x0
.L__unnamed_2:
	.quad	32                              # 0x20
	.size	.L__unnamed_2, 8

	.type	.L__unnamed_3,@object           # @2
	.p2align	3, 0x0
.L__unnamed_3:
	.quad	0                               # 0x0
	.size	.L__unnamed_3, 8

	.type	.L__unnamed_4,@object           # @3
	.p2align	3, 0x0
.L__unnamed_4:
	.quad	126                             # 0x7e
	.size	.L__unnamed_4, 8

	.type	.L__unnamed_5,@object           # @4
	.p2align	3, 0x0
.L__unnamed_5:
	.quad	0                               # 0x0
	.size	.L__unnamed_5, 8

	.type	.L__unnamed_6,@object           # @5
	.p2align	3, 0x0
.L__unnamed_6:
	.quad	126                             # 0x7e
	.size	.L__unnamed_6, 8

	.type	.L__unnamed_7,@object           # @6
	.p2align	3, 0x0
.L__unnamed_7:
	.quad	0                               # 0x0
	.size	.L__unnamed_7, 8

	.type	.L__unnamed_8,@object           # @7
	.p2align	3, 0x0
.L__unnamed_8:
	.quad	1                               # 0x1
	.size	.L__unnamed_8, 8

	.type	.L__unnamed_9,@object           # @8
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_9:
	.quad	.L__unnamed_1
	.quad	.L__unnamed_2
	.quad	.L__unnamed_3
	.quad	.L__unnamed_4
	.quad	.L__unnamed_5
	.quad	.L__unnamed_6
	.quad	.L__unnamed_7
	.quad	.L__unnamed_8
	.size	.L__unnamed_9, 64

	.type	.Lstr.5,@object                 # @str.5
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr.5:
	.asciz	"convolution_nhwc"
	.size	.Lstr.5, 17

	.type	.L__unnamed_10,@object          # @9
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_10:
	.quad	.Lstr
	.word	1                               # 0x1
	.word	4                               # 0x4
	.byte	2                               # 0x2
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lstr.4
	.word	1                               # 0x1
	.word	4                               # 0x4
	.byte	2                               # 0x2
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lstr.5
	.word	2                               # 0x2
	.word	4                               # 0x4
	.byte	2                               # 0x2
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.L__unnamed_9
	.size	.L__unnamed_10, 192

	.type	.Lstr.6,@object                 # @str.6
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr.6:
	.asciz	"riscv-64-linux-no_asserts-no_runtime-rvv-vector_bits_128"
	.size	.Lstr.6, 57

	.type	.Lconvolution_nhwc_metadata_storage,@object # @convolution_nhwc_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lconvolution_nhwc_metadata_storage:
	.word	1                               # 0x1
	.word	3                               # 0x3
	.quad	.L__unnamed_10
	.quad	.Lstr.6
	.quad	.Lstr.5
	.size	.Lconvolution_nhwc_metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.section	".note.GNU-stack","",@progbits
