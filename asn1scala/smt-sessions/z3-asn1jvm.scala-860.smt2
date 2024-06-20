; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24950 () Bool)

(assert start!24950)

(declare-fun b!126207 () Bool)

(declare-fun res!104572 () Bool)

(declare-fun e!83119 () Bool)

(assert (=> b!126207 (=> res!104572 e!83119)))

(declare-datatypes ((array!5701 0))(
  ( (array!5702 (arr!3184 (Array (_ BitVec 32) (_ BitVec 8))) (size!2579 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4482 0))(
  ( (BitStream!4483 (buf!2961 array!5701) (currentByte!5694 (_ BitVec 32)) (currentBit!5689 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4482)

(declare-datatypes ((Unit!7761 0))(
  ( (Unit!7762) )
))
(declare-datatypes ((tuple2!10540 0))(
  ( (tuple2!10541 (_1!5552 Unit!7761) (_2!5552 BitStream!4482)) )
))
(declare-fun lt!197417 () tuple2!10540)

(declare-fun isPrefixOf!0 (BitStream!4482 BitStream!4482) Bool)

(assert (=> b!126207 (= res!104572 (not (isPrefixOf!0 thiss!1614 (_2!5552 lt!197417))))))

(declare-fun b!126208 () Bool)

(declare-fun res!104567 () Bool)

(declare-fun e!83125 () Bool)

(assert (=> b!126208 (=> (not res!104567) (not e!83125))))

(assert (=> b!126208 (= res!104567 (isPrefixOf!0 thiss!1614 (_2!5552 lt!197417)))))

(declare-fun res!104565 () Bool)

(declare-fun e!83120 () Bool)

(assert (=> start!24950 (=> (not res!104565) (not e!83120))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun arr!227 () array!5701)

(assert (=> start!24950 (= res!104565 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2579 arr!227))))))

(assert (=> start!24950 e!83120))

(assert (=> start!24950 true))

(declare-fun array_inv!2368 (array!5701) Bool)

(assert (=> start!24950 (array_inv!2368 arr!227)))

(declare-fun e!83121 () Bool)

(declare-fun inv!12 (BitStream!4482) Bool)

(assert (=> start!24950 (and (inv!12 thiss!1614) e!83121)))

(declare-fun e!83123 () Bool)

(declare-datatypes ((tuple2!10542 0))(
  ( (tuple2!10543 (_1!5553 BitStream!4482) (_2!5553 array!5701)) )
))
(declare-fun lt!197418 () tuple2!10542)

(declare-fun b!126209 () Bool)

(declare-fun arrayRangesEq!66 (array!5701 array!5701 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126209 (= e!83123 (not (arrayRangesEq!66 arr!227 (_2!5553 lt!197418) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126210 () Bool)

(declare-fun res!104569 () Bool)

(assert (=> b!126210 (=> (not res!104569) (not e!83120))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126210 (= res!104569 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2579 (buf!2961 thiss!1614))) ((_ sign_extend 32) (currentByte!5694 thiss!1614)) ((_ sign_extend 32) (currentBit!5689 thiss!1614)) noOfBytes!1))))

(declare-fun b!126211 () Bool)

(assert (=> b!126211 (= e!83121 (array_inv!2368 (buf!2961 thiss!1614)))))

(declare-fun b!126212 () Bool)

(assert (=> b!126212 (= e!83119 true)))

(declare-datatypes ((tuple2!10544 0))(
  ( (tuple2!10545 (_1!5554 BitStream!4482) (_2!5554 BitStream!4482)) )
))
(declare-fun lt!197415 () tuple2!10544)

(declare-fun reader!0 (BitStream!4482 BitStream!4482) tuple2!10544)

(assert (=> b!126212 (= lt!197415 (reader!0 thiss!1614 (_2!5552 lt!197417)))))

(declare-fun b!126213 () Bool)

(assert (=> b!126213 (= e!83125 (not e!83123))))

(declare-fun res!104566 () Bool)

(assert (=> b!126213 (=> res!104566 e!83123)))

(declare-fun lt!197416 () tuple2!10544)

(assert (=> b!126213 (= res!104566 (or (not (= (size!2579 (_2!5553 lt!197418)) (size!2579 arr!227))) (not (= (_1!5553 lt!197418) (_2!5554 lt!197416)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4482 array!5701 (_ BitVec 32) (_ BitVec 32)) tuple2!10542)

(assert (=> b!126213 (= lt!197418 (readByteArrayLoopPure!0 (_1!5554 lt!197416) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197420 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126213 (validate_offset_bits!1 ((_ sign_extend 32) (size!2579 (buf!2961 (_2!5552 lt!197417)))) ((_ sign_extend 32) (currentByte!5694 thiss!1614)) ((_ sign_extend 32) (currentBit!5689 thiss!1614)) lt!197420)))

(declare-fun lt!197419 () Unit!7761)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4482 array!5701 (_ BitVec 64)) Unit!7761)

(assert (=> b!126213 (= lt!197419 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2961 (_2!5552 lt!197417)) lt!197420))))

(assert (=> b!126213 (= lt!197416 (reader!0 thiss!1614 (_2!5552 lt!197417)))))

(declare-fun b!126214 () Bool)

(assert (=> b!126214 (= e!83120 (not e!83119))))

(declare-fun res!104568 () Bool)

(assert (=> b!126214 (=> res!104568 e!83119)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126214 (= res!104568 (not (= (bitIndex!0 (size!2579 (buf!2961 (_2!5552 lt!197417))) (currentByte!5694 (_2!5552 lt!197417)) (currentBit!5689 (_2!5552 lt!197417))) (bvadd (bitIndex!0 (size!2579 (buf!2961 thiss!1614)) (currentByte!5694 thiss!1614) (currentBit!5689 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83122 () Bool)

(assert (=> b!126214 e!83122))

(declare-fun res!104570 () Bool)

(assert (=> b!126214 (=> (not res!104570) (not e!83122))))

(assert (=> b!126214 (= res!104570 (= (size!2579 (buf!2961 thiss!1614)) (size!2579 (buf!2961 (_2!5552 lt!197417)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4482 array!5701 (_ BitVec 32) (_ BitVec 32)) tuple2!10540)

(assert (=> b!126214 (= lt!197417 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126215 () Bool)

(assert (=> b!126215 (= e!83122 e!83125)))

(declare-fun res!104571 () Bool)

(assert (=> b!126215 (=> (not res!104571) (not e!83125))))

(assert (=> b!126215 (= res!104571 (= (bitIndex!0 (size!2579 (buf!2961 (_2!5552 lt!197417))) (currentByte!5694 (_2!5552 lt!197417)) (currentBit!5689 (_2!5552 lt!197417))) (bvadd (bitIndex!0 (size!2579 (buf!2961 thiss!1614)) (currentByte!5694 thiss!1614) (currentBit!5689 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197420))))))

(assert (=> b!126215 (= lt!197420 ((_ sign_extend 32) noOfBytes!1))))

(assert (= (and start!24950 res!104565) b!126210))

(assert (= (and b!126210 res!104569) b!126214))

(assert (= (and b!126214 res!104570) b!126215))

(assert (= (and b!126215 res!104571) b!126208))

(assert (= (and b!126208 res!104567) b!126213))

(assert (= (and b!126213 (not res!104566)) b!126209))

(assert (= (and b!126214 (not res!104568)) b!126207))

(assert (= (and b!126207 (not res!104572)) b!126212))

(assert (= start!24950 b!126211))

(declare-fun m!191705 () Bool)

(assert (=> b!126212 m!191705))

(declare-fun m!191707 () Bool)

(assert (=> start!24950 m!191707))

(declare-fun m!191709 () Bool)

(assert (=> start!24950 m!191709))

(declare-fun m!191711 () Bool)

(assert (=> b!126210 m!191711))

(declare-fun m!191713 () Bool)

(assert (=> b!126215 m!191713))

(declare-fun m!191715 () Bool)

(assert (=> b!126215 m!191715))

(declare-fun m!191717 () Bool)

(assert (=> b!126213 m!191717))

(declare-fun m!191719 () Bool)

(assert (=> b!126213 m!191719))

(declare-fun m!191721 () Bool)

(assert (=> b!126213 m!191721))

(assert (=> b!126213 m!191705))

(declare-fun m!191723 () Bool)

(assert (=> b!126209 m!191723))

(declare-fun m!191725 () Bool)

(assert (=> b!126207 m!191725))

(assert (=> b!126208 m!191725))

(assert (=> b!126214 m!191713))

(assert (=> b!126214 m!191715))

(declare-fun m!191727 () Bool)

(assert (=> b!126214 m!191727))

(declare-fun m!191729 () Bool)

(assert (=> b!126211 m!191729))

(check-sat (not b!126215) (not b!126208) (not b!126210) (not b!126209) (not b!126211) (not b!126212) (not start!24950) (not b!126207) (not b!126214) (not b!126213))
