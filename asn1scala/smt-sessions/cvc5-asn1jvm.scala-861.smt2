; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24954 () Bool)

(assert start!24954)

(declare-fun b!126261 () Bool)

(declare-fun res!104613 () Bool)

(declare-fun e!83174 () Bool)

(assert (=> b!126261 (=> (not res!104613) (not e!83174))))

(declare-datatypes ((array!5705 0))(
  ( (array!5706 (arr!3186 (Array (_ BitVec 32) (_ BitVec 8))) (size!2581 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4486 0))(
  ( (BitStream!4487 (buf!2963 array!5705) (currentByte!5696 (_ BitVec 32)) (currentBit!5691 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4486)

(declare-datatypes ((Unit!7765 0))(
  ( (Unit!7766) )
))
(declare-datatypes ((tuple2!10552 0))(
  ( (tuple2!10553 (_1!5558 Unit!7765) (_2!5558 BitStream!4486)) )
))
(declare-fun lt!197456 () tuple2!10552)

(declare-fun isPrefixOf!0 (BitStream!4486 BitStream!4486) Bool)

(assert (=> b!126261 (= res!104613 (isPrefixOf!0 thiss!1614 (_2!5558 lt!197456)))))

(declare-fun b!126262 () Bool)

(declare-fun e!83168 () Bool)

(assert (=> b!126262 (= e!83174 (not e!83168))))

(declare-fun res!104620 () Bool)

(assert (=> b!126262 (=> res!104620 e!83168)))

(declare-datatypes ((tuple2!10554 0))(
  ( (tuple2!10555 (_1!5559 BitStream!4486) (_2!5559 array!5705)) )
))
(declare-fun lt!197453 () tuple2!10554)

(declare-datatypes ((tuple2!10556 0))(
  ( (tuple2!10557 (_1!5560 BitStream!4486) (_2!5560 BitStream!4486)) )
))
(declare-fun lt!197454 () tuple2!10556)

(declare-fun arr!227 () array!5705)

(assert (=> b!126262 (= res!104620 (or (not (= (size!2581 (_2!5559 lt!197453)) (size!2581 arr!227))) (not (= (_1!5559 lt!197453) (_2!5560 lt!197454)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4486 array!5705 (_ BitVec 32) (_ BitVec 32)) tuple2!10554)

(assert (=> b!126262 (= lt!197453 (readByteArrayLoopPure!0 (_1!5560 lt!197454) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197452 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126262 (validate_offset_bits!1 ((_ sign_extend 32) (size!2581 (buf!2963 (_2!5558 lt!197456)))) ((_ sign_extend 32) (currentByte!5696 thiss!1614)) ((_ sign_extend 32) (currentBit!5691 thiss!1614)) lt!197452)))

(declare-fun lt!197451 () Unit!7765)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4486 array!5705 (_ BitVec 64)) Unit!7765)

(assert (=> b!126262 (= lt!197451 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2963 (_2!5558 lt!197456)) lt!197452))))

(declare-fun reader!0 (BitStream!4486 BitStream!4486) tuple2!10556)

(assert (=> b!126262 (= lt!197454 (reader!0 thiss!1614 (_2!5558 lt!197456)))))

(declare-fun b!126263 () Bool)

(declare-fun res!104616 () Bool)

(declare-fun e!83167 () Bool)

(assert (=> b!126263 (=> (not res!104616) (not e!83167))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126263 (= res!104616 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2581 (buf!2963 thiss!1614))) ((_ sign_extend 32) (currentByte!5696 thiss!1614)) ((_ sign_extend 32) (currentBit!5691 thiss!1614)) noOfBytes!1))))

(declare-fun b!126264 () Bool)

(declare-fun arrayRangesEq!68 (array!5705 array!5705 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126264 (= e!83168 (not (arrayRangesEq!68 arr!227 (_2!5559 lt!197453) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126265 () Bool)

(declare-fun e!83173 () Bool)

(declare-fun array_inv!2370 (array!5705) Bool)

(assert (=> b!126265 (= e!83173 (array_inv!2370 (buf!2963 thiss!1614)))))

(declare-fun b!126266 () Bool)

(declare-fun e!83169 () Bool)

(assert (=> b!126266 (= e!83169 true)))

(declare-fun lt!197455 () tuple2!10556)

(assert (=> b!126266 (= lt!197455 (reader!0 thiss!1614 (_2!5558 lt!197456)))))

(declare-fun res!104619 () Bool)

(assert (=> start!24954 (=> (not res!104619) (not e!83167))))

(assert (=> start!24954 (= res!104619 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2581 arr!227))))))

(assert (=> start!24954 e!83167))

(assert (=> start!24954 true))

(assert (=> start!24954 (array_inv!2370 arr!227)))

(declare-fun inv!12 (BitStream!4486) Bool)

(assert (=> start!24954 (and (inv!12 thiss!1614) e!83173)))

(declare-fun b!126267 () Bool)

(assert (=> b!126267 (= e!83167 (not e!83169))))

(declare-fun res!104614 () Bool)

(assert (=> b!126267 (=> res!104614 e!83169)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126267 (= res!104614 (not (= (bitIndex!0 (size!2581 (buf!2963 (_2!5558 lt!197456))) (currentByte!5696 (_2!5558 lt!197456)) (currentBit!5691 (_2!5558 lt!197456))) (bvadd (bitIndex!0 (size!2581 (buf!2963 thiss!1614)) (currentByte!5696 thiss!1614) (currentBit!5691 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83172 () Bool)

(assert (=> b!126267 e!83172))

(declare-fun res!104618 () Bool)

(assert (=> b!126267 (=> (not res!104618) (not e!83172))))

(assert (=> b!126267 (= res!104618 (= (size!2581 (buf!2963 thiss!1614)) (size!2581 (buf!2963 (_2!5558 lt!197456)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4486 array!5705 (_ BitVec 32) (_ BitVec 32)) tuple2!10552)

(assert (=> b!126267 (= lt!197456 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126268 () Bool)

(declare-fun res!104615 () Bool)

(assert (=> b!126268 (=> res!104615 e!83169)))

(assert (=> b!126268 (= res!104615 (not (isPrefixOf!0 thiss!1614 (_2!5558 lt!197456))))))

(declare-fun b!126269 () Bool)

(assert (=> b!126269 (= e!83172 e!83174)))

(declare-fun res!104617 () Bool)

(assert (=> b!126269 (=> (not res!104617) (not e!83174))))

(assert (=> b!126269 (= res!104617 (= (bitIndex!0 (size!2581 (buf!2963 (_2!5558 lt!197456))) (currentByte!5696 (_2!5558 lt!197456)) (currentBit!5691 (_2!5558 lt!197456))) (bvadd (bitIndex!0 (size!2581 (buf!2963 thiss!1614)) (currentByte!5696 thiss!1614) (currentBit!5691 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197452))))))

(assert (=> b!126269 (= lt!197452 ((_ sign_extend 32) noOfBytes!1))))

(assert (= (and start!24954 res!104619) b!126263))

(assert (= (and b!126263 res!104616) b!126267))

(assert (= (and b!126267 res!104618) b!126269))

(assert (= (and b!126269 res!104617) b!126261))

(assert (= (and b!126261 res!104613) b!126262))

(assert (= (and b!126262 (not res!104620)) b!126264))

(assert (= (and b!126267 (not res!104614)) b!126268))

(assert (= (and b!126268 (not res!104615)) b!126266))

(assert (= start!24954 b!126265))

(declare-fun m!191757 () Bool)

(assert (=> b!126265 m!191757))

(declare-fun m!191759 () Bool)

(assert (=> b!126267 m!191759))

(declare-fun m!191761 () Bool)

(assert (=> b!126267 m!191761))

(declare-fun m!191763 () Bool)

(assert (=> b!126267 m!191763))

(declare-fun m!191765 () Bool)

(assert (=> b!126261 m!191765))

(declare-fun m!191767 () Bool)

(assert (=> b!126264 m!191767))

(declare-fun m!191769 () Bool)

(assert (=> start!24954 m!191769))

(declare-fun m!191771 () Bool)

(assert (=> start!24954 m!191771))

(declare-fun m!191773 () Bool)

(assert (=> b!126266 m!191773))

(declare-fun m!191775 () Bool)

(assert (=> b!126262 m!191775))

(declare-fun m!191777 () Bool)

(assert (=> b!126262 m!191777))

(declare-fun m!191779 () Bool)

(assert (=> b!126262 m!191779))

(assert (=> b!126262 m!191773))

(assert (=> b!126268 m!191765))

(declare-fun m!191781 () Bool)

(assert (=> b!126263 m!191781))

(assert (=> b!126269 m!191759))

(assert (=> b!126269 m!191761))

(push 1)

(assert (not b!126265))

(assert (not b!126261))

(assert (not b!126266))

(assert (not start!24954))

(assert (not b!126264))

(assert (not b!126269))

(assert (not b!126262))

(assert (not b!126268))

(assert (not b!126263))

(assert (not b!126267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

