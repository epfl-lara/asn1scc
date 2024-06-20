; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47602 () Bool)

(assert start!47602)

(declare-fun b!226697 () Bool)

(declare-fun res!190214 () Bool)

(declare-fun e!154995 () Bool)

(assert (=> b!226697 (=> (not res!190214) (not e!154995))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226697 (= res!190214 (bvslt i!761 to!496))))

(declare-fun lt!361424 () (_ BitVec 64))

(declare-fun e!154996 () Bool)

(declare-datatypes ((array!11347 0))(
  ( (array!11348 (arr!5945 (Array (_ BitVec 32) (_ BitVec 8))) (size!4976 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9048 0))(
  ( (BitStream!9049 (buf!5517 array!11347) (currentByte!10343 (_ BitVec 32)) (currentBit!10338 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16829 0))(
  ( (Unit!16830) )
))
(declare-datatypes ((tuple3!1334 0))(
  ( (tuple3!1335 (_1!10534 Unit!16829) (_2!10534 BitStream!9048) (_3!809 array!11347)) )
))
(declare-fun lt!361425 () tuple3!1334)

(declare-fun lt!361428 () (_ BitVec 32))

(declare-fun b!226698 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226698 (= e!154996 (= (bvadd lt!361424 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!361428))) (bitIndex!0 (size!4976 (buf!5517 (_2!10534 lt!361425))) (currentByte!10343 (_2!10534 lt!361425)) (currentBit!10338 (_2!10534 lt!361425)))))))

(declare-fun b!226699 () Bool)

(declare-fun res!190213 () Bool)

(assert (=> b!226699 (=> (not res!190213) (not e!154995))))

(declare-fun thiss!1870 () BitStream!9048)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226699 (= res!190213 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4976 (buf!5517 thiss!1870))) ((_ sign_extend 32) (currentByte!10343 thiss!1870)) ((_ sign_extend 32) (currentBit!10338 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226700 () Bool)

(assert (=> b!226700 (= e!154995 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(assert (=> b!226700 e!154996))

(declare-fun res!190215 () Bool)

(assert (=> b!226700 (=> (not res!190215) (not e!154996))))

(declare-fun lt!361423 () (_ BitVec 64))

(assert (=> b!226700 (= res!190215 (= lt!361424 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!361423)))))

(declare-datatypes ((tuple2!19450 0))(
  ( (tuple2!19451 (_1!10535 (_ BitVec 8)) (_2!10535 BitStream!9048)) )
))
(declare-fun lt!361426 () tuple2!19450)

(assert (=> b!226700 (= lt!361424 (bitIndex!0 (size!4976 (buf!5517 (_2!10535 lt!361426))) (currentByte!10343 (_2!10535 lt!361426)) (currentBit!10338 (_2!10535 lt!361426))))))

(assert (=> b!226700 (= lt!361423 (bitIndex!0 (size!4976 (buf!5517 thiss!1870)) (currentByte!10343 thiss!1870) (currentBit!10338 thiss!1870)))))

(declare-fun arr!308 () array!11347)

(declare-fun readByteArrayLoop!0 (BitStream!9048 array!11347 (_ BitVec 32) (_ BitVec 32)) tuple3!1334)

(assert (=> b!226700 (= lt!361425 (readByteArrayLoop!0 (_2!10535 lt!361426) (array!11348 (store (arr!5945 arr!308) i!761 (_1!10535 lt!361426)) (size!4976 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226700 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4976 (buf!5517 (_2!10535 lt!361426)))) ((_ sign_extend 32) (currentByte!10343 (_2!10535 lt!361426))) ((_ sign_extend 32) (currentBit!10338 (_2!10535 lt!361426))) lt!361428)))

(assert (=> b!226700 (= lt!361428 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!361427 () Unit!16829)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9048 BitStream!9048 (_ BitVec 64) (_ BitVec 32)) Unit!16829)

(assert (=> b!226700 (= lt!361427 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10535 lt!361426) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9048) tuple2!19450)

(assert (=> b!226700 (= lt!361426 (readByte!0 thiss!1870))))

(declare-fun b!226701 () Bool)

(declare-fun e!154997 () Bool)

(declare-fun array_inv!4717 (array!11347) Bool)

(assert (=> b!226701 (= e!154997 (array_inv!4717 (buf!5517 thiss!1870)))))

(declare-fun res!190216 () Bool)

(assert (=> start!47602 (=> (not res!190216) (not e!154995))))

(assert (=> start!47602 (= res!190216 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4976 arr!308))))))

(assert (=> start!47602 e!154995))

(assert (=> start!47602 true))

(assert (=> start!47602 (array_inv!4717 arr!308)))

(declare-fun inv!12 (BitStream!9048) Bool)

(assert (=> start!47602 (and (inv!12 thiss!1870) e!154997)))

(assert (= (and start!47602 res!190216) b!226699))

(assert (= (and b!226699 res!190213) b!226697))

(assert (= (and b!226697 res!190214) b!226700))

(assert (= (and b!226700 res!190215) b!226698))

(assert (= start!47602 b!226701))

(declare-fun m!348331 () Bool)

(assert (=> b!226698 m!348331))

(declare-fun m!348333 () Bool)

(assert (=> b!226701 m!348333))

(declare-fun m!348335 () Bool)

(assert (=> b!226700 m!348335))

(declare-fun m!348337 () Bool)

(assert (=> b!226700 m!348337))

(declare-fun m!348339 () Bool)

(assert (=> b!226700 m!348339))

(declare-fun m!348341 () Bool)

(assert (=> b!226700 m!348341))

(declare-fun m!348343 () Bool)

(assert (=> b!226700 m!348343))

(declare-fun m!348345 () Bool)

(assert (=> b!226700 m!348345))

(declare-fun m!348347 () Bool)

(assert (=> b!226700 m!348347))

(declare-fun m!348349 () Bool)

(assert (=> start!47602 m!348349))

(declare-fun m!348351 () Bool)

(assert (=> start!47602 m!348351))

(declare-fun m!348353 () Bool)

(assert (=> b!226699 m!348353))

(check-sat (not start!47602) (not b!226700) (not b!226698) (not b!226701) (not b!226699))
(check-sat)
