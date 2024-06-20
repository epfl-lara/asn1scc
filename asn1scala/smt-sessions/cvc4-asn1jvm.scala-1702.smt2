; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47220 () Bool)

(assert start!47220)

(declare-fun res!189208 () Bool)

(declare-fun e!153888 () Bool)

(assert (=> start!47220 (=> (not res!189208) (not e!153888))))

(declare-datatypes ((array!11202 0))(
  ( (array!11203 (arr!5871 (Array (_ BitVec 32) (_ BitVec 8))) (size!4914 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11202)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47220 (= res!189208 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4914 arr!308))))))

(assert (=> start!47220 e!153888))

(assert (=> start!47220 true))

(declare-fun array_inv!4655 (array!11202) Bool)

(assert (=> start!47220 (array_inv!4655 arr!308)))

(declare-datatypes ((BitStream!8930 0))(
  ( (BitStream!8931 (buf!5458 array!11202) (currentByte!10242 (_ BitVec 32)) (currentBit!10237 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8930)

(declare-fun e!153890 () Bool)

(declare-fun inv!12 (BitStream!8930) Bool)

(assert (=> start!47220 (and (inv!12 thiss!1870) e!153890)))

(declare-fun b!225466 () Bool)

(assert (=> b!225466 (= e!153888 (not true))))

(declare-fun arrayRangesEq!804 (array!11202 array!11202 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225466 (arrayRangesEq!804 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16573 0))(
  ( (Unit!16574) )
))
(declare-fun lt!358635 () Unit!16573)

(declare-fun arrayRangesEqSlicedLemma!93 (array!11202 array!11202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16573)

(assert (=> b!225466 (= lt!358635 (arrayRangesEqSlicedLemma!93 arr!308 arr!308 #b00000000000000000000000000000000 (size!4914 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225466 (arrayRangesEq!804 arr!308 arr!308 #b00000000000000000000000000000000 (size!4914 arr!308))))

(declare-fun lt!358634 () Unit!16573)

(declare-fun arrayRangesEqReflexiveLemma!108 (array!11202) Unit!16573)

(assert (=> b!225466 (= lt!358634 (arrayRangesEqReflexiveLemma!108 arr!308))))

(declare-fun lt!358633 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225466 (= lt!358633 (bitIndex!0 (size!4914 (buf!5458 thiss!1870)) (currentByte!10242 thiss!1870) (currentBit!10237 thiss!1870)))))

(declare-fun b!225465 () Bool)

(declare-fun res!189210 () Bool)

(assert (=> b!225465 (=> (not res!189210) (not e!153888))))

(assert (=> b!225465 (= res!189210 (bvsge i!761 to!496))))

(declare-fun b!225467 () Bool)

(assert (=> b!225467 (= e!153890 (array_inv!4655 (buf!5458 thiss!1870)))))

(declare-fun b!225464 () Bool)

(declare-fun res!189209 () Bool)

(assert (=> b!225464 (=> (not res!189209) (not e!153888))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225464 (= res!189209 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4914 (buf!5458 thiss!1870))) ((_ sign_extend 32) (currentByte!10242 thiss!1870)) ((_ sign_extend 32) (currentBit!10237 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47220 res!189208) b!225464))

(assert (= (and b!225464 res!189209) b!225465))

(assert (= (and b!225465 res!189210) b!225466))

(assert (= start!47220 b!225467))

(declare-fun m!346461 () Bool)

(assert (=> start!47220 m!346461))

(declare-fun m!346463 () Bool)

(assert (=> start!47220 m!346463))

(declare-fun m!346465 () Bool)

(assert (=> b!225466 m!346465))

(declare-fun m!346467 () Bool)

(assert (=> b!225466 m!346467))

(declare-fun m!346469 () Bool)

(assert (=> b!225466 m!346469))

(declare-fun m!346471 () Bool)

(assert (=> b!225466 m!346471))

(declare-fun m!346473 () Bool)

(assert (=> b!225466 m!346473))

(declare-fun m!346475 () Bool)

(assert (=> b!225467 m!346475))

(declare-fun m!346477 () Bool)

(assert (=> b!225464 m!346477))

(push 1)

(assert (not b!225466))

(assert (not b!225467))

(assert (not start!47220))

(assert (not b!225464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

