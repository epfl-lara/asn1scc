; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50028 () Bool)

(assert start!50028)

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12357 0))(
  ( (array!12358 (arr!6414 (Array (_ BitVec 32) (_ BitVec 8))) (size!5427 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9818 0))(
  ( (BitStream!9819 (buf!5902 array!12357) (currentByte!10993 (_ BitVec 32)) (currentBit!10988 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19840 0))(
  ( (tuple2!19841 (_1!10824 BitStream!9818) (_2!10824 Bool)) )
))
(declare-fun lt!370874 () tuple2!19840)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun e!162541 () Bool)

(declare-fun b!235126 () Bool)

(assert (=> b!235126 (= e!162541 (and (_2!10824 lt!370874) (let ((bdg!14492 (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (and (not (= bdg!14492 (bvand i!546 #b10000000000000000000000000000000))) (not (= bdg!14492 (bvand (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546) #b10000000000000000000000000000000)))))))))

(declare-fun lt!370875 () BitStream!9818)

(declare-fun bs!63 () BitStream!9818)

(declare-fun withMovedBitIndex!0 (BitStream!9818 (_ BitVec 64)) BitStream!9818)

(assert (=> b!235126 (= lt!370875 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9818) tuple2!19840)

(assert (=> b!235126 (= lt!370874 (readBitPure!0 bs!63))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-datatypes ((tuple2!19842 0))(
  ( (tuple2!19843 (_1!10825 BitStream!9818) (_2!10825 (_ BitVec 64))) )
))
(declare-fun lt!370873 () tuple2!19842)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19842)

(assert (=> b!235126 (= lt!370873 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235127 () Bool)

(declare-fun res!196637 () Bool)

(assert (=> b!235127 (=> (not res!196637) (not e!162541))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235127 (= res!196637 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235129 () Bool)

(declare-fun e!162540 () Bool)

(declare-fun array_inv!5168 (array!12357) Bool)

(assert (=> b!235129 (= e!162540 (array_inv!5168 (buf!5902 bs!63)))))

(declare-fun b!235130 () Bool)

(declare-fun res!196638 () Bool)

(assert (=> b!235130 (=> (not res!196638) (not e!162541))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235130 (= res!196638 (validate_offset_bits!1 ((_ sign_extend 32) (size!5427 (buf!5902 bs!63))) ((_ sign_extend 32) (currentByte!10993 bs!63)) ((_ sign_extend 32) (currentBit!10988 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235128 () Bool)

(declare-fun res!196635 () Bool)

(assert (=> b!235128 (=> (not res!196635) (not e!162541))))

(assert (=> b!235128 (= res!196635 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196636 () Bool)

(assert (=> start!50028 (=> (not res!196636) (not e!162541))))

(assert (=> start!50028 (= res!196636 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50028 e!162541))

(assert (=> start!50028 true))

(declare-fun inv!12 (BitStream!9818) Bool)

(assert (=> start!50028 (and (inv!12 bs!63) e!162540)))

(assert (= (and start!50028 res!196636) b!235130))

(assert (= (and b!235130 res!196638) b!235128))

(assert (= (and b!235128 res!196635) b!235127))

(assert (= (and b!235127 res!196637) b!235126))

(assert (= start!50028 b!235129))

(declare-fun m!357765 () Bool)

(assert (=> b!235126 m!357765))

(declare-fun m!357767 () Bool)

(assert (=> b!235126 m!357767))

(declare-fun m!357769 () Bool)

(assert (=> b!235126 m!357769))

(declare-fun m!357771 () Bool)

(assert (=> b!235129 m!357771))

(declare-fun m!357773 () Bool)

(assert (=> start!50028 m!357773))

(declare-fun m!357775 () Bool)

(assert (=> b!235128 m!357775))

(declare-fun m!357777 () Bool)

(assert (=> b!235127 m!357777))

(declare-fun m!357779 () Bool)

(assert (=> b!235130 m!357779))

(push 1)

(assert (not b!235128))

(assert (not b!235130))

(assert (not b!235129))

(assert (not b!235127))

(assert (not start!50028))

(assert (not b!235126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

