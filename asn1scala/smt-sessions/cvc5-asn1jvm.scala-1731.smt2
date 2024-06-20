; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47732 () Bool)

(assert start!47732)

(declare-fun b!227199 () Bool)

(declare-fun res!190618 () Bool)

(declare-fun e!155434 () Bool)

(assert (=> b!227199 (=> (not res!190618) (not e!155434))))

(declare-datatypes ((array!11399 0))(
  ( (array!11400 (arr!5974 (Array (_ BitVec 32) (_ BitVec 8))) (size!4999 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9094 0))(
  ( (BitStream!9095 (buf!5540 array!11399) (currentByte!10378 (_ BitVec 32)) (currentBit!10373 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9094)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227199 (= res!190618 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4999 (buf!5540 thiss!1870))) ((_ sign_extend 32) (currentByte!10378 thiss!1870)) ((_ sign_extend 32) (currentBit!10373 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227201 () Bool)

(assert (=> b!227201 (= e!155434 (not true))))

(declare-fun arr!308 () array!11399)

(declare-fun lt!362961 () array!11399)

(declare-fun arrayRangesEq!835 (array!11399 array!11399 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227201 (arrayRangesEq!835 arr!308 lt!362961 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16941 0))(
  ( (Unit!16942) )
))
(declare-fun lt!362965 () Unit!16941)

(declare-datatypes ((tuple2!19520 0))(
  ( (tuple2!19521 (_1!10592 (_ BitVec 8)) (_2!10592 BitStream!9094)) )
))
(declare-fun lt!362959 () tuple2!19520)

(declare-fun arrayUpdatedAtPrefixLemma!394 (array!11399 (_ BitVec 32) (_ BitVec 8)) Unit!16941)

(assert (=> b!227201 (= lt!362965 (arrayUpdatedAtPrefixLemma!394 arr!308 i!761 (_1!10592 lt!362959)))))

(declare-fun lt!362963 () (_ BitVec 64))

(declare-datatypes ((tuple3!1380 0))(
  ( (tuple3!1381 (_1!10593 Unit!16941) (_2!10593 BitStream!9094) (_3!832 array!11399)) )
))
(declare-fun lt!362966 () tuple3!1380)

(declare-fun lt!362960 () (_ BitVec 64))

(declare-fun lt!362964 () (_ BitVec 32))

(declare-fun lt!362967 () (_ BitVec 64))

(assert (=> b!227201 (and (= (bvadd lt!362967 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362964))) lt!362960) (= (bvadd lt!362963 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362960) (= (buf!5540 thiss!1870) (buf!5540 (_2!10593 lt!362966))) (= (size!4999 arr!308) (size!4999 (_3!832 lt!362966))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227201 (= lt!362960 (bitIndex!0 (size!4999 (buf!5540 (_2!10593 lt!362966))) (currentByte!10378 (_2!10593 lt!362966)) (currentBit!10373 (_2!10593 lt!362966))))))

(assert (=> b!227201 (= lt!362967 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362963))))

(assert (=> b!227201 (= lt!362967 (bitIndex!0 (size!4999 (buf!5540 (_2!10592 lt!362959))) (currentByte!10378 (_2!10592 lt!362959)) (currentBit!10373 (_2!10592 lt!362959))))))

(assert (=> b!227201 (= lt!362963 (bitIndex!0 (size!4999 (buf!5540 thiss!1870)) (currentByte!10378 thiss!1870) (currentBit!10373 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9094 array!11399 (_ BitVec 32) (_ BitVec 32)) tuple3!1380)

(assert (=> b!227201 (= lt!362966 (readByteArrayLoop!0 (_2!10592 lt!362959) lt!362961 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227201 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4999 (buf!5540 (_2!10592 lt!362959)))) ((_ sign_extend 32) (currentByte!10378 (_2!10592 lt!362959))) ((_ sign_extend 32) (currentBit!10373 (_2!10592 lt!362959))) lt!362964)))

(assert (=> b!227201 (= lt!362964 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362962 () Unit!16941)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9094 BitStream!9094 (_ BitVec 64) (_ BitVec 32)) Unit!16941)

(assert (=> b!227201 (= lt!362962 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10592 lt!362959) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227201 (= lt!362961 (array!11400 (store (arr!5974 arr!308) i!761 (_1!10592 lt!362959)) (size!4999 arr!308)))))

(declare-fun readByte!0 (BitStream!9094) tuple2!19520)

(assert (=> b!227201 (= lt!362959 (readByte!0 thiss!1870))))

(declare-fun res!190617 () Bool)

(assert (=> start!47732 (=> (not res!190617) (not e!155434))))

(assert (=> start!47732 (= res!190617 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4999 arr!308))))))

(assert (=> start!47732 e!155434))

(assert (=> start!47732 true))

(declare-fun array_inv!4740 (array!11399) Bool)

(assert (=> start!47732 (array_inv!4740 arr!308)))

(declare-fun e!155431 () Bool)

(declare-fun inv!12 (BitStream!9094) Bool)

(assert (=> start!47732 (and (inv!12 thiss!1870) e!155431)))

(declare-fun b!227200 () Bool)

(declare-fun res!190616 () Bool)

(assert (=> b!227200 (=> (not res!190616) (not e!155434))))

(assert (=> b!227200 (= res!190616 (bvslt i!761 to!496))))

(declare-fun b!227202 () Bool)

(assert (=> b!227202 (= e!155431 (array_inv!4740 (buf!5540 thiss!1870)))))

(assert (= (and start!47732 res!190617) b!227199))

(assert (= (and b!227199 res!190618) b!227200))

(assert (= (and b!227200 res!190616) b!227201))

(assert (= start!47732 b!227202))

(declare-fun m!349303 () Bool)

(assert (=> b!227199 m!349303))

(declare-fun m!349305 () Bool)

(assert (=> b!227201 m!349305))

(declare-fun m!349307 () Bool)

(assert (=> b!227201 m!349307))

(declare-fun m!349309 () Bool)

(assert (=> b!227201 m!349309))

(declare-fun m!349311 () Bool)

(assert (=> b!227201 m!349311))

(declare-fun m!349313 () Bool)

(assert (=> b!227201 m!349313))

(declare-fun m!349315 () Bool)

(assert (=> b!227201 m!349315))

(declare-fun m!349317 () Bool)

(assert (=> b!227201 m!349317))

(declare-fun m!349319 () Bool)

(assert (=> b!227201 m!349319))

(declare-fun m!349321 () Bool)

(assert (=> b!227201 m!349321))

(declare-fun m!349323 () Bool)

(assert (=> b!227201 m!349323))

(declare-fun m!349325 () Bool)

(assert (=> start!47732 m!349325))

(declare-fun m!349327 () Bool)

(assert (=> start!47732 m!349327))

(declare-fun m!349329 () Bool)

(assert (=> b!227202 m!349329))

(push 1)

(assert (not b!227201))

(assert (not start!47732))

(assert (not b!227199))

(assert (not b!227202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

