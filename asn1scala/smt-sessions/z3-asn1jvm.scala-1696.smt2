; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47086 () Bool)

(assert start!47086)

(declare-fun res!188954 () Bool)

(declare-fun e!153595 () Bool)

(assert (=> start!47086 (=> (not res!188954) (not e!153595))))

(declare-datatypes ((array!11158 0))(
  ( (array!11159 (arr!5852 (Array (_ BitVec 32) (_ BitVec 8))) (size!4895 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11158)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47086 (= res!188954 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4895 arr!308))))))

(assert (=> start!47086 e!153595))

(assert (=> start!47086 true))

(declare-fun array_inv!4636 (array!11158) Bool)

(assert (=> start!47086 (array_inv!4636 arr!308)))

(declare-datatypes ((BitStream!8892 0))(
  ( (BitStream!8893 (buf!5439 array!11158) (currentByte!10205 (_ BitVec 32)) (currentBit!10200 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8892)

(declare-fun e!153596 () Bool)

(declare-fun inv!12 (BitStream!8892) Bool)

(assert (=> start!47086 (and (inv!12 thiss!1870) e!153596)))

(declare-fun b!225154 () Bool)

(assert (=> b!225154 (= e!153595 (not true))))

(declare-fun arrayRangesEq!785 (array!11158 array!11158 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225154 (arrayRangesEq!785 arr!308 arr!308 #b00000000000000000000000000000000 (size!4895 arr!308))))

(declare-datatypes ((Unit!16535 0))(
  ( (Unit!16536) )
))
(declare-fun lt!358341 () Unit!16535)

(declare-fun arrayRangesEqReflexiveLemma!89 (array!11158) Unit!16535)

(assert (=> b!225154 (= lt!358341 (arrayRangesEqReflexiveLemma!89 arr!308))))

(declare-fun lt!358340 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225154 (= lt!358340 (bitIndex!0 (size!4895 (buf!5439 thiss!1870)) (currentByte!10205 thiss!1870) (currentBit!10200 thiss!1870)))))

(declare-fun b!225153 () Bool)

(declare-fun res!188953 () Bool)

(assert (=> b!225153 (=> (not res!188953) (not e!153595))))

(assert (=> b!225153 (= res!188953 (bvsge i!761 to!496))))

(declare-fun b!225152 () Bool)

(declare-fun res!188955 () Bool)

(assert (=> b!225152 (=> (not res!188955) (not e!153595))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225152 (= res!188955 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4895 (buf!5439 thiss!1870))) ((_ sign_extend 32) (currentByte!10205 thiss!1870)) ((_ sign_extend 32) (currentBit!10200 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225155 () Bool)

(assert (=> b!225155 (= e!153596 (array_inv!4636 (buf!5439 thiss!1870)))))

(assert (= (and start!47086 res!188954) b!225152))

(assert (= (and b!225152 res!188955) b!225153))

(assert (= (and b!225153 res!188953) b!225154))

(assert (= start!47086 b!225155))

(declare-fun m!346067 () Bool)

(assert (=> start!47086 m!346067))

(declare-fun m!346069 () Bool)

(assert (=> start!47086 m!346069))

(declare-fun m!346071 () Bool)

(assert (=> b!225154 m!346071))

(declare-fun m!346073 () Bool)

(assert (=> b!225154 m!346073))

(declare-fun m!346075 () Bool)

(assert (=> b!225154 m!346075))

(declare-fun m!346077 () Bool)

(assert (=> b!225152 m!346077))

(declare-fun m!346079 () Bool)

(assert (=> b!225155 m!346079))

(check-sat (not b!225152) (not b!225154) (not start!47086) (not b!225155))
