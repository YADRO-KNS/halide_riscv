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
	addi	sp, sp, -880
	sd	ra, 872(sp)                     # 8-byte Folded Spill
	sd	s0, 864(sp)                     # 8-byte Folded Spill
	sd	s1, 856(sp)                     # 8-byte Folded Spill
	sd	s2, 848(sp)                     # 8-byte Folded Spill
	sd	s3, 840(sp)                     # 8-byte Folded Spill
	sd	s4, 832(sp)                     # 8-byte Folded Spill
	sd	s5, 824(sp)                     # 8-byte Folded Spill
	sd	s6, 816(sp)                     # 8-byte Folded Spill
	sd	s7, 808(sp)                     # 8-byte Folded Spill
	sd	s8, 800(sp)                     # 8-byte Folded Spill
	sd	s9, 792(sp)                     # 8-byte Folded Spill
	sd	s10, 784(sp)                    # 8-byte Folded Spill
	sd	s11, 776(sp)                    # 8-byte Folded Spill
	ld	a4, 40(a2)
	ld	a3, 16(a2)
	lw	a6, 0(a4)
	lw	t1, 16(a4)
	lw	a5, 24(a4)
	sd	a5, 72(sp)                      # 8-byte Folded Spill
	lw	t2, 32(a4)
	lw	t5, 40(a4)
	lw	t3, 48(a4)
	lw	t4, 56(a4)
	ld	t6, 16(a0)
	mv	a7, a3
	sd	a3, 32(sp)                      # 8-byte Folded Spill
	beqz	a3, .LBB0_6
# %bb.1:                                # %after_bb
	ld	s3, 16(a1)
	mv	t0, t6
	beqz	t6, .LBB0_12
.LBB0_2:                                # %after_bb1
	beqz	s3, .LBB0_14
.LBB0_3:
	li	a1, 0
	beqz	a7, .LBB0_16
.LBB0_4:
	li	a2, 0
	beqz	t0, .LBB0_17
.LBB0_5:
	li	a0, 0
	or	a0, a0, a1
	or	a0, a0, a2
	beqz	a0, .LBB0_18
	j	.LBB0_36
.LBB0_6:                                # %_halide_buffer_is_bounds_query.exit
	ld	a3, 0(a2)
	beqz	a3, .LBB0_8
# %bb.7:
	li	a7, 0
	ld	s3, 16(a1)
	mv	t0, t6
	bnez	t6, .LBB0_2
	j	.LBB0_12
.LBB0_8:                                # %then_bb
	sw	zero, 80(sp)
	li	a3, 126
	sw	a3, 84(sp)
	li	a5, 1
	sw	a5, 88(sp)
	sw	zero, 92(sp)
	sw	zero, 96(sp)
	sw	a3, 100(sp)
	sw	a3, 104(sp)
	sw	zero, 108(sp)
	sw	zero, 112(sp)
	li	a3, 32
	sw	a3, 116(sp)
	lui	a3, 4
	addiw	a3, a3, -508
	sw	a3, 120(sp)
	sw	zero, 124(sp)
	sw	zero, 128(sp)
	sw	a5, 132(sp)
	lui	a3, 124
	addiw	a3, a3, 128
	sw	a3, 136(sp)
	sw	zero, 140(sp)
	sd	zero, 16(a2)
	sd	zero, 8(a2)
	sd	zero, 0(a2)
	lui	a3, 512
	addiw	a3, a3, 9
	slli	a3, a3, 13
	addi	a5, a3, 2
	addi	a3, sp, 80
	sd	a5, 32(a2)
	beq	a3, a4, .LBB0_11
# %bb.9:                                # %for.body.i.preheader
	li	a5, 4
	li	s1, 4
.LBB0_10:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a5, e32, m1
	vlwu.v	v8, (a3)
	vsw.v	v8, (a4)
	addi	s1, s1, -1
	addi	a4, a4, 16
	addi	a3, a3, 16
	bnez	s1, .LBB0_10
.LBB0_11:                               # %_halide_buffer_init.exit
	li	a7, 0
	sd	zero, 24(a2)
	ld	s3, 16(a1)
	mv	t0, t6
	bnez	t6, .LBB0_2
.LBB0_12:                               # %_halide_buffer_is_bounds_query.exit93
	ld	a3, 0(a0)
	beqz	a3, .LBB0_37
# %bb.13:
	li	t0, 0
	bnez	s3, .LBB0_3
.LBB0_14:                               # %_halide_buffer_is_bounds_query.exit101
	ld	a3, 0(a1)
	beqz	a3, .LBB0_41
