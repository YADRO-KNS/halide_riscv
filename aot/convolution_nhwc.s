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
	addi	sp, sp, -336
	sd	ra, 328(sp)                     # 8-byte Folded Spill
	sd	s0, 320(sp)                     # 8-byte Folded Spill
	sd	s1, 312(sp)                     # 8-byte Folded Spill
	sd	s2, 304(sp)                     # 8-byte Folded Spill
	sd	s3, 296(sp)                     # 8-byte Folded Spill
	sd	s4, 288(sp)                     # 8-byte Folded Spill
	sd	s5, 280(sp)                     # 8-byte Folded Spill
	sd	s6, 272(sp)                     # 8-byte Folded Spill
	sd	s7, 264(sp)                     # 8-byte Folded Spill
	sd	s8, 256(sp)                     # 8-byte Folded Spill
	sd	s9, 248(sp)                     # 8-byte Folded Spill
	sd	s10, 240(sp)                    # 8-byte Folded Spill
	sd	s11, 232(sp)                    # 8-byte Folded Spill
	ld	t5, 40(a2)
	ld	a6, 16(a0)
	ld	s3, 16(a1)
	lw	t0, 0(t5)
	lw	t1, 16(t5)
	lw	s2, 24(t5)
	lw	t2, 32(t5)
	lw	a3, 40(t5)
	sd	a3, 8(sp)                       # 8-byte Folded Spill
	lw	t3, 48(t5)
	lw	t4, 56(t5)
	mv	t6, a6
	beqz	a6, .LBB0_6
# %bb.1:                                # %after_bb
	ld	s4, 16(a2)
	mv	a4, s3
	beqz	s3, .LBB0_12
.LBB0_2:                                # %after_bb1
	beqz	s4, .LBB0_14
.LBB0_3:
	li	a2, 0
	beqz	t6, .LBB0_16
.LBB0_4:
	li	a0, 0
	beqz	a4, .LBB0_17
.LBB0_5:
	li	a1, 0
	or	a1, a1, a2
	or	a0, a0, a1
	beqz	a0, .LBB0_18
	j	.LBB0_30
.LBB0_6:                                # %_halide_buffer_is_bounds_query.exit
	ld	a3, 0(a0)
	beqz	a3, .LBB0_8
# %bb.7:
	li	t6, 0
	ld	s4, 16(a2)
	mv	a4, s3
	bnez	s3, .LBB0_2
	j	.LBB0_12
.LBB0_8:                                # %then_bb
	ld	a3, 40(a0)
	sw	zero, 16(sp)
	li	a4, 16
	sw	a4, 20(sp)
	li	a5, 1
	sw	a5, 24(sp)
	sw	zero, 28(sp)
	sw	zero, 32(sp)
	li	s1, 128
	sw	s1, 36(sp)
	sw	a4, 40(sp)
	sw	zero, 44(sp)
	sw	zero, 48(sp)
	sw	s1, 52(sp)
	slli	a4, a5, 11
	sw	a4, 56(sp)
	sw	zero, 60(sp)
	sw	zero, 64(sp)
	sw	a5, 68(sp)
	lui	a4, 64
	sw	a4, 72(sp)
	sw	zero, 76(sp)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a4, 512
	addiw	a4, a4, 9
	slli	a4, a4, 13
	addi	a5, a4, 2
	addi	a4, sp, 16
	sd	a5, 32(a0)
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
	li	t6, 0
	sd	zero, 24(a0)
	ld	s4, 16(a2)
	mv	a4, s3
	bnez	s3, .LBB0_2
.LBB0_12:                               # %_halide_buffer_is_bounds_query.exit84
	ld	a3, 0(a1)
	beqz	a3, .LBB0_31
# %bb.13:
	li	a4, 0
	bnez	s4, .LBB0_3
.LBB0_14:                               # %_halide_buffer_is_bounds_query.exit92
	ld	a3, 0(a2)
	beqz	a3, .LBB0_35
# %bb.15:                               # %land.rhs.i114
	ld	a2, 0(a2)
	seqz	a2, a2
	bnez	t6, .LBB0_4
.LBB0_16:                               # %land.rhs.i119
	ld	a0, 0(a0)
	seqz	a0, a0
	bnez	a4, .LBB0_5
.LBB0_17:                               # %land.rhs.i124
	ld	a1, 0(a1)
	seqz	a1, a1
	or	a1, a1, a2
	or	a0, a0, a1
	bnez	a0, .LBB0_30
