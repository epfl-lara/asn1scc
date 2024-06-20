; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48128 () Bool)

(assert start!48128)

(declare-fun b!228628 () Bool)

(declare-fun res!191770 () Bool)

(declare-fun e!156730 () Bool)

(assert (=> b!228628 (=> (not res!191770) (not e!156730))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228628 (= res!191770 (bvsge i!761 to!496))))

(declare-fun res!191768 () Bool)

(assert (=> start!48128 (=> (not res!191768) (not e!156730))))

(declare-datatypes ((array!11555 0))(
  ( (array!11556 (arr!6058 (Array (_ BitVec 32) (_ BitVec 8))) (size!5071 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11555)

(assert (=> start!48128 (= res!191768 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5071 arr!308))))))

(assert (=> start!48128 e!156730))

(assert (=> start!48128 true))

(declare-fun array_inv!4812 (array!11555) Bool)

(assert (=> start!48128 (array_inv!4812 arr!308)))

(declare-datatypes ((BitStream!9238 0))(
  ( (BitStream!9239 (buf!5612 array!11555) (currentByte!10474 (_ BitVec 32)) (currentBit!10469 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9238)

(declare-fun e!156727 () Bool)

(declare-fun inv!12 (BitStream!9238) Bool)

(assert (=> start!48128 (and (inv!12 thiss!1870) e!156727)))

(declare-fun b!228627 () Bool)

(declare-fun res!191769 () Bool)

(assert (=> b!228627 (=> (not res!191769) (not e!156730))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228627 (= res!191769 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5071 (buf!5612 thiss!1870))) ((_ sign_extend 32) (currentByte!10474 thiss!1870)) ((_ sign_extend 32) (currentBit!10469 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228630 () Bool)

(assert (=> b!228630 (= e!156727 (array_inv!4812 (buf!5612 thiss!1870)))))

(declare-fun b!228629 () Bool)

(assert (=> b!228629 (= e!156730 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-fun arrayRangesEq!904 (array!11555 array!11555 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228629 (arrayRangesEq!904 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17209 0))(
  ( (Unit!17210) )
))
(declare-fun lt!366826 () Unit!17209)

(declare-fun arrayRangesEqSlicedLemma!130 (array!11555 array!11555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17209)

(assert (=> b!228629 (= lt!366826 (arrayRangesEqSlicedLemma!130 arr!308 arr!308 #b00000000000000000000000000000000 (size!5071 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228629 (arrayRangesEq!904 arr!308 arr!308 #b00000000000000000000000000000000 (size!5071 arr!308))))

(declare-fun lt!366828 () Unit!17209)

(declare-fun arrayRangesEqReflexiveLemma!160 (array!11555) Unit!17209)

(assert (=> b!228629 (= lt!366828 (arrayRangesEqReflexiveLemma!160 arr!308))))

(declare-fun lt!366827 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228629 (= lt!366827 (bitIndex!0 (size!5071 (buf!5612 thiss!1870)) (currentByte!10474 thiss!1870) (currentBit!10469 thiss!1870)))))

(assert (= (and start!48128 res!191768) b!228627))

(assert (= (and b!228627 res!191769) b!228628))

(assert (= (and b!228628 res!191770) b!228629))

(assert (= start!48128 b!228630))

(declare-fun m!352333 () Bool)

(assert (=> start!48128 m!352333))

(declare-fun m!352335 () Bool)

(assert (=> start!48128 m!352335))

(declare-fun m!352337 () Bool)

(assert (=> b!228627 m!352337))

(declare-fun m!352339 () Bool)

(assert (=> b!228630 m!352339))

(declare-fun m!352341 () Bool)

(assert (=> b!228629 m!352341))

(declare-fun m!352343 () Bool)

(assert (=> b!228629 m!352343))

(declare-fun m!352345 () Bool)

(assert (=> b!228629 m!352345))

(declare-fun m!352347 () Bool)

(assert (=> b!228629 m!352347))

(declare-fun m!352349 () Bool)

(assert (=> b!228629 m!352349))

(push 1)

(assert (not b!228629))

(assert (not b!228627))

(assert (not b!228630))

(assert (not start!48128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

