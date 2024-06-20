; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47216 () Bool)

(assert start!47216)

(declare-fun b!225440 () Bool)

(declare-fun res!189192 () Bool)

(declare-fun e!153866 () Bool)

(assert (=> b!225440 (=> (not res!189192) (not e!153866))))

(declare-datatypes ((array!11198 0))(
  ( (array!11199 (arr!5869 (Array (_ BitVec 32) (_ BitVec 8))) (size!4912 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8926 0))(
  ( (BitStream!8927 (buf!5456 array!11198) (currentByte!10240 (_ BitVec 32)) (currentBit!10235 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8926)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225440 (= res!189192 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4912 (buf!5456 thiss!1870))) ((_ sign_extend 32) (currentByte!10240 thiss!1870)) ((_ sign_extend 32) (currentBit!10235 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225443 () Bool)

(declare-fun e!153865 () Bool)

(declare-fun array_inv!4653 (array!11198) Bool)

(assert (=> b!225443 (= e!153865 (array_inv!4653 (buf!5456 thiss!1870)))))

(declare-fun res!189190 () Bool)

(assert (=> start!47216 (=> (not res!189190) (not e!153866))))

(declare-fun arr!308 () array!11198)

(assert (=> start!47216 (= res!189190 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4912 arr!308))))))

(assert (=> start!47216 e!153866))

(assert (=> start!47216 true))

(assert (=> start!47216 (array_inv!4653 arr!308)))

(declare-fun inv!12 (BitStream!8926) Bool)

(assert (=> start!47216 (and (inv!12 thiss!1870) e!153865)))

(declare-fun b!225442 () Bool)

(assert (=> b!225442 (= e!153866 (not true))))

(declare-fun arrayRangesEq!802 (array!11198 array!11198 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225442 (arrayRangesEq!802 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16569 0))(
  ( (Unit!16570) )
))
(declare-fun lt!358617 () Unit!16569)

(declare-fun arrayRangesEqSlicedLemma!91 (array!11198 array!11198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16569)

(assert (=> b!225442 (= lt!358617 (arrayRangesEqSlicedLemma!91 arr!308 arr!308 #b00000000000000000000000000000000 (size!4912 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225442 (arrayRangesEq!802 arr!308 arr!308 #b00000000000000000000000000000000 (size!4912 arr!308))))

(declare-fun lt!358615 () Unit!16569)

(declare-fun arrayRangesEqReflexiveLemma!106 (array!11198) Unit!16569)

(assert (=> b!225442 (= lt!358615 (arrayRangesEqReflexiveLemma!106 arr!308))))

(declare-fun lt!358616 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225442 (= lt!358616 (bitIndex!0 (size!4912 (buf!5456 thiss!1870)) (currentByte!10240 thiss!1870) (currentBit!10235 thiss!1870)))))

(declare-fun b!225441 () Bool)

(declare-fun res!189191 () Bool)

(assert (=> b!225441 (=> (not res!189191) (not e!153866))))

(assert (=> b!225441 (= res!189191 (bvsge i!761 to!496))))

(assert (= (and start!47216 res!189190) b!225440))

(assert (= (and b!225440 res!189192) b!225441))

(assert (= (and b!225441 res!189191) b!225442))

(assert (= start!47216 b!225443))

(declare-fun m!346425 () Bool)

(assert (=> b!225440 m!346425))

(declare-fun m!346427 () Bool)

(assert (=> b!225443 m!346427))

(declare-fun m!346429 () Bool)

(assert (=> start!47216 m!346429))

(declare-fun m!346431 () Bool)

(assert (=> start!47216 m!346431))

(declare-fun m!346433 () Bool)

(assert (=> b!225442 m!346433))

(declare-fun m!346435 () Bool)

(assert (=> b!225442 m!346435))

(declare-fun m!346437 () Bool)

(assert (=> b!225442 m!346437))

(declare-fun m!346439 () Bool)

(assert (=> b!225442 m!346439))

(declare-fun m!346441 () Bool)

(assert (=> b!225442 m!346441))

(push 1)

(assert (not b!225440))

(assert (not b!225442))

(assert (not b!225443))

(assert (not start!47216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

