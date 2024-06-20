; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50026 () Bool)

(assert start!50026)

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun i!546 () (_ BitVec 32))

(declare-datatypes ((array!12355 0))(
  ( (array!12356 (arr!6413 (Array (_ BitVec 32) (_ BitVec 8))) (size!5426 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9816 0))(
  ( (BitStream!9817 (buf!5901 array!12355) (currentByte!10992 (_ BitVec 32)) (currentBit!10987 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19836 0))(
  ( (tuple2!19837 (_1!10822 BitStream!9816) (_2!10822 Bool)) )
))
(declare-fun lt!370866 () tuple2!19836)

(declare-fun b!235111 () Bool)

(declare-fun e!162532 () Bool)

(assert (=> b!235111 (= e!162532 (and (_2!10822 lt!370866) (let ((bdg!14492 (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (and (not (= bdg!14492 (bvand i!546 #b10000000000000000000000000000000))) (not (= bdg!14492 (bvand (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546) #b10000000000000000000000000000000)))))))))

(declare-fun lt!370864 () BitStream!9816)

(declare-fun bs!63 () BitStream!9816)

(declare-fun withMovedBitIndex!0 (BitStream!9816 (_ BitVec 64)) BitStream!9816)

(assert (=> b!235111 (= lt!370864 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9816) tuple2!19836)

(assert (=> b!235111 (= lt!370866 (readBitPure!0 bs!63))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-datatypes ((tuple2!19838 0))(
  ( (tuple2!19839 (_1!10823 BitStream!9816) (_2!10823 (_ BitVec 64))) )
))
(declare-fun lt!370865 () tuple2!19838)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19838)

(assert (=> b!235111 (= lt!370865 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235112 () Bool)

(declare-fun res!196623 () Bool)

(assert (=> b!235112 (=> (not res!196623) (not e!162532))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235112 (= res!196623 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235113 () Bool)

(declare-fun e!162533 () Bool)

(declare-fun array_inv!5167 (array!12355) Bool)

(assert (=> b!235113 (= e!162533 (array_inv!5167 (buf!5901 bs!63)))))

(declare-fun b!235114 () Bool)

(declare-fun res!196625 () Bool)

(assert (=> b!235114 (=> (not res!196625) (not e!162532))))

(assert (=> b!235114 (= res!196625 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun res!196626 () Bool)

(assert (=> start!50026 (=> (not res!196626) (not e!162532))))

(assert (=> start!50026 (= res!196626 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50026 e!162532))

(assert (=> start!50026 true))

(declare-fun inv!12 (BitStream!9816) Bool)

(assert (=> start!50026 (and (inv!12 bs!63) e!162533)))

(declare-fun b!235115 () Bool)

(declare-fun res!196624 () Bool)

(assert (=> b!235115 (=> (not res!196624) (not e!162532))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235115 (= res!196624 (validate_offset_bits!1 ((_ sign_extend 32) (size!5426 (buf!5901 bs!63))) ((_ sign_extend 32) (currentByte!10992 bs!63)) ((_ sign_extend 32) (currentBit!10987 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!50026 res!196626) b!235115))

(assert (= (and b!235115 res!196624) b!235112))

(assert (= (and b!235112 res!196623) b!235114))

(assert (= (and b!235114 res!196625) b!235111))

(assert (= start!50026 b!235113))

(declare-fun m!357749 () Bool)

(assert (=> b!235114 m!357749))

(declare-fun m!357751 () Bool)

(assert (=> b!235113 m!357751))

(declare-fun m!357753 () Bool)

(assert (=> start!50026 m!357753))

(declare-fun m!357755 () Bool)

(assert (=> b!235115 m!357755))

(declare-fun m!357757 () Bool)

(assert (=> b!235112 m!357757))

(declare-fun m!357759 () Bool)

(assert (=> b!235111 m!357759))

(declare-fun m!357761 () Bool)

(assert (=> b!235111 m!357761))

(declare-fun m!357763 () Bool)

(assert (=> b!235111 m!357763))

(check-sat (not b!235115) (not b!235114) (not start!50026) (not b!235111) (not b!235112) (not b!235113))
(check-sat)
