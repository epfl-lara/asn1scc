; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47608 () Bool)

(assert start!47608)

(declare-fun e!155041 () Bool)

(declare-fun lt!361483 () (_ BitVec 32))

(declare-datatypes ((array!11353 0))(
  ( (array!11354 (arr!5948 (Array (_ BitVec 32) (_ BitVec 8))) (size!4979 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9054 0))(
  ( (BitStream!9055 (buf!5520 array!11353) (currentByte!10346 (_ BitVec 32)) (currentBit!10341 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16835 0))(
  ( (Unit!16836) )
))
(declare-datatypes ((tuple3!1340 0))(
  ( (tuple3!1341 (_1!10540 Unit!16835) (_2!10540 BitStream!9054) (_3!812 array!11353)) )
))
(declare-fun lt!361487 () tuple3!1340)

(declare-fun b!226742 () Bool)

(declare-fun lt!361482 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226742 (= e!155041 (= (bvadd lt!361482 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!361483))) (bitIndex!0 (size!4979 (buf!5520 (_2!10540 lt!361487))) (currentByte!10346 (_2!10540 lt!361487)) (currentBit!10341 (_2!10540 lt!361487)))))))

(declare-fun b!226743 () Bool)

(declare-fun res!190250 () Bool)

(declare-fun e!155040 () Bool)

(assert (=> b!226743 (=> (not res!190250) (not e!155040))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226743 (= res!190250 (bvslt i!761 to!496))))

(declare-fun b!226744 () Bool)

(declare-fun res!190249 () Bool)

(assert (=> b!226744 (=> (not res!190249) (not e!155040))))

(declare-fun thiss!1870 () BitStream!9054)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226744 (= res!190249 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4979 (buf!5520 thiss!1870))) ((_ sign_extend 32) (currentByte!10346 thiss!1870)) ((_ sign_extend 32) (currentBit!10341 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226745 () Bool)

(declare-fun lt!361485 () (_ BitVec 64))

(assert (=> b!226745 (= e!155040 (not (or (= lt!361485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!361485) lt!361485)))))))

(assert (=> b!226745 (= lt!361485 ((_ sign_extend 32) (bvsub to!496 i!761)))))

(assert (=> b!226745 e!155041))

(declare-fun res!190251 () Bool)

(assert (=> b!226745 (=> (not res!190251) (not e!155041))))

(declare-fun lt!361484 () (_ BitVec 64))

(assert (=> b!226745 (= res!190251 (= lt!361482 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!361484)))))

(declare-datatypes ((tuple2!19456 0))(
  ( (tuple2!19457 (_1!10541 (_ BitVec 8)) (_2!10541 BitStream!9054)) )
))
(declare-fun lt!361486 () tuple2!19456)

(assert (=> b!226745 (= lt!361482 (bitIndex!0 (size!4979 (buf!5520 (_2!10541 lt!361486))) (currentByte!10346 (_2!10541 lt!361486)) (currentBit!10341 (_2!10541 lt!361486))))))

(assert (=> b!226745 (= lt!361484 (bitIndex!0 (size!4979 (buf!5520 thiss!1870)) (currentByte!10346 thiss!1870) (currentBit!10341 thiss!1870)))))

(declare-fun arr!308 () array!11353)

(declare-fun readByteArrayLoop!0 (BitStream!9054 array!11353 (_ BitVec 32) (_ BitVec 32)) tuple3!1340)

(assert (=> b!226745 (= lt!361487 (readByteArrayLoop!0 (_2!10541 lt!361486) (array!11354 (store (arr!5948 arr!308) i!761 (_1!10541 lt!361486)) (size!4979 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226745 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4979 (buf!5520 (_2!10541 lt!361486)))) ((_ sign_extend 32) (currentByte!10346 (_2!10541 lt!361486))) ((_ sign_extend 32) (currentBit!10341 (_2!10541 lt!361486))) lt!361483)))

(assert (=> b!226745 (= lt!361483 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!361488 () Unit!16835)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9054 BitStream!9054 (_ BitVec 64) (_ BitVec 32)) Unit!16835)

(assert (=> b!226745 (= lt!361488 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10541 lt!361486) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9054) tuple2!19456)

(assert (=> b!226745 (= lt!361486 (readByte!0 thiss!1870))))

(declare-fun res!190252 () Bool)

(assert (=> start!47608 (=> (not res!190252) (not e!155040))))

(assert (=> start!47608 (= res!190252 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4979 arr!308))))))

(assert (=> start!47608 e!155040))

(assert (=> start!47608 true))

(declare-fun array_inv!4720 (array!11353) Bool)

(assert (=> start!47608 (array_inv!4720 arr!308)))

(declare-fun e!155042 () Bool)

(declare-fun inv!12 (BitStream!9054) Bool)

(assert (=> start!47608 (and (inv!12 thiss!1870) e!155042)))

(declare-fun b!226746 () Bool)

(assert (=> b!226746 (= e!155042 (array_inv!4720 (buf!5520 thiss!1870)))))

(assert (= (and start!47608 res!190252) b!226744))

(assert (= (and b!226744 res!190249) b!226743))

(assert (= (and b!226743 res!190250) b!226745))

(assert (= (and b!226745 res!190251) b!226742))

(assert (= start!47608 b!226746))

(declare-fun m!348403 () Bool)

(assert (=> b!226745 m!348403))

(declare-fun m!348405 () Bool)

(assert (=> b!226745 m!348405))

(declare-fun m!348407 () Bool)

(assert (=> b!226745 m!348407))

(declare-fun m!348409 () Bool)

(assert (=> b!226745 m!348409))

(declare-fun m!348411 () Bool)

(assert (=> b!226745 m!348411))

(declare-fun m!348413 () Bool)

(assert (=> b!226745 m!348413))

(declare-fun m!348415 () Bool)

(assert (=> b!226745 m!348415))

(declare-fun m!348417 () Bool)

(assert (=> b!226744 m!348417))

(declare-fun m!348419 () Bool)

(assert (=> start!47608 m!348419))

(declare-fun m!348421 () Bool)

(assert (=> start!47608 m!348421))

(declare-fun m!348423 () Bool)

(assert (=> b!226746 m!348423))

(declare-fun m!348425 () Bool)

(assert (=> b!226742 m!348425))

(check-sat (not start!47608) (not b!226744) (not b!226745) (not b!226742) (not b!226746))
(check-sat)
