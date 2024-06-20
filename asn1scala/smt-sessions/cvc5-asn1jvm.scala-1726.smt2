; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47660 () Bool)

(assert start!47660)

(declare-fun b!226918 () Bool)

(declare-fun res!190395 () Bool)

(declare-fun e!155183 () Bool)

(assert (=> b!226918 (=> (not res!190395) (not e!155183))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226918 (= res!190395 (bvslt i!761 to!496))))

(declare-fun b!226920 () Bool)

(declare-fun e!155184 () Bool)

(declare-datatypes ((array!11366 0))(
  ( (array!11367 (arr!5956 (Array (_ BitVec 32) (_ BitVec 8))) (size!4984 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9064 0))(
  ( (BitStream!9065 (buf!5525 array!11366) (currentByte!10357 (_ BitVec 32)) (currentBit!10352 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9064)

(declare-fun array_inv!4725 (array!11366) Bool)

(assert (=> b!226920 (= e!155184 (array_inv!4725 (buf!5525 thiss!1870)))))

(declare-fun lt!362100 () (_ BitVec 64))

(declare-fun b!226919 () Bool)

(declare-fun lt!362102 () (_ BitVec 64))

(assert (=> b!226919 (= e!155183 (not (= (bvadd lt!362102 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362100)))))

(declare-fun lt!362103 () (_ BitVec 64))

(declare-fun lt!362101 () (_ BitVec 32))

(assert (=> b!226919 (= (bvadd lt!362103 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362101))) lt!362100)))

(declare-datatypes ((Unit!16878 0))(
  ( (Unit!16879) )
))
(declare-datatypes ((tuple3!1350 0))(
  ( (tuple3!1351 (_1!10556 Unit!16878) (_2!10556 BitStream!9064) (_3!817 array!11366)) )
))
(declare-fun lt!362106 () tuple3!1350)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226919 (= lt!362100 (bitIndex!0 (size!4984 (buf!5525 (_2!10556 lt!362106))) (currentByte!10357 (_2!10556 lt!362106)) (currentBit!10352 (_2!10556 lt!362106))))))

(assert (=> b!226919 (= lt!362103 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362102))))

(declare-datatypes ((tuple2!19478 0))(
  ( (tuple2!19479 (_1!10557 (_ BitVec 8)) (_2!10557 BitStream!9064)) )
))
(declare-fun lt!362105 () tuple2!19478)

(assert (=> b!226919 (= lt!362103 (bitIndex!0 (size!4984 (buf!5525 (_2!10557 lt!362105))) (currentByte!10357 (_2!10557 lt!362105)) (currentBit!10352 (_2!10557 lt!362105))))))

(assert (=> b!226919 (= lt!362102 (bitIndex!0 (size!4984 (buf!5525 thiss!1870)) (currentByte!10357 thiss!1870) (currentBit!10352 thiss!1870)))))

(declare-fun arr!308 () array!11366)

(declare-fun readByteArrayLoop!0 (BitStream!9064 array!11366 (_ BitVec 32) (_ BitVec 32)) tuple3!1350)

(assert (=> b!226919 (= lt!362106 (readByteArrayLoop!0 (_2!10557 lt!362105) (array!11367 (store (arr!5956 arr!308) i!761 (_1!10557 lt!362105)) (size!4984 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226919 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4984 (buf!5525 (_2!10557 lt!362105)))) ((_ sign_extend 32) (currentByte!10357 (_2!10557 lt!362105))) ((_ sign_extend 32) (currentBit!10352 (_2!10557 lt!362105))) lt!362101)))

(assert (=> b!226919 (= lt!362101 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362104 () Unit!16878)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9064 BitStream!9064 (_ BitVec 64) (_ BitVec 32)) Unit!16878)

(assert (=> b!226919 (= lt!362104 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10557 lt!362105) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9064) tuple2!19478)

(assert (=> b!226919 (= lt!362105 (readByte!0 thiss!1870))))

(declare-fun b!226917 () Bool)

(declare-fun res!190396 () Bool)

(assert (=> b!226917 (=> (not res!190396) (not e!155183))))

(assert (=> b!226917 (= res!190396 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4984 (buf!5525 thiss!1870))) ((_ sign_extend 32) (currentByte!10357 thiss!1870)) ((_ sign_extend 32) (currentBit!10352 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190394 () Bool)

(assert (=> start!47660 (=> (not res!190394) (not e!155183))))

(assert (=> start!47660 (= res!190394 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4984 arr!308))))))

(assert (=> start!47660 e!155183))

(assert (=> start!47660 true))

(assert (=> start!47660 (array_inv!4725 arr!308)))

(declare-fun inv!12 (BitStream!9064) Bool)

(assert (=> start!47660 (and (inv!12 thiss!1870) e!155184)))

(assert (= (and start!47660 res!190394) b!226917))

(assert (= (and b!226917 res!190396) b!226918))

(assert (= (and b!226918 res!190395) b!226919))

(assert (= start!47660 b!226920))

(declare-fun m!348721 () Bool)

(assert (=> b!226920 m!348721))

(declare-fun m!348723 () Bool)

(assert (=> b!226919 m!348723))

(declare-fun m!348725 () Bool)

(assert (=> b!226919 m!348725))

(declare-fun m!348727 () Bool)

(assert (=> b!226919 m!348727))

(declare-fun m!348729 () Bool)

(assert (=> b!226919 m!348729))

(declare-fun m!348731 () Bool)

(assert (=> b!226919 m!348731))

(declare-fun m!348733 () Bool)

(assert (=> b!226919 m!348733))

(declare-fun m!348735 () Bool)

(assert (=> b!226919 m!348735))

(declare-fun m!348737 () Bool)

(assert (=> b!226919 m!348737))

(declare-fun m!348739 () Bool)

(assert (=> b!226917 m!348739))

(declare-fun m!348741 () Bool)

(assert (=> start!47660 m!348741))

(declare-fun m!348743 () Bool)

(assert (=> start!47660 m!348743))

(push 1)

(assert (not b!226917))

(assert (not b!226919))

(assert (not start!47660))

(assert (not b!226920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

