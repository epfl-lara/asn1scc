; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48108 () Bool)

(assert start!48108)

(declare-fun b!228509 () Bool)

(declare-fun e!156609 () Bool)

(assert (=> b!228509 (= e!156609 (not true))))

(declare-datatypes ((array!11535 0))(
  ( (array!11536 (arr!6048 (Array (_ BitVec 32) (_ BitVec 8))) (size!5061 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11535)

(declare-fun arrayRangesEq!894 (array!11535 array!11535 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228509 (arrayRangesEq!894 arr!308 arr!308 #b00000000000000000000000000000000 (size!5061 arr!308))))

(declare-datatypes ((Unit!17189 0))(
  ( (Unit!17190) )
))
(declare-fun lt!366764 () Unit!17189)

(declare-fun arrayRangesEqReflexiveLemma!150 (array!11535) Unit!17189)

(assert (=> b!228509 (= lt!366764 (arrayRangesEqReflexiveLemma!150 arr!308))))

(declare-fun lt!366765 () (_ BitVec 64))

(declare-datatypes ((BitStream!9218 0))(
  ( (BitStream!9219 (buf!5602 array!11535) (currentByte!10464 (_ BitVec 32)) (currentBit!10459 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9218)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228509 (= lt!366765 (bitIndex!0 (size!5061 (buf!5602 thiss!1870)) (currentByte!10464 thiss!1870) (currentBit!10459 thiss!1870)))))

(declare-fun b!228508 () Bool)

(declare-fun res!191678 () Bool)

(assert (=> b!228508 (=> (not res!191678) (not e!156609))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228508 (= res!191678 (bvsge i!761 to!496))))

(declare-fun res!191679 () Bool)

(assert (=> start!48108 (=> (not res!191679) (not e!156609))))

(assert (=> start!48108 (= res!191679 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5061 arr!308))))))

(assert (=> start!48108 e!156609))

(assert (=> start!48108 true))

(declare-fun array_inv!4802 (array!11535) Bool)

(assert (=> start!48108 (array_inv!4802 arr!308)))

(declare-fun e!156607 () Bool)

(declare-fun inv!12 (BitStream!9218) Bool)

(assert (=> start!48108 (and (inv!12 thiss!1870) e!156607)))

(declare-fun b!228510 () Bool)

(assert (=> b!228510 (= e!156607 (array_inv!4802 (buf!5602 thiss!1870)))))

(declare-fun b!228507 () Bool)

(declare-fun res!191680 () Bool)

(assert (=> b!228507 (=> (not res!191680) (not e!156609))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228507 (= res!191680 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5061 (buf!5602 thiss!1870))) ((_ sign_extend 32) (currentByte!10464 thiss!1870)) ((_ sign_extend 32) (currentBit!10459 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48108 res!191679) b!228507))

(assert (= (and b!228507 res!191680) b!228508))

(assert (= (and b!228508 res!191678) b!228509))

(assert (= start!48108 b!228510))

(declare-fun m!352193 () Bool)

(assert (=> b!228509 m!352193))

(declare-fun m!352195 () Bool)

(assert (=> b!228509 m!352195))

(declare-fun m!352197 () Bool)

(assert (=> b!228509 m!352197))

(declare-fun m!352199 () Bool)

(assert (=> start!48108 m!352199))

(declare-fun m!352201 () Bool)

(assert (=> start!48108 m!352201))

(declare-fun m!352203 () Bool)

(assert (=> b!228510 m!352203))

(declare-fun m!352205 () Bool)

(assert (=> b!228507 m!352205))

(push 1)

(assert (not b!228510))

(assert (not start!48108))

(assert (not b!228509))

