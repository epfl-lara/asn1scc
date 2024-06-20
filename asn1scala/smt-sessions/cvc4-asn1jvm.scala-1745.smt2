; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47934 () Bool)

(assert start!47934)

(declare-fun b!228021 () Bool)

(declare-fun res!191277 () Bool)

(declare-fun e!156187 () Bool)

(assert (=> b!228021 (=> (not res!191277) (not e!156187))))

(declare-datatypes ((array!11493 0))(
  ( (array!11494 (arr!6024 (Array (_ BitVec 32) (_ BitVec 8))) (size!5043 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9182 0))(
  ( (BitStream!9183 (buf!5584 array!11493) (currentByte!10434 (_ BitVec 32)) (currentBit!10429 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9182)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228021 (= res!191277 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5043 (buf!5584 thiss!1870))) ((_ sign_extend 32) (currentByte!10434 thiss!1870)) ((_ sign_extend 32) (currentBit!10429 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228023 () Bool)

(declare-fun lt!365329 () (_ BitVec 64))

(assert (=> b!228023 (= e!156187 (not (or (= lt!365329 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!365329) lt!365329)))))))

(declare-datatypes ((tuple2!19632 0))(
  ( (tuple2!19633 (_1!10692 (_ BitVec 8)) (_2!10692 BitStream!9182)) )
))
(declare-fun lt!365333 () tuple2!19632)

(declare-datatypes ((Unit!17093 0))(
  ( (Unit!17094) )
))
(declare-datatypes ((tuple3!1468 0))(
  ( (tuple3!1469 (_1!10693 Unit!17093) (_2!10693 BitStream!9182) (_3!876 array!11493)) )
))
(declare-fun lt!365328 () tuple3!1468)

(assert (=> b!228023 (and (= (_1!10692 lt!365333) (select (arr!6024 (_3!876 lt!365328)) i!761)) (= (select (arr!6024 (_3!876 lt!365328)) i!761) (_1!10692 lt!365333)))))

(declare-fun lt!365327 () Unit!17093)

(declare-fun lt!365324 () array!11493)

(declare-fun arrayRangesEqImpliesEq!135 (array!11493 array!11493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17093)

(assert (=> b!228023 (= lt!365327 (arrayRangesEqImpliesEq!135 lt!365324 (_3!876 lt!365328) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11493)

(declare-fun arrayRangesEq!879 (array!11493 array!11493 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228023 (arrayRangesEq!879 arr!308 (_3!876 lt!365328) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365330 () Unit!17093)

(declare-fun arrayRangesEqTransitive!302 (array!11493 array!11493 array!11493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17093)

(assert (=> b!228023 (= lt!365330 (arrayRangesEqTransitive!302 arr!308 lt!365324 (_3!876 lt!365328) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228023 (arrayRangesEq!879 arr!308 lt!365324 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365332 () Unit!17093)

(declare-fun arrayUpdatedAtPrefixLemma!438 (array!11493 (_ BitVec 32) (_ BitVec 8)) Unit!17093)

(assert (=> b!228023 (= lt!365332 (arrayUpdatedAtPrefixLemma!438 arr!308 i!761 (_1!10692 lt!365333)))))

(assert (=> b!228023 (= lt!365329 ((_ sign_extend 32) (bvsub to!496 i!761)))))

(declare-fun lt!365326 () (_ BitVec 32))

(declare-fun lt!365325 () (_ BitVec 64))

(declare-fun lt!365334 () (_ BitVec 64))

(declare-fun lt!365323 () (_ BitVec 64))

(assert (=> b!228023 (and (= (bvadd lt!365334 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365326))) lt!365323) (= (bvadd lt!365325 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365323) (= (buf!5584 thiss!1870) (buf!5584 (_2!10693 lt!365328))) (= (size!5043 arr!308) (size!5043 (_3!876 lt!365328))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228023 (= lt!365323 (bitIndex!0 (size!5043 (buf!5584 (_2!10693 lt!365328))) (currentByte!10434 (_2!10693 lt!365328)) (currentBit!10429 (_2!10693 lt!365328))))))

(assert (=> b!228023 (= lt!365334 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365325))))

(assert (=> b!228023 (= lt!365334 (bitIndex!0 (size!5043 (buf!5584 (_2!10692 lt!365333))) (currentByte!10434 (_2!10692 lt!365333)) (currentBit!10429 (_2!10692 lt!365333))))))

(assert (=> b!228023 (= lt!365325 (bitIndex!0 (size!5043 (buf!5584 thiss!1870)) (currentByte!10434 thiss!1870) (currentBit!10429 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9182 array!11493 (_ BitVec 32) (_ BitVec 32)) tuple3!1468)

(assert (=> b!228023 (= lt!365328 (readByteArrayLoop!0 (_2!10692 lt!365333) lt!365324 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!228023 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5043 (buf!5584 (_2!10692 lt!365333)))) ((_ sign_extend 32) (currentByte!10434 (_2!10692 lt!365333))) ((_ sign_extend 32) (currentBit!10429 (_2!10692 lt!365333))) lt!365326)))

(assert (=> b!228023 (= lt!365326 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365331 () Unit!17093)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9182 BitStream!9182 (_ BitVec 64) (_ BitVec 32)) Unit!17093)

(assert (=> b!228023 (= lt!365331 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10692 lt!365333) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228023 (= lt!365324 (array!11494 (store (arr!6024 arr!308) i!761 (_1!10692 lt!365333)) (size!5043 arr!308)))))

(declare-fun readByte!0 (BitStream!9182) tuple2!19632)

(assert (=> b!228023 (= lt!365333 (readByte!0 thiss!1870))))

(declare-fun res!191276 () Bool)

(assert (=> start!47934 (=> (not res!191276) (not e!156187))))

(assert (=> start!47934 (= res!191276 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5043 arr!308))))))

(assert (=> start!47934 e!156187))

(assert (=> start!47934 true))

(declare-fun array_inv!4784 (array!11493) Bool)

(assert (=> start!47934 (array_inv!4784 arr!308)))

(declare-fun e!156190 () Bool)

(declare-fun inv!12 (BitStream!9182) Bool)

(assert (=> start!47934 (and (inv!12 thiss!1870) e!156190)))

(declare-fun b!228022 () Bool)

(declare-fun res!191278 () Bool)

(assert (=> b!228022 (=> (not res!191278) (not e!156187))))

(assert (=> b!228022 (= res!191278 (bvslt i!761 to!496))))

(declare-fun b!228024 () Bool)

(assert (=> b!228024 (= e!156190 (array_inv!4784 (buf!5584 thiss!1870)))))

(assert (= (and start!47934 res!191276) b!228021))

(assert (= (and b!228021 res!191277) b!228022))

(assert (= (and b!228022 res!191278) b!228023))

(assert (= start!47934 b!228024))

(declare-fun m!351211 () Bool)

(assert (=> b!228021 m!351211))

(declare-fun m!351213 () Bool)

(assert (=> b!228023 m!351213))

(declare-fun m!351215 () Bool)

(assert (=> b!228023 m!351215))

(declare-fun m!351217 () Bool)

(assert (=> b!228023 m!351217))

(declare-fun m!351219 () Bool)

(assert (=> b!228023 m!351219))

(declare-fun m!351221 () Bool)

(assert (=> b!228023 m!351221))

(declare-fun m!351223 () Bool)

(assert (=> b!228023 m!351223))

(declare-fun m!351225 () Bool)

(assert (=> b!228023 m!351225))

(declare-fun m!351227 () Bool)

(assert (=> b!228023 m!351227))

(declare-fun m!351229 () Bool)

(assert (=> b!228023 m!351229))

(declare-fun m!351231 () Bool)

(assert (=> b!228023 m!351231))

(declare-fun m!351233 () Bool)

(assert (=> b!228023 m!351233))

(declare-fun m!351235 () Bool)

(assert (=> b!228023 m!351235))

(declare-fun m!351237 () Bool)

(assert (=> b!228023 m!351237))

(declare-fun m!351239 () Bool)

(assert (=> b!228023 m!351239))

(declare-fun m!351241 () Bool)

(assert (=> start!47934 m!351241))

(declare-fun m!351243 () Bool)

(assert (=> start!47934 m!351243))

(declare-fun m!351245 () Bool)

(assert (=> b!228024 m!351245))

(push 1)

(assert (not b!228021))

(assert (not b!228023))

(assert (not start!47934))

(assert (not b!228024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

