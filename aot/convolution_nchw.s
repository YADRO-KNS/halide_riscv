	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.text.convolution_nchw,"ax",@progbits
	.globl	convolution_nchw                # -- Begin function convolution_nchw
	.p2align	1
	.type	convolution_nchw,@function
convolution_nchw:                       # @convolution_nchw
# %bb.0:                                # %entry
	addi	sp, sp, -368
	sd	ra, 360(sp)                     # 8-byte Folded Spill
	sd	s0, 352(sp)                     # 8-byte Folded Spill
	sd	s1, 344(sp)                     # 8-byte Folded Spill
	sd	s2, 336(sp)                     # 8-byte Folded Spill
	sd	s3, 328(sp)                     # 8-byte Folded Spill
	sd	s4, 320(sp)                     # 8-byte Folded Spill
	sd	s5, 312(sp)                     # 8-byte Folded Spill
	sd	s6, 304(sp)                     # 8-byte Folded Spill
	sd	s7, 296(sp)                     # 8-byte Folded Spill
	sd	s8, 288(sp)                     # 8-byte Folded Spill
	sd	s9, 280(sp)                     # 8-byte Folded Spill
	sd	s10, 272(sp)                    # 8-byte Folded Spill
	sd	s11, 264(sp)                    # 8-byte Folded Spill
	ld	s1, 40(a2)
	ld	a3, 16(a0)
	ld	t5, 16(a1)
	lw	t0, 0(s1)
	lw	t1, 16(s1)
	lw	t6, 24(s1)
	lw	t2, 32(s1)
	lw	a4, 40(s1)
	sd	a4, 24(sp)                      # 8-byte Folded Spill
	lw	t3, 48(s1)
	lw	t4, 56(s1)
	mv	a6, a3
	sd	a3, 32(sp)                      # 8-byte Folded Spill
	beqz	a3, .LBB0_6
# %bb.1:                                # %after_bb
	ld	s7, 16(a2)
	mv	a5, t5
	beqz	t5, .LBB0_12
.LBB0_2:                                # %after_bb1
	beqz	s7, .LBB0_14
.LBB0_3:
	li	a2, 0
	beqz	a6, .LBB0_16
.LBB0_4:
	li	a0, 0
	beqz	a5, .LBB0_17
.LBB0_5:
	li	a1, 0
	or	a1, a1, a2
	or	a0, a0, a1
	beqz	a0, .LBB0_18
	j	.LBB0_36
.LBB0_6:                                # %_halide_buffer_is_bounds_query.exit
	ld	a3, 0(a0)
	beqz	a3, .LBB0_8
# %bb.7:
	li	a6, 0
	ld	s7, 16(a2)
	mv	a5, t5
	bnez	t5, .LBB0_2
	j	.LBB0_12
.LBB0_8:                                # %then_bb
	ld	a3, 40(a0)
	sw	zero, 48(sp)
	li	a4, 128
	sw	a4, 52(sp)
	li	a5, 1
	sw	a5, 56(sp)
	sw	zero, 60(sp)
	sw	zero, 64(sp)
	sw	a4, 68(sp)
	sw	a4, 72(sp)
	sw	zero, 76(sp)
	sw	zero, 80(sp)
	li	a4, 16
	sw	a4, 84(sp)
	lui	a4, 4
	sw	a4, 88(sp)
	sw	zero, 92(sp)
	sw	zero, 96(sp)
	sw	a5, 100(sp)
	lui	a4, 64
	sw	a4, 104(sp)
	sw	zero, 108(sp)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a4, 512
	addiw	a4, a4, 9
	slli	a4, a4, 13
	addi	a5, a4, 2
	addi	a4, sp, 48
	sd	a5, 32(a0)
	beq	a4, a3, .LBB0_11
# %bb.9:                                # %for.body.i.preheader
	li	a5, 4
	li	s0, 4
.LBB0_10:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a5, e32, m1
	vlwu.v	v8, (a4)
	vsw.v	v8, (a3)
	addi	s0, s0, -1
	addi	a3, a3, 16
	addi	a4, a4, 16
	bnez	s0, .LBB0_10
.LBB0_11:                               # %_halide_buffer_init.exit
	li	a6, 0
	sd	zero, 24(a0)
	ld	s7, 16(a2)
	mv	a5, t5
	bnez	t5, .LBB0_2
.LBB0_12:                               # %_halide_buffer_is_bounds_query.exit103
	ld	a3, 0(a1)
	beqz	a3, .LBB0_37
# %bb.13:
	li	a5, 0
	bnez	s7, .LBB0_3
.LBB0_14:                               # %_halide_buffer_is_bounds_query.exit111
	ld	a3, 0(a2)
	beqz	a3, .LBB0_41