.LBB0_18:                               # %"produce convolution_nhwc"
	li	t5, 0
	mulw	a0, s2, t1
	ld	a1, 8(sp)                       # 8-byte Folded Reload
	mulw	a1, a1, t2
	mulw	a2, t4, t3
	add	a0, a0, a1
	add	a0, a0, a2
	add	t0, t0, a0
	vsetvli	a0, zero, e32, m1
	vmv.v.i	v8, 0
	li	t4, 4
	addi	a2, sp, 208
	lui	a0, 2
	li	a5, 3
	li	s9, 16
	li	t6, 8
	li	t1, 126
.LBB0_19:                               # %"for convolution_nhwc.s0.y"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
                                        #       Child Loop BB0_21 Depth 3
                                        #         Child Loop BB0_22 Depth 4
                                        #           Child Loop BB0_23 Depth 5
                                        #             Child Loop BB0_24 Depth 6
	li	t3, 0
	ld	a1, 8(sp)                       # 8-byte Folded Reload
	mulw	t2, a1, t5
	mv	a7, a6
.LBB0_20:                               # %"for convolution_nhwc.s0.x"
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_21 Depth 3
                                        #         Child Loop BB0_22 Depth 4
                                        #           Child Loop BB0_23 Depth 5
                                        #             Child Loop BB0_24 Depth 6
	li	s8, 0
	mulw	a1, s2, t3
	add	a1, a1, t2
	subw	s5, a1, t0
	mv	s7, s3
.LBB0_21:                               # %"for convolution_nhwc.s0.c.c"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_22 Depth 4
                                        #           Child Loop BB0_23 Depth 5
                                        #             Child Loop BB0_24 Depth 6
	li	s10, 0
	vsetvli	zero, t4, e32, m1
	vsw.v	v8, (a2)
	mv	s11, s7
	mv	s6, a7
.LBB0_22:                               # %"for sum$3.s1.r144$z"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_21 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB0_23 Depth 5
                                        #             Child Loop BB0_24 Depth 6
	li	a3, 0
	mv	a1, s11
	mv	ra, s6
.LBB0_23:                               # %"for sum$3.s1.r144$y"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_21 Depth=3
                                        #         Parent Loop BB0_22 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB0_24 Depth 6
	li	s0, 3
	mv	s1, a1
	mv	a4, ra
.LBB0_24:                               # %"for sum$3.s1.r144$x"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_21 Depth=3
                                        #         Parent Loop BB0_22 Depth=4
                                        #           Parent Loop BB0_23 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	vlwu.v	v9, (s1)
	flw	ft0, 0(a4)
	vlwu.v	v10, (a2)
	vfmul.vf	v9, v9, ft0
	vfadd.vv	v9, v10, v9
	vsw.v	v9, (a2)
	addi	s0, s0, -1
	addi	a4, a4, 64
	addi	s1, s1, 128
	bnez	s0, .LBB0_24
# %bb.25:                               # %"end for sum$3.s1.r144$x"
                                        #   in Loop: Header=BB0_23 Depth=5
	addi	a3, a3, 1
	add	ra, ra, a0
	addi	a1, a1, 384
	bne	a3, a5, .LBB0_23
# %bb.26:                               # %"end for sum$3.s1.r144$y"
                                        #   in Loop: Header=BB0_22 Depth=4
	addi	s10, s10, 1
	addi	s6, s6, 4
	addi	s11, s11, 1152
	bne	s10, s9, .LBB0_22
# %bb.27:                               # %"consume sum$3"
                                        #   in Loop: Header=BB0_21 Depth=3
	vlwu.v	v9, (a2)
	slli	a1, s8, 2
	add	a1, a1, s5
	slli	a1, a1, 2
	add	a1, a1, s4
	vsw.v	v9, (a1)
	addi	s8, s8, 1
	addi	s7, s7, 16
	bne	s8, t6, .LBB0_21
# %bb.28:                               # %"end for convolution_nhwc.s0.c.c"
                                        #   in Loop: Header=BB0_20 Depth=2
	addi	t3, t3, 1
	addi	a7, a7, 64
	bne	t3, t1, .LBB0_20
# %bb.29:                               # %"end for convolution_nhwc.s0.x"
                                        #   in Loop: Header=BB0_19 Depth=1
	addi	t5, t5, 1
	add	a6, a6, a0
	bne	t5, t1, .LBB0_19
