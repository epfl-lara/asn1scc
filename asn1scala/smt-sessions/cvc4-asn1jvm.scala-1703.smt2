; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47226 () Bool)

(assert start!47226)

(declare-fun res!189237 () Bool)

(declare-fun e!153923 () Bool)

(assert (=> start!47226 (=> (not res!189237) (not e!153923))))

(declare-datatypes ((array!11208 0))(
  ( (array!11209 (arr!5874 (Array (_ BitVec 32) (_ BitVec 8))) (size!4917 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11208)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47226 (= res!189237 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4917 arr!308))))))

(assert (=> start!47226 e!153923))

(assert (=> start!47226 true))

(declare-fun array_inv!4658 (array!11208) Bool)

(assert (=> start!47226 (array_inv!4658 arr!308)))

(declare-datatypes ((BitStream!8936 0))(
  ( (BitStream!8937 (buf!5461 array!11208) (currentByte!10245 (_ BitVec 32)) (currentBit!10240 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8936)

(declare-fun e!153926 () Bool)

(declare-fun inv!12 (BitStream!8936) Bool)

(assert (=> start!47226 (and (inv!12 thiss!1870) e!153926)))

(declare-fun b!225503 () Bool)

(assert (=> b!225503 (= e!153926 (array_inv!4658 (buf!5461 thiss!1870)))))

(declare-fun b!225501 () Bool)

(declare-fun res!189235 () Bool)

(assert (=> b!225501 (=> (not res!189235) (not e!153923))))

(assert (=> b!225501 (= res!189235 (bvsge i!761 to!496))))

(declare-fun b!225500 () Bool)

(declare-fun res!189236 () Bool)

(assert (=> b!225500 (=> (not res!189236) (not e!153923))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225500 (= res!189236 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4917 (buf!5461 thiss!1870))) ((_ sign_extend 32) (currentByte!10245 thiss!1870)) ((_ sign_extend 32) (currentBit!10240 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun lt!358661 () (_ BitVec 64))

(declare-fun b!225502 () Bool)

(assert (=> b!225502 (= e!153923 (not (or (not (= (bvadd lt!358661 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!358661)) (bvsle i!761 (size!4917 arr!308)))))))

(declare-fun arrayRangesEq!807 (array!11208 array!11208 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225502 (arrayRangesEq!807 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16579 0))(
  ( (Unit!16580) )
))
(declare-fun lt!358662 () Unit!16579)

(declare-fun arrayRangesEqSlicedLemma!96 (array!11208 array!11208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16579)

(assert (=> b!225502 (= lt!358662 (arrayRangesEqSlicedLemma!96 arr!308 arr!308 #b00000000000000000000000000000000 (size!4917 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225502 (arrayRangesEq!807 arr!308 arr!308 #b00000000000000000000000000000000 (size!4917 arr!308))))

(declare-fun lt!358660 () Unit!16579)

(declare-fun arrayRangesEqReflexiveLemma!111 (array!11208) Unit!16579)

(assert (=> b!225502 (= lt!358660 (arrayRangesEqReflexiveLemma!111 arr!308))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225502 (= lt!358661 (bitIndex!0 (size!4917 (buf!5461 thiss!1870)) (currentByte!10245 thiss!1870) (currentBit!10240 thiss!1870)))))

(assert (= (and start!47226 res!189237) b!225500))

(assert (= (and b!225500 res!189236) b!225501))

(assert (= (and b!225501 res!189235) b!225502))

(assert (= start!47226 b!225503))

(declare-fun m!346515 () Bool)

(assert (=> start!47226 m!346515))

(declare-fun m!346517 () Bool)

(assert (=> start!47226 m!346517))

(declare-fun m!346519 () Bool)

(assert (=> b!225503 m!346519))

(declare-fun m!346521 () Bool)

(assert (=> b!225500 m!346521))

(declare-fun m!346523 () Bool)

(assert (=> b!225502 m!346523))

(declare-fun m!346525 () Bool)

(assert (=> b!225502 m!346525))

(declare-fun m!346527 () Bool)

(assert (=> b!225502 m!346527))

(declare-fun m!346529 () Bool)

(assert (=> b!225502 m!346529))

(declare-fun m!346531 () Bool)

(assert (=> b!225502 m!346531))

(push 1)

(assert (not b!225502))

(assert (not b!225503))

(assert (not start!47226))

(assert (not b!225500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

