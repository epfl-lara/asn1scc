; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48118 () Bool)

(assert start!48118)

(declare-fun res!191725 () Bool)

(declare-fun e!156669 () Bool)

(assert (=> start!48118 (=> (not res!191725) (not e!156669))))

(declare-datatypes ((array!11545 0))(
  ( (array!11546 (arr!6053 (Array (_ BitVec 32) (_ BitVec 8))) (size!5066 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11545)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48118 (= res!191725 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5066 arr!308))))))

(assert (=> start!48118 e!156669))

(assert (=> start!48118 true))

(declare-fun array_inv!4807 (array!11545) Bool)

(assert (=> start!48118 (array_inv!4807 arr!308)))

(declare-datatypes ((BitStream!9228 0))(
  ( (BitStream!9229 (buf!5607 array!11545) (currentByte!10469 (_ BitVec 32)) (currentBit!10464 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9228)

(declare-fun e!156668 () Bool)

(declare-fun inv!12 (BitStream!9228) Bool)

(assert (=> start!48118 (and (inv!12 thiss!1870) e!156668)))

(declare-fun b!228568 () Bool)

(declare-fun res!191723 () Bool)

(assert (=> b!228568 (=> (not res!191723) (not e!156669))))

(assert (=> b!228568 (= res!191723 (bvsge i!761 to!496))))

(declare-fun b!228570 () Bool)

(assert (=> b!228570 (= e!156668 (array_inv!4807 (buf!5607 thiss!1870)))))

(declare-fun b!228569 () Bool)

(assert (=> b!228569 (= e!156669 (not (or (bvsgt #b00000000000000000000000000000000 (size!5066 arr!308)) (bvsle i!761 (size!5066 arr!308)))))))

(declare-fun arrayRangesEq!899 (array!11545 array!11545 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228569 (arrayRangesEq!899 arr!308 arr!308 #b00000000000000000000000000000000 (size!5066 arr!308))))

(declare-datatypes ((Unit!17199 0))(
  ( (Unit!17200) )
))
(declare-fun lt!366794 () Unit!17199)

(declare-fun arrayRangesEqReflexiveLemma!155 (array!11545) Unit!17199)

(assert (=> b!228569 (= lt!366794 (arrayRangesEqReflexiveLemma!155 arr!308))))

(declare-fun lt!366795 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228569 (= lt!366795 (bitIndex!0 (size!5066 (buf!5607 thiss!1870)) (currentByte!10469 thiss!1870) (currentBit!10464 thiss!1870)))))

(declare-fun b!228567 () Bool)

(declare-fun res!191724 () Bool)

(assert (=> b!228567 (=> (not res!191724) (not e!156669))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228567 (= res!191724 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5066 (buf!5607 thiss!1870))) ((_ sign_extend 32) (currentByte!10469 thiss!1870)) ((_ sign_extend 32) (currentBit!10464 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48118 res!191725) b!228567))

(assert (= (and b!228567 res!191724) b!228568))

(assert (= (and b!228568 res!191723) b!228569))

(assert (= start!48118 b!228570))

(declare-fun m!352263 () Bool)

(assert (=> start!48118 m!352263))

(declare-fun m!352265 () Bool)

(assert (=> start!48118 m!352265))

(declare-fun m!352267 () Bool)

(assert (=> b!228570 m!352267))

(declare-fun m!352269 () Bool)

(assert (=> b!228569 m!352269))

(declare-fun m!352271 () Bool)

(assert (=> b!228569 m!352271))

(declare-fun m!352273 () Bool)

(assert (=> b!228569 m!352273))

(declare-fun m!352275 () Bool)

(assert (=> b!228567 m!352275))

(check-sat (not start!48118) (not b!228569) (not b!228567) (not b!228570))
(check-sat)
