; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47096 () Bool)

(assert start!47096)

(declare-fun b!225212 () Bool)

(declare-fun res!188999 () Bool)

(declare-fun e!153653 () Bool)

(assert (=> b!225212 (=> (not res!188999) (not e!153653))))

(declare-datatypes ((array!11168 0))(
  ( (array!11169 (arr!5857 (Array (_ BitVec 32) (_ BitVec 8))) (size!4900 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8902 0))(
  ( (BitStream!8903 (buf!5444 array!11168) (currentByte!10210 (_ BitVec 32)) (currentBit!10205 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8902)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225212 (= res!188999 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4900 (buf!5444 thiss!1870))) ((_ sign_extend 32) (currentByte!10210 thiss!1870)) ((_ sign_extend 32) (currentBit!10205 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225213 () Bool)

(declare-fun res!189000 () Bool)

(assert (=> b!225213 (=> (not res!189000) (not e!153653))))

(assert (=> b!225213 (= res!189000 (bvsge i!761 to!496))))

(declare-fun b!225215 () Bool)

(declare-fun e!153655 () Bool)

(declare-fun array_inv!4641 (array!11168) Bool)

(assert (=> b!225215 (= e!153655 (array_inv!4641 (buf!5444 thiss!1870)))))

(declare-fun res!188998 () Bool)

(assert (=> start!47096 (=> (not res!188998) (not e!153653))))

(declare-fun arr!308 () array!11168)

(assert (=> start!47096 (= res!188998 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4900 arr!308))))))

(assert (=> start!47096 e!153653))

(assert (=> start!47096 true))

(assert (=> start!47096 (array_inv!4641 arr!308)))

(declare-fun inv!12 (BitStream!8902) Bool)

(assert (=> start!47096 (and (inv!12 thiss!1870) e!153655)))

(declare-fun b!225214 () Bool)

(assert (=> b!225214 (= e!153653 (not true))))

(declare-fun arrayRangesEq!790 (array!11168 array!11168 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225214 (arrayRangesEq!790 arr!308 arr!308 #b00000000000000000000000000000000 (size!4900 arr!308))))

(declare-datatypes ((Unit!16545 0))(
  ( (Unit!16546) )
))
(declare-fun lt!358371 () Unit!16545)

(declare-fun arrayRangesEqReflexiveLemma!94 (array!11168) Unit!16545)

(assert (=> b!225214 (= lt!358371 (arrayRangesEqReflexiveLemma!94 arr!308))))

(declare-fun lt!358370 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225214 (= lt!358370 (bitIndex!0 (size!4900 (buf!5444 thiss!1870)) (currentByte!10210 thiss!1870) (currentBit!10205 thiss!1870)))))

(assert (= (and start!47096 res!188998) b!225212))

(assert (= (and b!225212 res!188999) b!225213))

(assert (= (and b!225213 res!189000) b!225214))

(assert (= start!47096 b!225215))

(declare-fun m!346137 () Bool)

(assert (=> b!225212 m!346137))

(declare-fun m!346139 () Bool)

(assert (=> b!225215 m!346139))

(declare-fun m!346141 () Bool)

(assert (=> start!47096 m!346141))

(declare-fun m!346143 () Bool)

(assert (=> start!47096 m!346143))

(declare-fun m!346145 () Bool)

(assert (=> b!225214 m!346145))

(declare-fun m!346147 () Bool)

(assert (=> b!225214 m!346147))

(declare-fun m!346149 () Bool)

(assert (=> b!225214 m!346149))

(push 1)

(assert (not b!225212))

(assert (not b!225214))

(assert (not start!47096))

(assert (not b!225215))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

