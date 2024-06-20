; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48152 () Bool)

(assert start!48152)

(declare-fun res!191876 () Bool)

(declare-fun e!156874 () Bool)

(assert (=> start!48152 (=> (not res!191876) (not e!156874))))

(declare-datatypes ((array!11579 0))(
  ( (array!11580 (arr!6070 (Array (_ BitVec 32) (_ BitVec 8))) (size!5083 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11579)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48152 (= res!191876 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5083 arr!308))))))

(assert (=> start!48152 e!156874))

(assert (=> start!48152 true))

(declare-fun array_inv!4824 (array!11579) Bool)

(assert (=> start!48152 (array_inv!4824 arr!308)))

(declare-datatypes ((BitStream!9262 0))(
  ( (BitStream!9263 (buf!5624 array!11579) (currentByte!10486 (_ BitVec 32)) (currentBit!10481 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9262)

(declare-fun e!156871 () Bool)

(declare-fun inv!12 (BitStream!9262) Bool)

(assert (=> start!48152 (and (inv!12 thiss!1870) e!156871)))

(declare-fun b!228771 () Bool)

(declare-fun res!191878 () Bool)

(assert (=> b!228771 (=> (not res!191878) (not e!156874))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228771 (= res!191878 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5083 (buf!5624 thiss!1870))) ((_ sign_extend 32) (currentByte!10486 thiss!1870)) ((_ sign_extend 32) (currentBit!10481 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228772 () Bool)

(declare-fun res!191877 () Bool)

(assert (=> b!228772 (=> (not res!191877) (not e!156874))))

(assert (=> b!228772 (= res!191877 (bvsge i!761 to!496))))

(declare-fun b!228774 () Bool)

(assert (=> b!228774 (= e!156871 (array_inv!4824 (buf!5624 thiss!1870)))))

(declare-fun b!228773 () Bool)

(assert (=> b!228773 (= e!156874 (not true))))

(declare-fun arrayRangesEq!916 (array!11579 array!11579 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228773 (arrayRangesEq!916 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17233 0))(
  ( (Unit!17234) )
))
(declare-fun lt!366963 () Unit!17233)

(declare-fun arrayRangesEqSlicedLemma!142 (array!11579 array!11579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17233)

(assert (=> b!228773 (= lt!366963 (arrayRangesEqSlicedLemma!142 arr!308 arr!308 #b00000000000000000000000000000000 (size!5083 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228773 (arrayRangesEq!916 arr!308 arr!308 #b00000000000000000000000000000000 (size!5083 arr!308))))

(declare-fun lt!366961 () Unit!17233)

(declare-fun arrayRangesEqReflexiveLemma!172 (array!11579) Unit!17233)

(assert (=> b!228773 (= lt!366961 (arrayRangesEqReflexiveLemma!172 arr!308))))

(declare-fun lt!366962 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228773 (= lt!366962 (bitIndex!0 (size!5083 (buf!5624 thiss!1870)) (currentByte!10486 thiss!1870) (currentBit!10481 thiss!1870)))))

(assert (= (and start!48152 res!191876) b!228771))

(assert (= (and b!228771 res!191878) b!228772))

(assert (= (and b!228772 res!191877) b!228773))

(assert (= start!48152 b!228774))

(declare-fun m!352549 () Bool)

(assert (=> start!48152 m!352549))

(declare-fun m!352551 () Bool)

(assert (=> start!48152 m!352551))

(declare-fun m!352553 () Bool)

(assert (=> b!228771 m!352553))

(declare-fun m!352555 () Bool)

(assert (=> b!228774 m!352555))

(declare-fun m!352557 () Bool)

(assert (=> b!228773 m!352557))

(declare-fun m!352559 () Bool)

(assert (=> b!228773 m!352559))

(declare-fun m!352561 () Bool)

(assert (=> b!228773 m!352561))

(declare-fun m!352563 () Bool)

(assert (=> b!228773 m!352563))

(declare-fun m!352565 () Bool)

(assert (=> b!228773 m!352565))

(push 1)

(assert (not b!228774))

(assert (not start!48152))

(assert (not b!228771))

(assert (not b!228773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

