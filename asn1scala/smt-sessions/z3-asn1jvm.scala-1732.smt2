; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47740 () Bool)

(assert start!47740)

(declare-fun b!227248 () Bool)

(declare-fun res!190652 () Bool)

(declare-fun e!155481 () Bool)

(assert (=> b!227248 (=> (not res!190652) (not e!155481))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227248 (= res!190652 (bvslt i!761 to!496))))

(declare-fun b!227249 () Bool)

(declare-datatypes ((array!11407 0))(
  ( (array!11408 (arr!5978 (Array (_ BitVec 32) (_ BitVec 8))) (size!5003 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11407)

(assert (=> b!227249 (= e!155481 (not (or (bvsgt i!761 (bvadd #b00000000000000000000000000000001 i!761)) (and (bvsle i!761 (size!5003 arr!308)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (size!5003 arr!308))))))))

(declare-fun lt!363068 () array!11407)

(declare-fun arrayRangesEq!839 (array!11407 array!11407 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227249 (arrayRangesEq!839 arr!308 lt!363068 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16949 0))(
  ( (Unit!16950) )
))
(declare-fun lt!363072 () Unit!16949)

(declare-datatypes ((BitStream!9102 0))(
  ( (BitStream!9103 (buf!5544 array!11407) (currentByte!10382 (_ BitVec 32)) (currentBit!10377 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19528 0))(
  ( (tuple2!19529 (_1!10600 (_ BitVec 8)) (_2!10600 BitStream!9102)) )
))
(declare-fun lt!363073 () tuple2!19528)

(declare-fun arrayUpdatedAtPrefixLemma!398 (array!11407 (_ BitVec 32) (_ BitVec 8)) Unit!16949)

(assert (=> b!227249 (= lt!363072 (arrayUpdatedAtPrefixLemma!398 arr!308 i!761 (_1!10600 lt!363073)))))

(declare-fun lt!363070 () (_ BitVec 64))

(declare-fun lt!363075 () (_ BitVec 64))

(declare-fun lt!363071 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!9102)

(declare-datatypes ((tuple3!1388 0))(
  ( (tuple3!1389 (_1!10601 Unit!16949) (_2!10601 BitStream!9102) (_3!836 array!11407)) )
))
(declare-fun lt!363069 () tuple3!1388)

(declare-fun lt!363074 () (_ BitVec 32))

(assert (=> b!227249 (and (= (bvadd lt!363075 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363074))) lt!363071) (= (bvadd lt!363070 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363071) (= (buf!5544 thiss!1870) (buf!5544 (_2!10601 lt!363069))) (= (size!5003 arr!308) (size!5003 (_3!836 lt!363069))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227249 (= lt!363071 (bitIndex!0 (size!5003 (buf!5544 (_2!10601 lt!363069))) (currentByte!10382 (_2!10601 lt!363069)) (currentBit!10377 (_2!10601 lt!363069))))))

(assert (=> b!227249 (= lt!363075 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363070))))

(assert (=> b!227249 (= lt!363075 (bitIndex!0 (size!5003 (buf!5544 (_2!10600 lt!363073))) (currentByte!10382 (_2!10600 lt!363073)) (currentBit!10377 (_2!10600 lt!363073))))))

(assert (=> b!227249 (= lt!363070 (bitIndex!0 (size!5003 (buf!5544 thiss!1870)) (currentByte!10382 thiss!1870) (currentBit!10377 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9102 array!11407 (_ BitVec 32) (_ BitVec 32)) tuple3!1388)

(assert (=> b!227249 (= lt!363069 (readByteArrayLoop!0 (_2!10600 lt!363073) lt!363068 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227249 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5003 (buf!5544 (_2!10600 lt!363073)))) ((_ sign_extend 32) (currentByte!10382 (_2!10600 lt!363073))) ((_ sign_extend 32) (currentBit!10377 (_2!10600 lt!363073))) lt!363074)))

(assert (=> b!227249 (= lt!363074 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363067 () Unit!16949)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9102 BitStream!9102 (_ BitVec 64) (_ BitVec 32)) Unit!16949)

(assert (=> b!227249 (= lt!363067 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10600 lt!363073) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227249 (= lt!363068 (array!11408 (store (arr!5978 arr!308) i!761 (_1!10600 lt!363073)) (size!5003 arr!308)))))

(declare-fun readByte!0 (BitStream!9102) tuple2!19528)

(assert (=> b!227249 (= lt!363073 (readByte!0 thiss!1870))))

(declare-fun res!190653 () Bool)

(assert (=> start!47740 (=> (not res!190653) (not e!155481))))

(assert (=> start!47740 (= res!190653 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5003 arr!308))))))

(assert (=> start!47740 e!155481))

(assert (=> start!47740 true))

(declare-fun array_inv!4744 (array!11407) Bool)

(assert (=> start!47740 (array_inv!4744 arr!308)))

(declare-fun e!155479 () Bool)

(declare-fun inv!12 (BitStream!9102) Bool)

(assert (=> start!47740 (and (inv!12 thiss!1870) e!155479)))

(declare-fun b!227250 () Bool)

(assert (=> b!227250 (= e!155479 (array_inv!4744 (buf!5544 thiss!1870)))))

(declare-fun b!227247 () Bool)

(declare-fun res!190654 () Bool)

(assert (=> b!227247 (=> (not res!190654) (not e!155481))))

(assert (=> b!227247 (= res!190654 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5003 (buf!5544 thiss!1870))) ((_ sign_extend 32) (currentByte!10382 thiss!1870)) ((_ sign_extend 32) (currentBit!10377 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47740 res!190653) b!227247))

(assert (= (and b!227247 res!190654) b!227248))

(assert (= (and b!227248 res!190652) b!227249))

(assert (= start!47740 b!227250))

(declare-fun m!349415 () Bool)

(assert (=> b!227249 m!349415))

(declare-fun m!349417 () Bool)

(assert (=> b!227249 m!349417))

(declare-fun m!349419 () Bool)

(assert (=> b!227249 m!349419))

(declare-fun m!349421 () Bool)

(assert (=> b!227249 m!349421))

(declare-fun m!349423 () Bool)

(assert (=> b!227249 m!349423))

(declare-fun m!349425 () Bool)

(assert (=> b!227249 m!349425))

(declare-fun m!349427 () Bool)

(assert (=> b!227249 m!349427))

(declare-fun m!349429 () Bool)

(assert (=> b!227249 m!349429))

(declare-fun m!349431 () Bool)

(assert (=> b!227249 m!349431))

(declare-fun m!349433 () Bool)

(assert (=> b!227249 m!349433))

(declare-fun m!349435 () Bool)

(assert (=> start!47740 m!349435))

(declare-fun m!349437 () Bool)

(assert (=> start!47740 m!349437))

(declare-fun m!349439 () Bool)

(assert (=> b!227250 m!349439))

(declare-fun m!349441 () Bool)

(assert (=> b!227247 m!349441))

(check-sat (not b!227247) (not b!227250) (not start!47740) (not b!227249))
(check-sat)
