; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49814 () Bool)

(assert start!49814)

(declare-fun b!234637 () Bool)

(declare-fun e!162194 () Bool)

(declare-datatypes ((array!12308 0))(
  ( (array!12309 (arr!6394 (Array (_ BitVec 32) (_ BitVec 8))) (size!5407 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9778 0))(
  ( (BitStream!9779 (buf!5882 array!12308) (currentByte!10955 (_ BitVec 32)) (currentBit!10950 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9778)

(declare-fun array_inv!5148 (array!12308) Bool)

(assert (=> b!234637 (= e!162194 (array_inv!5148 (buf!5882 bs!63)))))

(declare-fun b!234638 () Bool)

(declare-fun res!196230 () Bool)

(declare-fun e!162192 () Bool)

(assert (=> b!234638 (=> (not res!196230) (not e!162192))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234638 (= res!196230 (validate_offset_bits!1 ((_ sign_extend 32) (size!5407 (buf!5882 bs!63))) ((_ sign_extend 32) (currentByte!10955 bs!63)) ((_ sign_extend 32) (currentBit!10950 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234639 () Bool)

(declare-fun res!196227 () Bool)

(assert (=> b!234639 (=> (not res!196227) (not e!162192))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234639 (= res!196227 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234640 () Bool)

(declare-fun res!196228 () Bool)

(assert (=> b!234640 (=> (not res!196228) (not e!162192))))

(assert (=> b!234640 (= res!196228 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196229 () Bool)

(assert (=> start!49814 (=> (not res!196229) (not e!162192))))

(assert (=> start!49814 (= res!196229 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49814 e!162192))

(assert (=> start!49814 true))

(declare-fun inv!12 (BitStream!9778) Bool)

(assert (=> start!49814 (and (inv!12 bs!63) e!162194)))

(declare-fun b!234641 () Bool)

(assert (=> b!234641 (= e!162192 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun lt!370298 () BitStream!9778)

(declare-fun withMovedBitIndex!0 (BitStream!9778 (_ BitVec 64)) BitStream!9778)

(assert (=> b!234641 (= lt!370298 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19718 0))(
  ( (tuple2!19719 (_1!10763 BitStream!9778) (_2!10763 Bool)) )
))
(declare-fun lt!370299 () tuple2!19718)

(declare-fun readBitPure!0 (BitStream!9778) tuple2!19718)

(assert (=> b!234641 (= lt!370299 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19720 0))(
  ( (tuple2!19721 (_1!10764 BitStream!9778) (_2!10764 (_ BitVec 64))) )
))
(declare-fun lt!370297 () tuple2!19720)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19720)

(assert (=> b!234641 (= lt!370297 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(assert (= (and start!49814 res!196229) b!234638))

(assert (= (and b!234638 res!196230) b!234640))

(assert (= (and b!234640 res!196228) b!234639))

(assert (= (and b!234639 res!196227) b!234641))

(assert (= start!49814 b!234637))

(declare-fun m!357223 () Bool)

(assert (=> b!234641 m!357223))

(declare-fun m!357225 () Bool)

(assert (=> b!234641 m!357225))

(declare-fun m!357227 () Bool)

(assert (=> b!234641 m!357227))

(declare-fun m!357229 () Bool)

(assert (=> start!49814 m!357229))

(declare-fun m!357231 () Bool)

(assert (=> b!234639 m!357231))

(declare-fun m!357233 () Bool)

(assert (=> b!234637 m!357233))

(declare-fun m!357235 () Bool)

(assert (=> b!234640 m!357235))

(declare-fun m!357237 () Bool)

(assert (=> b!234638 m!357237))

(push 1)

(assert (not start!49814))

(assert (not b!234639))

(assert (not b!234641))

(assert (not b!234637))

(assert (not b!234638))

(assert (not b!234640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

