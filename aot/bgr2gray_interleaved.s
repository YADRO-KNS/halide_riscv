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
	addi	sp, sp, -176
	sd	ra, 168(sp)                     # 8-byte Folded Spill
	sd	s0, 160(sp)                     # 8-byte Folded Spill
	sd	s1, 152(sp)                     # 8-byte Folded Spill
	sd	s2, 144(sp)                     # 8-byte Folded Spill
	sd	s3, 136(sp)                     # 8-byte Folded Spill
	sd	s4, 128(sp)                     # 8-byte Folded Spill
	sd	s5, 120(sp)                     # 8-byte Folded Spill
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	sd	s7, 104(sp)                     # 8-byte Folded Spill
	sd	s8, 96(sp)                      # 8-byte Folded Spill
	sd	s9, 88(sp)                      # 8-byte Folded Spill
	sd	s10, 80(sp)                     # 8-byte Folded Spill
	sd	s11, 72(sp)                     # 8-byte Folded Spill
	ld	t5, 16(a0)
	ld	t3, 40(a1)
.Lpcrel_hi0:
	auipc	a2, %pcrel_hi(.Lb202.buffer)
	addi	t2, a2, %pcrel_lo(.Lpcrel_hi0)
	ld	a6, 16(t2)
	lw	t0, 0(t3)
	lw	a2, 4(t3)
	sd	a2, 24(sp)                      # 8-byte Folded Spill
	lw	t1, 16(t3)
	lw	a2, 20(t3)
	sd	a2, 16(sp)                      # 8-byte Folded Spill
	lw	a2, 24(t3)
	sd	a2, 8(sp)                       # 8-byte Folded Spill
	mv	a2, a6
	bnez	t5, .LBB0_2
# %bb.1:                                # %_halide_buffer_is_bounds_query.exit
	ld	a3, 0(a0)
	mv	a2, a6
	beqz	a3, .LBB0_24
.LBB0_2:                                # %after_bb
	ld	a3, 0(t2)
	ld	s2, 16(a1)
	or	a2, a2, a3
	bnez	a2, .LBB0_4
.LBB0_3:                                # %then_bb2
	sd	zero, 16(t2)
	sd	zero, 8(t2)
	sd	zero, 0(t2)
	lui	a2, 256
	addiw	a2, a2, 17
	ld	a3, 40(t2)
	slli	a2, a2, 12
	addi	a2, a2, 1
	sd	a2, 32(t2)
	sw	zero, 0(a3)
	li	a2, 3
	sw	a2, 4(a3)
	li	a2, 1
	sw	a2, 8(a3)
	sw	zero, 12(a3)
	sd	zero, 24(t2)
.LBB0_4:                                # %after_bb1
	beqz	s2, .LBB0_7
# %bb.5:
	li	a1, 0
	beqz	t5, .LBB0_9
.LBB0_6:
	li	a0, 0
	j	.LBB0_10
.LBB0_7:                                # %_halide_buffer_is_bounds_query.exit53
	ld	a2, 0(a1)
	beqz	a2, .LBB0_25
# %bb.8:                                # %land.rhs.i66
	ld	a1, 0(a1)
	seqz	a1, a1
	bnez	t5, .LBB0_6
.LBB0_9:                                # %land.rhs.i71
	ld	a0, 0(a0)
	seqz	a0, a0
.LBB0_10:                               # %_halide_buffer_is_bounds_query.exit72
	ld	a2, 16(t2)
	ld	a3, 0(t2)
	or	a2, a2, a3
	seqz	a2, a2
	or	a0, a0, a1
	or	a0, a0, a2
	bnez	a0, .LBB0_23
# %bb.11:                               # %"produce bgr2gray"
	ld	a0, 16(sp)                      # 8-byte Folded Reload
	blez	a0, .LBB0_23
# %bb.12:                               # %"for bgr2gray.s0.y.rebased.preheader"
	li	t2, 0
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	addiw	a0, s3, 7
	sraiw	t3, a0, 3
	addiw	s3, s3, -8
	li	a0, 1920
	mulw	a0, t1, a0
	add	t0, t0, a0
	vsetvli	a0, zero, e16, m1
	vmv.v.i	v8, 0
	li	s6, 8
	addi	a2, sp, 48
	li	a3, 12
	li	a5, 1
	addi	s0, sp, 32
	addi	t1, sp, 38
	addi	s4, sp, 36
	addi	s5, sp, 34
	addi	s11, sp, 46
	addi	ra, sp, 44
	addi	t4, sp, 42
	addi	a0, sp, 40
