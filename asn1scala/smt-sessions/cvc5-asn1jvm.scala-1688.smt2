; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46922 () Bool)

(assert start!46922)

(declare-fun b!224717 () Bool)

(declare-fun res!188609 () Bool)

(declare-fun e!153191 () Bool)

(assert (=> b!224717 (=> (not res!188609) (not e!153191))))

(declare-datatypes ((array!11100 0))(
  ( (array!11101 (arr!5824 (Array (_ BitVec 32) (_ BitVec 8))) (size!4870 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8842 0))(
  ( (BitStream!8843 (buf!5414 array!11100) (currentByte!10160 (_ BitVec 32)) (currentBit!10155 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8842)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224717 (= res!188609 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4870 (buf!5414 thiss!1870))) ((_ sign_extend 32) (currentByte!10160 thiss!1870)) ((_ sign_extend 32) (currentBit!10155 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224720 () Bool)

(declare-fun e!153194 () Bool)

(declare-fun array_inv!4611 (array!11100) Bool)

(assert (=> b!224720 (= e!153194 (array_inv!4611 (buf!5414 thiss!1870)))))

(declare-fun b!224718 () Bool)

(declare-fun res!188610 () Bool)

(assert (=> b!224718 (=> (not res!188610) (not e!153191))))

(assert (=> b!224718 (= res!188610 (bvslt i!761 to!496))))

(declare-fun res!188608 () Bool)

(assert (=> start!46922 (=> (not res!188608) (not e!153191))))

(declare-fun arr!308 () array!11100)

(assert (=> start!46922 (= res!188608 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4870 arr!308))))))

(assert (=> start!46922 e!153191))

(assert (=> start!46922 true))

(assert (=> start!46922 (array_inv!4611 arr!308)))

(declare-fun inv!12 (BitStream!8842) Bool)

(assert (=> start!46922 (and (inv!12 thiss!1870) e!153194)))

(declare-fun b!224719 () Bool)

(assert (=> b!224719 (= e!153191 (not true))))

(declare-datatypes ((tuple2!19250 0))(
  ( (tuple2!19251 (_1!10400 (_ BitVec 8)) (_2!10400 BitStream!8842)) )
))
(declare-fun lt!357393 () tuple2!19250)

(declare-datatypes ((Unit!16464 0))(
  ( (Unit!16465) )
))
(declare-datatypes ((tuple3!1266 0))(
  ( (tuple3!1267 (_1!10401 Unit!16464) (_2!10401 BitStream!8842) (_3!775 array!11100)) )
))
(declare-fun lt!357392 () tuple3!1266)

(assert (=> b!224719 (and (= (_1!10400 lt!357393) (select (arr!5824 (_3!775 lt!357392)) i!761)) (= (select (arr!5824 (_3!775 lt!357392)) i!761) (_1!10400 lt!357393)))))

(declare-fun lt!357390 () array!11100)

(declare-fun lt!357398 () Unit!16464)

(declare-fun arrayRangesEqImpliesEq!88 (array!11100 array!11100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16464)

(assert (=> b!224719 (= lt!357398 (arrayRangesEqImpliesEq!88 lt!357390 (_3!775 lt!357392) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!766 (array!11100 array!11100 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224719 (arrayRangesEq!766 arr!308 (_3!775 lt!357392) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357389 () Unit!16464)

(declare-fun arrayRangesEqTransitive!237 (array!11100 array!11100 array!11100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16464)

(assert (=> b!224719 (= lt!357389 (arrayRangesEqTransitive!237 arr!308 lt!357390 (_3!775 lt!357392) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224719 (arrayRangesEq!766 arr!308 lt!357390 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357396 () Unit!16464)

(declare-fun arrayUpdatedAtPrefixLemma!358 (array!11100 (_ BitVec 32) (_ BitVec 8)) Unit!16464)

(assert (=> b!224719 (= lt!357396 (arrayUpdatedAtPrefixLemma!358 arr!308 i!761 (_1!10400 lt!357393)))))

(declare-fun lt!357394 () (_ BitVec 32))

(declare-fun lt!357397 () (_ BitVec 64))

(declare-fun lt!357391 () (_ BitVec 64))

(declare-fun lt!357399 () (_ BitVec 64))

(assert (=> b!224719 (and (= (bvadd lt!357391 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357394))) lt!357397) (= (bvadd lt!357399 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357397) (= (buf!5414 thiss!1870) (buf!5414 (_2!10401 lt!357392))) (= (size!4870 arr!308) (size!4870 (_3!775 lt!357392))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224719 (= lt!357397 (bitIndex!0 (size!4870 (buf!5414 (_2!10401 lt!357392))) (currentByte!10160 (_2!10401 lt!357392)) (currentBit!10155 (_2!10401 lt!357392))))))

(assert (=> b!224719 (= lt!357391 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357399))))

(assert (=> b!224719 (= lt!357391 (bitIndex!0 (size!4870 (buf!5414 (_2!10400 lt!357393))) (currentByte!10160 (_2!10400 lt!357393)) (currentBit!10155 (_2!10400 lt!357393))))))

(assert (=> b!224719 (= lt!357399 (bitIndex!0 (size!4870 (buf!5414 thiss!1870)) (currentByte!10160 thiss!1870) (currentBit!10155 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8842 array!11100 (_ BitVec 32) (_ BitVec 32)) tuple3!1266)

(assert (=> b!224719 (= lt!357392 (readByteArrayLoop!0 (_2!10400 lt!357393) lt!357390 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224719 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4870 (buf!5414 (_2!10400 lt!357393)))) ((_ sign_extend 32) (currentByte!10160 (_2!10400 lt!357393))) ((_ sign_extend 32) (currentBit!10155 (_2!10400 lt!357393))) lt!357394)))

(assert (=> b!224719 (= lt!357394 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357395 () Unit!16464)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8842 BitStream!8842 (_ BitVec 64) (_ BitVec 32)) Unit!16464)

(assert (=> b!224719 (= lt!357395 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10400 lt!357393) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224719 (= lt!357390 (array!11101 (store (arr!5824 arr!308) i!761 (_1!10400 lt!357393)) (size!4870 arr!308)))))

(declare-fun readByte!0 (BitStream!8842) tuple2!19250)

(assert (=> b!224719 (= lt!357393 (readByte!0 thiss!1870))))

(assert (= (and start!46922 res!188608) b!224717))

(assert (= (and b!224717 res!188609) b!224718))

(assert (= (and b!224718 res!188610) b!224719))

(assert (= start!46922 b!224720))

(declare-fun m!345203 () Bool)

(assert (=> b!224717 m!345203))

(declare-fun m!345205 () Bool)

(assert (=> b!224720 m!345205))

(declare-fun m!345207 () Bool)

(assert (=> start!46922 m!345207))

(declare-fun m!345209 () Bool)

(assert (=> start!46922 m!345209))

(declare-fun m!345211 () Bool)

(assert (=> b!224719 m!345211))

(declare-fun m!345213 () Bool)

(assert (=> b!224719 m!345213))

(declare-fun m!345215 () Bool)

(assert (=> b!224719 m!345215))

(declare-fun m!345217 () Bool)

(assert (=> b!224719 m!345217))

(declare-fun m!345219 () Bool)

(assert (=> b!224719 m!345219))

(declare-fun m!345221 () Bool)

(assert (=> b!224719 m!345221))

(declare-fun m!345223 () Bool)

(assert (=> b!224719 m!345223))

(declare-fun m!345225 () Bool)

(assert (=> b!224719 m!345225))

(declare-fun m!345227 () Bool)

(assert (=> b!224719 m!345227))

(declare-fun m!345229 () Bool)

(assert (=> b!224719 m!345229))

(declare-fun m!345231 () Bool)

(assert (=> b!224719 m!345231))

(declare-fun m!345233 () Bool)

(assert (=> b!224719 m!345233))

(declare-fun m!345235 () Bool)

(assert (=> b!224719 m!345235))

(declare-fun m!345237 () Bool)

(assert (=> b!224719 m!345237))

(push 1)

(assert (not b!224720))

(assert (not b!224717))

(assert (not start!46922))

(assert (not b!224719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

