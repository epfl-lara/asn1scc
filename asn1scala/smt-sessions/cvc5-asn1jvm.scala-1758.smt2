; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48146 () Bool)

(assert start!48146)

(declare-fun b!228736 () Bool)

(declare-fun res!191851 () Bool)

(declare-fun e!156837 () Bool)

(assert (=> b!228736 (=> (not res!191851) (not e!156837))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228736 (= res!191851 (bvsge i!761 to!496))))

(declare-fun res!191849 () Bool)

(assert (=> start!48146 (=> (not res!191849) (not e!156837))))

(declare-datatypes ((array!11573 0))(
  ( (array!11574 (arr!6067 (Array (_ BitVec 32) (_ BitVec 8))) (size!5080 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11573)

(assert (=> start!48146 (= res!191849 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5080 arr!308))))))

(assert (=> start!48146 e!156837))

(assert (=> start!48146 true))

(declare-fun array_inv!4821 (array!11573) Bool)

(assert (=> start!48146 (array_inv!4821 arr!308)))

(declare-datatypes ((BitStream!9256 0))(
  ( (BitStream!9257 (buf!5621 array!11573) (currentByte!10483 (_ BitVec 32)) (currentBit!10478 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9256)

(declare-fun e!156836 () Bool)

(declare-fun inv!12 (BitStream!9256) Bool)

(assert (=> start!48146 (and (inv!12 thiss!1870) e!156836)))

(declare-fun b!228735 () Bool)

(declare-fun res!191850 () Bool)

(assert (=> b!228735 (=> (not res!191850) (not e!156837))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228735 (= res!191850 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5080 (buf!5621 thiss!1870))) ((_ sign_extend 32) (currentByte!10483 thiss!1870)) ((_ sign_extend 32) (currentBit!10478 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228738 () Bool)

(assert (=> b!228738 (= e!156836 (array_inv!4821 (buf!5621 thiss!1870)))))

(declare-fun b!228737 () Bool)

(assert (=> b!228737 (= e!156837 (not true))))

(declare-fun arrayRangesEq!913 (array!11573 array!11573 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228737 (arrayRangesEq!913 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17227 0))(
  ( (Unit!17228) )
))
(declare-fun lt!366935 () Unit!17227)

(declare-fun arrayRangesEqSlicedLemma!139 (array!11573 array!11573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17227)

(assert (=> b!228737 (= lt!366935 (arrayRangesEqSlicedLemma!139 arr!308 arr!308 #b00000000000000000000000000000000 (size!5080 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228737 (arrayRangesEq!913 arr!308 arr!308 #b00000000000000000000000000000000 (size!5080 arr!308))))

(declare-fun lt!366936 () Unit!17227)

(declare-fun arrayRangesEqReflexiveLemma!169 (array!11573) Unit!17227)

(assert (=> b!228737 (= lt!366936 (arrayRangesEqReflexiveLemma!169 arr!308))))

(declare-fun lt!366934 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228737 (= lt!366934 (bitIndex!0 (size!5080 (buf!5621 thiss!1870)) (currentByte!10483 thiss!1870) (currentBit!10478 thiss!1870)))))

(assert (= (and start!48146 res!191849) b!228735))

(assert (= (and b!228735 res!191850) b!228736))

(assert (= (and b!228736 res!191851) b!228737))

(assert (= start!48146 b!228738))

(declare-fun m!352495 () Bool)

(assert (=> start!48146 m!352495))

(declare-fun m!352497 () Bool)

(assert (=> start!48146 m!352497))

(declare-fun m!352499 () Bool)

(assert (=> b!228735 m!352499))

(declare-fun m!352501 () Bool)

(assert (=> b!228738 m!352501))

(declare-fun m!352503 () Bool)

(assert (=> b!228737 m!352503))

(declare-fun m!352505 () Bool)

(assert (=> b!228737 m!352505))

(declare-fun m!352507 () Bool)

(assert (=> b!228737 m!352507))

(declare-fun m!352509 () Bool)

(assert (=> b!228737 m!352509))

(declare-fun m!352511 () Bool)

(assert (=> b!228737 m!352511))

(push 1)

(assert (not b!228737))

(assert (not b!228738))

(assert (not start!48146))

(assert (not b!228735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

