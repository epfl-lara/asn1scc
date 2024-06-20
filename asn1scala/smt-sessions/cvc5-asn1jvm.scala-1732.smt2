; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47738 () Bool)

(assert start!47738)

(declare-fun res!190645 () Bool)

(declare-fun e!155469 () Bool)

(assert (=> start!47738 (=> (not res!190645) (not e!155469))))

(declare-datatypes ((array!11405 0))(
  ( (array!11406 (arr!5977 (Array (_ BitVec 32) (_ BitVec 8))) (size!5002 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11405)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47738 (= res!190645 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5002 arr!308))))))

(assert (=> start!47738 e!155469))

(assert (=> start!47738 true))

(declare-fun array_inv!4743 (array!11405) Bool)

(assert (=> start!47738 (array_inv!4743 arr!308)))

(declare-datatypes ((BitStream!9100 0))(
  ( (BitStream!9101 (buf!5543 array!11405) (currentByte!10381 (_ BitVec 32)) (currentBit!10376 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9100)

(declare-fun e!155468 () Bool)

(declare-fun inv!12 (BitStream!9100) Bool)

(assert (=> start!47738 (and (inv!12 thiss!1870) e!155468)))

(declare-fun b!227237 () Bool)

(assert (=> b!227237 (= e!155469 (not (or (bvsgt i!761 (bvadd #b00000000000000000000000000000001 i!761)) (and (bvsle i!761 (size!5002 arr!308)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (size!5002 arr!308))))))))

(declare-fun lt!363041 () array!11405)

(declare-fun arrayRangesEq!838 (array!11405 array!11405 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227237 (arrayRangesEq!838 arr!308 lt!363041 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19526 0))(
  ( (tuple2!19527 (_1!10598 (_ BitVec 8)) (_2!10598 BitStream!9100)) )
))
(declare-fun lt!363043 () tuple2!19526)

(declare-datatypes ((Unit!16947 0))(
  ( (Unit!16948) )
))
(declare-fun lt!363048 () Unit!16947)

(declare-fun arrayUpdatedAtPrefixLemma!397 (array!11405 (_ BitVec 32) (_ BitVec 8)) Unit!16947)

(assert (=> b!227237 (= lt!363048 (arrayUpdatedAtPrefixLemma!397 arr!308 i!761 (_1!10598 lt!363043)))))

(declare-fun lt!363047 () (_ BitVec 64))

(declare-fun lt!363042 () (_ BitVec 64))

(declare-fun lt!363040 () (_ BitVec 64))

(declare-datatypes ((tuple3!1386 0))(
  ( (tuple3!1387 (_1!10599 Unit!16947) (_2!10599 BitStream!9100) (_3!835 array!11405)) )
))
(declare-fun lt!363045 () tuple3!1386)

(declare-fun lt!363046 () (_ BitVec 32))

(assert (=> b!227237 (and (= (bvadd lt!363047 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363046))) lt!363040) (= (bvadd lt!363042 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363040) (= (buf!5543 thiss!1870) (buf!5543 (_2!10599 lt!363045))) (= (size!5002 arr!308) (size!5002 (_3!835 lt!363045))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227237 (= lt!363040 (bitIndex!0 (size!5002 (buf!5543 (_2!10599 lt!363045))) (currentByte!10381 (_2!10599 lt!363045)) (currentBit!10376 (_2!10599 lt!363045))))))

(assert (=> b!227237 (= lt!363047 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363042))))

(assert (=> b!227237 (= lt!363047 (bitIndex!0 (size!5002 (buf!5543 (_2!10598 lt!363043))) (currentByte!10381 (_2!10598 lt!363043)) (currentBit!10376 (_2!10598 lt!363043))))))

(assert (=> b!227237 (= lt!363042 (bitIndex!0 (size!5002 (buf!5543 thiss!1870)) (currentByte!10381 thiss!1870) (currentBit!10376 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9100 array!11405 (_ BitVec 32) (_ BitVec 32)) tuple3!1386)

(assert (=> b!227237 (= lt!363045 (readByteArrayLoop!0 (_2!10598 lt!363043) lt!363041 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227237 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5002 (buf!5543 (_2!10598 lt!363043)))) ((_ sign_extend 32) (currentByte!10381 (_2!10598 lt!363043))) ((_ sign_extend 32) (currentBit!10376 (_2!10598 lt!363043))) lt!363046)))

(assert (=> b!227237 (= lt!363046 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363044 () Unit!16947)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9100 BitStream!9100 (_ BitVec 64) (_ BitVec 32)) Unit!16947)

(assert (=> b!227237 (= lt!363044 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10598 lt!363043) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227237 (= lt!363041 (array!11406 (store (arr!5977 arr!308) i!761 (_1!10598 lt!363043)) (size!5002 arr!308)))))

(declare-fun readByte!0 (BitStream!9100) tuple2!19526)

(assert (=> b!227237 (= lt!363043 (readByte!0 thiss!1870))))

(declare-fun b!227235 () Bool)

(declare-fun res!190643 () Bool)

(assert (=> b!227235 (=> (not res!190643) (not e!155469))))

(assert (=> b!227235 (= res!190643 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5002 (buf!5543 thiss!1870))) ((_ sign_extend 32) (currentByte!10381 thiss!1870)) ((_ sign_extend 32) (currentBit!10376 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227236 () Bool)

(declare-fun res!190644 () Bool)

(assert (=> b!227236 (=> (not res!190644) (not e!155469))))

(assert (=> b!227236 (= res!190644 (bvslt i!761 to!496))))

(declare-fun b!227238 () Bool)

(assert (=> b!227238 (= e!155468 (array_inv!4743 (buf!5543 thiss!1870)))))

(assert (= (and start!47738 res!190645) b!227235))

(assert (= (and b!227235 res!190643) b!227236))

(assert (= (and b!227236 res!190644) b!227237))

(assert (= start!47738 b!227238))

(declare-fun m!349387 () Bool)

(assert (=> start!47738 m!349387))

(declare-fun m!349389 () Bool)

(assert (=> start!47738 m!349389))

(declare-fun m!349391 () Bool)

(assert (=> b!227237 m!349391))

(declare-fun m!349393 () Bool)

(assert (=> b!227237 m!349393))

(declare-fun m!349395 () Bool)

(assert (=> b!227237 m!349395))

(declare-fun m!349397 () Bool)

(assert (=> b!227237 m!349397))

(declare-fun m!349399 () Bool)

(assert (=> b!227237 m!349399))

(declare-fun m!349401 () Bool)

(assert (=> b!227237 m!349401))

(declare-fun m!349403 () Bool)

(assert (=> b!227237 m!349403))

(declare-fun m!349405 () Bool)

(assert (=> b!227237 m!349405))

(declare-fun m!349407 () Bool)

(assert (=> b!227237 m!349407))

(declare-fun m!349409 () Bool)

(assert (=> b!227237 m!349409))

(declare-fun m!349411 () Bool)

(assert (=> b!227235 m!349411))

(declare-fun m!349413 () Bool)

(assert (=> b!227238 m!349413))

(push 1)

(assert (not b!227235))

(assert (not b!227238))

(assert (not start!47738))

(assert (not b!227237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