.LBB0_13:                               # %"for bgr2gray.s0.y.rebased"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
                                        #       Child Loop BB0_20 Depth 3
	ld	a1, 24(sp)                      # 8-byte Folded Reload
	blez	a1, .LBB0_22
# %bb.14:                               # %"for bgr2gray.s0.x.x.preheader"
                                        #   in Loop: Header=BB0_13 Depth=1
	li	s7, 0
	li	s8, 0
	ld	a1, 8(sp)                       # 8-byte Folded Reload
	mulw	s9, a1, t2
.LBB0_15:                               # %"for bgr2gray.s0.x.x"
                                        #   Parent Loop BB0_13 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_20 Depth 3
	mv	a1, s7
	blt	s7, s3, .LBB0_17
# %bb.16:                               # %"for bgr2gray.s0.x.x"
                                        #   in Loop: Header=BB0_15 Depth=2
	mv	a1, s3
.LBB0_17:                               # %"for bgr2gray.s0.x.x"
                                        #   in Loop: Header=BB0_15 Depth=2
	slliw	s10, s8, 3
	blt	s10, s3, .LBB0_19
# %bb.18:                               # %"for bgr2gray.s0.x.x"
                                        #   in Loop: Header=BB0_15 Depth=2
	mv	s10, s3
.LBB0_19:                               # %"for bgr2gray.s0.x.x"
                                        #   in Loop: Header=BB0_15 Depth=2
	add	s1, t0, a1
	slli	a1, s1, 1
	addw	a1, a1, s1
	slli	a1, a1, 1
	add	s1, t5, a1
	vsetvli	zero, s6, e16, m1
	vsh.v	v8, (a2)
	li	a1, 3
	mv	t6, a6
.LBB0_20:                               # %"for sum.s1.r17$x"
                                        #   Parent Loop BB0_13 Depth=1
                                        #     Parent Loop BB0_15 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vlhu.v	v9, (a2)
	vsetvli	zero, a3, e16, m2
	vlhu.v	v10, (s1)
	vsetvli	zero, a5, e16, m2
	vslidedown.vi	v12, v10, 3
	vslidedown.vi	v14, v10, 6
	vslidedown.vi	v16, v10, 9
	addi	a7, s1, 20
	vsetvli	zero, a3, e16, m2
	vlhu.v	v18, (a7)
	vsetvli	zero, a5, e16, m2
	vslidedown.vi	v20, v18, 2
	vslidedown.vi	v22, v18, 5
	vslidedown.vi	v24, v18, 8
	vslidedown.vi	v18, v18, 11
	vsh.v	v10, (s0)
	vsh.v	v16, (t1)
	vsh.v	v14, (s4)
	vsh.v	v12, (s5)
	vsh.v	v18, (s11)
	vsh.v	v24, (ra)
	vsh.v	v22, (t4)
	vsh.v	v20, (a0)
	vsetvli	zero, s6, e16, m1
	vlhu.v	v10, (s0)
	lh	a4, 0(t6)
	vmadd.vx	v10, a4, v9
	vsh.v	v10, (a2)
	addi	a1, a1, -1
	addi	t6, t6, 2
	addi	s1, s1, 2
	bnez	a1, .LBB0_20
# %bb.21:                               # %"consume sum"
                                        #   in Loop: Header=BB0_15 Depth=2
	vlhu.v	v9, (a2)
	vsrl.vi	v9, v9, 8
	add	s10, s10, s9
	slli	s10, s10, 1
	add	s10, s10, s2
	vsh.v	v9, (s10)
	addiw	s8, s8, 1
	addiw	s7, s7, 8
	bne	s8, t3, .LBB0_15
.LBB0_22:                               # %"end for bgr2gray.s0.x.x"
                                        #   in Loop: Header=BB0_13 Depth=1
	addi	t2, t2, 1
	addiw	t0, t0, 1920
	ld	a1, 16(sp)                      # 8-byte Folded Reload
	bne	t2, a1, .LBB0_13
