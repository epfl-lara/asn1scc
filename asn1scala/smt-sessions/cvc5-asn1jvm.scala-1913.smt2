; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50048 () Bool)

(assert start!50048)

(declare-fun b!235298 () Bool)

(declare-fun res!196755 () Bool)

(declare-fun e!162642 () Bool)

(assert (=> b!235298 (=> (not res!196755) (not e!162642))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235298 (= res!196755 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235299 () Bool)

(declare-fun res!196756 () Bool)

(assert (=> b!235299 (=> (not res!196756) (not e!162642))))

(assert (=> b!235299 (= res!196756 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235300 () Bool)

(declare-fun res!196757 () Bool)

(assert (=> b!235300 (=> (not res!196757) (not e!162642))))

(declare-datatypes ((array!12377 0))(
  ( (array!12378 (arr!6424 (Array (_ BitVec 32) (_ BitVec 8))) (size!5437 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9838 0))(
  ( (BitStream!9839 (buf!5912 array!12377) (currentByte!11003 (_ BitVec 32)) (currentBit!10998 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9838)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235300 (= res!196757 (validate_offset_bits!1 ((_ sign_extend 32) (size!5437 (buf!5912 bs!63))) ((_ sign_extend 32) (currentByte!11003 bs!63)) ((_ sign_extend 32) (currentBit!10998 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235301 () Bool)

(declare-fun e!162644 () Bool)

(declare-fun array_inv!5178 (array!12377) Bool)

(assert (=> b!235301 (= e!162644 (array_inv!5178 (buf!5912 bs!63)))))

(declare-fun b!235303 () Bool)

(assert (=> b!235303 (= e!162642 (bvslt (bvsub nBits!274 i!546) #b00000000000000000000000000000000))))

(declare-fun e!162643 () (_ BitVec 64))

(declare-datatypes ((tuple2!19880 0))(
  ( (tuple2!19881 (_1!10844 BitStream!9838) (_2!10844 (_ BitVec 64))) )
))
(declare-fun lt!370953 () tuple2!19880)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19880)

(declare-fun withMovedBitIndex!0 (BitStream!9838 (_ BitVec 64)) BitStream!9838)

(assert (=> b!235303 (= lt!370953 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162643)))))

(declare-fun c!11287 () Bool)

(declare-datatypes ((tuple2!19882 0))(
  ( (tuple2!19883 (_1!10845 BitStream!9838) (_2!10845 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9838) tuple2!19882)

(assert (=> b!235303 (= c!11287 (_2!10845 (readBitPure!0 bs!63)))))

(declare-fun lt!370952 () tuple2!19880)

(assert (=> b!235303 (= lt!370952 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235304 () Bool)

(assert (=> b!235304 (= e!162643 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))))))

(declare-fun b!235302 () Bool)

(assert (=> b!235302 (= e!162643 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!196758 () Bool)

(assert (=> start!50048 (=> (not res!196758) (not e!162642))))

(assert (=> start!50048 (= res!196758 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50048 e!162642))

(assert (=> start!50048 true))

(declare-fun inv!12 (BitStream!9838) Bool)

(assert (=> start!50048 (and (inv!12 bs!63) e!162644)))

(assert (= (and start!50048 res!196758) b!235300))

(assert (= (and b!235300 res!196757) b!235298))

(assert (= (and b!235298 res!196755) b!235299))

(assert (= (and b!235299 res!196756) b!235303))

(assert (= (and b!235303 c!11287) b!235304))

(assert (= (and b!235303 (not c!11287)) b!235302))

(assert (= start!50048 b!235301))

(declare-fun m!357931 () Bool)

(assert (=> b!235299 m!357931))

(declare-fun m!357933 () Bool)

(assert (=> b!235303 m!357933))

(assert (=> b!235303 m!357933))

(declare-fun m!357935 () Bool)

(assert (=> b!235303 m!357935))

(declare-fun m!357937 () Bool)

(assert (=> b!235303 m!357937))

(declare-fun m!357939 () Bool)

(assert (=> b!235303 m!357939))

(declare-fun m!357941 () Bool)

(assert (=> b!235300 m!357941))

(declare-fun m!357943 () Bool)

(assert (=> start!50048 m!357943))

(declare-fun m!357945 () Bool)

(assert (=> b!235301 m!357945))

(declare-fun m!357947 () Bool)

(assert (=> b!235298 m!357947))

(push 1)

(assert (not b!235301))

(assert (not b!235299))

(assert (not b!235298))

(assert (not b!235300))

(assert (not b!235303))

(assert (not start!50048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

