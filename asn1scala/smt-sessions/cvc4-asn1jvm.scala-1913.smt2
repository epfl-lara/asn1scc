; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50052 () Bool)

(assert start!50052)

(declare-fun res!196779 () Bool)

(declare-fun e!162665 () Bool)

(assert (=> start!50052 (=> (not res!196779) (not e!162665))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!50052 (= res!196779 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50052 e!162665))

(assert (=> start!50052 true))

(declare-datatypes ((array!12381 0))(
  ( (array!12382 (arr!6426 (Array (_ BitVec 32) (_ BitVec 8))) (size!5439 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9842 0))(
  ( (BitStream!9843 (buf!5914 array!12381) (currentByte!11005 (_ BitVec 32)) (currentBit!11000 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9842)

(declare-fun e!162666 () Bool)

(declare-fun inv!12 (BitStream!9842) Bool)

(assert (=> start!50052 (and (inv!12 bs!63) e!162666)))

(declare-fun b!235340 () Bool)

(declare-fun res!196782 () Bool)

(assert (=> b!235340 (=> (not res!196782) (not e!162665))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235340 (= res!196782 (validate_offset_bits!1 ((_ sign_extend 32) (size!5439 (buf!5914 bs!63))) ((_ sign_extend 32) (currentByte!11005 bs!63)) ((_ sign_extend 32) (currentBit!11000 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235341 () Bool)

(declare-fun res!196780 () Bool)

(assert (=> b!235341 (=> (not res!196780) (not e!162665))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235341 (= res!196780 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235342 () Bool)

(declare-fun e!162668 () (_ BitVec 64))

(assert (=> b!235342 (= e!162668 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!235343 () Bool)

(declare-fun array_inv!5180 (array!12381) Bool)

(assert (=> b!235343 (= e!162666 (array_inv!5180 (buf!5914 bs!63)))))

(declare-fun b!235344 () Bool)

(assert (=> b!235344 (= e!162665 (bvslt (bvsub nBits!274 i!546) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!19888 0))(
  ( (tuple2!19889 (_1!10848 BitStream!9842) (_2!10848 (_ BitVec 64))) )
))
(declare-fun lt!370965 () tuple2!19888)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19888)

(declare-fun withMovedBitIndex!0 (BitStream!9842 (_ BitVec 64)) BitStream!9842)

(assert (=> b!235344 (= lt!370965 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162668)))))

(declare-fun c!11293 () Bool)

(declare-datatypes ((tuple2!19890 0))(
  ( (tuple2!19891 (_1!10849 BitStream!9842) (_2!10849 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9842) tuple2!19890)

(assert (=> b!235344 (= c!11293 (_2!10849 (readBitPure!0 bs!63)))))

(declare-fun lt!370964 () tuple2!19888)

(assert (=> b!235344 (= lt!370964 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235345 () Bool)

(assert (=> b!235345 (= e!162668 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))))))

(declare-fun b!235346 () Bool)

(declare-fun res!196781 () Bool)

(assert (=> b!235346 (=> (not res!196781) (not e!162665))))

(assert (=> b!235346 (= res!196781 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(assert (= (and start!50052 res!196779) b!235340))

(assert (= (and b!235340 res!196782) b!235341))

(assert (= (and b!235341 res!196780) b!235346))

(assert (= (and b!235346 res!196781) b!235344))

(assert (= (and b!235344 c!11293) b!235345))

(assert (= (and b!235344 (not c!11293)) b!235342))

(assert (= start!50052 b!235343))

(declare-fun m!357967 () Bool)

(assert (=> b!235341 m!357967))

(declare-fun m!357969 () Bool)

(assert (=> b!235340 m!357969))

(declare-fun m!357971 () Bool)

(assert (=> b!235343 m!357971))

(declare-fun m!357973 () Bool)

(assert (=> b!235344 m!357973))

(assert (=> b!235344 m!357973))

(declare-fun m!357975 () Bool)

(assert (=> b!235344 m!357975))

(declare-fun m!357977 () Bool)

(assert (=> b!235344 m!357977))

(declare-fun m!357979 () Bool)

(assert (=> b!235344 m!357979))

(declare-fun m!357981 () Bool)

(assert (=> b!235346 m!357981))

(declare-fun m!357983 () Bool)

(assert (=> start!50052 m!357983))

(push 1)

(assert (not b!235340))

(assert (not b!235343))

(assert (not b!235341))

(assert (not b!235344))

(assert (not b!235346))

(assert (not start!50052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