# %bb.15:                               # %land.rhs.i123
	ld	a1, 0(a1)
	seqz	a1, a1
	bnez	a7, .LBB0_4
.LBB0_16:                               # %land.rhs.i128
	ld	a2, 0(a2)
	seqz	a2, a2
	bnez	t0, .LBB0_5
.LBB0_17:                               # %land.rhs.i133
	ld	a0, 0(a0)
	seqz	a0, a0
	or	a0, a0, a1
	or	a0, a0, a2
	bnez	a0, .LBB0_36
.LBB0_18:                               # %"produce convolution_nchw"
	li	s1, 0
	ld	s6, 72(sp)                      # 8-byte Folded Reload
	mulw	a0, s6, t1
	mulw	a1, t5, t2
	mulw	a2, t4, t3
	add	a0, a0, a1
	add	a0, a0, a2
	addi	s0, sp, 760
	li	a1, 125
	vsetvli	a2, zero, e32, m1
	vmv.s.x	v8, a1
	li	a2, 124
	vmv.s.x	v9, a2
	li	a2, 2
	vsetvli	zero, a2, e32, m1
	vslideup.vi	v9, v8, 1
	li	a3, 126
	vsetvli	a2, zero, e32, m1
	vmv.s.x	v8, a3
	li	a5, 3
	vsetvli	zero, a5, e32, m1
	vslideup.vi	v9, v8, 2
	li	a2, 127
	vsetvli	a3, zero, e32, m1
	vmv.s.x	v8, a2
	li	ra, 4
	vsetvli	zero, ra, e32, m1
	vslideup.vi	v9, v8, 3
	vsetvli	zero, zero, e32, m1
	vmsle.vx	v0, v9, a1
	addi	a4, sp, 768
	add	a6, a6, a0
	addi	a0, t6, 496
	sd	a0, 0(sp)                       # 8-byte Folded Spill
	ld	a0, 32(sp)                      # 8-byte Folded Reload
	addi	a0, a0, 488
	sd	a0, 64(sp)                      # 8-byte Folded Spill
	sd	a6, 8(sp)                       # 8-byte Folded Spill
	negw	a1, a6
	slli	s6, s6, 2
	sd	s6, 56(sp)                      # 8-byte Folded Spill
	vsetvli	a0, zero, e32, m1
	vmv.v.i	v8, 0
	addi	a2, sp, 272
	li	a3, 31
	lui	t0, 16
	li	s2, 16
	sd	t5, 24(sp)                      # 8-byte Folded Spill
	sd	t6, 16(sp)                      # 8-byte Folded Spill
.LBB0_19:                               # %"for convolution_nchw.s0.c"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
                                        #       Child Loop BB0_21 Depth 3
                                        #       Child Loop BB0_23 Depth 3
                                        #         Child Loop BB0_24 Depth 4
                                        #           Child Loop BB0_25 Depth 5
                                        #             Child Loop BB0_26 Depth 6
                                        #           Child Loop BB0_29 Depth 5
                                        #       Child Loop BB0_33 Depth 3
	li	s11, 0
	sd	a1, 40(sp)                      # 8-byte Folded Spill
	slli	s7, a1, 2
	ld	a0, 32(sp)                      # 8-byte Folded Reload
	add	s7, s7, a0
	sd	s1, 48(sp)                      # 8-byte Folded Spill
	mulw	a0, t5, s1
	ld	a1, 8(sp)                       # 8-byte Folded Reload
	subw	s8, a0, a1
	ld	t3, 0(sp)                       # 8-byte Folded Reload
.LBB0_20:                               # %"for convolution_nchw.s0.y"
                                        #   Parent Loop BB0_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_21 Depth 3
                                        #       Child Loop BB0_23 Depth 3
                                        #         Child Loop BB0_24 Depth 4
                                        #           Child Loop BB0_25 Depth 5
                                        #             Child Loop BB0_26 Depth 6
                                        #           Child Loop BB0_29 Depth 5
                                        #       Child Loop BB0_33 Depth 3
	li	a0, 31
	addi	a1, sp, 272
.LBB0_21:                               # %"for sum.s0.x.x_vo"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vsetvli	zero, ra, e32, m1
	vsw.v	v8, (a1)
	addi	a0, a0, -1
	addi	a1, a1, 16
	bnez	a0, .LBB0_21
# %bb.22:                               # %"end for sum.s0.x.x_vo"
                                        #   in Loop: Header=BB0_20 Depth=2
	li	s1, 0
	mv	s6, s0
	vsw.v	v8, (s0)
	mv	t1, t3
	mv	t5, t6
	mv	s4, s3
	mv	t4, s3
