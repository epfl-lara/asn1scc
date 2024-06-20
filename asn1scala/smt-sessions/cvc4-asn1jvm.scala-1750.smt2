; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48102 () Bool)

(assert start!48102)

(declare-fun b!228473 () Bool)

(declare-fun e!156574 () Bool)

(declare-datatypes ((array!11529 0))(
  ( (array!11530 (arr!6045 (Array (_ BitVec 32) (_ BitVec 8))) (size!5058 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11529)

(assert (=> b!228473 (= e!156574 (not (bvsle #b00000000000000000000000000000000 (size!5058 arr!308))))))

(declare-fun arrayRangesEq!891 (array!11529 array!11529 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228473 (arrayRangesEq!891 arr!308 arr!308 #b00000000000000000000000000000000 (size!5058 arr!308))))

(declare-datatypes ((Unit!17183 0))(
  ( (Unit!17184) )
))
(declare-fun lt!366746 () Unit!17183)

(declare-fun arrayRangesEqReflexiveLemma!147 (array!11529) Unit!17183)

(assert (=> b!228473 (= lt!366746 (arrayRangesEqReflexiveLemma!147 arr!308))))

(declare-fun lt!366747 () (_ BitVec 64))

(declare-datatypes ((BitStream!9212 0))(
  ( (BitStream!9213 (buf!5599 array!11529) (currentByte!10461 (_ BitVec 32)) (currentBit!10456 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9212)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228473 (= lt!366747 (bitIndex!0 (size!5058 (buf!5599 thiss!1870)) (currentByte!10461 thiss!1870) (currentBit!10456 thiss!1870)))))

(declare-fun b!228474 () Bool)

(declare-fun e!156572 () Bool)

(declare-fun array_inv!4799 (array!11529) Bool)

(assert (=> b!228474 (= e!156572 (array_inv!4799 (buf!5599 thiss!1870)))))

(declare-fun b!228471 () Bool)

(declare-fun res!191653 () Bool)

(assert (=> b!228471 (=> (not res!191653) (not e!156574))))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228471 (= res!191653 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5058 (buf!5599 thiss!1870))) ((_ sign_extend 32) (currentByte!10461 thiss!1870)) ((_ sign_extend 32) (currentBit!10456 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228472 () Bool)

(declare-fun res!191652 () Bool)

(assert (=> b!228472 (=> (not res!191652) (not e!156574))))

(assert (=> b!228472 (= res!191652 (bvsge i!761 to!496))))

(declare-fun res!191651 () Bool)

(assert (=> start!48102 (=> (not res!191651) (not e!156574))))

(assert (=> start!48102 (= res!191651 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5058 arr!308))))))

(assert (=> start!48102 e!156574))

(assert (=> start!48102 true))

(assert (=> start!48102 (array_inv!4799 arr!308)))

(declare-fun inv!12 (BitStream!9212) Bool)

(assert (=> start!48102 (and (inv!12 thiss!1870) e!156572)))

(assert (= (and start!48102 res!191651) b!228471))

(assert (= (and b!228471 res!191653) b!228472))

(assert (= (and b!228472 res!191652) b!228473))

(assert (= start!48102 b!228474))

(declare-fun m!352151 () Bool)

(assert (=> b!228473 m!352151))

(declare-fun m!352153 () Bool)

(assert (=> b!228473 m!352153))

(declare-fun m!352155 () Bool)

(assert (=> b!228473 m!352155))

(declare-fun m!352157 () Bool)

(assert (=> b!228474 m!352157))

(declare-fun m!352159 () Bool)

(assert (=> b!228471 m!352159))

(declare-fun m!352161 () Bool)

(assert (=> start!48102 m!352161))

(declare-fun m!352163 () Bool)

(assert (=> start!48102 m!352163))

(push 1)

(assert (not b!228474))

(assert (not b!228473))

(assert (not start!48102))

(assert (not b!228471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

