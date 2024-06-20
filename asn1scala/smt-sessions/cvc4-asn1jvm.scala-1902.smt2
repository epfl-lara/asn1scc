; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49818 () Bool)

(assert start!49818)

(declare-fun b!234667 () Bool)

(declare-fun e!162210 () Bool)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> b!234667 (= e!162210 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-datatypes ((array!12312 0))(
  ( (array!12313 (arr!6396 (Array (_ BitVec 32) (_ BitVec 8))) (size!5409 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9782 0))(
  ( (BitStream!9783 (buf!5884 array!12312) (currentByte!10957 (_ BitVec 32)) (currentBit!10952 (_ BitVec 32))) )
))
(declare-fun lt!370317 () BitStream!9782)

(declare-fun bs!63 () BitStream!9782)

(declare-fun withMovedBitIndex!0 (BitStream!9782 (_ BitVec 64)) BitStream!9782)

(assert (=> b!234667 (= lt!370317 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19726 0))(
  ( (tuple2!19727 (_1!10767 BitStream!9782) (_2!10767 Bool)) )
))
(declare-fun lt!370315 () tuple2!19726)

(declare-fun readBitPure!0 (BitStream!9782) tuple2!19726)

(assert (=> b!234667 (= lt!370315 (readBitPure!0 bs!63))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-datatypes ((tuple2!19728 0))(
  ( (tuple2!19729 (_1!10768 BitStream!9782) (_2!10768 (_ BitVec 64))) )
))
(declare-fun lt!370316 () tuple2!19728)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19728)

(assert (=> b!234667 (= lt!370316 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun res!196251 () Bool)

(assert (=> start!49818 (=> (not res!196251) (not e!162210))))

(assert (=> start!49818 (= res!196251 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49818 e!162210))

(assert (=> start!49818 true))

(declare-fun e!162211 () Bool)

(declare-fun inv!12 (BitStream!9782) Bool)

(assert (=> start!49818 (and (inv!12 bs!63) e!162211)))

(declare-fun b!234668 () Bool)

(declare-fun array_inv!5150 (array!12312) Bool)

(assert (=> b!234668 (= e!162211 (array_inv!5150 (buf!5884 bs!63)))))

(declare-fun b!234669 () Bool)

(declare-fun res!196252 () Bool)

(assert (=> b!234669 (=> (not res!196252) (not e!162210))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234669 (= res!196252 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234670 () Bool)

(declare-fun res!196253 () Bool)

(assert (=> b!234670 (=> (not res!196253) (not e!162210))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234670 (= res!196253 (validate_offset_bits!1 ((_ sign_extend 32) (size!5409 (buf!5884 bs!63))) ((_ sign_extend 32) (currentByte!10957 bs!63)) ((_ sign_extend 32) (currentBit!10952 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234671 () Bool)

(declare-fun res!196254 () Bool)

(assert (=> b!234671 (=> (not res!196254) (not e!162210))))

(assert (=> b!234671 (= res!196254 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!49818 res!196251) b!234670))

(assert (= (and b!234670 res!196253) b!234671))

(assert (= (and b!234671 res!196254) b!234669))

(assert (= (and b!234669 res!196252) b!234667))

(assert (= start!49818 b!234668))

(declare-fun m!357255 () Bool)

(assert (=> start!49818 m!357255))

(declare-fun m!357257 () Bool)

(assert (=> b!234668 m!357257))

(declare-fun m!357259 () Bool)

(assert (=> b!234670 m!357259))

(declare-fun m!357261 () Bool)

(assert (=> b!234669 m!357261))

(declare-fun m!357263 () Bool)

(assert (=> b!234671 m!357263))

(declare-fun m!357265 () Bool)

(assert (=> b!234667 m!357265))

(declare-fun m!357267 () Bool)

(assert (=> b!234667 m!357267))

(declare-fun m!357269 () Bool)

(assert (=> b!234667 m!357269))

(push 1)

(assert (not b!234671))

(assert (not b!234669))

(assert (not b!234668))

(assert (not start!49818))

(assert (not b!234670))

(assert (not b!234667))

(check-sat)

(pop 1)

(push 1)

(check-sat)