.LBB0_30:                               # %destructor_block
	li	a0, 0
	ld	ra, 328(sp)                     # 8-byte Folded Reload
	ld	s0, 320(sp)                     # 8-byte Folded Reload
	ld	s1, 312(sp)                     # 8-byte Folded Reload
	ld	s2, 304(sp)                     # 8-byte Folded Reload
	ld	s3, 296(sp)                     # 8-byte Folded Reload
	ld	s4, 288(sp)                     # 8-byte Folded Reload
	ld	s5, 280(sp)                     # 8-byte Folded Reload
	ld	s6, 272(sp)                     # 8-byte Folded Reload
	ld	s7, 264(sp)                     # 8-byte Folded Reload
	ld	s8, 256(sp)                     # 8-byte Folded Reload
	ld	s9, 248(sp)                     # 8-byte Folded Reload
	ld	s10, 240(sp)                    # 8-byte Folded Reload
	ld	s11, 232(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 336
	ret
.LBB0_31:                               # %then_bb2
	ld	a3, 40(a1)
	sw	zero, 80(sp)
	li	a4, 32
	sw	a4, 84(sp)
	li	a5, 1
	sw	a5, 88(sp)
	sw	zero, 92(sp)
	sw	zero, 96(sp)
	li	a5, 3
	sw	a5, 100(sp)
	sw	a4, 104(sp)
	sw	zero, 108(sp)
	sw	zero, 112(sp)
	sw	a5, 116(sp)
	li	a4, 96
	sw	a4, 120(sp)
	sw	zero, 124(sp)
	sw	zero, 128(sp)
	li	a4, 16
	sw	a4, 132(sp)
	li	a4, 288
	sw	a4, 136(sp)
	sw	zero, 140(sp)
	sd	zero, 16(a1)
	sd	zero, 8(a1)
	sd	zero, 0(a1)
	lui	a4, 512
	addiw	a4, a4, 9
	slli	a4, a4, 13
	addi	a5, a4, 2
	addi	a4, sp, 80
	sd	a5, 32(a1)
	beq	a4, a3, .LBB0_34
# %bb.32:                               # %for.body.i108.preheader
	li	a5, 4
	li	s1, 4
.LBB0_33:                               # %for.body.i108
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a5, e32, m1
	vlwu.v	v8, (a4)
	vsw.v	v8, (a3)
	addi	s1, s1, -1
	addi	a3, a3, 16
	addi	a4, a4, 16
	bnez	s1, .LBB0_33
.LBB0_34:                               # %_halide_buffer_init.exit110
	li	a4, 0
	sd	zero, 24(a1)
	bnez	s4, .LBB0_3
	j	.LBB0_14
.LBB0_35:                               # %then_bb5
	sw	zero, 144(sp)
	li	a3, 32
	sw	a3, 148(sp)
	li	a5, 1
	sw	a5, 152(sp)
	sw	zero, 156(sp)
	sw	zero, 160(sp)
	li	s1, 126
	sw	s1, 164(sp)
	sw	a3, 168(sp)
	sw	zero, 172(sp)
	sw	zero, 176(sp)
	sw	s1, 180(sp)
	lui	a3, 1
	addiw	a3, a3, -64
	sw	a3, 184(sp)
	sw	zero, 188(sp)
	sw	zero, 192(sp)
	sw	a5, 196(sp)
	lui	a3, 124
	addiw	a3, a3, 128
	sw	a3, 200(sp)
	sw	zero, 204(sp)
	sd	zero, 16(a2)
	sd	zero, 8(a2)
	sd	zero, 0(a2)
	lui	a3, 512
	addiw	a3, a3, 9
	slli	a3, a3, 13
	addi	a5, a3, 2
	addi	a3, sp, 144
	sd	a5, 32(a2)
	beq	a3, t5, .LBB0_38
# %bb.36:                               # %for.body.i141.preheader
	li	a5, 4
	li	s1, 4
.LBB0_37:                               # %for.body.i141
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a5, e32, m1
	vlwu.v	v8, (a3)
	vsw.v	v8, (t5)
	addi	s1, s1, -1
	addi	t5, t5, 16
	addi	a3, a3, 16
	bnez	s1, .LBB0_37
.LBB0_38:                               # %_halide_buffer_init.exit143
	sd	zero, 24(a2)
	ld	a2, 0(a2)
	seqz	a2, a2
	bnez	t6, .LBB0_4
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
	.asciz	"b761"
	.size	.Lstr, 5

	.type	.Lstr.4,@object                 # @str.4
	.p2align	5, 0x0
.Lstr.4:
	.asciz	"b762"
	.size	.Lstr.4, 5

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
