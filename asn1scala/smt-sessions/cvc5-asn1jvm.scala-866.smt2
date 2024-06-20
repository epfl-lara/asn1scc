; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25050 () Bool)

(assert start!25050)

(declare-fun b!126825 () Bool)

(declare-fun e!83621 () Bool)

(declare-fun e!83620 () Bool)

(assert (=> b!126825 (= e!83621 (not e!83620))))

(declare-fun res!105114 () Bool)

(assert (=> b!126825 (=> res!105114 e!83620)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5738 0))(
  ( (array!5739 (arr!3207 (Array (_ BitVec 32) (_ BitVec 8))) (size!2596 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4516 0))(
  ( (BitStream!4517 (buf!2981 array!5738) (currentByte!5720 (_ BitVec 32)) (currentBit!5715 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7798 0))(
  ( (Unit!7799) )
))
(declare-datatypes ((tuple2!10642 0))(
  ( (tuple2!10643 (_1!5606 Unit!7798) (_2!5606 BitStream!4516)) )
))
(declare-fun lt!198118 () tuple2!10642)

(declare-fun thiss!1614 () BitStream!4516)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126825 (= res!105114 (not (= (bitIndex!0 (size!2596 (buf!2981 (_2!5606 lt!198118))) (currentByte!5720 (_2!5606 lt!198118)) (currentBit!5715 (_2!5606 lt!198118))) (bvadd (bitIndex!0 (size!2596 (buf!2981 thiss!1614)) (currentByte!5720 thiss!1614) (currentBit!5715 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83626 () Bool)

(assert (=> b!126825 e!83626))

(declare-fun res!105117 () Bool)

(assert (=> b!126825 (=> (not res!105117) (not e!83626))))

(assert (=> b!126825 (= res!105117 (= (size!2596 (buf!2981 thiss!1614)) (size!2596 (buf!2981 (_2!5606 lt!198118)))))))

(declare-fun arr!227 () array!5738)

(declare-fun appendByteArrayLoop!0 (BitStream!4516 array!5738 (_ BitVec 32) (_ BitVec 32)) tuple2!10642)

(assert (=> b!126825 (= lt!198118 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126826 () Bool)

(assert (=> b!126826 (= e!83620 true)))

(declare-datatypes ((tuple2!10644 0))(
  ( (tuple2!10645 (_1!5607 BitStream!4516) (_2!5607 array!5738)) )
))
(declare-fun lt!198116 () tuple2!10644)

(declare-datatypes ((tuple2!10646 0))(
  ( (tuple2!10647 (_1!5608 BitStream!4516) (_2!5608 BitStream!4516)) )
))
(declare-fun lt!198122 () tuple2!10646)

(declare-fun readByteArrayLoopPure!0 (BitStream!4516 array!5738 (_ BitVec 32) (_ BitVec 32)) tuple2!10644)

(assert (=> b!126826 (= lt!198116 (readByteArrayLoopPure!0 (_1!5608 lt!198122) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126826 (validate_offset_bits!1 ((_ sign_extend 32) (size!2596 (buf!2981 (_2!5606 lt!198118)))) ((_ sign_extend 32) (currentByte!5720 thiss!1614)) ((_ sign_extend 32) (currentBit!5715 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198120 () Unit!7798)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4516 array!5738 (_ BitVec 64)) Unit!7798)

(assert (=> b!126826 (= lt!198120 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2981 (_2!5606 lt!198118)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4516 BitStream!4516) tuple2!10646)

(assert (=> b!126826 (= lt!198122 (reader!0 thiss!1614 (_2!5606 lt!198118)))))

(declare-fun b!126827 () Bool)

(declare-fun e!83624 () Bool)

(declare-fun e!83627 () Bool)

(assert (=> b!126827 (= e!83624 (not e!83627))))

(declare-fun res!105121 () Bool)

(assert (=> b!126827 (=> res!105121 e!83627)))

(declare-fun lt!198115 () tuple2!10646)

(declare-fun lt!198119 () tuple2!10644)

(assert (=> b!126827 (= res!105121 (or (not (= (size!2596 (_2!5607 lt!198119)) (size!2596 arr!227))) (not (= (_1!5607 lt!198119) (_2!5608 lt!198115)))))))

(assert (=> b!126827 (= lt!198119 (readByteArrayLoopPure!0 (_1!5608 lt!198115) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198117 () (_ BitVec 64))

(assert (=> b!126827 (validate_offset_bits!1 ((_ sign_extend 32) (size!2596 (buf!2981 (_2!5606 lt!198118)))) ((_ sign_extend 32) (currentByte!5720 thiss!1614)) ((_ sign_extend 32) (currentBit!5715 thiss!1614)) lt!198117)))

(declare-fun lt!198121 () Unit!7798)

(assert (=> b!126827 (= lt!198121 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2981 (_2!5606 lt!198118)) lt!198117))))

(assert (=> b!126827 (= lt!198115 (reader!0 thiss!1614 (_2!5606 lt!198118)))))

(declare-fun b!126828 () Bool)

(declare-fun res!105120 () Bool)

(assert (=> b!126828 (=> (not res!105120) (not e!83624))))

(declare-fun isPrefixOf!0 (BitStream!4516 BitStream!4516) Bool)

(assert (=> b!126828 (= res!105120 (isPrefixOf!0 thiss!1614 (_2!5606 lt!198118)))))

(declare-fun b!126829 () Bool)

(declare-fun arrayRangesEq!83 (array!5738 array!5738 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126829 (= e!83627 (not (arrayRangesEq!83 arr!227 (_2!5607 lt!198119) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126830 () Bool)

(declare-fun e!83625 () Bool)

(declare-fun array_inv!2385 (array!5738) Bool)

(assert (=> b!126830 (= e!83625 (array_inv!2385 (buf!2981 thiss!1614)))))

(declare-fun b!126831 () Bool)

(declare-fun res!105115 () Bool)

(assert (=> b!126831 (=> (not res!105115) (not e!83621))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126831 (= res!105115 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2596 (buf!2981 thiss!1614))) ((_ sign_extend 32) (currentByte!5720 thiss!1614)) ((_ sign_extend 32) (currentBit!5715 thiss!1614)) noOfBytes!1))))

(declare-fun b!126832 () Bool)

(declare-fun res!105119 () Bool)

(assert (=> b!126832 (=> res!105119 e!83620)))

(assert (=> b!126832 (= res!105119 (not (isPrefixOf!0 thiss!1614 (_2!5606 lt!198118))))))

(declare-fun res!105116 () Bool)

(assert (=> start!25050 (=> (not res!105116) (not e!83621))))

(assert (=> start!25050 (= res!105116 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2596 arr!227))))))

(assert (=> start!25050 e!83621))

(assert (=> start!25050 true))

(assert (=> start!25050 (array_inv!2385 arr!227)))

(declare-fun inv!12 (BitStream!4516) Bool)

(assert (=> start!25050 (and (inv!12 thiss!1614) e!83625)))

(declare-fun b!126833 () Bool)

(assert (=> b!126833 (= e!83626 e!83624)))

(declare-fun res!105118 () Bool)

(assert (=> b!126833 (=> (not res!105118) (not e!83624))))

(assert (=> b!126833 (= res!105118 (= (bitIndex!0 (size!2596 (buf!2981 (_2!5606 lt!198118))) (currentByte!5720 (_2!5606 lt!198118)) (currentBit!5715 (_2!5606 lt!198118))) (bvadd (bitIndex!0 (size!2596 (buf!2981 thiss!1614)) (currentByte!5720 thiss!1614) (currentBit!5715 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198117))))))

(assert (=> b!126833 (= lt!198117 ((_ sign_extend 32) noOfBytes!1))))

(assert (= (and start!25050 res!105116) b!126831))

(assert (= (and b!126831 res!105115) b!126825))

(assert (= (and b!126825 res!105117) b!126833))

(assert (= (and b!126833 res!105118) b!126828))

(assert (= (and b!126828 res!105120) b!126827))

(assert (= (and b!126827 (not res!105121)) b!126829))

(assert (= (and b!126825 (not res!105114)) b!126832))

(assert (= (and b!126832 (not res!105119)) b!126826))

(assert (= start!25050 b!126830))

(declare-fun m!192417 () Bool)

(assert (=> b!126830 m!192417))

(declare-fun m!192419 () Bool)

(assert (=> b!126826 m!192419))

(declare-fun m!192421 () Bool)

(assert (=> b!126826 m!192421))

(declare-fun m!192423 () Bool)

(assert (=> b!126826 m!192423))

(declare-fun m!192425 () Bool)

(assert (=> b!126826 m!192425))

(declare-fun m!192427 () Bool)

(assert (=> b!126833 m!192427))

(declare-fun m!192429 () Bool)

(assert (=> b!126833 m!192429))

(assert (=> b!126825 m!192427))

(assert (=> b!126825 m!192429))

(declare-fun m!192431 () Bool)

(assert (=> b!126825 m!192431))

(declare-fun m!192433 () Bool)

(assert (=> b!126827 m!192433))

(declare-fun m!192435 () Bool)

(assert (=> b!126827 m!192435))

(declare-fun m!192437 () Bool)

(assert (=> b!126827 m!192437))

(assert (=> b!126827 m!192425))

(declare-fun m!192439 () Bool)

(assert (=> b!126828 m!192439))

(declare-fun m!192441 () Bool)

(assert (=> b!126829 m!192441))

(declare-fun m!192443 () Bool)

(assert (=> b!126831 m!192443))

(assert (=> b!126832 m!192439))

(declare-fun m!192445 () Bool)

(assert (=> start!25050 m!192445))

(declare-fun m!192447 () Bool)

(assert (=> start!25050 m!192447))

(push 1)

(assert (not start!25050))

(assert (not b!126833))

(assert (not b!126828))

(assert (not b!126831))

(assert (not b!126832))

(assert (not b!126829))

(assert (not b!126827))

(assert (not b!126826))

(assert (not b!126825))

(assert (not b!126830))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

