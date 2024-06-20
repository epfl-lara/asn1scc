; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47832 () Bool)

(assert start!47832)

(declare-fun res!190952 () Bool)

(declare-fun e!155821 () Bool)

(assert (=> start!47832 (=> (not res!190952) (not e!155821))))

(declare-datatypes ((array!11448 0))(
  ( (array!11449 (arr!6000 (Array (_ BitVec 32) (_ BitVec 8))) (size!5022 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11448)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47832 (= res!190952 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5022 arr!308))))))

(assert (=> start!47832 e!155821))

(assert (=> start!47832 true))

(declare-fun array_inv!4763 (array!11448) Bool)

(assert (=> start!47832 (array_inv!4763 arr!308)))

(declare-datatypes ((BitStream!9140 0))(
  ( (BitStream!9141 (buf!5563 array!11448) (currentByte!10407 (_ BitVec 32)) (currentBit!10402 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9140)

(declare-fun e!155819 () Bool)

(declare-fun inv!12 (BitStream!9140) Bool)

(assert (=> start!47832 (and (inv!12 thiss!1870) e!155819)))

(declare-fun b!227622 () Bool)

(assert (=> b!227622 (= e!155819 (array_inv!4763 (buf!5563 thiss!1870)))))

(declare-fun b!227621 () Bool)

(assert (=> b!227621 (= e!155821 (not true))))

(declare-datatypes ((Unit!17018 0))(
  ( (Unit!17019) )
))
(declare-datatypes ((tuple3!1426 0))(
  ( (tuple3!1427 (_1!10644 Unit!17018) (_2!10644 BitStream!9140) (_3!855 array!11448)) )
))
(declare-fun lt!364128 () tuple3!1426)

(declare-fun arrayRangesEq!858 (array!11448 array!11448 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227621 (arrayRangesEq!858 arr!308 (_3!855 lt!364128) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364132 () Unit!17018)

(declare-fun lt!364137 () array!11448)

(declare-fun arrayRangesEqTransitive!281 (array!11448 array!11448 array!11448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17018)

(assert (=> b!227621 (= lt!364132 (arrayRangesEqTransitive!281 arr!308 lt!364137 (_3!855 lt!364128) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227621 (arrayRangesEq!858 arr!308 lt!364137 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364131 () Unit!17018)

(declare-datatypes ((tuple2!19578 0))(
  ( (tuple2!19579 (_1!10645 (_ BitVec 8)) (_2!10645 BitStream!9140)) )
))
(declare-fun lt!364134 () tuple2!19578)

(declare-fun arrayUpdatedAtPrefixLemma!417 (array!11448 (_ BitVec 32) (_ BitVec 8)) Unit!17018)

(assert (=> b!227621 (= lt!364131 (arrayUpdatedAtPrefixLemma!417 arr!308 i!761 (_1!10645 lt!364134)))))

(declare-fun lt!364135 () (_ BitVec 64))

(declare-fun lt!364133 () (_ BitVec 32))

(declare-fun lt!364130 () (_ BitVec 64))

(declare-fun lt!364129 () (_ BitVec 64))

(assert (=> b!227621 (and (= (bvadd lt!364135 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364133))) lt!364130) (= (bvadd lt!364129 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364130) (= (buf!5563 thiss!1870) (buf!5563 (_2!10644 lt!364128))) (= (size!5022 arr!308) (size!5022 (_3!855 lt!364128))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227621 (= lt!364130 (bitIndex!0 (size!5022 (buf!5563 (_2!10644 lt!364128))) (currentByte!10407 (_2!10644 lt!364128)) (currentBit!10402 (_2!10644 lt!364128))))))

(assert (=> b!227621 (= lt!364135 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364129))))

(assert (=> b!227621 (= lt!364135 (bitIndex!0 (size!5022 (buf!5563 (_2!10645 lt!364134))) (currentByte!10407 (_2!10645 lt!364134)) (currentBit!10402 (_2!10645 lt!364134))))))

(assert (=> b!227621 (= lt!364129 (bitIndex!0 (size!5022 (buf!5563 thiss!1870)) (currentByte!10407 thiss!1870) (currentBit!10402 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9140 array!11448 (_ BitVec 32) (_ BitVec 32)) tuple3!1426)

(assert (=> b!227621 (= lt!364128 (readByteArrayLoop!0 (_2!10645 lt!364134) lt!364137 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227621 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5022 (buf!5563 (_2!10645 lt!364134)))) ((_ sign_extend 32) (currentByte!10407 (_2!10645 lt!364134))) ((_ sign_extend 32) (currentBit!10402 (_2!10645 lt!364134))) lt!364133)))

(assert (=> b!227621 (= lt!364133 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364136 () Unit!17018)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9140 BitStream!9140 (_ BitVec 64) (_ BitVec 32)) Unit!17018)

(assert (=> b!227621 (= lt!364136 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10645 lt!364134) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227621 (= lt!364137 (array!11449 (store (arr!6000 arr!308) i!761 (_1!10645 lt!364134)) (size!5022 arr!308)))))

(declare-fun readByte!0 (BitStream!9140) tuple2!19578)

(assert (=> b!227621 (= lt!364134 (readByte!0 thiss!1870))))

(declare-fun b!227620 () Bool)

(declare-fun res!190953 () Bool)

(assert (=> b!227620 (=> (not res!190953) (not e!155821))))

(assert (=> b!227620 (= res!190953 (bvslt i!761 to!496))))

(declare-fun b!227619 () Bool)

(declare-fun res!190954 () Bool)

(assert (=> b!227619 (=> (not res!190954) (not e!155821))))

(assert (=> b!227619 (= res!190954 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5022 (buf!5563 thiss!1870))) ((_ sign_extend 32) (currentByte!10407 thiss!1870)) ((_ sign_extend 32) (currentBit!10402 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47832 res!190952) b!227619))

(assert (= (and b!227619 res!190954) b!227620))

(assert (= (and b!227620 res!190953) b!227621))

(assert (= start!47832 b!227622))

(declare-fun m!350237 () Bool)

(assert (=> start!47832 m!350237))

(declare-fun m!350239 () Bool)

(assert (=> start!47832 m!350239))

(declare-fun m!350241 () Bool)

(assert (=> b!227622 m!350241))

(declare-fun m!350243 () Bool)

(assert (=> b!227621 m!350243))

(declare-fun m!350245 () Bool)

(assert (=> b!227621 m!350245))

(declare-fun m!350247 () Bool)

(assert (=> b!227621 m!350247))

(declare-fun m!350249 () Bool)

(assert (=> b!227621 m!350249))

(declare-fun m!350251 () Bool)

(assert (=> b!227621 m!350251))

(declare-fun m!350253 () Bool)

(assert (=> b!227621 m!350253))

(declare-fun m!350255 () Bool)

(assert (=> b!227621 m!350255))

(declare-fun m!350257 () Bool)

(assert (=> b!227621 m!350257))

(declare-fun m!350259 () Bool)

(assert (=> b!227621 m!350259))

(declare-fun m!350261 () Bool)

(assert (=> b!227621 m!350261))

(declare-fun m!350263 () Bool)

(assert (=> b!227621 m!350263))

(declare-fun m!350265 () Bool)

(assert (=> b!227621 m!350265))

(declare-fun m!350267 () Bool)

(assert (=> b!227619 m!350267))

(push 1)

