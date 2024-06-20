; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50046 () Bool)

(assert start!50046)

(declare-fun b!235277 () Bool)

(declare-fun res!196745 () Bool)

(declare-fun e!162631 () Bool)

(assert (=> b!235277 (=> (not res!196745) (not e!162631))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12375 0))(
  ( (array!12376 (arr!6423 (Array (_ BitVec 32) (_ BitVec 8))) (size!5436 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9836 0))(
  ( (BitStream!9837 (buf!5911 array!12375) (currentByte!11002 (_ BitVec 32)) (currentBit!10997 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9836)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235277 (= res!196745 (validate_offset_bits!1 ((_ sign_extend 32) (size!5436 (buf!5911 bs!63))) ((_ sign_extend 32) (currentByte!11002 bs!63)) ((_ sign_extend 32) (currentBit!10997 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235278 () Bool)

(declare-fun res!196743 () Bool)

(assert (=> b!235278 (=> (not res!196743) (not e!162631))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235278 (= res!196743 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235280 () Bool)

(declare-fun res!196746 () Bool)

(assert (=> b!235280 (=> (not res!196746) (not e!162631))))

(assert (=> b!235280 (= res!196746 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235281 () Bool)

(declare-fun e!162629 () (_ BitVec 64))

(assert (=> b!235281 (= e!162629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!235282 () Bool)

(assert (=> b!235282 (= e!162631 (and (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000))) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19876 0))(
  ( (tuple2!19877 (_1!10842 BitStream!9836) (_2!10842 (_ BitVec 64))) )
))
(declare-fun lt!370947 () tuple2!19876)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19876)

(declare-fun withMovedBitIndex!0 (BitStream!9836 (_ BitVec 64)) BitStream!9836)

(assert (=> b!235282 (= lt!370947 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162629)))))

(declare-fun c!11284 () Bool)

(declare-datatypes ((tuple2!19878 0))(
  ( (tuple2!19879 (_1!10843 BitStream!9836) (_2!10843 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9836) tuple2!19878)

(assert (=> b!235282 (= c!11284 (_2!10843 (readBitPure!0 bs!63)))))

(declare-fun lt!370946 () tuple2!19876)

(assert (=> b!235282 (= lt!370946 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235283 () Bool)

(declare-fun e!162632 () Bool)

(declare-fun array_inv!5177 (array!12375) Bool)

(assert (=> b!235283 (= e!162632 (array_inv!5177 (buf!5911 bs!63)))))

(declare-fun res!196744 () Bool)

(assert (=> start!50046 (=> (not res!196744) (not e!162631))))

(assert (=> start!50046 (= res!196744 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50046 e!162631))

(assert (=> start!50046 true))

(declare-fun inv!12 (BitStream!9836) Bool)

(assert (=> start!50046 (and (inv!12 bs!63) e!162632)))

(declare-fun b!235279 () Bool)

(assert (=> b!235279 (= e!162629 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))))))

(assert (= (and start!50046 res!196744) b!235277))

(assert (= (and b!235277 res!196745) b!235278))

(assert (= (and b!235278 res!196743) b!235280))

(assert (= (and b!235280 res!196746) b!235282))

(assert (= (and b!235282 c!11284) b!235279))

(assert (= (and b!235282 (not c!11284)) b!235281))

(assert (= start!50046 b!235283))

(declare-fun m!357913 () Bool)

(assert (=> b!235283 m!357913))

(declare-fun m!357915 () Bool)

(assert (=> b!235282 m!357915))

(assert (=> b!235282 m!357915))

(declare-fun m!357917 () Bool)

(assert (=> b!235282 m!357917))

(declare-fun m!357919 () Bool)

(assert (=> b!235282 m!357919))

(declare-fun m!357921 () Bool)

(assert (=> b!235282 m!357921))

(declare-fun m!357923 () Bool)

(assert (=> b!235278 m!357923))

(declare-fun m!357925 () Bool)

(assert (=> b!235277 m!357925))

(declare-fun m!357927 () Bool)

(assert (=> start!50046 m!357927))

(declare-fun m!357929 () Bool)

(assert (=> b!235280 m!357929))

(push 1)

(assert (not start!50046))

(assert (not b!235283))

(assert (not b!235278))

(assert (not b!235280))

(assert (not b!235277))

(assert (not b!235282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

