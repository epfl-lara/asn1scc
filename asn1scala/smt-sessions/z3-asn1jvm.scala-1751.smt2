; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48106 () Bool)

(assert start!48106)

(declare-fun b!228496 () Bool)

(declare-fun res!191670 () Bool)

(declare-fun e!156597 () Bool)

(assert (=> b!228496 (=> (not res!191670) (not e!156597))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228496 (= res!191670 (bvsge i!761 to!496))))

(declare-fun b!228498 () Bool)

(declare-fun e!156595 () Bool)

(declare-datatypes ((array!11533 0))(
  ( (array!11534 (arr!6047 (Array (_ BitVec 32) (_ BitVec 8))) (size!5060 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9216 0))(
  ( (BitStream!9217 (buf!5601 array!11533) (currentByte!10463 (_ BitVec 32)) (currentBit!10458 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9216)

(declare-fun array_inv!4801 (array!11533) Bool)

(assert (=> b!228498 (= e!156595 (array_inv!4801 (buf!5601 thiss!1870)))))

(declare-fun res!191671 () Bool)

(assert (=> start!48106 (=> (not res!191671) (not e!156597))))

(declare-fun arr!308 () array!11533)

(assert (=> start!48106 (= res!191671 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5060 arr!308))))))

(assert (=> start!48106 e!156597))

(assert (=> start!48106 true))

(assert (=> start!48106 (array_inv!4801 arr!308)))

(declare-fun inv!12 (BitStream!9216) Bool)

(assert (=> start!48106 (and (inv!12 thiss!1870) e!156595)))

(declare-fun b!228497 () Bool)

(assert (=> b!228497 (= e!156597 (not true))))

(declare-fun arrayRangesEq!893 (array!11533 array!11533 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228497 (arrayRangesEq!893 arr!308 arr!308 #b00000000000000000000000000000000 (size!5060 arr!308))))

(declare-datatypes ((Unit!17187 0))(
  ( (Unit!17188) )
))
(declare-fun lt!366759 () Unit!17187)

(declare-fun arrayRangesEqReflexiveLemma!149 (array!11533) Unit!17187)

(assert (=> b!228497 (= lt!366759 (arrayRangesEqReflexiveLemma!149 arr!308))))

(declare-fun lt!366758 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228497 (= lt!366758 (bitIndex!0 (size!5060 (buf!5601 thiss!1870)) (currentByte!10463 thiss!1870) (currentBit!10458 thiss!1870)))))

(declare-fun b!228495 () Bool)

(declare-fun res!191669 () Bool)

(assert (=> b!228495 (=> (not res!191669) (not e!156597))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228495 (= res!191669 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5060 (buf!5601 thiss!1870))) ((_ sign_extend 32) (currentByte!10463 thiss!1870)) ((_ sign_extend 32) (currentBit!10458 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48106 res!191671) b!228495))

(assert (= (and b!228495 res!191669) b!228496))

(assert (= (and b!228496 res!191670) b!228497))

(assert (= start!48106 b!228498))

(declare-fun m!352179 () Bool)

(assert (=> b!228498 m!352179))

(declare-fun m!352181 () Bool)

(assert (=> start!48106 m!352181))

(declare-fun m!352183 () Bool)

(assert (=> start!48106 m!352183))

(declare-fun m!352185 () Bool)

(assert (=> b!228497 m!352185))

(declare-fun m!352187 () Bool)

(assert (=> b!228497 m!352187))

(declare-fun m!352189 () Bool)

(assert (=> b!228497 m!352189))

(declare-fun m!352191 () Bool)

(assert (=> b!228495 m!352191))

(check-sat (not b!228497) (not b!228498) (not start!48106) (not b!228495))