.LBB0_23:                               # %"for sum.s1.r4$z"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_24 Depth 4
                                        #           Child Loop BB0_25 Depth 5
                                        #             Child Loop BB0_26 Depth 6
                                        #           Child Loop BB0_29 Depth 5
	li	s5, 0
	mv	s9, t1
	mv	a7, t5
	mv	a6, t4
.LBB0_24:                               # %"for sum.s1.r4$y"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_23 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB0_25 Depth 5
                                        #             Child Loop BB0_26 Depth 6
                                        #           Child Loop BB0_29 Depth 5
	li	t2, 0
	mv	s10, a7
.LBB0_25:                               # %"for sum.s1.x.x_vo"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_23 Depth=3
                                        #         Parent Loop BB0_24 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB0_26 Depth 6
	slli	a1, t2, 4
	add	a1, a1, a2
	li	a0, 3
	mv	s0, s10
	mv	s3, a6
.LBB0_26:                               # %"for sum.s1.r4$x"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_23 Depth=3
                                        #         Parent Loop BB0_24 Depth=4
                                        #           Parent Loop BB0_25 Depth=5
                                        # =>          This Inner Loop Header: Depth=6
	vlwu.v	v9, (s0)
	flw	ft0, 0(s3)
	vlwu.v	v10, (a1)
	vfmul.vf	v9, v9, ft0
	vfadd.vv	v9, v10, v9
	vsw.v	v9, (a1)
	addi	a0, a0, -1
	addi	s3, s3, 4
	addi	s0, s0, 4
	bnez	a0, .LBB0_26
# %bb.27:                               # %"end for sum.s1.r4$x"
                                        #   in Loop: Header=BB0_25 Depth=5
	addi	t2, t2, 1
	addi	s10, s10, 16
	bne	t2, a3, .LBB0_25
# %bb.28:                               # %"for sum.s1.r4$x10.preheader"
                                        #   in Loop: Header=BB0_24 Depth=4
	li	s0, 3
	mv	a1, s9
	mv	a0, a6
.LBB0_29:                               # %"for sum.s1.r4$x10"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        #       Parent Loop BB0_23 Depth=3
                                        #         Parent Loop BB0_24 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	vlwu.v	v9, (a4), v0.t
	vlwu.v	v10, (a1), v0.t
	flw	ft0, 0(a0)
	vfmul.vf	v10, v10, ft0
	vfadd.vv	v9, v9, v10
	vsw.v	v9, (a4), v0.t
	addi	s0, s0, -1
	addi	a0, a0, 4
	addi	a1, a1, 4
	bnez	s0, .LBB0_29
# %bb.30:                               # %"end for sum.s1.r4$x11"
                                        #   in Loop: Header=BB0_24 Depth=4
	addi	s5, s5, 1
	addi	a6, a6, 12
	addi	a7, a7, 512
	addi	s9, s9, 512
	bne	s5, a5, .LBB0_24
# %bb.31:                               # %"end for sum.s1.r4$y"
                                        #   in Loop: Header=BB0_23 Depth=3
	addi	s1, s1, 1
	addi	t4, t4, 36
	add	t5, t5, t0
	add	t1, t1, t0
	bne	s1, s2, .LBB0_23
# %bb.32:                               # %"consume sum"
                                        #   in Loop: Header=BB0_20 Depth=2
	ld	a0, 72(sp)                      # 8-byte Folded Reload
	mul	a0, s11, a0
	add	a0, a0, s8
	li	a1, 31
	addi	s1, sp, 272
	mv	s0, s7
.LBB0_33:                               # %"for convolution_nchw.s0.x.x_vo"
                                        #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vlwu.v	v9, (s1)
	vsw.v	v9, (s0)
	addi	a1, a1, -1
	addi	s0, s0, 16
	addi	s1, s1, 16
	bnez	a1, .LBB0_33
# %bb.34:                               # %"end for convolution_nchw.s0.x.x_vo"
                                        #   in Loop: Header=BB0_20 Depth=2
	mv	s0, s6
	vlwu.v	v9, (s6)
	slli	a0, a0, 2
	ld	a1, 64(sp)                      # 8-byte Folded Reload
	add	a0, a0, a1
	vsw.v	v9, (a0)
	addi	s11, s11, 1
	addi	t6, t6, 512
	addi	t3, t3, 512
	ld	a0, 56(sp)                      # 8-byte Folded Reload
	add	s7, s7, a0
	mv	s3, s4
	li	a0, 126
	bne	s11, a0, .LBB0_20
