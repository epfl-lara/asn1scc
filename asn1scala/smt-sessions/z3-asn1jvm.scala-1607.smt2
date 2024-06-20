; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45660 () Bool)

(assert start!45660)

(declare-fun b!220715 () Bool)

(declare-fun e!149890 () Bool)

(declare-datatypes ((array!10773 0))(
  ( (array!10774 (arr!5660 (Array (_ BitVec 32) (_ BitVec 8))) (size!4730 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8568 0))(
  ( (BitStream!8569 (buf!5277 array!10773) (currentByte!9913 (_ BitVec 32)) (currentBit!9908 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8568)

(declare-fun array_inv!4471 (array!10773) Bool)

(assert (=> b!220715 (= e!149890 (array_inv!4471 (buf!5277 bs!62)))))

(declare-fun b!220716 () Bool)

(declare-fun res!185926 () Bool)

(declare-fun e!149892 () Bool)

(assert (=> b!220716 (=> (not res!185926) (not e!149892))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220716 (= res!185926 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220717 () Bool)

(declare-datatypes ((tuple2!18912 0))(
  ( (tuple2!18913 (_1!10114 BitStream!8568) (_2!10114 Bool)) )
))
(declare-fun lt!348588 () tuple2!18912)

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220717 (= e!149892 (and (_2!10114 lt!348588) (or (bvslt ((_ sign_extend 32) i!541) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!541) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun lt!348589 () BitStream!8568)

(declare-fun withMovedBitIndex!0 (BitStream!8568 (_ BitVec 64)) BitStream!8568)

(assert (=> b!220717 (= lt!348589 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!8568) tuple2!18912)

(assert (=> b!220717 (= lt!348588 (readBitPure!0 bs!62))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((tuple2!18914 0))(
  ( (tuple2!18915 (_1!10115 BitStream!8568) (_2!10115 (_ BitVec 64))) )
))
(declare-fun lt!348590 () tuple2!18914)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18914)

(assert (=> b!220717 (= lt!348590 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220718 () Bool)

(declare-fun res!185927 () Bool)

(assert (=> b!220718 (=> (not res!185927) (not e!149892))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220718 (= res!185927 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!185924 () Bool)

(assert (=> start!45660 (=> (not res!185924) (not e!149892))))

(assert (=> start!45660 (= res!185924 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45660 e!149892))

(assert (=> start!45660 true))

(declare-fun inv!12 (BitStream!8568) Bool)

(assert (=> start!45660 (and (inv!12 bs!62) e!149890)))

(declare-fun b!220719 () Bool)

(declare-fun res!185925 () Bool)

(assert (=> b!220719 (=> (not res!185925) (not e!149892))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220719 (= res!185925 (validate_offset_bits!1 ((_ sign_extend 32) (size!4730 (buf!5277 bs!62))) ((_ sign_extend 32) (currentByte!9913 bs!62)) ((_ sign_extend 32) (currentBit!9908 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(assert (= (and start!45660 res!185924) b!220719))

(assert (= (and b!220719 res!185925) b!220718))

(assert (= (and b!220718 res!185927) b!220716))

(assert (= (and b!220716 res!185926) b!220717))

(assert (= start!45660 b!220715))

(declare-fun m!339405 () Bool)

(assert (=> b!220718 m!339405))

(declare-fun m!339407 () Bool)

(assert (=> b!220719 m!339407))

(declare-fun m!339409 () Bool)

(assert (=> start!45660 m!339409))

(declare-fun m!339411 () Bool)

(assert (=> b!220715 m!339411))

(declare-fun m!339413 () Bool)

(assert (=> b!220717 m!339413))

(declare-fun m!339415 () Bool)

(assert (=> b!220717 m!339415))

(declare-fun m!339417 () Bool)

(assert (=> b!220717 m!339417))

(check-sat (not b!220719) (not start!45660) (not b!220715) (not b!220718) (not b!220717))
