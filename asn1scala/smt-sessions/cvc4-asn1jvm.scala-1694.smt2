; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47076 () Bool)

(assert start!47076)

(declare-fun b!225093 () Bool)

(declare-fun res!188909 () Bool)

(declare-fun e!153535 () Bool)

(assert (=> b!225093 (=> (not res!188909) (not e!153535))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225093 (= res!188909 (bvsge i!761 to!496))))

(declare-fun res!188910 () Bool)

(assert (=> start!47076 (=> (not res!188910) (not e!153535))))

(declare-datatypes ((array!11148 0))(
  ( (array!11149 (arr!5847 (Array (_ BitVec 32) (_ BitVec 8))) (size!4890 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11148)

(assert (=> start!47076 (= res!188910 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4890 arr!308))))))

(assert (=> start!47076 e!153535))

(assert (=> start!47076 true))

(declare-fun array_inv!4631 (array!11148) Bool)

(assert (=> start!47076 (array_inv!4631 arr!308)))

(declare-datatypes ((BitStream!8882 0))(
  ( (BitStream!8883 (buf!5434 array!11148) (currentByte!10200 (_ BitVec 32)) (currentBit!10195 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8882)

(declare-fun e!153533 () Bool)

(declare-fun inv!12 (BitStream!8882) Bool)

(assert (=> start!47076 (and (inv!12 thiss!1870) e!153533)))

(declare-fun b!225094 () Bool)

(assert (=> b!225094 (= e!153535 (not true))))

(declare-fun arrayRangesEq!780 (array!11148 array!11148 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225094 (arrayRangesEq!780 arr!308 arr!308 #b00000000000000000000000000000000 (size!4890 arr!308))))

(declare-datatypes ((Unit!16525 0))(
  ( (Unit!16526) )
))
(declare-fun lt!358310 () Unit!16525)

(declare-fun arrayRangesEqReflexiveLemma!84 (array!11148) Unit!16525)

(assert (=> b!225094 (= lt!358310 (arrayRangesEqReflexiveLemma!84 arr!308))))

(declare-fun lt!358311 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225094 (= lt!358311 (bitIndex!0 (size!4890 (buf!5434 thiss!1870)) (currentByte!10200 thiss!1870) (currentBit!10195 thiss!1870)))))

(declare-fun b!225095 () Bool)

(assert (=> b!225095 (= e!153533 (array_inv!4631 (buf!5434 thiss!1870)))))

(declare-fun b!225092 () Bool)

(declare-fun res!188908 () Bool)

(assert (=> b!225092 (=> (not res!188908) (not e!153535))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225092 (= res!188908 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4890 (buf!5434 thiss!1870))) ((_ sign_extend 32) (currentByte!10200 thiss!1870)) ((_ sign_extend 32) (currentBit!10195 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47076 res!188910) b!225092))

(assert (= (and b!225092 res!188908) b!225093))

(assert (= (and b!225093 res!188909) b!225094))

(assert (= start!47076 b!225095))

(declare-fun m!345997 () Bool)

(assert (=> start!47076 m!345997))

(declare-fun m!345999 () Bool)

(assert (=> start!47076 m!345999))

(declare-fun m!346001 () Bool)

(assert (=> b!225094 m!346001))

(declare-fun m!346003 () Bool)

(assert (=> b!225094 m!346003))

(declare-fun m!346005 () Bool)

(assert (=> b!225094 m!346005))

(declare-fun m!346007 () Bool)

(assert (=> b!225095 m!346007))

(declare-fun m!346009 () Bool)

(assert (=> b!225092 m!346009))

(push 1)

(assert (not b!225094))

(assert (not b!225095))

(assert (not start!47076))

(assert (not b!225092))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

