; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47094 () Bool)

(assert start!47094)

(declare-fun b!225200 () Bool)

(declare-fun res!188989 () Bool)

(declare-fun e!153643 () Bool)

(assert (=> b!225200 (=> (not res!188989) (not e!153643))))

(declare-datatypes ((array!11166 0))(
  ( (array!11167 (arr!5856 (Array (_ BitVec 32) (_ BitVec 8))) (size!4899 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8900 0))(
  ( (BitStream!8901 (buf!5443 array!11166) (currentByte!10209 (_ BitVec 32)) (currentBit!10204 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8900)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225200 (= res!188989 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4899 (buf!5443 thiss!1870))) ((_ sign_extend 32) (currentByte!10209 thiss!1870)) ((_ sign_extend 32) (currentBit!10204 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225202 () Bool)

(assert (=> b!225202 (= e!153643 (not true))))

(declare-fun arr!308 () array!11166)

(declare-fun arrayRangesEq!789 (array!11166 array!11166 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225202 (arrayRangesEq!789 arr!308 arr!308 #b00000000000000000000000000000000 (size!4899 arr!308))))

(declare-datatypes ((Unit!16543 0))(
  ( (Unit!16544) )
))
(declare-fun lt!358364 () Unit!16543)

(declare-fun arrayRangesEqReflexiveLemma!93 (array!11166) Unit!16543)

(assert (=> b!225202 (= lt!358364 (arrayRangesEqReflexiveLemma!93 arr!308))))

(declare-fun lt!358365 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225202 (= lt!358365 (bitIndex!0 (size!4899 (buf!5443 thiss!1870)) (currentByte!10209 thiss!1870) (currentBit!10204 thiss!1870)))))

(declare-fun b!225201 () Bool)

(declare-fun res!188991 () Bool)

(assert (=> b!225201 (=> (not res!188991) (not e!153643))))

(assert (=> b!225201 (= res!188991 (bvsge i!761 to!496))))

(declare-fun b!225203 () Bool)

(declare-fun e!153641 () Bool)

(declare-fun array_inv!4640 (array!11166) Bool)

(assert (=> b!225203 (= e!153641 (array_inv!4640 (buf!5443 thiss!1870)))))

(declare-fun res!188990 () Bool)

(assert (=> start!47094 (=> (not res!188990) (not e!153643))))

(assert (=> start!47094 (= res!188990 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4899 arr!308))))))

(assert (=> start!47094 e!153643))

(assert (=> start!47094 true))

(assert (=> start!47094 (array_inv!4640 arr!308)))

(declare-fun inv!12 (BitStream!8900) Bool)

(assert (=> start!47094 (and (inv!12 thiss!1870) e!153641)))

(assert (= (and start!47094 res!188990) b!225200))

(assert (= (and b!225200 res!188989) b!225201))

(assert (= (and b!225201 res!188991) b!225202))

(assert (= start!47094 b!225203))

(declare-fun m!346123 () Bool)

(assert (=> b!225200 m!346123))

(declare-fun m!346125 () Bool)

(assert (=> b!225202 m!346125))

(declare-fun m!346127 () Bool)

(assert (=> b!225202 m!346127))

(declare-fun m!346129 () Bool)

(assert (=> b!225202 m!346129))

(declare-fun m!346131 () Bool)

(assert (=> b!225203 m!346131))

(declare-fun m!346133 () Bool)

(assert (=> start!47094 m!346133))

(declare-fun m!346135 () Bool)

(assert (=> start!47094 m!346135))

(push 1)

(assert (not b!225200))

