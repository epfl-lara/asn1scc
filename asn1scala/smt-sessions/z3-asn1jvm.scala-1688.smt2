; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46924 () Bool)

(assert start!46924)

(declare-fun b!224731 () Bool)

(declare-fun e!153203 () Bool)

(assert (=> b!224731 (= e!153203 (not true))))

(declare-datatypes ((array!11102 0))(
  ( (array!11103 (arr!5825 (Array (_ BitVec 32) (_ BitVec 8))) (size!4871 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8844 0))(
  ( (BitStream!8845 (buf!5415 array!11102) (currentByte!10161 (_ BitVec 32)) (currentBit!10156 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19252 0))(
  ( (tuple2!19253 (_1!10402 (_ BitVec 8)) (_2!10402 BitStream!8844)) )
))
(declare-fun lt!357430 () tuple2!19252)

(declare-datatypes ((Unit!16466 0))(
  ( (Unit!16467) )
))
(declare-datatypes ((tuple3!1268 0))(
  ( (tuple3!1269 (_1!10403 Unit!16466) (_2!10403 BitStream!8844) (_3!776 array!11102)) )
))
(declare-fun lt!357423 () tuple3!1268)

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!224731 (and (= (_1!10402 lt!357430) (select (arr!5825 (_3!776 lt!357423)) i!761)) (= (select (arr!5825 (_3!776 lt!357423)) i!761) (_1!10402 lt!357430)))))

(declare-fun lt!357431 () array!11102)

(declare-fun lt!357426 () Unit!16466)

(declare-fun arrayRangesEqImpliesEq!89 (array!11102 array!11102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16466)

(assert (=> b!224731 (= lt!357426 (arrayRangesEqImpliesEq!89 lt!357431 (_3!776 lt!357423) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11102)

(declare-fun arrayRangesEq!767 (array!11102 array!11102 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224731 (arrayRangesEq!767 arr!308 (_3!776 lt!357423) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357429 () Unit!16466)

(declare-fun arrayRangesEqTransitive!238 (array!11102 array!11102 array!11102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16466)

(assert (=> b!224731 (= lt!357429 (arrayRangesEqTransitive!238 arr!308 lt!357431 (_3!776 lt!357423) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224731 (arrayRangesEq!767 arr!308 lt!357431 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357428 () Unit!16466)

(declare-fun arrayUpdatedAtPrefixLemma!359 (array!11102 (_ BitVec 32) (_ BitVec 8)) Unit!16466)

(assert (=> b!224731 (= lt!357428 (arrayUpdatedAtPrefixLemma!359 arr!308 i!761 (_1!10402 lt!357430)))))

(declare-fun lt!357425 () (_ BitVec 64))

(declare-fun lt!357422 () (_ BitVec 32))

(declare-fun lt!357427 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8844)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!357432 () (_ BitVec 64))

(assert (=> b!224731 (and (= (bvadd lt!357427 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357422))) lt!357432) (= (bvadd lt!357425 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357432) (= (buf!5415 thiss!1870) (buf!5415 (_2!10403 lt!357423))) (= (size!4871 arr!308) (size!4871 (_3!776 lt!357423))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224731 (= lt!357432 (bitIndex!0 (size!4871 (buf!5415 (_2!10403 lt!357423))) (currentByte!10161 (_2!10403 lt!357423)) (currentBit!10156 (_2!10403 lt!357423))))))

(assert (=> b!224731 (= lt!357427 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357425))))

(assert (=> b!224731 (= lt!357427 (bitIndex!0 (size!4871 (buf!5415 (_2!10402 lt!357430))) (currentByte!10161 (_2!10402 lt!357430)) (currentBit!10156 (_2!10402 lt!357430))))))

(assert (=> b!224731 (= lt!357425 (bitIndex!0 (size!4871 (buf!5415 thiss!1870)) (currentByte!10161 thiss!1870) (currentBit!10156 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8844 array!11102 (_ BitVec 32) (_ BitVec 32)) tuple3!1268)

(assert (=> b!224731 (= lt!357423 (readByteArrayLoop!0 (_2!10402 lt!357430) lt!357431 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224731 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4871 (buf!5415 (_2!10402 lt!357430)))) ((_ sign_extend 32) (currentByte!10161 (_2!10402 lt!357430))) ((_ sign_extend 32) (currentBit!10156 (_2!10402 lt!357430))) lt!357422)))

(assert (=> b!224731 (= lt!357422 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357424 () Unit!16466)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8844 BitStream!8844 (_ BitVec 64) (_ BitVec 32)) Unit!16466)

(assert (=> b!224731 (= lt!357424 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10402 lt!357430) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224731 (= lt!357431 (array!11103 (store (arr!5825 arr!308) i!761 (_1!10402 lt!357430)) (size!4871 arr!308)))))

(declare-fun readByte!0 (BitStream!8844) tuple2!19252)

(assert (=> b!224731 (= lt!357430 (readByte!0 thiss!1870))))

(declare-fun b!224729 () Bool)

(declare-fun res!188618 () Bool)

(assert (=> b!224729 (=> (not res!188618) (not e!153203))))

(assert (=> b!224729 (= res!188618 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4871 (buf!5415 thiss!1870))) ((_ sign_extend 32) (currentByte!10161 thiss!1870)) ((_ sign_extend 32) (currentBit!10156 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224730 () Bool)

(declare-fun res!188617 () Bool)

(assert (=> b!224730 (=> (not res!188617) (not e!153203))))

(assert (=> b!224730 (= res!188617 (bvslt i!761 to!496))))

(declare-fun b!224732 () Bool)

(declare-fun e!153205 () Bool)

(declare-fun array_inv!4612 (array!11102) Bool)

(assert (=> b!224732 (= e!153205 (array_inv!4612 (buf!5415 thiss!1870)))))

(declare-fun res!188619 () Bool)

(assert (=> start!46924 (=> (not res!188619) (not e!153203))))

(assert (=> start!46924 (= res!188619 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4871 arr!308))))))

(assert (=> start!46924 e!153203))

(assert (=> start!46924 true))

(assert (=> start!46924 (array_inv!4612 arr!308)))

(declare-fun inv!12 (BitStream!8844) Bool)

(assert (=> start!46924 (and (inv!12 thiss!1870) e!153205)))

(assert (= (and start!46924 res!188619) b!224729))

(assert (= (and b!224729 res!188618) b!224730))

(assert (= (and b!224730 res!188617) b!224731))

(assert (= start!46924 b!224732))

(declare-fun m!345239 () Bool)

(assert (=> b!224731 m!345239))

(declare-fun m!345241 () Bool)

(assert (=> b!224731 m!345241))

(declare-fun m!345243 () Bool)

(assert (=> b!224731 m!345243))

(declare-fun m!345245 () Bool)

(assert (=> b!224731 m!345245))

(declare-fun m!345247 () Bool)

(assert (=> b!224731 m!345247))

(declare-fun m!345249 () Bool)

(assert (=> b!224731 m!345249))

(declare-fun m!345251 () Bool)

(assert (=> b!224731 m!345251))

(declare-fun m!345253 () Bool)

(assert (=> b!224731 m!345253))

(declare-fun m!345255 () Bool)

(assert (=> b!224731 m!345255))

(declare-fun m!345257 () Bool)

(assert (=> b!224731 m!345257))

(declare-fun m!345259 () Bool)

(assert (=> b!224731 m!345259))

(declare-fun m!345261 () Bool)

(assert (=> b!224731 m!345261))

(declare-fun m!345263 () Bool)

(assert (=> b!224731 m!345263))

(declare-fun m!345265 () Bool)

(assert (=> b!224731 m!345265))

(declare-fun m!345267 () Bool)

(assert (=> b!224729 m!345267))

(declare-fun m!345269 () Bool)

(assert (=> b!224732 m!345269))

(declare-fun m!345271 () Bool)

(assert (=> start!46924 m!345271))

(declare-fun m!345273 () Bool)

(assert (=> start!46924 m!345273))

(check-sat (not b!224731) (not b!224732) (not b!224729) (not start!46924))