.LBB0_23:                               # %destructor_block
	li	a0, 0
	ld	ra, 168(sp)                     # 8-byte Folded Reload
	ld	s0, 160(sp)                     # 8-byte Folded Reload
	ld	s1, 152(sp)                     # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	ld	s3, 136(sp)                     # 8-byte Folded Reload
	ld	s4, 128(sp)                     # 8-byte Folded Reload
	ld	s5, 120(sp)                     # 8-byte Folded Reload
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	ld	s7, 104(sp)                     # 8-byte Folded Reload
	ld	s8, 96(sp)                      # 8-byte Folded Reload
	ld	s9, 88(sp)                      # 8-byte Folded Reload
	ld	s10, 80(sp)                     # 8-byte Folded Reload
	ld	s11, 72(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 176
	ret
.LBB0_24:                               # %then_bb
	ld	a2, 40(a0)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a3, 768
	addiw	a3, a3, 17
	slli	a3, a3, 12
	addi	a3, a3, 1
	sd	a3, 32(a0)
	sw	zero, 0(a2)
	li	a3, 1920
	sw	a3, 4(a2)
	li	a3, 3
	sw	a3, 8(a2)
	sw	zero, 12(a2)
	sw	zero, 16(a2)
	li	a4, 1080
	sw	a4, 20(a2)
	lui	a4, 1
	addiw	a4, a4, 1664
	sw	a4, 24(a2)
	sw	zero, 28(a2)
	sw	zero, 32(a2)
	sw	a3, 36(a2)
	li	a3, 1
	sw	a3, 40(a2)
	sw	zero, 44(a2)
	ld	a2, 16(t2)
	sd	zero, 24(a0)
	ld	a3, 0(t2)
	ld	s2, 16(a1)
	or	a2, a2, a3
	beqz	a2, .LBB0_3
	j	.LBB0_4
.LBB0_25:                               # %then_bb5
	li	a3, 8
	ld	a4, 24(sp)                      # 8-byte Folded Reload
	mv	a2, a4
	blt	a3, a4, .LBB0_27
# %bb.26:                               # %then_bb5
	li	a2, 8
.LBB0_27:                               # %then_bb5
	ld	a5, 24(sp)                      # 8-byte Folded Reload
	mv	a4, a5
	blt	a5, a3, .LBB0_29
# %bb.28:                               # %then_bb5
	li	a4, 8
.LBB0_29:                               # %then_bb5
	add	a4, a4, t0
	addiw	a4, a4, -8
	sd	zero, 16(a1)
	sd	zero, 8(a1)
	sd	zero, 0(a1)
	lui	a3, 512
	addiw	a3, a3, 17
	slli	a3, a3, 12
	addi	a3, a3, 1
	sd	a3, 32(a1)
	sw	a4, 0(t3)
	sw	a2, 4(t3)
	li	a3, 1
	sw	a3, 8(t3)
	sw	zero, 12(t3)
	sw	t1, 16(t3)
	ld	a3, 16(sp)                      # 8-byte Folded Reload
	sw	a3, 20(t3)
	sw	a2, 24(t3)
	sw	zero, 28(t3)
	sd	zero, 24(a1)
	ld	a1, 0(a1)
	seqz	a1, a1
	bnez	t5, .LBB0_6
	j	.LBB0_9
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
.Lpcrel_hi1:
	auipc	a0, %pcrel_hi(.Lbgr2gray_interleaved_metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi1)
	ret
.Lfunc_end2:
	.size	bgr2gray_interleaved_metadata, .Lfunc_end2-bgr2gray_interleaved_metadata
                                        # -- End function
	.type	.Lb202.shape,@object            # @b202.shape
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lb202.shape:
	.asciz	"\000\000\000\000\003\000\000\000\001\000\000\000\000\000\000"
	.size	.Lb202.shape, 16

	.type	.Lb202.data,@object             # @b202.data
	.p2align	5, 0x0
.Lb202.data:
	.asciz	"\035\000\226\000M"
	.size	.Lb202.data, 6

	.type	.Lb202.buffer,@object           # @b202.buffer
	.data
	.p2align	4, 0x0
.Lb202.buffer:
	.quad	0                               # 0x0
	.quad	0
	.quad	.Lb202.data
	.quad	1                               # 0x1
	.byte	1                               # 0x1
	.byte	16                              # 0x10
	.half	1                               # 0x1
	.word	1                               # 0x1
	.quad	.Lb202.shape
	.quad	0
	.size	.Lb202.buffer, 56

	.type	.Lstr,@object                   # @str
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr:
	.asciz	"b200"
	.size	.Lstr, 5

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
	.asciz	"bgr2gray_interleaved"
	.size	.Lstr.6, 21

	.type	.Lbgr2gray_interleaved_metadata_storage,@object # @bgr2gray_interleaved_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lbgr2gray_interleaved_metadata_storage:
	.word	1                               # 0x1
	.word	2                               # 0x2
	.quad	.L__unnamed_2
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
