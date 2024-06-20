; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25048 () Bool)

(assert start!25048)

(declare-fun b!126798 () Bool)

(declare-fun e!83601 () Bool)

(assert (=> b!126798 (= e!83601 true)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5736 0))(
  ( (array!5737 (arr!3206 (Array (_ BitVec 32) (_ BitVec 8))) (size!2595 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4514 0))(
  ( (BitStream!4515 (buf!2980 array!5736) (currentByte!5719 (_ BitVec 32)) (currentBit!5714 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10636 0))(
  ( (tuple2!10637 (_1!5603 BitStream!4514) (_2!5603 BitStream!4514)) )
))
(declare-fun lt!198095 () tuple2!10636)

(declare-datatypes ((tuple2!10638 0))(
  ( (tuple2!10639 (_1!5604 BitStream!4514) (_2!5604 array!5736)) )
))
(declare-fun lt!198093 () tuple2!10638)

(declare-fun arr!227 () array!5736)

(declare-fun readByteArrayLoopPure!0 (BitStream!4514 array!5736 (_ BitVec 32) (_ BitVec 32)) tuple2!10638)

(assert (=> b!126798 (= lt!198093 (readByteArrayLoopPure!0 (_1!5603 lt!198095) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7796 0))(
  ( (Unit!7797) )
))
(declare-datatypes ((tuple2!10640 0))(
  ( (tuple2!10641 (_1!5605 Unit!7796) (_2!5605 BitStream!4514)) )
))
(declare-fun lt!198098 () tuple2!10640)

(declare-fun thiss!1614 () BitStream!4514)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126798 (validate_offset_bits!1 ((_ sign_extend 32) (size!2595 (buf!2980 (_2!5605 lt!198098)))) ((_ sign_extend 32) (currentByte!5719 thiss!1614)) ((_ sign_extend 32) (currentBit!5714 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198091 () Unit!7796)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4514 array!5736 (_ BitVec 64)) Unit!7796)

(assert (=> b!126798 (= lt!198091 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2980 (_2!5605 lt!198098)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4514 BitStream!4514) tuple2!10636)

(assert (=> b!126798 (= lt!198095 (reader!0 thiss!1614 (_2!5605 lt!198098)))))

(declare-fun b!126799 () Bool)

(declare-fun e!83596 () Bool)

(declare-fun e!83603 () Bool)

(assert (=> b!126799 (= e!83596 (not e!83603))))

(declare-fun res!105092 () Bool)

(assert (=> b!126799 (=> res!105092 e!83603)))

(declare-fun lt!198094 () tuple2!10638)

(declare-fun lt!198096 () tuple2!10636)

(assert (=> b!126799 (= res!105092 (or (not (= (size!2595 (_2!5604 lt!198094)) (size!2595 arr!227))) (not (= (_1!5604 lt!198094) (_2!5603 lt!198096)))))))

(assert (=> b!126799 (= lt!198094 (readByteArrayLoopPure!0 (_1!5603 lt!198096) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198097 () (_ BitVec 64))

(assert (=> b!126799 (validate_offset_bits!1 ((_ sign_extend 32) (size!2595 (buf!2980 (_2!5605 lt!198098)))) ((_ sign_extend 32) (currentByte!5719 thiss!1614)) ((_ sign_extend 32) (currentBit!5714 thiss!1614)) lt!198097)))

(declare-fun lt!198092 () Unit!7796)

(assert (=> b!126799 (= lt!198092 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2980 (_2!5605 lt!198098)) lt!198097))))

(assert (=> b!126799 (= lt!198096 (reader!0 thiss!1614 (_2!5605 lt!198098)))))

(declare-fun b!126800 () Bool)

(declare-fun e!83598 () Bool)

(assert (=> b!126800 (= e!83598 (not e!83601))))

(declare-fun res!105095 () Bool)

(assert (=> b!126800 (=> res!105095 e!83601)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126800 (= res!105095 (not (= (bitIndex!0 (size!2595 (buf!2980 (_2!5605 lt!198098))) (currentByte!5719 (_2!5605 lt!198098)) (currentBit!5714 (_2!5605 lt!198098))) (bvadd (bitIndex!0 (size!2595 (buf!2980 thiss!1614)) (currentByte!5719 thiss!1614) (currentBit!5714 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83597 () Bool)

(assert (=> b!126800 e!83597))

(declare-fun res!105096 () Bool)

(assert (=> b!126800 (=> (not res!105096) (not e!83597))))

(assert (=> b!126800 (= res!105096 (= (size!2595 (buf!2980 thiss!1614)) (size!2595 (buf!2980 (_2!5605 lt!198098)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4514 array!5736 (_ BitVec 32) (_ BitVec 32)) tuple2!10640)

(assert (=> b!126800 (= lt!198098 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126801 () Bool)

(declare-fun e!83602 () Bool)

(declare-fun array_inv!2384 (array!5736) Bool)

(assert (=> b!126801 (= e!83602 (array_inv!2384 (buf!2980 thiss!1614)))))

(declare-fun b!126802 () Bool)

(declare-fun arrayRangesEq!82 (array!5736 array!5736 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126802 (= e!83603 (not (arrayRangesEq!82 arr!227 (_2!5604 lt!198094) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126803 () Bool)

(declare-fun res!105093 () Bool)

(assert (=> b!126803 (=> (not res!105093) (not e!83598))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126803 (= res!105093 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2595 (buf!2980 thiss!1614))) ((_ sign_extend 32) (currentByte!5719 thiss!1614)) ((_ sign_extend 32) (currentBit!5714 thiss!1614)) noOfBytes!1))))

(declare-fun b!126804 () Bool)

(declare-fun res!105094 () Bool)

(assert (=> b!126804 (=> (not res!105094) (not e!83596))))

(declare-fun isPrefixOf!0 (BitStream!4514 BitStream!4514) Bool)

(assert (=> b!126804 (= res!105094 (isPrefixOf!0 thiss!1614 (_2!5605 lt!198098)))))

(declare-fun b!126805 () Bool)

(assert (=> b!126805 (= e!83597 e!83596)))

(declare-fun res!105090 () Bool)

(assert (=> b!126805 (=> (not res!105090) (not e!83596))))

(assert (=> b!126805 (= res!105090 (= (bitIndex!0 (size!2595 (buf!2980 (_2!5605 lt!198098))) (currentByte!5719 (_2!5605 lt!198098)) (currentBit!5714 (_2!5605 lt!198098))) (bvadd (bitIndex!0 (size!2595 (buf!2980 thiss!1614)) (currentByte!5719 thiss!1614) (currentBit!5714 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198097))))))

(assert (=> b!126805 (= lt!198097 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126806 () Bool)

(declare-fun res!105091 () Bool)

(assert (=> b!126806 (=> res!105091 e!83601)))

(assert (=> b!126806 (= res!105091 (not (isPrefixOf!0 thiss!1614 (_2!5605 lt!198098))))))

(declare-fun res!105097 () Bool)

(assert (=> start!25048 (=> (not res!105097) (not e!83598))))

(assert (=> start!25048 (= res!105097 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2595 arr!227))))))

(assert (=> start!25048 e!83598))

(assert (=> start!25048 true))

(assert (=> start!25048 (array_inv!2384 arr!227)))

(declare-fun inv!12 (BitStream!4514) Bool)

(assert (=> start!25048 (and (inv!12 thiss!1614) e!83602)))

(assert (= (and start!25048 res!105097) b!126803))

(assert (= (and b!126803 res!105093) b!126800))

(assert (= (and b!126800 res!105096) b!126805))

(assert (= (and b!126805 res!105090) b!126804))

(assert (= (and b!126804 res!105094) b!126799))

(assert (= (and b!126799 (not res!105092)) b!126802))

(assert (= (and b!126800 (not res!105095)) b!126806))

(assert (= (and b!126806 (not res!105091)) b!126798))

(assert (= start!25048 b!126801))

(declare-fun m!192385 () Bool)

(assert (=> b!126798 m!192385))

(declare-fun m!192387 () Bool)

(assert (=> b!126798 m!192387))

(declare-fun m!192389 () Bool)

(assert (=> b!126798 m!192389))

(declare-fun m!192391 () Bool)

(assert (=> b!126798 m!192391))

(declare-fun m!192393 () Bool)

(assert (=> start!25048 m!192393))

(declare-fun m!192395 () Bool)

(assert (=> start!25048 m!192395))

(declare-fun m!192397 () Bool)

(assert (=> b!126801 m!192397))

(declare-fun m!192399 () Bool)

(assert (=> b!126800 m!192399))

(declare-fun m!192401 () Bool)

(assert (=> b!126800 m!192401))

(declare-fun m!192403 () Bool)

(assert (=> b!126800 m!192403))

(declare-fun m!192405 () Bool)

(assert (=> b!126799 m!192405))

(declare-fun m!192407 () Bool)

(assert (=> b!126799 m!192407))

(declare-fun m!192409 () Bool)

(assert (=> b!126799 m!192409))

(assert (=> b!126799 m!192391))

(declare-fun m!192411 () Bool)

(assert (=> b!126804 m!192411))

(assert (=> b!126805 m!192399))

(assert (=> b!126805 m!192401))

(assert (=> b!126806 m!192411))

(declare-fun m!192413 () Bool)

(assert (=> b!126802 m!192413))

(declare-fun m!192415 () Bool)

(assert (=> b!126803 m!192415))

(push 1)

(assert (not b!126801))

(assert (not b!126802))

(assert (not b!126799))

(assert (not b!126800))

(assert (not b!126806))

(assert (not b!126803))

(assert (not start!25048))

(assert (not b!126805))

(assert (not b!126798))

(assert (not b!126804))

(check-sat)

