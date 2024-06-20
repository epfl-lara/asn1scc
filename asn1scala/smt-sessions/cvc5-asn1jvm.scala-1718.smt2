; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47486 () Bool)

(assert start!47486)

(declare-fun b!226302 () Bool)

(declare-fun res!189897 () Bool)

(declare-fun e!154666 () Bool)

(assert (=> b!226302 (=> (not res!189897) (not e!154666))))

(declare-datatypes ((array!11309 0))(
  ( (array!11310 (arr!5923 (Array (_ BitVec 32) (_ BitVec 8))) (size!4960 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9016 0))(
  ( (BitStream!9017 (buf!5501 array!11309) (currentByte!10315 (_ BitVec 32)) (currentBit!10310 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9016)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226302 (= res!189897 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4960 (buf!5501 thiss!1870))) ((_ sign_extend 32) (currentByte!10315 thiss!1870)) ((_ sign_extend 32) (currentBit!10310 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226305 () Bool)

(declare-fun e!154664 () Bool)

(declare-fun array_inv!4701 (array!11309) Bool)

(assert (=> b!226305 (= e!154664 (array_inv!4701 (buf!5501 thiss!1870)))))

(declare-fun b!226303 () Bool)

(declare-fun res!189896 () Bool)

(assert (=> b!226303 (=> (not res!189896) (not e!154666))))

(assert (=> b!226303 (= res!189896 (bvslt i!761 to!496))))

(declare-fun b!226304 () Bool)

(assert (=> b!226304 (= e!154666 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19394 0))(
  ( (tuple2!19395 (_1!10490 (_ BitVec 8)) (_2!10490 BitStream!9016)) )
))
(declare-fun lt!360166 () tuple2!19394)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226304 (= (bitIndex!0 (size!4960 (buf!5501 (_2!10490 lt!360166))) (currentByte!10315 (_2!10490 lt!360166)) (currentBit!10310 (_2!10490 lt!360166))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4960 (buf!5501 thiss!1870)) (currentByte!10315 thiss!1870) (currentBit!10310 thiss!1870))))))

(declare-datatypes ((Unit!16731 0))(
  ( (Unit!16732) )
))
(declare-datatypes ((tuple3!1302 0))(
  ( (tuple3!1303 (_1!10491 Unit!16731) (_2!10491 BitStream!9016) (_3!793 array!11309)) )
))
(declare-fun lt!360167 () tuple3!1302)

(declare-fun arr!308 () array!11309)

(declare-fun readByteArrayLoop!0 (BitStream!9016 array!11309 (_ BitVec 32) (_ BitVec 32)) tuple3!1302)

(assert (=> b!226304 (= lt!360167 (readByteArrayLoop!0 (_2!10490 lt!360166) (array!11310 (store (arr!5923 arr!308) i!761 (_1!10490 lt!360166)) (size!4960 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226304 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4960 (buf!5501 (_2!10490 lt!360166)))) ((_ sign_extend 32) (currentByte!10315 (_2!10490 lt!360166))) ((_ sign_extend 32) (currentBit!10310 (_2!10490 lt!360166))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360168 () Unit!16731)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9016 BitStream!9016 (_ BitVec 64) (_ BitVec 32)) Unit!16731)

(assert (=> b!226304 (= lt!360168 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10490 lt!360166) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9016) tuple2!19394)

(assert (=> b!226304 (= lt!360166 (readByte!0 thiss!1870))))

(declare-fun res!189898 () Bool)

(assert (=> start!47486 (=> (not res!189898) (not e!154666))))

(assert (=> start!47486 (= res!189898 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4960 arr!308))))))

(assert (=> start!47486 e!154666))

(assert (=> start!47486 true))

(assert (=> start!47486 (array_inv!4701 arr!308)))

(declare-fun inv!12 (BitStream!9016) Bool)

(assert (=> start!47486 (and (inv!12 thiss!1870) e!154664)))

(assert (= (and start!47486 res!189898) b!226302))

(assert (= (and b!226302 res!189897) b!226303))

(assert (= (and b!226303 res!189896) b!226304))

(assert (= start!47486 b!226305))

(declare-fun m!347587 () Bool)

(assert (=> b!226302 m!347587))

(declare-fun m!347589 () Bool)

(assert (=> b!226305 m!347589))

(declare-fun m!347591 () Bool)

(assert (=> b!226304 m!347591))

(declare-fun m!347593 () Bool)

(assert (=> b!226304 m!347593))

(declare-fun m!347595 () Bool)

(assert (=> b!226304 m!347595))

(declare-fun m!347597 () Bool)

(assert (=> b!226304 m!347597))

(declare-fun m!347599 () Bool)

(assert (=> b!226304 m!347599))

(declare-fun m!347601 () Bool)

(assert (=> b!226304 m!347601))

(declare-fun m!347603 () Bool)

(assert (=> b!226304 m!347603))

(declare-fun m!347605 () Bool)

(assert (=> start!47486 m!347605))

(declare-fun m!347607 () Bool)

(assert (=> start!47486 m!347607))

(push 1)

(assert (not b!226302))

(assert (not b!226304))

(assert (not b!226305))

(assert (not start!47486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

