; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47084 () Bool)

(assert start!47084)

(declare-fun res!188944 () Bool)

(declare-fun e!153582 () Bool)

(assert (=> start!47084 (=> (not res!188944) (not e!153582))))

(declare-datatypes ((array!11156 0))(
  ( (array!11157 (arr!5851 (Array (_ BitVec 32) (_ BitVec 8))) (size!4894 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11156)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47084 (= res!188944 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4894 arr!308))))))

(assert (=> start!47084 e!153582))

(assert (=> start!47084 true))

(declare-fun array_inv!4635 (array!11156) Bool)

(assert (=> start!47084 (array_inv!4635 arr!308)))

(declare-datatypes ((BitStream!8890 0))(
  ( (BitStream!8891 (buf!5438 array!11156) (currentByte!10204 (_ BitVec 32)) (currentBit!10199 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8890)

(declare-fun e!153583 () Bool)

(declare-fun inv!12 (BitStream!8890) Bool)

(assert (=> start!47084 (and (inv!12 thiss!1870) e!153583)))

(declare-fun b!225142 () Bool)

(assert (=> b!225142 (= e!153582 (not true))))

(declare-fun arrayRangesEq!784 (array!11156 array!11156 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225142 (arrayRangesEq!784 arr!308 arr!308 #b00000000000000000000000000000000 (size!4894 arr!308))))

(declare-datatypes ((Unit!16533 0))(
  ( (Unit!16534) )
))
(declare-fun lt!358335 () Unit!16533)

(declare-fun arrayRangesEqReflexiveLemma!88 (array!11156) Unit!16533)

(assert (=> b!225142 (= lt!358335 (arrayRangesEqReflexiveLemma!88 arr!308))))

(declare-fun lt!358334 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225142 (= lt!358334 (bitIndex!0 (size!4894 (buf!5438 thiss!1870)) (currentByte!10204 thiss!1870) (currentBit!10199 thiss!1870)))))

(declare-fun b!225141 () Bool)

(declare-fun res!188946 () Bool)

(assert (=> b!225141 (=> (not res!188946) (not e!153582))))

(assert (=> b!225141 (= res!188946 (bvsge i!761 to!496))))

(declare-fun b!225140 () Bool)

(declare-fun res!188945 () Bool)

(assert (=> b!225140 (=> (not res!188945) (not e!153582))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225140 (= res!188945 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4894 (buf!5438 thiss!1870))) ((_ sign_extend 32) (currentByte!10204 thiss!1870)) ((_ sign_extend 32) (currentBit!10199 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225143 () Bool)

(assert (=> b!225143 (= e!153583 (array_inv!4635 (buf!5438 thiss!1870)))))

(assert (= (and start!47084 res!188944) b!225140))

(assert (= (and b!225140 res!188945) b!225141))

(assert (= (and b!225141 res!188946) b!225142))

(assert (= start!47084 b!225143))

(declare-fun m!346053 () Bool)

(assert (=> start!47084 m!346053))

(declare-fun m!346055 () Bool)

(assert (=> start!47084 m!346055))

(declare-fun m!346057 () Bool)

(assert (=> b!225142 m!346057))

(declare-fun m!346059 () Bool)

(assert (=> b!225142 m!346059))

(declare-fun m!346061 () Bool)

(assert (=> b!225142 m!346061))

(declare-fun m!346063 () Bool)

(assert (=> b!225140 m!346063))

(declare-fun m!346065 () Bool)

(assert (=> b!225143 m!346065))

(push 1)

(assert (not b!225140))

(assert (not start!47084))

(assert (not b!225143))

(assert (not b!225142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

