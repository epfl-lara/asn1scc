; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47744 () Bool)

(assert start!47744)

(declare-fun res!190672 () Bool)

(declare-fun e!155504 () Bool)

(assert (=> start!47744 (=> (not res!190672) (not e!155504))))

(declare-datatypes ((array!11411 0))(
  ( (array!11412 (arr!5980 (Array (_ BitVec 32) (_ BitVec 8))) (size!5005 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11411)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47744 (= res!190672 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5005 arr!308))))))

(assert (=> start!47744 e!155504))

(assert (=> start!47744 true))

(declare-fun array_inv!4746 (array!11411) Bool)

(assert (=> start!47744 (array_inv!4746 arr!308)))

(declare-datatypes ((BitStream!9106 0))(
  ( (BitStream!9107 (buf!5546 array!11411) (currentByte!10384 (_ BitVec 32)) (currentBit!10379 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9106)

(declare-fun e!155505 () Bool)

(declare-fun inv!12 (BitStream!9106) Bool)

(assert (=> start!47744 (and (inv!12 thiss!1870) e!155505)))

(declare-fun b!227273 () Bool)

(assert (=> b!227273 (= e!155504 (not true))))

(declare-fun lt!363123 () array!11411)

(declare-fun arrayRangesEq!841 (array!11411 array!11411 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227273 (arrayRangesEq!841 arr!308 lt!363123 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19532 0))(
  ( (tuple2!19533 (_1!10604 (_ BitVec 8)) (_2!10604 BitStream!9106)) )
))
(declare-fun lt!363125 () tuple2!19532)

(declare-datatypes ((Unit!16953 0))(
  ( (Unit!16954) )
))
(declare-fun lt!363128 () Unit!16953)

(declare-fun arrayUpdatedAtPrefixLemma!400 (array!11411 (_ BitVec 32) (_ BitVec 8)) Unit!16953)

(assert (=> b!227273 (= lt!363128 (arrayUpdatedAtPrefixLemma!400 arr!308 i!761 (_1!10604 lt!363125)))))

(declare-fun lt!363126 () (_ BitVec 64))

(declare-fun lt!363124 () (_ BitVec 32))

(declare-fun lt!363121 () (_ BitVec 64))

(declare-datatypes ((tuple3!1392 0))(
  ( (tuple3!1393 (_1!10605 Unit!16953) (_2!10605 BitStream!9106) (_3!838 array!11411)) )
))
(declare-fun lt!363122 () tuple3!1392)

(declare-fun lt!363127 () (_ BitVec 64))

(assert (=> b!227273 (and (= (bvadd lt!363127 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363124))) lt!363126) (= (bvadd lt!363121 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363126) (= (buf!5546 thiss!1870) (buf!5546 (_2!10605 lt!363122))) (= (size!5005 arr!308) (size!5005 (_3!838 lt!363122))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227273 (= lt!363126 (bitIndex!0 (size!5005 (buf!5546 (_2!10605 lt!363122))) (currentByte!10384 (_2!10605 lt!363122)) (currentBit!10379 (_2!10605 lt!363122))))))

(assert (=> b!227273 (= lt!363127 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363121))))

(assert (=> b!227273 (= lt!363127 (bitIndex!0 (size!5005 (buf!5546 (_2!10604 lt!363125))) (currentByte!10384 (_2!10604 lt!363125)) (currentBit!10379 (_2!10604 lt!363125))))))

(assert (=> b!227273 (= lt!363121 (bitIndex!0 (size!5005 (buf!5546 thiss!1870)) (currentByte!10384 thiss!1870) (currentBit!10379 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9106 array!11411 (_ BitVec 32) (_ BitVec 32)) tuple3!1392)

(assert (=> b!227273 (= lt!363122 (readByteArrayLoop!0 (_2!10604 lt!363125) lt!363123 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227273 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5005 (buf!5546 (_2!10604 lt!363125)))) ((_ sign_extend 32) (currentByte!10384 (_2!10604 lt!363125))) ((_ sign_extend 32) (currentBit!10379 (_2!10604 lt!363125))) lt!363124)))

(assert (=> b!227273 (= lt!363124 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363129 () Unit!16953)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9106 BitStream!9106 (_ BitVec 64) (_ BitVec 32)) Unit!16953)

(assert (=> b!227273 (= lt!363129 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10604 lt!363125) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227273 (= lt!363123 (array!11412 (store (arr!5980 arr!308) i!761 (_1!10604 lt!363125)) (size!5005 arr!308)))))

(declare-fun readByte!0 (BitStream!9106) tuple2!19532)

(assert (=> b!227273 (= lt!363125 (readByte!0 thiss!1870))))

(declare-fun b!227272 () Bool)

(declare-fun res!190670 () Bool)

(assert (=> b!227272 (=> (not res!190670) (not e!155504))))

(assert (=> b!227272 (= res!190670 (bvslt i!761 to!496))))

(declare-fun b!227271 () Bool)

(declare-fun res!190671 () Bool)

(assert (=> b!227271 (=> (not res!190671) (not e!155504))))

(assert (=> b!227271 (= res!190671 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5005 (buf!5546 thiss!1870))) ((_ sign_extend 32) (currentByte!10384 thiss!1870)) ((_ sign_extend 32) (currentBit!10379 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227274 () Bool)

(assert (=> b!227274 (= e!155505 (array_inv!4746 (buf!5546 thiss!1870)))))

(assert (= (and start!47744 res!190672) b!227271))

(assert (= (and b!227271 res!190671) b!227272))

(assert (= (and b!227272 res!190670) b!227273))

(assert (= start!47744 b!227274))

(declare-fun m!349471 () Bool)

(assert (=> start!47744 m!349471))

(declare-fun m!349473 () Bool)

(assert (=> start!47744 m!349473))

(declare-fun m!349475 () Bool)

(assert (=> b!227273 m!349475))

(declare-fun m!349477 () Bool)

(assert (=> b!227273 m!349477))

(declare-fun m!349479 () Bool)

(assert (=> b!227273 m!349479))

(declare-fun m!349481 () Bool)

(assert (=> b!227273 m!349481))

(declare-fun m!349483 () Bool)

(assert (=> b!227273 m!349483))

(declare-fun m!349485 () Bool)

(assert (=> b!227273 m!349485))

(declare-fun m!349487 () Bool)

(assert (=> b!227273 m!349487))

(declare-fun m!349489 () Bool)

(assert (=> b!227273 m!349489))

(declare-fun m!349491 () Bool)

(assert (=> b!227273 m!349491))

(declare-fun m!349493 () Bool)

(assert (=> b!227273 m!349493))

(declare-fun m!349495 () Bool)

(assert (=> b!227271 m!349495))

(declare-fun m!349497 () Bool)

(assert (=> b!227274 m!349497))

(push 1)

(assert (not b!227274))

(assert (not start!47744))

(assert (not b!227273))

(assert (not b!227271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

