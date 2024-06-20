; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47088 () Bool)

(assert start!47088)

(declare-fun b!225166 () Bool)

(declare-fun e!153606 () Bool)

(assert (=> b!225166 (= e!153606 (not true))))

(declare-datatypes ((array!11160 0))(
  ( (array!11161 (arr!5853 (Array (_ BitVec 32) (_ BitVec 8))) (size!4896 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11160)

(declare-fun arrayRangesEq!786 (array!11160 array!11160 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225166 (arrayRangesEq!786 arr!308 arr!308 #b00000000000000000000000000000000 (size!4896 arr!308))))

(declare-datatypes ((Unit!16537 0))(
  ( (Unit!16538) )
))
(declare-fun lt!358347 () Unit!16537)

(declare-fun arrayRangesEqReflexiveLemma!90 (array!11160) Unit!16537)

(assert (=> b!225166 (= lt!358347 (arrayRangesEqReflexiveLemma!90 arr!308))))

(declare-fun lt!358346 () (_ BitVec 64))

(declare-datatypes ((BitStream!8894 0))(
  ( (BitStream!8895 (buf!5440 array!11160) (currentByte!10206 (_ BitVec 32)) (currentBit!10201 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8894)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225166 (= lt!358346 (bitIndex!0 (size!4896 (buf!5440 thiss!1870)) (currentByte!10206 thiss!1870) (currentBit!10201 thiss!1870)))))

(declare-fun res!188964 () Bool)

(assert (=> start!47088 (=> (not res!188964) (not e!153606))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47088 (= res!188964 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4896 arr!308))))))

(assert (=> start!47088 e!153606))

(assert (=> start!47088 true))

(declare-fun array_inv!4637 (array!11160) Bool)

(assert (=> start!47088 (array_inv!4637 arr!308)))

(declare-fun e!153607 () Bool)

(declare-fun inv!12 (BitStream!8894) Bool)

(assert (=> start!47088 (and (inv!12 thiss!1870) e!153607)))

(declare-fun b!225167 () Bool)

(assert (=> b!225167 (= e!153607 (array_inv!4637 (buf!5440 thiss!1870)))))

(declare-fun b!225165 () Bool)

(declare-fun res!188963 () Bool)

(assert (=> b!225165 (=> (not res!188963) (not e!153606))))

(assert (=> b!225165 (= res!188963 (bvsge i!761 to!496))))

(declare-fun b!225164 () Bool)

(declare-fun res!188962 () Bool)

(assert (=> b!225164 (=> (not res!188962) (not e!153606))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225164 (= res!188962 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4896 (buf!5440 thiss!1870))) ((_ sign_extend 32) (currentByte!10206 thiss!1870)) ((_ sign_extend 32) (currentBit!10201 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47088 res!188964) b!225164))

(assert (= (and b!225164 res!188962) b!225165))

(assert (= (and b!225165 res!188963) b!225166))

(assert (= start!47088 b!225167))

(declare-fun m!346081 () Bool)

(assert (=> b!225166 m!346081))

(declare-fun m!346083 () Bool)

(assert (=> b!225166 m!346083))

(declare-fun m!346085 () Bool)

(assert (=> b!225166 m!346085))

(declare-fun m!346087 () Bool)

(assert (=> start!47088 m!346087))

(declare-fun m!346089 () Bool)

(assert (=> start!47088 m!346089))

(declare-fun m!346091 () Bool)

(assert (=> b!225167 m!346091))

(declare-fun m!346093 () Bool)

(assert (=> b!225164 m!346093))

(push 1)

(assert (not b!225164))

(assert (not b!225166))

(assert (not start!47088))

(assert (not b!225167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

