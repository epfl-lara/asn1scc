; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25052 () Bool)

(assert start!25052)

(declare-fun b!126853 () Bool)

(declare-fun e!83648 () Bool)

(declare-datatypes ((array!5740 0))(
  ( (array!5741 (arr!3208 (Array (_ BitVec 32) (_ BitVec 8))) (size!2597 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4518 0))(
  ( (BitStream!4519 (buf!2982 array!5740) (currentByte!5721 (_ BitVec 32)) (currentBit!5716 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4518)

(declare-fun array_inv!2386 (array!5740) Bool)

(assert (=> b!126853 (= e!83648 (array_inv!2386 (buf!2982 thiss!1614)))))

(declare-fun b!126854 () Bool)

(declare-fun e!83647 () Bool)

(declare-fun e!83651 () Bool)

(assert (=> b!126854 (= e!83647 e!83651)))

(declare-fun res!105145 () Bool)

(assert (=> b!126854 (=> (not res!105145) (not e!83651))))

(declare-datatypes ((Unit!7800 0))(
  ( (Unit!7801) )
))
(declare-datatypes ((tuple2!10648 0))(
  ( (tuple2!10649 (_1!5609 Unit!7800) (_2!5609 BitStream!4518)) )
))
(declare-fun lt!198145 () tuple2!10648)

(declare-fun lt!198146 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126854 (= res!105145 (= (bitIndex!0 (size!2597 (buf!2982 (_2!5609 lt!198145))) (currentByte!5721 (_2!5609 lt!198145)) (currentBit!5716 (_2!5609 lt!198145))) (bvadd (bitIndex!0 (size!2597 (buf!2982 thiss!1614)) (currentByte!5721 thiss!1614) (currentBit!5716 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198146))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!126854 (= lt!198146 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126855 () Bool)

(declare-fun res!105139 () Bool)

(declare-fun e!83649 () Bool)

(assert (=> b!126855 (=> res!105139 e!83649)))

(declare-fun isPrefixOf!0 (BitStream!4518 BitStream!4518) Bool)

(assert (=> b!126855 (= res!105139 (not (isPrefixOf!0 thiss!1614 (_2!5609 lt!198145))))))

(declare-fun b!126856 () Bool)

(declare-fun res!105140 () Bool)

(assert (=> b!126856 (=> (not res!105140) (not e!83651))))

(assert (=> b!126856 (= res!105140 (isPrefixOf!0 thiss!1614 (_2!5609 lt!198145)))))

(declare-fun b!126857 () Bool)

(declare-fun e!83645 () Bool)

(assert (=> b!126857 (= e!83651 (not e!83645))))

(declare-fun res!105144 () Bool)

(assert (=> b!126857 (=> res!105144 e!83645)))

(declare-datatypes ((tuple2!10650 0))(
  ( (tuple2!10651 (_1!5610 BitStream!4518) (_2!5610 BitStream!4518)) )
))
(declare-fun lt!198139 () tuple2!10650)

(declare-fun arr!227 () array!5740)

(declare-datatypes ((tuple2!10652 0))(
  ( (tuple2!10653 (_1!5611 BitStream!4518) (_2!5611 array!5740)) )
))
(declare-fun lt!198141 () tuple2!10652)

(assert (=> b!126857 (= res!105144 (or (not (= (size!2597 (_2!5611 lt!198141)) (size!2597 arr!227))) (not (= (_1!5611 lt!198141) (_2!5610 lt!198139)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4518 array!5740 (_ BitVec 32) (_ BitVec 32)) tuple2!10652)

(assert (=> b!126857 (= lt!198141 (readByteArrayLoopPure!0 (_1!5610 lt!198139) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126857 (validate_offset_bits!1 ((_ sign_extend 32) (size!2597 (buf!2982 (_2!5609 lt!198145)))) ((_ sign_extend 32) (currentByte!5721 thiss!1614)) ((_ sign_extend 32) (currentBit!5716 thiss!1614)) lt!198146)))

(declare-fun lt!198143 () Unit!7800)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4518 array!5740 (_ BitVec 64)) Unit!7800)

(assert (=> b!126857 (= lt!198143 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2982 (_2!5609 lt!198145)) lt!198146))))

(declare-fun reader!0 (BitStream!4518 BitStream!4518) tuple2!10650)

(assert (=> b!126857 (= lt!198139 (reader!0 thiss!1614 (_2!5609 lt!198145)))))

(declare-fun b!126858 () Bool)

(declare-fun e!83646 () Bool)

(assert (=> b!126858 (= e!83646 (not e!83649))))

(declare-fun res!105143 () Bool)

(assert (=> b!126858 (=> res!105143 e!83649)))

(assert (=> b!126858 (= res!105143 (not (= (bitIndex!0 (size!2597 (buf!2982 (_2!5609 lt!198145))) (currentByte!5721 (_2!5609 lt!198145)) (currentBit!5716 (_2!5609 lt!198145))) (bvadd (bitIndex!0 (size!2597 (buf!2982 thiss!1614)) (currentByte!5721 thiss!1614) (currentBit!5716 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126858 e!83647))

(declare-fun res!105138 () Bool)

(assert (=> b!126858 (=> (not res!105138) (not e!83647))))

(assert (=> b!126858 (= res!105138 (= (size!2597 (buf!2982 thiss!1614)) (size!2597 (buf!2982 (_2!5609 lt!198145)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4518 array!5740 (_ BitVec 32) (_ BitVec 32)) tuple2!10648)

(assert (=> b!126858 (= lt!198145 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126859 () Bool)

(declare-fun res!105142 () Bool)

(assert (=> b!126859 (=> (not res!105142) (not e!83646))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126859 (= res!105142 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2597 (buf!2982 thiss!1614))) ((_ sign_extend 32) (currentByte!5721 thiss!1614)) ((_ sign_extend 32) (currentBit!5716 thiss!1614)) noOfBytes!1))))

(declare-fun b!126860 () Bool)

(assert (=> b!126860 (= e!83649 true)))

(declare-fun lt!198142 () tuple2!10650)

(declare-fun lt!198144 () tuple2!10652)

(assert (=> b!126860 (= lt!198144 (readByteArrayLoopPure!0 (_1!5610 lt!198142) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!126860 (validate_offset_bits!1 ((_ sign_extend 32) (size!2597 (buf!2982 (_2!5609 lt!198145)))) ((_ sign_extend 32) (currentByte!5721 thiss!1614)) ((_ sign_extend 32) (currentBit!5716 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198140 () Unit!7800)

(assert (=> b!126860 (= lt!198140 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2982 (_2!5609 lt!198145)) ((_ sign_extend 32) noOfBytes!1)))))

(assert (=> b!126860 (= lt!198142 (reader!0 thiss!1614 (_2!5609 lt!198145)))))

(declare-fun b!126852 () Bool)

(declare-fun arrayRangesEq!84 (array!5740 array!5740 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126852 (= e!83645 (not (arrayRangesEq!84 arr!227 (_2!5611 lt!198141) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun res!105141 () Bool)

(assert (=> start!25052 (=> (not res!105141) (not e!83646))))

(assert (=> start!25052 (= res!105141 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2597 arr!227))))))

(assert (=> start!25052 e!83646))

(assert (=> start!25052 true))

(assert (=> start!25052 (array_inv!2386 arr!227)))

(declare-fun inv!12 (BitStream!4518) Bool)

(assert (=> start!25052 (and (inv!12 thiss!1614) e!83648)))

(assert (= (and start!25052 res!105141) b!126859))

(assert (= (and b!126859 res!105142) b!126858))

(assert (= (and b!126858 res!105138) b!126854))

(assert (= (and b!126854 res!105145) b!126856))

(assert (= (and b!126856 res!105140) b!126857))

(assert (= (and b!126857 (not res!105144)) b!126852))

(assert (= (and b!126858 (not res!105143)) b!126855))

(assert (= (and b!126855 (not res!105139)) b!126860))

(assert (= start!25052 b!126853))

(declare-fun m!192449 () Bool)

(assert (=> b!126855 m!192449))

(declare-fun m!192451 () Bool)

(assert (=> b!126857 m!192451))

(declare-fun m!192453 () Bool)

(assert (=> b!126857 m!192453))

(declare-fun m!192455 () Bool)

(assert (=> b!126857 m!192455))

(declare-fun m!192457 () Bool)

(assert (=> b!126857 m!192457))

(assert (=> b!126856 m!192449))

(declare-fun m!192459 () Bool)

(assert (=> b!126852 m!192459))

(declare-fun m!192461 () Bool)

(assert (=> b!126853 m!192461))

(declare-fun m!192463 () Bool)

(assert (=> b!126860 m!192463))

(declare-fun m!192465 () Bool)

(assert (=> b!126860 m!192465))

(declare-fun m!192467 () Bool)

(assert (=> b!126860 m!192467))

(assert (=> b!126860 m!192457))

(declare-fun m!192469 () Bool)

(assert (=> b!126858 m!192469))

(declare-fun m!192471 () Bool)

(assert (=> b!126858 m!192471))

(declare-fun m!192473 () Bool)

(assert (=> b!126858 m!192473))

(declare-fun m!192475 () Bool)

(assert (=> start!25052 m!192475))

(declare-fun m!192477 () Bool)

(assert (=> start!25052 m!192477))

(declare-fun m!192479 () Bool)

(assert (=> b!126859 m!192479))

(assert (=> b!126854 m!192469))

(assert (=> b!126854 m!192471))

(check-sat (not b!126854) (not b!126859) (not b!126857) (not b!126858) (not b!126852) (not start!25052) (not b!126855) (not b!126856) (not b!126860) (not b!126853))