# %bb.15:                               # %land.rhs.i133
	ld	a2, 0(a2)
	seqz	a2, a2
	bnez	a6, .LBB0_4
.LBB0_16:                               # %land.rhs.i138
	ld	a0, 0(a0)
	seqz	a0, a0
	bnez	a5, .LBB0_5
.LBB0_17:                               # %land.rhs.i143
	ld	a1, 0(a1)
	seqz	a1, a1
	or	a1, a1, a2
	or	a0, a0, a1
	bnez	a0, .LBB0_36
.LBB0_18:                               # %"produce convolution_nchw"
	li	a3, 0
	mulw	a0, t6, t1
	ld	a1, 24(sp)                      # 8-byte Folded Reload
	mulw	a1, a1, t2
	mulw	a2, t4, t3
	add	a0, a0, a1
	add	a0, a0, a2
	add	a0, a0, t0
	sd	a0, 16(sp)                      # 8-byte Folded Spill
	ld	a0, 32(sp)                      # 8-byte Folded Reload
	addi	a0, a0, 488
	sd	a0, 8(sp)                       # 8-byte Folded Spill
	addi	t2, s7, 488
	vsetvli	a0, zero, e32, m1
	vmv.v.i	v8, 0
	li	s8, 4
	addi	a0, sp, 240
	li	a5, 3
	lui	t4, 16
	li	t0, 16
	li	s9, 31
	li	t3, 126
.LBB0_19:                               # %"for convolution_nchw.s0.c"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
                                        #       Child Loop BB0_21 Depth 3
                                        #         Child Loop BB0_22 Depth 4
                                        #           Child Loop BB0_23 Depth 5
                                        #             Child Loop BB0_24 Depth 6
                                        #       Child Loop BB0_29 Depth 3
                                        #         Child Loop BB0_30 Depth 4
                                        #           Child Loop BB0_31 Depth 5
	li	s2, 0
	ld	a1, 24(sp)                      # 8-byte Folded Reload
	sd	a3, 40(sp)                      # 8-byte Folded Spill
	mulw	a1, a1, a3
	ld	a2, 16(sp)                      # 8-byte Folded Reload
	subw	s3, a1, a2
	ld	s4, 8(sp)                       # 8-byte Folded Reload
	ld	t1, 32(sp)                      # 8-byte Folded Reload
.LBB0_20:                               # %"for convolution_nchw.s0.y"
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_21 Depth 3
                                        #         Child Loop BB0_22 Depth 4
                                        #           Child Loop BB0_23 Depth 5
                                        #             Child Loop BB0_24 Depth 6
                                        #       Child Loop BB0_29 Depth 3
                                        #         Child Loop BB0_30 Depth 4
                                        #           Child Loop BB0_31 Depth 5
	li	a3, 0
	mul	s10, s2, t6
	add	s10, s10, s3
	mv	a7, t1
.LBB0_21:                               # %"for convolution_nchw.s0.x.x"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_22 Depth 4
                                        #           Child Loop BB0_23 Depth 5
                                        #             Child Loop BB0_24 Depth 6
	li	s1, 0
	vsetvli	zero, s8, e32, m1
	vsw.v	v8, (a0)
	slli	s11, a3, 2
	mv	s5, a7
	mv	s6, t5
.LBB0_22:                               # %"for sum$2.s1.r96$z"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_21 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB0_23 Depth 5
                                        #             Child Loop BB0_24 Depth 6
	li	a6, 0
	mv	ra, s5
	mv	s0, s6
.LBB0_23:                               # %"for sum$2.s1.r96$y"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_21 Depth=3
                                        #         Parent Loop BB0_22 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB0_24 Depth 6
	li	a4, 3
	mv	a1, ra
	mv	a2, s0
.LBB0_24:                               # %"for sum$2.s1.r96$x"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_21 Depth=3
                                        #         Parent Loop BB0_22 Depth=4
                                        #           Parent Loop BB0_23 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	vlwu.v	v9, (a1)
	flw	ft0, 0(a2)
	vlwu.v	v10, (a0)
	vfmul.vf	v9, v9, ft0
	vfadd.vv	v9, v10, v9
	vsw.v	v9, (a0)
	addi	a4, a4, -1
	addi	a2, a2, 4
	addi	a1, a1, 4
	bnez	a4, .LBB0_24
# %bb.25:                               # %"end for sum$2.s1.r96$x"
                                        #   in Loop: Header=BB0_23 Depth=5
	addi	a6, a6, 1
	addi	s0, s0, 12
	addi	ra, ra, 512
	bne	a6, a5, .LBB0_23
# %bb.26:                               # %"end for sum$2.s1.r96$y"
                                        #   in Loop: Header=BB0_22 Depth=4
	addi	s1, s1, 1
	addi	s6, s6, 36
	add	s5, s5, t4
	bne	s1, t0, .LBB0_22
