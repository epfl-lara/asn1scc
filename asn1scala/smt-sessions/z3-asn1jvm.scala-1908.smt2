; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50020 () Bool)

(assert start!50020)

(declare-fun res!196588 () Bool)

(declare-fun e!162505 () Bool)

(assert (=> start!50020 (=> (not res!196588) (not e!162505))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!50020 (= res!196588 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50020 e!162505))

(assert (=> start!50020 true))

(declare-datatypes ((array!12349 0))(
  ( (array!12350 (arr!6410 (Array (_ BitVec 32) (_ BitVec 8))) (size!5423 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9810 0))(
  ( (BitStream!9811 (buf!5898 array!12349) (currentByte!10989 (_ BitVec 32)) (currentBit!10984 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9810)

(declare-fun e!162506 () Bool)

(declare-fun inv!12 (BitStream!9810) Bool)

(assert (=> start!50020 (and (inv!12 bs!63) e!162506)))

(declare-fun b!235066 () Bool)

(declare-datatypes ((tuple2!19824 0))(
  ( (tuple2!19825 (_1!10816 BitStream!9810) (_2!10816 Bool)) )
))
(declare-fun lt!370838 () tuple2!19824)

(assert (=> b!235066 (= e!162505 (and (_2!10816 lt!370838) (not (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun lt!370839 () BitStream!9810)

(declare-fun withMovedBitIndex!0 (BitStream!9810 (_ BitVec 64)) BitStream!9810)

(assert (=> b!235066 (= lt!370839 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9810) tuple2!19824)

(assert (=> b!235066 (= lt!370838 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19826 0))(
  ( (tuple2!19827 (_1!10817 BitStream!9810) (_2!10817 (_ BitVec 64))) )
))
(declare-fun lt!370837 () tuple2!19826)

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19826)

(assert (=> b!235066 (= lt!370837 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235067 () Bool)

(declare-fun array_inv!5164 (array!12349) Bool)

(assert (=> b!235067 (= e!162506 (array_inv!5164 (buf!5898 bs!63)))))

(declare-fun b!235068 () Bool)

(declare-fun res!196589 () Bool)

(assert (=> b!235068 (=> (not res!196589) (not e!162505))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235068 (= res!196589 (validate_offset_bits!1 ((_ sign_extend 32) (size!5423 (buf!5898 bs!63))) ((_ sign_extend 32) (currentByte!10989 bs!63)) ((_ sign_extend 32) (currentBit!10984 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235069 () Bool)

(declare-fun res!196590 () Bool)

(assert (=> b!235069 (=> (not res!196590) (not e!162505))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235069 (= res!196590 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235070 () Bool)

(declare-fun res!196587 () Bool)

(assert (=> b!235070 (=> (not res!196587) (not e!162505))))

(assert (=> b!235070 (= res!196587 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(assert (= (and start!50020 res!196588) b!235068))

(assert (= (and b!235068 res!196589) b!235069))

(assert (= (and b!235069 res!196590) b!235070))

(assert (= (and b!235070 res!196587) b!235066))

(assert (= start!50020 b!235067))

(declare-fun m!357701 () Bool)

(assert (=> b!235068 m!357701))

(declare-fun m!357703 () Bool)

(assert (=> start!50020 m!357703))

(declare-fun m!357705 () Bool)

(assert (=> b!235070 m!357705))

(declare-fun m!357707 () Bool)

(assert (=> b!235067 m!357707))

(declare-fun m!357709 () Bool)

(assert (=> b!235066 m!357709))

(declare-fun m!357711 () Bool)

(assert (=> b!235066 m!357711))

(declare-fun m!357713 () Bool)

(assert (=> b!235066 m!357713))

(declare-fun m!357715 () Bool)

(assert (=> b!235069 m!357715))

(check-sat (not start!50020) (not b!235067) (not b!235070) (not b!235066) (not b!235068) (not b!235069))
(check-sat)
