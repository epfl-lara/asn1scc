; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48150 () Bool)

(assert start!48150)

(declare-fun res!191868 () Bool)

(declare-fun e!156862 () Bool)

(assert (=> start!48150 (=> (not res!191868) (not e!156862))))

(declare-datatypes ((array!11577 0))(
  ( (array!11578 (arr!6069 (Array (_ BitVec 32) (_ BitVec 8))) (size!5082 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11577)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48150 (= res!191868 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5082 arr!308))))))

(assert (=> start!48150 e!156862))

(assert (=> start!48150 true))

(declare-fun array_inv!4823 (array!11577) Bool)

(assert (=> start!48150 (array_inv!4823 arr!308)))

(declare-datatypes ((BitStream!9260 0))(
  ( (BitStream!9261 (buf!5623 array!11577) (currentByte!10485 (_ BitVec 32)) (currentBit!10480 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9260)

(declare-fun e!156860 () Bool)

(declare-fun inv!12 (BitStream!9260) Bool)

(assert (=> start!48150 (and (inv!12 thiss!1870) e!156860)))

(declare-fun b!228761 () Bool)

(assert (=> b!228761 (= e!156862 (not true))))

(declare-fun arrayRangesEq!915 (array!11577 array!11577 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228761 (arrayRangesEq!915 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17231 0))(
  ( (Unit!17232) )
))
(declare-fun lt!366953 () Unit!17231)

(declare-fun arrayRangesEqSlicedLemma!141 (array!11577 array!11577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17231)

(assert (=> b!228761 (= lt!366953 (arrayRangesEqSlicedLemma!141 arr!308 arr!308 #b00000000000000000000000000000000 (size!5082 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228761 (arrayRangesEq!915 arr!308 arr!308 #b00000000000000000000000000000000 (size!5082 arr!308))))

(declare-fun lt!366952 () Unit!17231)

(declare-fun arrayRangesEqReflexiveLemma!171 (array!11577) Unit!17231)

(assert (=> b!228761 (= lt!366952 (arrayRangesEqReflexiveLemma!171 arr!308))))

(declare-fun lt!366954 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228761 (= lt!366954 (bitIndex!0 (size!5082 (buf!5623 thiss!1870)) (currentByte!10485 thiss!1870) (currentBit!10480 thiss!1870)))))

(declare-fun b!228759 () Bool)

(declare-fun res!191869 () Bool)

(assert (=> b!228759 (=> (not res!191869) (not e!156862))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228759 (= res!191869 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5082 (buf!5623 thiss!1870))) ((_ sign_extend 32) (currentByte!10485 thiss!1870)) ((_ sign_extend 32) (currentBit!10480 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228762 () Bool)

(assert (=> b!228762 (= e!156860 (array_inv!4823 (buf!5623 thiss!1870)))))

(declare-fun b!228760 () Bool)

(declare-fun res!191867 () Bool)

(assert (=> b!228760 (=> (not res!191867) (not e!156862))))

(assert (=> b!228760 (= res!191867 (bvsge i!761 to!496))))

(assert (= (and start!48150 res!191868) b!228759))

(assert (= (and b!228759 res!191869) b!228760))

(assert (= (and b!228760 res!191867) b!228761))

(assert (= start!48150 b!228762))

(declare-fun m!352531 () Bool)

(assert (=> start!48150 m!352531))

(declare-fun m!352533 () Bool)

(assert (=> start!48150 m!352533))

(declare-fun m!352535 () Bool)

(assert (=> b!228761 m!352535))

(declare-fun m!352537 () Bool)

(assert (=> b!228761 m!352537))

(declare-fun m!352539 () Bool)

(assert (=> b!228761 m!352539))

(declare-fun m!352541 () Bool)

(assert (=> b!228761 m!352541))

(declare-fun m!352543 () Bool)

(assert (=> b!228761 m!352543))

(declare-fun m!352545 () Bool)

(assert (=> b!228759 m!352545))

(declare-fun m!352547 () Bool)

(assert (=> b!228762 m!352547))

(push 1)

(assert (not b!228761))

(assert (not start!48150))

(assert (not b!228762))

(assert (not b!228759))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

