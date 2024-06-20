; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48144 () Bool)

(assert start!48144)

(declare-fun b!228723 () Bool)

(declare-fun res!191840 () Bool)

(declare-fun e!156825 () Bool)

(assert (=> b!228723 (=> (not res!191840) (not e!156825))))

(declare-datatypes ((array!11571 0))(
  ( (array!11572 (arr!6066 (Array (_ BitVec 32) (_ BitVec 8))) (size!5079 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9254 0))(
  ( (BitStream!9255 (buf!5620 array!11571) (currentByte!10482 (_ BitVec 32)) (currentBit!10477 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9254)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228723 (= res!191840 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5079 (buf!5620 thiss!1870))) ((_ sign_extend 32) (currentByte!10482 thiss!1870)) ((_ sign_extend 32) (currentBit!10477 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191841 () Bool)

(assert (=> start!48144 (=> (not res!191841) (not e!156825))))

(declare-fun arr!308 () array!11571)

(assert (=> start!48144 (= res!191841 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5079 arr!308))))))

(assert (=> start!48144 e!156825))

(assert (=> start!48144 true))

(declare-fun array_inv!4820 (array!11571) Bool)

(assert (=> start!48144 (array_inv!4820 arr!308)))

(declare-fun e!156826 () Bool)

(declare-fun inv!12 (BitStream!9254) Bool)

(assert (=> start!48144 (and (inv!12 thiss!1870) e!156826)))

(declare-fun b!228724 () Bool)

(declare-fun res!191842 () Bool)

(assert (=> b!228724 (=> (not res!191842) (not e!156825))))

(assert (=> b!228724 (= res!191842 (bvsge i!761 to!496))))

(declare-fun b!228726 () Bool)

(assert (=> b!228726 (= e!156826 (array_inv!4820 (buf!5620 thiss!1870)))))

(declare-fun lt!366923 () (_ BitVec 64))

(declare-fun lt!366927 () (_ BitVec 64))

(declare-fun b!228725 () Bool)

(declare-fun lt!366926 () (_ BitVec 64))

(assert (=> b!228725 (= e!156825 (not (or (not (= lt!366927 (bvand lt!366923 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!366927 (bvand (bvadd lt!366926 lt!366923) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!228725 (= lt!366927 (bvand lt!366926 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228725 (= lt!366923 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761))))))

(declare-fun arrayRangesEq!912 (array!11571 array!11571 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228725 (arrayRangesEq!912 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!17225 0))(
  ( (Unit!17226) )
))
(declare-fun lt!366924 () Unit!17225)

(declare-fun arrayRangesEqSlicedLemma!138 (array!11571 array!11571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17225)

(assert (=> b!228725 (= lt!366924 (arrayRangesEqSlicedLemma!138 arr!308 arr!308 #b00000000000000000000000000000000 (size!5079 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!228725 (arrayRangesEq!912 arr!308 arr!308 #b00000000000000000000000000000000 (size!5079 arr!308))))

(declare-fun lt!366925 () Unit!17225)

(declare-fun arrayRangesEqReflexiveLemma!168 (array!11571) Unit!17225)

(assert (=> b!228725 (= lt!366925 (arrayRangesEqReflexiveLemma!168 arr!308))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228725 (= lt!366926 (bitIndex!0 (size!5079 (buf!5620 thiss!1870)) (currentByte!10482 thiss!1870) (currentBit!10477 thiss!1870)))))

(assert (= (and start!48144 res!191841) b!228723))

(assert (= (and b!228723 res!191840) b!228724))

(assert (= (and b!228724 res!191842) b!228725))

(assert (= start!48144 b!228726))

(declare-fun m!352477 () Bool)

(assert (=> b!228723 m!352477))

(declare-fun m!352479 () Bool)

(assert (=> start!48144 m!352479))

(declare-fun m!352481 () Bool)

(assert (=> start!48144 m!352481))

(declare-fun m!352483 () Bool)

(assert (=> b!228726 m!352483))

(declare-fun m!352485 () Bool)

(assert (=> b!228725 m!352485))

(declare-fun m!352487 () Bool)

(assert (=> b!228725 m!352487))

(declare-fun m!352489 () Bool)

(assert (=> b!228725 m!352489))

(declare-fun m!352491 () Bool)

(assert (=> b!228725 m!352491))

(declare-fun m!352493 () Bool)

(assert (=> b!228725 m!352493))

(push 1)

(assert (not b!228725))

(assert (not b!228726))

(assert (not start!48144))

(assert (not b!228723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

