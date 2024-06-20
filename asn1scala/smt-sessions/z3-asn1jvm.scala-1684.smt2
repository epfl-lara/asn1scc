; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46756 () Bool)

(assert start!46756)

(declare-fun res!188271 () Bool)

(declare-fun e!152857 () Bool)

(assert (=> start!46756 (=> (not res!188271) (not e!152857))))

(declare-datatypes ((array!11072 0))(
  ( (array!11073 (arr!5807 (Array (_ BitVec 32) (_ BitVec 8))) (size!4859 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11072)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46756 (= res!188271 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4859 arr!308))))))

(assert (=> start!46756 e!152857))

(assert (=> start!46756 true))

(declare-fun array_inv!4600 (array!11072) Bool)

(assert (=> start!46756 (array_inv!4600 arr!308)))

(declare-datatypes ((BitStream!8820 0))(
  ( (BitStream!8821 (buf!5403 array!11072) (currentByte!10131 (_ BitVec 32)) (currentBit!10126 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8820)

(declare-fun e!152856 () Bool)

(declare-fun inv!12 (BitStream!8820) Bool)

(assert (=> start!46756 (and (inv!12 thiss!1870) e!152856)))

(declare-fun b!224318 () Bool)

(assert (=> b!224318 (= e!152856 (array_inv!4600 (buf!5403 thiss!1870)))))

(declare-fun b!224317 () Bool)

(assert (=> b!224317 (= e!152857 (not true))))

(declare-datatypes ((Unit!16387 0))(
  ( (Unit!16388) )
))
(declare-datatypes ((tuple3!1244 0))(
  ( (tuple3!1245 (_1!10367 Unit!16387) (_2!10367 BitStream!8820) (_3!764 array!11072)) )
))
(declare-fun lt!355985 () tuple3!1244)

(declare-fun arrayRangesEq!755 (array!11072 array!11072 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224317 (arrayRangesEq!755 arr!308 (_3!764 lt!355985) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355979 () array!11072)

(declare-fun lt!355984 () Unit!16387)

(declare-fun arrayRangesEqTransitive!226 (array!11072 array!11072 array!11072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16387)

(assert (=> b!224317 (= lt!355984 (arrayRangesEqTransitive!226 arr!308 lt!355979 (_3!764 lt!355985) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224317 (arrayRangesEq!755 arr!308 lt!355979 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355983 () Unit!16387)

(declare-datatypes ((tuple2!19206 0))(
  ( (tuple2!19207 (_1!10368 (_ BitVec 8)) (_2!10368 BitStream!8820)) )
))
(declare-fun lt!355980 () tuple2!19206)

(declare-fun arrayUpdatedAtPrefixLemma!347 (array!11072 (_ BitVec 32) (_ BitVec 8)) Unit!16387)

(assert (=> b!224317 (= lt!355983 (arrayUpdatedAtPrefixLemma!347 arr!308 i!761 (_1!10368 lt!355980)))))

(declare-fun lt!355981 () (_ BitVec 64))

(declare-fun lt!355986 () (_ BitVec 64))

(declare-fun lt!355982 () (_ BitVec 32))

(declare-fun lt!355977 () (_ BitVec 64))

(assert (=> b!224317 (and (= (bvadd lt!355986 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355982))) lt!355977) (= (bvadd lt!355981 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355977) (= (buf!5403 thiss!1870) (buf!5403 (_2!10367 lt!355985))) (= (size!4859 arr!308) (size!4859 (_3!764 lt!355985))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224317 (= lt!355977 (bitIndex!0 (size!4859 (buf!5403 (_2!10367 lt!355985))) (currentByte!10131 (_2!10367 lt!355985)) (currentBit!10126 (_2!10367 lt!355985))))))

(assert (=> b!224317 (= lt!355986 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355981))))

(assert (=> b!224317 (= lt!355986 (bitIndex!0 (size!4859 (buf!5403 (_2!10368 lt!355980))) (currentByte!10131 (_2!10368 lt!355980)) (currentBit!10126 (_2!10368 lt!355980))))))

(assert (=> b!224317 (= lt!355981 (bitIndex!0 (size!4859 (buf!5403 thiss!1870)) (currentByte!10131 thiss!1870) (currentBit!10126 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8820 array!11072 (_ BitVec 32) (_ BitVec 32)) tuple3!1244)

(assert (=> b!224317 (= lt!355985 (readByteArrayLoop!0 (_2!10368 lt!355980) lt!355979 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224317 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4859 (buf!5403 (_2!10368 lt!355980)))) ((_ sign_extend 32) (currentByte!10131 (_2!10368 lt!355980))) ((_ sign_extend 32) (currentBit!10126 (_2!10368 lt!355980))) lt!355982)))

(assert (=> b!224317 (= lt!355982 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355978 () Unit!16387)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8820 BitStream!8820 (_ BitVec 64) (_ BitVec 32)) Unit!16387)

(assert (=> b!224317 (= lt!355978 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10368 lt!355980) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224317 (= lt!355979 (array!11073 (store (arr!5807 arr!308) i!761 (_1!10368 lt!355980)) (size!4859 arr!308)))))

(declare-fun readByte!0 (BitStream!8820) tuple2!19206)

(assert (=> b!224317 (= lt!355980 (readByte!0 thiss!1870))))

(declare-fun b!224315 () Bool)

(declare-fun res!188269 () Bool)

(assert (=> b!224315 (=> (not res!188269) (not e!152857))))

(assert (=> b!224315 (= res!188269 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4859 (buf!5403 thiss!1870))) ((_ sign_extend 32) (currentByte!10131 thiss!1870)) ((_ sign_extend 32) (currentBit!10126 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224316 () Bool)

(declare-fun res!188270 () Bool)

(assert (=> b!224316 (=> (not res!188270) (not e!152857))))

(assert (=> b!224316 (= res!188270 (bvslt i!761 to!496))))

(assert (= (and start!46756 res!188271) b!224315))

(assert (= (and b!224315 res!188269) b!224316))

(assert (= (and b!224316 res!188270) b!224317))

(assert (= start!46756 b!224318))

(declare-fun m!344311 () Bool)

(assert (=> start!46756 m!344311))

(declare-fun m!344313 () Bool)

(assert (=> start!46756 m!344313))

(declare-fun m!344315 () Bool)

(assert (=> b!224318 m!344315))

(declare-fun m!344317 () Bool)

(assert (=> b!224317 m!344317))

(declare-fun m!344319 () Bool)

(assert (=> b!224317 m!344319))

(declare-fun m!344321 () Bool)

(assert (=> b!224317 m!344321))

(declare-fun m!344323 () Bool)

(assert (=> b!224317 m!344323))

(declare-fun m!344325 () Bool)

(assert (=> b!224317 m!344325))

(declare-fun m!344327 () Bool)

(assert (=> b!224317 m!344327))

(declare-fun m!344329 () Bool)

(assert (=> b!224317 m!344329))

(declare-fun m!344331 () Bool)

(assert (=> b!224317 m!344331))

(declare-fun m!344333 () Bool)

(assert (=> b!224317 m!344333))

(declare-fun m!344335 () Bool)

(assert (=> b!224317 m!344335))

(declare-fun m!344337 () Bool)

(assert (=> b!224317 m!344337))

(declare-fun m!344339 () Bool)

(assert (=> b!224317 m!344339))

(declare-fun m!344341 () Bool)

(assert (=> b!224315 m!344341))

(check-sat (not b!224318) (not b!224317) (not b!224315) (not start!46756))
