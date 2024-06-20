; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25154 () Bool)

(assert start!25154)

(declare-fun b!127407 () Bool)

(declare-fun e!84115 () Bool)

(declare-fun e!84118 () Bool)

(assert (=> b!127407 (= e!84115 e!84118)))

(declare-fun res!105626 () Bool)

(assert (=> b!127407 (=> (not res!105626) (not e!84118))))

(declare-datatypes ((array!5779 0))(
  ( (array!5780 (arr!3232 (Array (_ BitVec 32) (_ BitVec 8))) (size!2615 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4554 0))(
  ( (BitStream!4555 (buf!3003 array!5779) (currentByte!5748 (_ BitVec 32)) (currentBit!5743 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4554)

(declare-datatypes ((Unit!7833 0))(
  ( (Unit!7834) )
))
(declare-datatypes ((tuple2!10738 0))(
  ( (tuple2!10739 (_1!5657 Unit!7833) (_2!5657 BitStream!4554)) )
))
(declare-fun lt!198807 () tuple2!10738)

(declare-fun lt!198809 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127407 (= res!105626 (= (bitIndex!0 (size!2615 (buf!3003 (_2!5657 lt!198807))) (currentByte!5748 (_2!5657 lt!198807)) (currentBit!5743 (_2!5657 lt!198807))) (bvadd (bitIndex!0 (size!2615 (buf!3003 thiss!1614)) (currentByte!5748 thiss!1614) (currentBit!5743 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198809))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!127407 (= lt!198809 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127408 () Bool)

(declare-fun res!105628 () Bool)

(declare-fun e!84119 () Bool)

(assert (=> b!127408 (=> res!105628 e!84119)))

(declare-fun isPrefixOf!0 (BitStream!4554 BitStream!4554) Bool)

(assert (=> b!127408 (= res!105628 (not (isPrefixOf!0 thiss!1614 (_2!5657 lt!198807))))))

(declare-fun b!127409 () Bool)

(declare-fun e!84117 () Bool)

(declare-fun array_inv!2404 (array!5779) Bool)

(assert (=> b!127409 (= e!84117 (array_inv!2404 (buf!3003 thiss!1614)))))

(declare-fun b!127410 () Bool)

(declare-fun res!105624 () Bool)

(declare-fun e!84122 () Bool)

(assert (=> b!127410 (=> (not res!105624) (not e!84122))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127410 (= res!105624 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2615 (buf!3003 thiss!1614))) ((_ sign_extend 32) (currentByte!5748 thiss!1614)) ((_ sign_extend 32) (currentBit!5743 thiss!1614)) noOfBytes!1))))

(declare-fun e!84121 () Bool)

(declare-fun arr!227 () array!5779)

(declare-fun b!127411 () Bool)

(declare-datatypes ((tuple2!10740 0))(
  ( (tuple2!10741 (_1!5658 BitStream!4554) (_2!5658 array!5779)) )
))
(declare-fun lt!198805 () tuple2!10740)

(declare-fun arrayRangesEq!99 (array!5779 array!5779 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127411 (= e!84121 (not (arrayRangesEq!99 arr!227 (_2!5658 lt!198805) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127413 () Bool)

(declare-fun res!105625 () Bool)

(assert (=> b!127413 (=> (not res!105625) (not e!84118))))

(assert (=> b!127413 (= res!105625 (isPrefixOf!0 thiss!1614 (_2!5657 lt!198807)))))

(declare-fun b!127414 () Bool)

(assert (=> b!127414 (= e!84119 (bvsge ((_ sign_extend 32) noOfBytes!1) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!10742 0))(
  ( (tuple2!10743 (_1!5659 BitStream!4554) (_2!5659 BitStream!4554)) )
))
(declare-fun lt!198808 () tuple2!10742)

(declare-fun reader!0 (BitStream!4554 BitStream!4554) tuple2!10742)

(assert (=> b!127414 (= lt!198808 (reader!0 thiss!1614 (_2!5657 lt!198807)))))

(declare-fun b!127415 () Bool)

(assert (=> b!127415 (= e!84118 (not e!84121))))

(declare-fun res!105621 () Bool)

(assert (=> b!127415 (=> res!105621 e!84121)))

(declare-fun lt!198804 () tuple2!10742)

(assert (=> b!127415 (= res!105621 (or (not (= (size!2615 (_2!5658 lt!198805)) (size!2615 arr!227))) (not (= (_1!5658 lt!198805) (_2!5659 lt!198804)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4554 array!5779 (_ BitVec 32) (_ BitVec 32)) tuple2!10740)

(assert (=> b!127415 (= lt!198805 (readByteArrayLoopPure!0 (_1!5659 lt!198804) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127415 (validate_offset_bits!1 ((_ sign_extend 32) (size!2615 (buf!3003 (_2!5657 lt!198807)))) ((_ sign_extend 32) (currentByte!5748 thiss!1614)) ((_ sign_extend 32) (currentBit!5743 thiss!1614)) lt!198809)))

(declare-fun lt!198806 () Unit!7833)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4554 array!5779 (_ BitVec 64)) Unit!7833)

(assert (=> b!127415 (= lt!198806 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3003 (_2!5657 lt!198807)) lt!198809))))

(assert (=> b!127415 (= lt!198804 (reader!0 thiss!1614 (_2!5657 lt!198807)))))

(declare-fun b!127412 () Bool)

(assert (=> b!127412 (= e!84122 (not e!84119))))

(declare-fun res!105623 () Bool)

(assert (=> b!127412 (=> res!105623 e!84119)))

(assert (=> b!127412 (= res!105623 (not (= (bitIndex!0 (size!2615 (buf!3003 (_2!5657 lt!198807))) (currentByte!5748 (_2!5657 lt!198807)) (currentBit!5743 (_2!5657 lt!198807))) (bvadd (bitIndex!0 (size!2615 (buf!3003 thiss!1614)) (currentByte!5748 thiss!1614) (currentBit!5743 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!127412 e!84115))

(declare-fun res!105627 () Bool)

(assert (=> b!127412 (=> (not res!105627) (not e!84115))))

(assert (=> b!127412 (= res!105627 (= (size!2615 (buf!3003 thiss!1614)) (size!2615 (buf!3003 (_2!5657 lt!198807)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4554 array!5779 (_ BitVec 32) (_ BitVec 32)) tuple2!10738)

(assert (=> b!127412 (= lt!198807 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun res!105622 () Bool)

(assert (=> start!25154 (=> (not res!105622) (not e!84122))))

(assert (=> start!25154 (= res!105622 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2615 arr!227))))))

(assert (=> start!25154 e!84122))

(assert (=> start!25154 true))

(assert (=> start!25154 (array_inv!2404 arr!227)))

(declare-fun inv!12 (BitStream!4554) Bool)

(assert (=> start!25154 (and (inv!12 thiss!1614) e!84117)))

(assert (= (and start!25154 res!105622) b!127410))

(assert (= (and b!127410 res!105624) b!127412))

(assert (= (and b!127412 res!105627) b!127407))

(assert (= (and b!127407 res!105626) b!127413))

(assert (= (and b!127413 res!105625) b!127415))

(assert (= (and b!127415 (not res!105621)) b!127411))

(assert (= (and b!127412 (not res!105623)) b!127408))

(assert (= (and b!127408 (not res!105628)) b!127414))

(assert (= start!25154 b!127409))

(declare-fun m!193103 () Bool)

(assert (=> b!127410 m!193103))

(declare-fun m!193105 () Bool)

(assert (=> b!127414 m!193105))

(declare-fun m!193107 () Bool)

(assert (=> b!127413 m!193107))

(declare-fun m!193109 () Bool)

(assert (=> start!25154 m!193109))

(declare-fun m!193111 () Bool)

(assert (=> start!25154 m!193111))

(assert (=> b!127408 m!193107))

(declare-fun m!193113 () Bool)

(assert (=> b!127409 m!193113))

(declare-fun m!193115 () Bool)

(assert (=> b!127415 m!193115))

(declare-fun m!193117 () Bool)

(assert (=> b!127415 m!193117))

(declare-fun m!193119 () Bool)

(assert (=> b!127415 m!193119))

(assert (=> b!127415 m!193105))

(declare-fun m!193121 () Bool)

(assert (=> b!127411 m!193121))

(declare-fun m!193123 () Bool)

(assert (=> b!127407 m!193123))

(declare-fun m!193125 () Bool)

(assert (=> b!127407 m!193125))

(assert (=> b!127412 m!193123))

(assert (=> b!127412 m!193125))

(declare-fun m!193127 () Bool)

(assert (=> b!127412 m!193127))

(check-sat (not b!127408) (not b!127412) (not b!127414) (not b!127411) (not b!127415) (not start!25154) (not b!127413) (not b!127410) (not b!127409) (not b!127407))
(check-sat)