# %bb.27:                               # %"consume sum$2"
                                        #   in Loop: Header=BB0_21 Depth=3
	vlwu.v	v9, (a0)
	add	s11, s11, s10
	slli	s11, s11, 2
	add	s11, s11, s7
	vsw.v	v9, (s11)
	addi	a3, a3, 1
	addi	a7, a7, 16
	bne	a3, s9, .LBB0_21
# %bb.28:                               # %"produce sum$210"
                                        #   in Loop: Header=BB0_20 Depth=2
	li	a6, 0
	vsw.v	v8, (a0)
	mv	a7, s4
	mv	s5, t5
.LBB0_29:                               # %"for sum$2.s1.r96$z11"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_30 Depth 4
                                        #           Child Loop BB0_31 Depth 5
	li	s1, 0
	mv	a2, a7
	mv	a4, s5
.LBB0_30:                               # %"for sum$2.s1.r96$y14"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_29 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB0_31 Depth 5
	li	a1, 3
	mv	a3, a2
	mv	s0, a4
.LBB0_31:                               # %"for sum$2.s1.r96$x17"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_29 Depth=3
                                        #         Parent Loop BB0_30 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	vlwu.v	v9, (a3)
	flw	ft0, 0(s0)
	vlwu.v	v10, (a0)
	vfmul.vf	v9, v9, ft0
	vfadd.vv	v9, v10, v9
	vsw.v	v9, (a0)
	addi	a1, a1, -1
	addi	s0, s0, 4
	addi	a3, a3, 4
	bnez	a1, .LBB0_31
# %bb.32:                               # %"end for sum$2.s1.r96$x18"
                                        #   in Loop: Header=BB0_30 Depth=4
	addi	s1, s1, 1
	addi	a4, a4, 12
	addi	a2, a2, 512
	bne	s1, a5, .LBB0_30
# %bb.33:                               # %"end for sum$2.s1.r96$y15"
                                        #   in Loop: Header=BB0_29 Depth=3
	addi	a6, a6, 1
	addi	s5, s5, 36
	add	a7, a7, t4
	bne	a6, t0, .LBB0_29
# %bb.34:                               # %"consume sum$220"
                                        #   in Loop: Header=BB0_20 Depth=2
	vlwu.v	v9, (a0)
	slli	s10, s10, 2
	add	s10, s10, t2
	vsw.v	v9, (s10)
	addi	s2, s2, 1
	addi	t1, t1, 512
	addi	s4, s4, 512
	bne	s2, t3, .LBB0_20
# %bb.35:                               # %"end for convolution_nchw.s0.y"
                                        #   in Loop: Header=BB0_19 Depth=1
	ld	a3, 40(sp)                      # 8-byte Folded Reload
	addi	a3, a3, 1
	addi	t5, t5, 576
	li	a1, 32
	bne	a3, a1, .LBB0_19
