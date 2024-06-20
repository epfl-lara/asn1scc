; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45678 () Bool)

(assert start!45678)

(declare-fun b!220879 () Bool)

(declare-fun res!186035 () Bool)

(declare-fun e!149988 () Bool)

(assert (=> b!220879 (=> (not res!186035) (not e!149988))))

(declare-datatypes ((array!10791 0))(
  ( (array!10792 (arr!5669 (Array (_ BitVec 32) (_ BitVec 8))) (size!4739 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8586 0))(
  ( (BitStream!8587 (buf!5286 array!10791) (currentByte!9922 (_ BitVec 32)) (currentBit!9917 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8586)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220879 (= res!186035 (validate_offset_bits!1 ((_ sign_extend 32) (size!4739 (buf!5286 bs!62))) ((_ sign_extend 32) (currentByte!9922 bs!62)) ((_ sign_extend 32) (currentBit!9917 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220880 () Bool)

(assert (=> b!220880 (= e!149988 (bvslt (bvsub nBits!265 i!541) #b00000000000000000000000000000000))))

(declare-fun e!149985 () (_ BitVec 64))

(declare-datatypes ((tuple2!18948 0))(
  ( (tuple2!18949 (_1!10132 BitStream!8586) (_2!10132 (_ BitVec 64))) )
))
(declare-fun lt!348656 () tuple2!18948)

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18948)

(declare-fun withMovedBitIndex!0 (BitStream!8586 (_ BitVec 64)) BitStream!8586)

(assert (=> b!220880 (= lt!348656 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!149985)))))

(declare-fun c!10691 () Bool)

(declare-datatypes ((tuple2!18950 0))(
  ( (tuple2!18951 (_1!10133 BitStream!8586) (_2!10133 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8586) tuple2!18950)

(assert (=> b!220880 (= c!10691 (_2!10133 (readBitPure!0 bs!62)))))

(declare-fun lt!348655 () tuple2!18948)

(assert (=> b!220880 (= lt!348655 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220881 () Bool)

(assert (=> b!220881 (= e!149985 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)))))

(declare-fun b!220882 () Bool)

(assert (=> b!220882 (= e!149985 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!220883 () Bool)

(declare-fun res!186034 () Bool)

(assert (=> b!220883 (=> (not res!186034) (not e!149988))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220883 (= res!186034 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220884 () Bool)

(declare-fun e!149986 () Bool)

(declare-fun array_inv!4480 (array!10791) Bool)

(assert (=> b!220884 (= e!149986 (array_inv!4480 (buf!5286 bs!62)))))

(declare-fun b!220878 () Bool)

(declare-fun res!186032 () Bool)

(assert (=> b!220878 (=> (not res!186032) (not e!149988))))

(assert (=> b!220878 (= res!186032 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun res!186033 () Bool)

(assert (=> start!45678 (=> (not res!186033) (not e!149988))))

(assert (=> start!45678 (= res!186033 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45678 e!149988))

(assert (=> start!45678 true))

(declare-fun inv!12 (BitStream!8586) Bool)

(assert (=> start!45678 (and (inv!12 bs!62) e!149986)))

(assert (= (and start!45678 res!186033) b!220879))

(assert (= (and b!220879 res!186035) b!220883))

(assert (= (and b!220883 res!186034) b!220878))

(assert (= (and b!220878 res!186032) b!220880))

(assert (= (and b!220880 c!10691) b!220881))

(assert (= (and b!220880 (not c!10691)) b!220882))

(assert (= start!45678 b!220884))

(declare-fun m!339539 () Bool)

(assert (=> b!220884 m!339539))

(declare-fun m!339541 () Bool)

(assert (=> start!45678 m!339541))

(declare-fun m!339543 () Bool)

(assert (=> b!220879 m!339543))

(declare-fun m!339545 () Bool)

(assert (=> b!220880 m!339545))

(assert (=> b!220880 m!339545))

(declare-fun m!339547 () Bool)

(assert (=> b!220880 m!339547))

(declare-fun m!339549 () Bool)

(assert (=> b!220880 m!339549))

(declare-fun m!339551 () Bool)

(assert (=> b!220880 m!339551))

(declare-fun m!339553 () Bool)

(assert (=> b!220883 m!339553))

(check-sat (not b!220880) (not b!220884) (not b!220879) (not start!45678) (not b!220883))
