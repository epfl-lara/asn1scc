; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47600 () Bool)

(assert start!47600)

(declare-fun b!226682 () Bool)

(declare-fun res!190202 () Bool)

(declare-fun e!154981 () Bool)

(assert (=> b!226682 (=> (not res!190202) (not e!154981))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226682 (= res!190202 (bvslt i!761 to!496))))

(declare-fun b!226683 () Bool)

(declare-fun res!190201 () Bool)

(assert (=> b!226683 (=> (not res!190201) (not e!154981))))

(declare-datatypes ((array!11345 0))(
  ( (array!11346 (arr!5944 (Array (_ BitVec 32) (_ BitVec 8))) (size!4975 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9046 0))(
  ( (BitStream!9047 (buf!5516 array!11345) (currentByte!10342 (_ BitVec 32)) (currentBit!10337 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9046)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226683 (= res!190201 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4975 (buf!5516 thiss!1870))) ((_ sign_extend 32) (currentByte!10342 thiss!1870)) ((_ sign_extend 32) (currentBit!10337 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226684 () Bool)

(declare-fun e!154980 () Bool)

(declare-fun array_inv!4716 (array!11345) Bool)

(assert (=> b!226684 (= e!154980 (array_inv!4716 (buf!5516 thiss!1870)))))

(declare-fun res!190204 () Bool)

(assert (=> start!47600 (=> (not res!190204) (not e!154981))))

(declare-fun arr!308 () array!11345)

(assert (=> start!47600 (= res!190204 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4975 arr!308))))))

(assert (=> start!47600 e!154981))

(assert (=> start!47600 true))

(assert (=> start!47600 (array_inv!4716 arr!308)))

(declare-fun inv!12 (BitStream!9046) Bool)

(assert (=> start!47600 (and (inv!12 thiss!1870) e!154980)))

(declare-fun b!226685 () Bool)

(declare-datatypes ((Unit!16827 0))(
  ( (Unit!16828) )
))
(declare-datatypes ((tuple3!1332 0))(
  ( (tuple3!1333 (_1!10532 Unit!16827) (_2!10532 BitStream!9046) (_3!808 array!11345)) )
))
(declare-fun lt!361405 () tuple3!1332)

(declare-fun e!154983 () Bool)

(declare-fun lt!361407 () (_ BitVec 64))

(declare-fun lt!361406 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226685 (= e!154983 (= (bvadd lt!361407 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!361406))) (bitIndex!0 (size!4975 (buf!5516 (_2!10532 lt!361405))) (currentByte!10342 (_2!10532 lt!361405)) (currentBit!10337 (_2!10532 lt!361405)))))))

(declare-fun b!226686 () Bool)

(assert (=> b!226686 (= e!154981 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(assert (=> b!226686 e!154983))

(declare-fun res!190203 () Bool)

(assert (=> b!226686 (=> (not res!190203) (not e!154983))))

(declare-fun lt!361408 () (_ BitVec 64))

(assert (=> b!226686 (= res!190203 (= lt!361407 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!361408)))))

(declare-datatypes ((tuple2!19448 0))(
  ( (tuple2!19449 (_1!10533 (_ BitVec 8)) (_2!10533 BitStream!9046)) )
))
(declare-fun lt!361409 () tuple2!19448)

(assert (=> b!226686 (= lt!361407 (bitIndex!0 (size!4975 (buf!5516 (_2!10533 lt!361409))) (currentByte!10342 (_2!10533 lt!361409)) (currentBit!10337 (_2!10533 lt!361409))))))

(assert (=> b!226686 (= lt!361408 (bitIndex!0 (size!4975 (buf!5516 thiss!1870)) (currentByte!10342 thiss!1870) (currentBit!10337 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9046 array!11345 (_ BitVec 32) (_ BitVec 32)) tuple3!1332)

(assert (=> b!226686 (= lt!361405 (readByteArrayLoop!0 (_2!10533 lt!361409) (array!11346 (store (arr!5944 arr!308) i!761 (_1!10533 lt!361409)) (size!4975 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226686 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4975 (buf!5516 (_2!10533 lt!361409)))) ((_ sign_extend 32) (currentByte!10342 (_2!10533 lt!361409))) ((_ sign_extend 32) (currentBit!10337 (_2!10533 lt!361409))) lt!361406)))

(assert (=> b!226686 (= lt!361406 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!361410 () Unit!16827)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9046 BitStream!9046 (_ BitVec 64) (_ BitVec 32)) Unit!16827)

(assert (=> b!226686 (= lt!361410 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10533 lt!361409) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9046) tuple2!19448)

(assert (=> b!226686 (= lt!361409 (readByte!0 thiss!1870))))

(assert (= (and start!47600 res!190204) b!226683))

(assert (= (and b!226683 res!190201) b!226682))

(assert (= (and b!226682 res!190202) b!226686))

(assert (= (and b!226686 res!190203) b!226685))

(assert (= start!47600 b!226684))

(declare-fun m!348307 () Bool)

(assert (=> b!226686 m!348307))

(declare-fun m!348309 () Bool)

(assert (=> b!226686 m!348309))

(declare-fun m!348311 () Bool)

(assert (=> b!226686 m!348311))

(declare-fun m!348313 () Bool)

(assert (=> b!226686 m!348313))

(declare-fun m!348315 () Bool)

(assert (=> b!226686 m!348315))

(declare-fun m!348317 () Bool)

(assert (=> b!226686 m!348317))

(declare-fun m!348319 () Bool)

(assert (=> b!226686 m!348319))

(declare-fun m!348321 () Bool)

(assert (=> start!47600 m!348321))

(declare-fun m!348323 () Bool)

(assert (=> start!47600 m!348323))

(declare-fun m!348325 () Bool)

(assert (=> b!226683 m!348325))

(declare-fun m!348327 () Bool)

(assert (=> b!226684 m!348327))

(declare-fun m!348329 () Bool)

(assert (=> b!226685 m!348329))

(push 1)

(assert (not b!226684))

(assert (not b!226686))

(assert (not b!226685))

(assert (not b!226683))

(assert (not start!47600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

