; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45642 () Bool)

(assert start!45642)

(declare-fun b!220631 () Bool)

(declare-fun e!149832 () Bool)

(declare-fun e!149828 () Bool)

(assert (=> b!220631 (= e!149832 e!149828)))

(declare-fun res!185858 () Bool)

(assert (=> b!220631 (=> (not res!185858) (not e!149828))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun lt!348554 () (_ BitVec 64))

(assert (=> b!220631 (= res!185858 (= (bvand acc!113 lt!348554) acc!113))))

(assert (=> b!220631 (= lt!348554 #b1111111111111111111111111111111111111111111111111111111111111111)))

(declare-fun b!220632 () Bool)

(declare-fun e!149831 () Bool)

(declare-fun lt!348553 () (_ BitVec 64))

(assert (=> b!220632 (= e!149831 (not (= (bvand lt!348553 lt!348554) lt!348553)))))

(declare-fun b!220633 () Bool)

(assert (=> b!220633 (= e!149828 e!149831)))

(declare-fun res!185860 () Bool)

(assert (=> b!220633 (=> (not res!185860) (not e!149831))))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220633 (= res!185860 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-datatypes ((array!10761 0))(
  ( (array!10762 (arr!5654 (Array (_ BitVec 32) (_ BitVec 8))) (size!4724 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8556 0))(
  ( (BitStream!8557 (buf!5271 array!10761) (currentByte!9907 (_ BitVec 32)) (currentBit!9902 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18900 0))(
  ( (tuple2!18901 (_1!10108 BitStream!8556) (_2!10108 Bool)) )
))
(declare-fun lt!348555 () tuple2!18900)

(assert (=> b!220633 (= lt!348553 (bvor acc!113 (ite (_2!10108 lt!348555) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!348556 () BitStream!8556)

(declare-fun bs!62 () BitStream!8556)

(declare-fun withMovedBitIndex!0 (BitStream!8556 (_ BitVec 64)) BitStream!8556)

(assert (=> b!220633 (= lt!348556 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!8556) tuple2!18900)

(assert (=> b!220633 (= lt!348555 (readBitPure!0 bs!62))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((tuple2!18902 0))(
  ( (tuple2!18903 (_1!10109 BitStream!8556) (_2!10109 (_ BitVec 64))) )
))
(declare-fun lt!348557 () tuple2!18902)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18902)

(assert (=> b!220633 (= lt!348557 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220635 () Bool)

(declare-fun res!185862 () Bool)

(assert (=> b!220635 (=> (not res!185862) (not e!149832))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220635 (= res!185862 (validate_offset_bits!1 ((_ sign_extend 32) (size!4724 (buf!5271 bs!62))) ((_ sign_extend 32) (currentByte!9907 bs!62)) ((_ sign_extend 32) (currentBit!9902 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220636 () Bool)

(declare-fun res!185863 () Bool)

(assert (=> b!220636 (=> (not res!185863) (not e!149831))))

(assert (=> b!220636 (= res!185863 (validate_offset_bits!1 ((_ sign_extend 32) (size!4724 (buf!5271 lt!348556))) ((_ sign_extend 32) (currentByte!9907 lt!348556)) ((_ sign_extend 32) (currentBit!9902 lt!348556)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun b!220637 () Bool)

(declare-fun e!149830 () Bool)

(declare-fun array_inv!4465 (array!10761) Bool)

(assert (=> b!220637 (= e!149830 (array_inv!4465 (buf!5271 bs!62)))))

(declare-fun b!220638 () Bool)

(declare-fun res!185861 () Bool)

(assert (=> b!220638 (=> (not res!185861) (not e!149832))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220638 (= res!185861 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220634 () Bool)

(declare-fun res!185859 () Bool)

(assert (=> b!220634 (=> (not res!185859) (not e!149831))))

(assert (=> b!220634 (= res!185859 (= (bvand lt!348553 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!185864 () Bool)

(assert (=> start!45642 (=> (not res!185864) (not e!149832))))

(assert (=> start!45642 (= res!185864 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45642 e!149832))

(assert (=> start!45642 true))

(declare-fun inv!12 (BitStream!8556) Bool)

(assert (=> start!45642 (and (inv!12 bs!62) e!149830)))

(assert (= (and start!45642 res!185864) b!220635))

(assert (= (and b!220635 res!185862) b!220638))

(assert (= (and b!220638 res!185861) b!220631))

(assert (= (and b!220631 res!185858) b!220633))

(assert (= (and b!220633 res!185860) b!220636))

(assert (= (and b!220636 res!185863) b!220634))

(assert (= (and b!220634 res!185859) b!220632))

(assert (= start!45642 b!220637))

(declare-fun m!339337 () Bool)

(assert (=> start!45642 m!339337))

(declare-fun m!339339 () Bool)

(assert (=> b!220636 m!339339))

(declare-fun m!339341 () Bool)

(assert (=> b!220635 m!339341))

(declare-fun m!339343 () Bool)

(assert (=> b!220633 m!339343))

(declare-fun m!339345 () Bool)

(assert (=> b!220633 m!339345))

(declare-fun m!339347 () Bool)

(assert (=> b!220633 m!339347))

(declare-fun m!339349 () Bool)

(assert (=> b!220634 m!339349))

(declare-fun m!339351 () Bool)

(assert (=> b!220638 m!339351))

(declare-fun m!339353 () Bool)

(assert (=> b!220637 m!339353))

(check-sat (not b!220634) (not b!220637) (not b!220636) (not b!220638) (not b!220633) (not b!220635) (not start!45642))
