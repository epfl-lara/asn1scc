; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50042 () Bool)

(assert start!50042)

(declare-fun b!235235 () Bool)

(declare-fun e!162606 () (_ BitVec 64))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun i!546 () (_ BitVec 32))

(assert (=> b!235235 (= e!162606 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))))))

(declare-fun b!235236 () Bool)

(declare-fun e!162607 () Bool)

(assert (=> b!235236 (= e!162607 (and (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000))) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-datatypes ((array!12371 0))(
  ( (array!12372 (arr!6421 (Array (_ BitVec 32) (_ BitVec 8))) (size!5434 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9832 0))(
  ( (BitStream!9833 (buf!5909 array!12371) (currentByte!11000 (_ BitVec 32)) (currentBit!10995 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9832)

(declare-datatypes ((tuple2!19868 0))(
  ( (tuple2!19869 (_1!10838 BitStream!9832) (_2!10838 (_ BitVec 64))) )
))
(declare-fun lt!370934 () tuple2!19868)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19868)

(declare-fun withMovedBitIndex!0 (BitStream!9832 (_ BitVec 64)) BitStream!9832)

(assert (=> b!235236 (= lt!370934 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162606)))))

(declare-fun c!11278 () Bool)

(declare-datatypes ((tuple2!19870 0))(
  ( (tuple2!19871 (_1!10839 BitStream!9832) (_2!10839 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9832) tuple2!19870)

(assert (=> b!235236 (= c!11278 (_2!10839 (readBitPure!0 bs!63)))))

(declare-fun lt!370935 () tuple2!19868)

(assert (=> b!235236 (= lt!370935 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun res!196720 () Bool)

(assert (=> start!50042 (=> (not res!196720) (not e!162607))))

(assert (=> start!50042 (= res!196720 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50042 e!162607))

(assert (=> start!50042 true))

(declare-fun e!162605 () Bool)

(declare-fun inv!12 (BitStream!9832) Bool)

(assert (=> start!50042 (and (inv!12 bs!63) e!162605)))

(declare-fun b!235237 () Bool)

(declare-fun res!196719 () Bool)

(assert (=> b!235237 (=> (not res!196719) (not e!162607))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235237 (= res!196719 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235238 () Bool)

(declare-fun res!196721 () Bool)

(assert (=> b!235238 (=> (not res!196721) (not e!162607))))

(assert (=> b!235238 (= res!196721 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235239 () Bool)

(declare-fun array_inv!5175 (array!12371) Bool)

(assert (=> b!235239 (= e!162605 (array_inv!5175 (buf!5909 bs!63)))))

(declare-fun b!235240 () Bool)

(assert (=> b!235240 (= e!162606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!235241 () Bool)

(declare-fun res!196722 () Bool)

(assert (=> b!235241 (=> (not res!196722) (not e!162607))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235241 (= res!196722 (validate_offset_bits!1 ((_ sign_extend 32) (size!5434 (buf!5909 bs!63))) ((_ sign_extend 32) (currentByte!11000 bs!63)) ((_ sign_extend 32) (currentBit!10995 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!50042 res!196720) b!235241))

(assert (= (and b!235241 res!196722) b!235237))

(assert (= (and b!235237 res!196719) b!235238))

(assert (= (and b!235238 res!196721) b!235236))

(assert (= (and b!235236 c!11278) b!235235))

(assert (= (and b!235236 (not c!11278)) b!235240))

(assert (= start!50042 b!235239))

(declare-fun m!357877 () Bool)

(assert (=> b!235238 m!357877))

(declare-fun m!357879 () Bool)

(assert (=> b!235236 m!357879))

(assert (=> b!235236 m!357879))

(declare-fun m!357881 () Bool)

(assert (=> b!235236 m!357881))

(declare-fun m!357883 () Bool)

(assert (=> b!235236 m!357883))

(declare-fun m!357885 () Bool)

(assert (=> b!235236 m!357885))

(declare-fun m!357887 () Bool)

(assert (=> start!50042 m!357887))

(declare-fun m!357889 () Bool)

(assert (=> b!235237 m!357889))

(declare-fun m!357891 () Bool)

(assert (=> b!235239 m!357891))

(declare-fun m!357893 () Bool)

(assert (=> b!235241 m!357893))

(push 1)

(assert (not b!235237))

(assert (not b!235236))

(assert (not b!235239))

(assert (not b!235241))

(assert (not start!50042))

(assert (not b!235238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