.LBB0_36:                               # %destructor_block
	li	a0, 0
	ld	ra, 360(sp)                     # 8-byte Folded Reload
	ld	s0, 352(sp)                     # 8-byte Folded Reload
	ld	s1, 344(sp)                     # 8-byte Folded Reload
	ld	s2, 336(sp)                     # 8-byte Folded Reload
	ld	s3, 328(sp)                     # 8-byte Folded Reload
	ld	s4, 320(sp)                     # 8-byte Folded Reload
	ld	s5, 312(sp)                     # 8-byte Folded Reload
	ld	s6, 304(sp)                     # 8-byte Folded Reload
	ld	s7, 296(sp)                     # 8-byte Folded Reload
	ld	s8, 288(sp)                     # 8-byte Folded Reload
	ld	s9, 280(sp)                     # 8-byte Folded Reload
	ld	s10, 272(sp)                    # 8-byte Folded Reload
	ld	s11, 264(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 368
	ret
.LBB0_37:                               # %then_bb2
	ld	a3, 40(a1)
	sw	zero, 112(sp)
	li	a4, 3
	sw	a4, 116(sp)
	li	a5, 1
	sw	a5, 120(sp)
	sw	zero, 124(sp)
	sw	zero, 128(sp)
	sw	a4, 132(sp)
	sw	a4, 136(sp)
	sw	zero, 140(sp)
	sw	zero, 144(sp)
	li	a4, 16
	sw	a4, 148(sp)
	li	a4, 9
	sw	a4, 152(sp)
	sw	zero, 156(sp)
	sw	zero, 160(sp)
	li	a4, 32
	sw	a4, 164(sp)
	li	a4, 144
	sw	a4, 168(sp)
	sw	zero, 172(sp)
	sd	zero, 16(a1)
	sd	zero, 8(a1)
	sd	zero, 0(a1)
	lui	a4, 512
	addiw	a4, a4, 9
	slli	a4, a4, 13
	addi	a4, a4, 2
	addi	a5, sp, 112
	sd	a4, 32(a1)
	beq	a5, a3, .LBB0_40
# %bb.38:                               # %for.body.i127.preheader
	li	s0, 4
	li	a4, 4
.LBB0_39:                               # %for.body.i127
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, s0, e32, m1
	vlwu.v	v8, (a5)
	vsw.v	v8, (a3)
	addi	a4, a4, -1
	addi	a3, a3, 16
	addi	a5, a5, 16
	bnez	a4, .LBB0_39
.LBB0_40:                               # %_halide_buffer_init.exit129
	li	a5, 0
	sd	zero, 24(a1)
	bnez	s7, .LBB0_3
	j	.LBB0_14
.LBB0_41:                               # %then_bb5
	sw	zero, 176(sp)
	li	a3, 126
	sw	a3, 180(sp)
	li	a4, 1
	sw	a4, 184(sp)
	sw	zero, 188(sp)
	sw	zero, 192(sp)
	sw	a3, 196(sp)
	sw	a3, 200(sp)
	sw	zero, 204(sp)
	sw	zero, 208(sp)
	li	a3, 32
	sw	a3, 212(sp)
	lui	a3, 4
	addiw	a3, a3, -508
	sw	a3, 216(sp)
	sw	zero, 220(sp)
	sw	zero, 224(sp)
	sw	a4, 228(sp)
	lui	a3, 124
	addiw	a3, a3, 128
	sw	a3, 232(sp)
	sw	zero, 236(sp)
	sd	zero, 16(a2)
	sd	zero, 8(a2)
	sd	zero, 0(a2)
	lui	a3, 512
	addiw	a3, a3, 9
	slli	a3, a3, 13
	addi	a4, a3, 2
	addi	a3, sp, 176
	sd	a4, 32(a2)
	beq	a3, s1, .LBB0_44
# %bb.42:                               # %for.body.i160.preheader
	li	s0, 4
	li	a4, 4
.LBB0_43:                               # %for.body.i160
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, s0, e32, m1
	vlwu.v	v8, (a3)
	vsw.v	v8, (s1)
	addi	a4, a4, -1
	addi	s1, s1, 16
	addi	a3, a3, 16
	bnez	a4, .LBB0_43
.LBB0_44:                               # %_halide_buffer_init.exit162
	sd	zero, 24(a2)
	ld	a2, 0(a2)
	seqz	a2, a2
	bnez	a6, .LBB0_4
	j	.LBB0_16
.Lfunc_end0:
	.size	convolution_nchw, .Lfunc_end0-convolution_nchw
                                        # -- End function
	.section	.text.convolution_nchw_argv,"ax",@progbits
	.globl	convolution_nchw_argv           # -- Begin function convolution_nchw_argv
	.p2align	1
	.type	convolution_nchw_argv,@function
convolution_nchw_argv:                  # @convolution_nchw_argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a3, 0(a0)
	ld	a1, 8(a0)
	ld	a2, 16(a0)
	mv	a0, a3
	call	convolution_nchw@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	convolution_nchw_argv, .Lfunc_end1-convolution_nchw_argv
                                        # -- End function
	.section	.text.convolution_nchw_metadata,"ax",@progbits
	.globl	convolution_nchw_metadata       # -- Begin function convolution_nchw_metadata
	.p2align	1
	.type	convolution_nchw_metadata,@function
convolution_nchw_metadata:              # @convolution_nchw_metadata
# %bb.0:                                # %entry
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.Lconvolution_nchw_metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	ret
.Lfunc_end2:
	.size	convolution_nchw_metadata, .Lfunc_end2-convolution_nchw_metadata
                                        # -- End function
	.type	.Lstr,@object                   # @str
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr:
	.asciz	"b572"
	.size	.Lstr, 5

	.type	.Lstr.4,@object                 # @str.4
	.p2align	5, 0x0
.Lstr.4:
	.asciz	"b573"
	.size	.Lstr.4, 5

	.type	.L__unnamed_1,@object           # @0
	.p2align	3, 0x0
.L__unnamed_1:
	.quad	0                               # 0x0
	.size	.L__unnamed_1, 8

	.type	.L__unnamed_2,@object           # @1
	.p2align	3, 0x0
.L__unnamed_2:
	.quad	126                             # 0x7e
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
	.quad	32                              # 0x20
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
	.asciz	"convolution_nchw"
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

	.type	.Lconvolution_nchw_metadata_storage,@object # @convolution_nchw_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lconvolution_nchw_metadata_storage:
	.word	1                               # 0x1
	.word	3                               # 0x3
	.quad	.L__unnamed_10
	.quad	.Lstr.6
	.quad	.Lstr.5
	.size	.Lconvolution_nchw_metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.section	".note.GNU-stack","",@progbits
