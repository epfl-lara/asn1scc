; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47836 () Bool)

(assert start!47836)

(declare-fun b!227646 () Bool)

(declare-fun e!155842 () Bool)

(declare-datatypes ((array!11452 0))(
  ( (array!11453 (arr!6002 (Array (_ BitVec 32) (_ BitVec 8))) (size!5024 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9144 0))(
  ( (BitStream!9145 (buf!5565 array!11452) (currentByte!10409 (_ BitVec 32)) (currentBit!10404 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9144)

(declare-fun array_inv!4765 (array!11452) Bool)

(assert (=> b!227646 (= e!155842 (array_inv!4765 (buf!5565 thiss!1870)))))

(declare-fun res!190970 () Bool)

(declare-fun e!155845 () Bool)

(assert (=> start!47836 (=> (not res!190970) (not e!155845))))

(declare-fun arr!308 () array!11452)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47836 (= res!190970 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5024 arr!308))))))

(assert (=> start!47836 e!155845))

(assert (=> start!47836 true))

(assert (=> start!47836 (array_inv!4765 arr!308)))

(declare-fun inv!12 (BitStream!9144) Bool)

(assert (=> start!47836 (and (inv!12 thiss!1870) e!155842)))

(declare-fun b!227643 () Bool)

(declare-fun res!190972 () Bool)

(assert (=> b!227643 (=> (not res!190972) (not e!155845))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227643 (= res!190972 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5024 (buf!5565 thiss!1870))) ((_ sign_extend 32) (currentByte!10409 thiss!1870)) ((_ sign_extend 32) (currentBit!10404 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227644 () Bool)

(declare-fun res!190971 () Bool)

(assert (=> b!227644 (=> (not res!190971) (not e!155845))))

(assert (=> b!227644 (= res!190971 (bvslt i!761 to!496))))

(declare-fun b!227645 () Bool)

(assert (=> b!227645 (= e!155845 (not (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (size!5024 arr!308)))))))

(declare-datatypes ((Unit!17022 0))(
  ( (Unit!17023) )
))
(declare-datatypes ((tuple3!1430 0))(
  ( (tuple3!1431 (_1!10648 Unit!17022) (_2!10648 BitStream!9144) (_3!857 array!11452)) )
))
(declare-fun lt!364192 () tuple3!1430)

(declare-fun arrayRangesEq!860 (array!11452 array!11452 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227645 (arrayRangesEq!860 arr!308 (_3!857 lt!364192) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364197 () array!11452)

(declare-fun lt!364191 () Unit!17022)

(declare-fun arrayRangesEqTransitive!283 (array!11452 array!11452 array!11452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17022)

(assert (=> b!227645 (= lt!364191 (arrayRangesEqTransitive!283 arr!308 lt!364197 (_3!857 lt!364192) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227645 (arrayRangesEq!860 arr!308 lt!364197 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19582 0))(
  ( (tuple2!19583 (_1!10649 (_ BitVec 8)) (_2!10649 BitStream!9144)) )
))
(declare-fun lt!364189 () tuple2!19582)

(declare-fun lt!364193 () Unit!17022)

(declare-fun arrayUpdatedAtPrefixLemma!419 (array!11452 (_ BitVec 32) (_ BitVec 8)) Unit!17022)

(assert (=> b!227645 (= lt!364193 (arrayUpdatedAtPrefixLemma!419 arr!308 i!761 (_1!10649 lt!364189)))))

(declare-fun lt!364188 () (_ BitVec 64))

(declare-fun lt!364190 () (_ BitVec 64))

(declare-fun lt!364194 () (_ BitVec 32))

(declare-fun lt!364196 () (_ BitVec 64))

(assert (=> b!227645 (and (= (bvadd lt!364188 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364194))) lt!364190) (= (bvadd lt!364196 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364190) (= (buf!5565 thiss!1870) (buf!5565 (_2!10648 lt!364192))) (= (size!5024 arr!308) (size!5024 (_3!857 lt!364192))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227645 (= lt!364190 (bitIndex!0 (size!5024 (buf!5565 (_2!10648 lt!364192))) (currentByte!10409 (_2!10648 lt!364192)) (currentBit!10404 (_2!10648 lt!364192))))))

(assert (=> b!227645 (= lt!364188 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364196))))

(assert (=> b!227645 (= lt!364188 (bitIndex!0 (size!5024 (buf!5565 (_2!10649 lt!364189))) (currentByte!10409 (_2!10649 lt!364189)) (currentBit!10404 (_2!10649 lt!364189))))))

(assert (=> b!227645 (= lt!364196 (bitIndex!0 (size!5024 (buf!5565 thiss!1870)) (currentByte!10409 thiss!1870) (currentBit!10404 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9144 array!11452 (_ BitVec 32) (_ BitVec 32)) tuple3!1430)

(assert (=> b!227645 (= lt!364192 (readByteArrayLoop!0 (_2!10649 lt!364189) lt!364197 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227645 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5024 (buf!5565 (_2!10649 lt!364189)))) ((_ sign_extend 32) (currentByte!10409 (_2!10649 lt!364189))) ((_ sign_extend 32) (currentBit!10404 (_2!10649 lt!364189))) lt!364194)))

(assert (=> b!227645 (= lt!364194 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364195 () Unit!17022)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9144 BitStream!9144 (_ BitVec 64) (_ BitVec 32)) Unit!17022)

(assert (=> b!227645 (= lt!364195 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10649 lt!364189) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227645 (= lt!364197 (array!11453 (store (arr!6002 arr!308) i!761 (_1!10649 lt!364189)) (size!5024 arr!308)))))

(declare-fun readByte!0 (BitStream!9144) tuple2!19582)

(assert (=> b!227645 (= lt!364189 (readByte!0 thiss!1870))))

(assert (= (and start!47836 res!190970) b!227643))

(assert (= (and b!227643 res!190972) b!227644))

(assert (= (and b!227644 res!190971) b!227645))

(assert (= start!47836 b!227646))

(declare-fun m!350301 () Bool)

(assert (=> b!227646 m!350301))

(declare-fun m!350303 () Bool)

(assert (=> start!47836 m!350303))

(declare-fun m!350305 () Bool)

(assert (=> start!47836 m!350305))

(declare-fun m!350307 () Bool)

(assert (=> b!227643 m!350307))

(declare-fun m!350309 () Bool)

(assert (=> b!227645 m!350309))

(declare-fun m!350311 () Bool)

(assert (=> b!227645 m!350311))

(declare-fun m!350313 () Bool)

(assert (=> b!227645 m!350313))

(declare-fun m!350315 () Bool)

(assert (=> b!227645 m!350315))

(declare-fun m!350317 () Bool)

(assert (=> b!227645 m!350317))

(declare-fun m!350319 () Bool)

(assert (=> b!227645 m!350319))

(declare-fun m!350321 () Bool)

(assert (=> b!227645 m!350321))

(declare-fun m!350323 () Bool)

(assert (=> b!227645 m!350323))

(declare-fun m!350325 () Bool)

(assert (=> b!227645 m!350325))

(declare-fun m!350327 () Bool)

(assert (=> b!227645 m!350327))

(declare-fun m!350329 () Bool)

(assert (=> b!227645 m!350329))

(declare-fun m!350331 () Bool)

(assert (=> b!227645 m!350331))

(check-sat (not start!47836) (not b!227643) (not b!227645) (not b!227646))
(check-sat)
