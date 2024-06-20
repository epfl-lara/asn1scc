; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47604 () Bool)

(assert start!47604)

(declare-fun b!226712 () Bool)

(declare-fun res!190225 () Bool)

(declare-fun e!155014 () Bool)

(assert (=> b!226712 (=> (not res!190225) (not e!155014))))

(declare-datatypes ((array!11349 0))(
  ( (array!11350 (arr!5946 (Array (_ BitVec 32) (_ BitVec 8))) (size!4977 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9050 0))(
  ( (BitStream!9051 (buf!5518 array!11349) (currentByte!10344 (_ BitVec 32)) (currentBit!10339 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9050)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226712 (= res!190225 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4977 (buf!5518 thiss!1870))) ((_ sign_extend 32) (currentByte!10344 thiss!1870)) ((_ sign_extend 32) (currentBit!10339 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226713 () Bool)

(declare-fun e!155013 () Bool)

(declare-fun array_inv!4718 (array!11349) Bool)

(assert (=> b!226713 (= e!155013 (array_inv!4718 (buf!5518 thiss!1870)))))

(declare-fun b!226714 () Bool)

(declare-fun res!190227 () Bool)

(assert (=> b!226714 (=> (not res!190227) (not e!155014))))

(assert (=> b!226714 (= res!190227 (bvslt i!761 to!496))))

(declare-fun res!190226 () Bool)

(assert (=> start!47604 (=> (not res!190226) (not e!155014))))

(declare-fun arr!308 () array!11349)

(assert (=> start!47604 (= res!190226 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4977 arr!308))))))

(assert (=> start!47604 e!155014))

(assert (=> start!47604 true))

(assert (=> start!47604 (array_inv!4718 arr!308)))

(declare-fun inv!12 (BitStream!9050) Bool)

(assert (=> start!47604 (and (inv!12 thiss!1870) e!155013)))

(declare-fun lt!361446 () (_ BitVec 32))

(declare-fun e!155012 () Bool)

(declare-fun b!226715 () Bool)

(declare-fun lt!361443 () (_ BitVec 64))

(declare-datatypes ((Unit!16831 0))(
  ( (Unit!16832) )
))
(declare-datatypes ((tuple3!1336 0))(
  ( (tuple3!1337 (_1!10536 Unit!16831) (_2!10536 BitStream!9050) (_3!810 array!11349)) )
))
(declare-fun lt!361444 () tuple3!1336)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226715 (= e!155012 (= (bvadd lt!361443 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!361446))) (bitIndex!0 (size!4977 (buf!5518 (_2!10536 lt!361444))) (currentByte!10344 (_2!10536 lt!361444)) (currentBit!10339 (_2!10536 lt!361444)))))))

(declare-fun b!226716 () Bool)

(assert (=> b!226716 (= e!155014 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(assert (=> b!226716 e!155012))

(declare-fun res!190228 () Bool)

(assert (=> b!226716 (=> (not res!190228) (not e!155012))))

(declare-fun lt!361445 () (_ BitVec 64))

(assert (=> b!226716 (= res!190228 (= lt!361443 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!361445)))))

(declare-datatypes ((tuple2!19452 0))(
  ( (tuple2!19453 (_1!10537 (_ BitVec 8)) (_2!10537 BitStream!9050)) )
))
(declare-fun lt!361442 () tuple2!19452)

(assert (=> b!226716 (= lt!361443 (bitIndex!0 (size!4977 (buf!5518 (_2!10537 lt!361442))) (currentByte!10344 (_2!10537 lt!361442)) (currentBit!10339 (_2!10537 lt!361442))))))

(assert (=> b!226716 (= lt!361445 (bitIndex!0 (size!4977 (buf!5518 thiss!1870)) (currentByte!10344 thiss!1870) (currentBit!10339 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9050 array!11349 (_ BitVec 32) (_ BitVec 32)) tuple3!1336)

(assert (=> b!226716 (= lt!361444 (readByteArrayLoop!0 (_2!10537 lt!361442) (array!11350 (store (arr!5946 arr!308) i!761 (_1!10537 lt!361442)) (size!4977 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226716 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4977 (buf!5518 (_2!10537 lt!361442)))) ((_ sign_extend 32) (currentByte!10344 (_2!10537 lt!361442))) ((_ sign_extend 32) (currentBit!10339 (_2!10537 lt!361442))) lt!361446)))

(assert (=> b!226716 (= lt!361446 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!361441 () Unit!16831)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9050 BitStream!9050 (_ BitVec 64) (_ BitVec 32)) Unit!16831)

(assert (=> b!226716 (= lt!361441 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10537 lt!361442) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9050) tuple2!19452)

(assert (=> b!226716 (= lt!361442 (readByte!0 thiss!1870))))

(assert (= (and start!47604 res!190226) b!226712))

(assert (= (and b!226712 res!190225) b!226714))

(assert (= (and b!226714 res!190227) b!226716))

(assert (= (and b!226716 res!190228) b!226715))

(assert (= start!47604 b!226713))

(declare-fun m!348355 () Bool)

(assert (=> b!226716 m!348355))

(declare-fun m!348357 () Bool)

(assert (=> b!226716 m!348357))

(declare-fun m!348359 () Bool)

(assert (=> b!226716 m!348359))

(declare-fun m!348361 () Bool)

(assert (=> b!226716 m!348361))

(declare-fun m!348363 () Bool)

(assert (=> b!226716 m!348363))

(declare-fun m!348365 () Bool)

(assert (=> b!226716 m!348365))

(declare-fun m!348367 () Bool)

(assert (=> b!226716 m!348367))

(declare-fun m!348369 () Bool)

(assert (=> b!226713 m!348369))

(declare-fun m!348371 () Bool)

(assert (=> b!226712 m!348371))

(declare-fun m!348373 () Bool)

(assert (=> b!226715 m!348373))

(declare-fun m!348375 () Bool)

(assert (=> start!47604 m!348375))

(declare-fun m!348377 () Bool)

(assert (=> start!47604 m!348377))

(push 1)

(assert (not b!226715))

(assert (not b!226713))

(assert (not b!226716))

(assert (not start!47604))

(assert (not b!226712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

