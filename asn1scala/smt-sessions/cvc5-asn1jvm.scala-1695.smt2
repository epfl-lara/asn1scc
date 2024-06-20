; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47078 () Bool)

(assert start!47078)

(declare-fun b!225104 () Bool)

(declare-fun res!188917 () Bool)

(declare-fun e!153548 () Bool)

(assert (=> b!225104 (=> (not res!188917) (not e!153548))))

(declare-datatypes ((array!11150 0))(
  ( (array!11151 (arr!5848 (Array (_ BitVec 32) (_ BitVec 8))) (size!4891 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8884 0))(
  ( (BitStream!8885 (buf!5435 array!11150) (currentByte!10201 (_ BitVec 32)) (currentBit!10196 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8884)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225104 (= res!188917 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4891 (buf!5435 thiss!1870))) ((_ sign_extend 32) (currentByte!10201 thiss!1870)) ((_ sign_extend 32) (currentBit!10196 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225107 () Bool)

(declare-fun e!153545 () Bool)

(declare-fun array_inv!4632 (array!11150) Bool)

(assert (=> b!225107 (= e!153545 (array_inv!4632 (buf!5435 thiss!1870)))))

(declare-fun b!225105 () Bool)

(declare-fun res!188919 () Bool)

(assert (=> b!225105 (=> (not res!188919) (not e!153548))))

(assert (=> b!225105 (= res!188919 (bvsge i!761 to!496))))

(declare-fun b!225106 () Bool)

(assert (=> b!225106 (= e!153548 (not true))))

(declare-fun arr!308 () array!11150)

(declare-fun arrayRangesEq!781 (array!11150 array!11150 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225106 (arrayRangesEq!781 arr!308 arr!308 #b00000000000000000000000000000000 (size!4891 arr!308))))

(declare-datatypes ((Unit!16527 0))(
  ( (Unit!16528) )
))
(declare-fun lt!358316 () Unit!16527)

(declare-fun arrayRangesEqReflexiveLemma!85 (array!11150) Unit!16527)

(assert (=> b!225106 (= lt!358316 (arrayRangesEqReflexiveLemma!85 arr!308))))

(declare-fun lt!358317 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225106 (= lt!358317 (bitIndex!0 (size!4891 (buf!5435 thiss!1870)) (currentByte!10201 thiss!1870) (currentBit!10196 thiss!1870)))))

(declare-fun res!188918 () Bool)

(assert (=> start!47078 (=> (not res!188918) (not e!153548))))

(assert (=> start!47078 (= res!188918 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4891 arr!308))))))

(assert (=> start!47078 e!153548))

(assert (=> start!47078 true))

(assert (=> start!47078 (array_inv!4632 arr!308)))

(declare-fun inv!12 (BitStream!8884) Bool)

(assert (=> start!47078 (and (inv!12 thiss!1870) e!153545)))

(assert (= (and start!47078 res!188918) b!225104))

(assert (= (and b!225104 res!188917) b!225105))

(assert (= (and b!225105 res!188919) b!225106))

(assert (= start!47078 b!225107))

(declare-fun m!346011 () Bool)

(assert (=> b!225104 m!346011))

(declare-fun m!346013 () Bool)

(assert (=> b!225107 m!346013))

(declare-fun m!346015 () Bool)

(assert (=> b!225106 m!346015))

(declare-fun m!346017 () Bool)

(assert (=> b!225106 m!346017))

(declare-fun m!346019 () Bool)

(assert (=> b!225106 m!346019))

(declare-fun m!346021 () Bool)

(assert (=> start!47078 m!346021))

(declare-fun m!346023 () Bool)

(assert (=> start!47078 m!346023))

(push 1)

(assert (not start!47078))

(assert (not b!225106))

(assert (not b!225104))

(assert (not b!225107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

