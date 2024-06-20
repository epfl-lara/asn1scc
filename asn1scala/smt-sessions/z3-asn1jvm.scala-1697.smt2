; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47092 () Bool)

(assert start!47092)

(declare-fun res!188981 () Bool)

(declare-fun e!153629 () Bool)

(assert (=> start!47092 (=> (not res!188981) (not e!153629))))

(declare-datatypes ((array!11164 0))(
  ( (array!11165 (arr!5855 (Array (_ BitVec 32) (_ BitVec 8))) (size!4898 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11164)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47092 (= res!188981 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4898 arr!308))))))

(assert (=> start!47092 e!153629))

(assert (=> start!47092 true))

(declare-fun array_inv!4639 (array!11164) Bool)

(assert (=> start!47092 (array_inv!4639 arr!308)))

(declare-datatypes ((BitStream!8898 0))(
  ( (BitStream!8899 (buf!5442 array!11164) (currentByte!10208 (_ BitVec 32)) (currentBit!10203 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8898)

(declare-fun e!153631 () Bool)

(declare-fun inv!12 (BitStream!8898) Bool)

(assert (=> start!47092 (and (inv!12 thiss!1870) e!153631)))

(declare-fun b!225191 () Bool)

(assert (=> b!225191 (= e!153631 (array_inv!4639 (buf!5442 thiss!1870)))))

(declare-fun b!225188 () Bool)

(declare-fun res!188982 () Bool)

(assert (=> b!225188 (=> (not res!188982) (not e!153629))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225188 (= res!188982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4898 (buf!5442 thiss!1870))) ((_ sign_extend 32) (currentByte!10208 thiss!1870)) ((_ sign_extend 32) (currentBit!10203 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225190 () Bool)

(assert (=> b!225190 (= e!153629 (not true))))

(declare-fun arrayRangesEq!788 (array!11164 array!11164 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225190 (arrayRangesEq!788 arr!308 arr!308 #b00000000000000000000000000000000 (size!4898 arr!308))))

(declare-datatypes ((Unit!16541 0))(
  ( (Unit!16542) )
))
(declare-fun lt!358359 () Unit!16541)

(declare-fun arrayRangesEqReflexiveLemma!92 (array!11164) Unit!16541)

(assert (=> b!225190 (= lt!358359 (arrayRangesEqReflexiveLemma!92 arr!308))))

(declare-fun lt!358358 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225190 (= lt!358358 (bitIndex!0 (size!4898 (buf!5442 thiss!1870)) (currentByte!10208 thiss!1870) (currentBit!10203 thiss!1870)))))

(declare-fun b!225189 () Bool)

(declare-fun res!188980 () Bool)

(assert (=> b!225189 (=> (not res!188980) (not e!153629))))

(assert (=> b!225189 (= res!188980 (bvsge i!761 to!496))))

(assert (= (and start!47092 res!188981) b!225188))

(assert (= (and b!225188 res!188982) b!225189))

(assert (= (and b!225189 res!188980) b!225190))

(assert (= start!47092 b!225191))

(declare-fun m!346109 () Bool)

(assert (=> start!47092 m!346109))

(declare-fun m!346111 () Bool)

(assert (=> start!47092 m!346111))

(declare-fun m!346113 () Bool)

(assert (=> b!225191 m!346113))

(declare-fun m!346115 () Bool)

(assert (=> b!225188 m!346115))

(declare-fun m!346117 () Bool)

(assert (=> b!225190 m!346117))

(declare-fun m!346119 () Bool)

(assert (=> b!225190 m!346119))

(declare-fun m!346121 () Bool)

(assert (=> b!225190 m!346121))

(check-sat (not b!225188) (not start!47092) (not b!225191) (not b!225190))