# %bb.35:                               # %"end for convolution_nchw.s0.y"
                                        #   in Loop: Header=BB0_19 Depth=1
	ld	s1, 48(sp)                      # 8-byte Folded Reload
	addi	s1, s1, 1
	addi	s3, s3, 576
	ld	t5, 24(sp)                      # 8-byte Folded Reload
	ld	a1, 40(sp)                      # 8-byte Folded Reload
	addw	a1, a1, t5
	ld	t6, 16(sp)                      # 8-byte Folded Reload
	li	a0, 32
	bne	s1, a0, .LBB0_19
.LBB0_36:                               # %destructor_block
	li	a0, 0
	ld	ra, 872(sp)                     # 8-byte Folded Reload
	ld	s0, 864(sp)                     # 8-byte Folded Reload
	ld	s1, 856(sp)                     # 8-byte Folded Reload
	ld	s2, 848(sp)                     # 8-byte Folded Reload
	ld	s3, 840(sp)                     # 8-byte Folded Reload
	ld	s4, 832(sp)                     # 8-byte Folded Reload
	ld	s5, 824(sp)                     # 8-byte Folded Reload
	ld	s6, 816(sp)                     # 8-byte Folded Reload
	ld	s7, 808(sp)                     # 8-byte Folded Reload
	ld	s8, 800(sp)                     # 8-byte Folded Reload
	ld	s9, 792(sp)                     # 8-byte Folded Reload
	ld	s10, 784(sp)                    # 8-byte Folded Reload
	ld	s11, 776(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 880
	ret
.LBB0_37:                               # %then_bb2
	ld	a4, 40(a0)
	sw	zero, 144(sp)
	li	a3, 128
	sw	a3, 148(sp)
	li	a5, 1
	sw	a5, 152(sp)
	sw	zero, 156(sp)
	sw	zero, 160(sp)
	sw	a3, 164(sp)
	sw	a3, 168(sp)
	sw	zero, 172(sp)
	sw	zero, 176(sp)
	li	a3, 16
	sw	a3, 180(sp)
	lui	a3, 4
	sw	a3, 184(sp)
	sw	zero, 188(sp)
	sw	zero, 192(sp)
	sw	a5, 196(sp)
	lui	a3, 64
	sw	a3, 200(sp)
	sw	zero, 204(sp)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a3, 512
	addiw	a3, a3, 9
	slli	a3, a3, 13
	addi	a3, a3, 2
	addi	a5, sp, 144
	sd	a3, 32(a0)
	beq	a5, a4, .LBB0_40
# %bb.38:                               # %for.body.i117.preheader
	li	a3, 4
	li	s1, 4
.LBB0_39:                               # %for.body.i117
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a3, e32, m1
	vlwu.v	v8, (a5)
	vsw.v	v8, (a4)
	addi	s1, s1, -1
	addi	a4, a4, 16
	addi	a5, a5, 16
	bnez	s1, .LBB0_39
.LBB0_40:                               # %_halide_buffer_init.exit119
	li	t0, 0
	sd	zero, 24(a0)
	bnez	s3, .LBB0_3
	j	.LBB0_14
.LBB0_41:                               # %then_bb5
	ld	a5, 40(a1)
	sw	zero, 208(sp)
	li	a3, 3
	sw	a3, 212(sp)
	li	s1, 1
	sw	s1, 216(sp)
	sw	zero, 220(sp)
	sw	zero, 224(sp)
	sw	a3, 228(sp)
	sw	a3, 232(sp)
	sw	zero, 236(sp)
	sw	zero, 240(sp)
	li	a3, 16
	sw	a3, 244(sp)
	li	a3, 9
	sw	a3, 248(sp)
	sw	zero, 252(sp)
	sw	zero, 256(sp)
	li	a3, 32
	sw	a3, 260(sp)
	li	a3, 144
	sw	a3, 264(sp)
	sw	zero, 268(sp)
	sd	zero, 16(a1)
	sd	zero, 8(a1)
	sd	zero, 0(a1)
	lui	a3, 512
	addiw	a3, a3, 9
	slli	a3, a3, 13
	addi	a3, a3, 2
	addi	a4, sp, 208
	sd	a3, 32(a1)
	beq	a4, a5, .LBB0_44
# %bb.42:                               # %for.body.i150.preheader
	li	s1, 4
	li	a3, 4
.LBB0_43:                               # %for.body.i150
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, s1, e32, m1
	vlwu.v	v8, (a4)
	vsw.v	v8, (a5)
	addi	a3, a3, -1
	addi	a5, a5, 16
	addi	a4, a4, 16
	bnez	a3, .LBB0_43
.LBB0_44:                               # %_halide_buffer_init.exit152
	sd	zero, 24(a1)
	ld	a1, 0(a1)
	seqz	a1, a1
	bnez	a7, .LBB0_4
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
