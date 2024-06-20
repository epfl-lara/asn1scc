; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47820 () Bool)

(assert start!47820)

(declare-fun b!227550 () Bool)

(declare-fun e!155749 () Bool)

(declare-datatypes ((array!11436 0))(
  ( (array!11437 (arr!5994 (Array (_ BitVec 32) (_ BitVec 8))) (size!5016 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9128 0))(
  ( (BitStream!9129 (buf!5557 array!11436) (currentByte!10401 (_ BitVec 32)) (currentBit!10396 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9128)

(declare-fun array_inv!4757 (array!11436) Bool)

(assert (=> b!227550 (= e!155749 (array_inv!4757 (buf!5557 thiss!1870)))))

(declare-fun res!190898 () Bool)

(declare-fun e!155747 () Bool)

(assert (=> start!47820 (=> (not res!190898) (not e!155747))))

(declare-fun arr!308 () array!11436)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47820 (= res!190898 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5016 arr!308))))))

(assert (=> start!47820 e!155747))

(assert (=> start!47820 true))

(assert (=> start!47820 (array_inv!4757 arr!308)))

(declare-fun inv!12 (BitStream!9128) Bool)

(assert (=> start!47820 (and (inv!12 thiss!1870) e!155749)))

(declare-fun b!227548 () Bool)

(declare-fun res!190900 () Bool)

(assert (=> b!227548 (=> (not res!190900) (not e!155747))))

(assert (=> b!227548 (= res!190900 (bvslt i!761 to!496))))

(declare-fun b!227547 () Bool)

(declare-fun res!190899 () Bool)

(assert (=> b!227547 (=> (not res!190899) (not e!155747))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227547 (= res!190899 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5016 (buf!5557 thiss!1870))) ((_ sign_extend 32) (currentByte!10401 thiss!1870)) ((_ sign_extend 32) (currentBit!10396 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227549 () Bool)

(assert (=> b!227549 (= e!155747 (not (or (not (= (bvand i!761 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!761 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((Unit!17006 0))(
  ( (Unit!17007) )
))
(declare-datatypes ((tuple3!1414 0))(
  ( (tuple3!1415 (_1!10632 Unit!17006) (_2!10632 BitStream!9128) (_3!849 array!11436)) )
))
(declare-fun lt!363956 () tuple3!1414)

(declare-fun arrayRangesEq!852 (array!11436 array!11436 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227549 (arrayRangesEq!852 arr!308 (_3!849 lt!363956) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363952 () array!11436)

(declare-fun lt!363957 () Unit!17006)

(declare-fun arrayRangesEqTransitive!275 (array!11436 array!11436 array!11436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17006)

(assert (=> b!227549 (= lt!363957 (arrayRangesEqTransitive!275 arr!308 lt!363952 (_3!849 lt!363956) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227549 (arrayRangesEq!852 arr!308 lt!363952 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19566 0))(
  ( (tuple2!19567 (_1!10633 (_ BitVec 8)) (_2!10633 BitStream!9128)) )
))
(declare-fun lt!363948 () tuple2!19566)

(declare-fun lt!363955 () Unit!17006)

(declare-fun arrayUpdatedAtPrefixLemma!411 (array!11436 (_ BitVec 32) (_ BitVec 8)) Unit!17006)

(assert (=> b!227549 (= lt!363955 (arrayUpdatedAtPrefixLemma!411 arr!308 i!761 (_1!10633 lt!363948)))))

(declare-fun lt!363953 () (_ BitVec 64))

(declare-fun lt!363954 () (_ BitVec 32))

(declare-fun lt!363949 () (_ BitVec 64))

(declare-fun lt!363950 () (_ BitVec 64))

(assert (=> b!227549 (and (= (bvadd lt!363950 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363954))) lt!363953) (= (bvadd lt!363949 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363953) (= (buf!5557 thiss!1870) (buf!5557 (_2!10632 lt!363956))) (= (size!5016 arr!308) (size!5016 (_3!849 lt!363956))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227549 (= lt!363953 (bitIndex!0 (size!5016 (buf!5557 (_2!10632 lt!363956))) (currentByte!10401 (_2!10632 lt!363956)) (currentBit!10396 (_2!10632 lt!363956))))))

(assert (=> b!227549 (= lt!363950 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363949))))

(assert (=> b!227549 (= lt!363950 (bitIndex!0 (size!5016 (buf!5557 (_2!10633 lt!363948))) (currentByte!10401 (_2!10633 lt!363948)) (currentBit!10396 (_2!10633 lt!363948))))))

(assert (=> b!227549 (= lt!363949 (bitIndex!0 (size!5016 (buf!5557 thiss!1870)) (currentByte!10401 thiss!1870) (currentBit!10396 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9128 array!11436 (_ BitVec 32) (_ BitVec 32)) tuple3!1414)

(assert (=> b!227549 (= lt!363956 (readByteArrayLoop!0 (_2!10633 lt!363948) lt!363952 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227549 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5016 (buf!5557 (_2!10633 lt!363948)))) ((_ sign_extend 32) (currentByte!10401 (_2!10633 lt!363948))) ((_ sign_extend 32) (currentBit!10396 (_2!10633 lt!363948))) lt!363954)))

(assert (=> b!227549 (= lt!363954 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363951 () Unit!17006)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9128 BitStream!9128 (_ BitVec 64) (_ BitVec 32)) Unit!17006)

(assert (=> b!227549 (= lt!363951 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10633 lt!363948) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227549 (= lt!363952 (array!11437 (store (arr!5994 arr!308) i!761 (_1!10633 lt!363948)) (size!5016 arr!308)))))

(declare-fun readByte!0 (BitStream!9128) tuple2!19566)

(assert (=> b!227549 (= lt!363948 (readByte!0 thiss!1870))))

(assert (= (and start!47820 res!190898) b!227547))

(assert (= (and b!227547 res!190899) b!227548))

(assert (= (and b!227548 res!190900) b!227549))

(assert (= start!47820 b!227550))

(declare-fun m!350045 () Bool)

(assert (=> b!227550 m!350045))

(declare-fun m!350047 () Bool)

(assert (=> start!47820 m!350047))

(declare-fun m!350049 () Bool)

(assert (=> start!47820 m!350049))

(declare-fun m!350051 () Bool)

(assert (=> b!227547 m!350051))

(declare-fun m!350053 () Bool)

(assert (=> b!227549 m!350053))

(declare-fun m!350055 () Bool)

(assert (=> b!227549 m!350055))

(declare-fun m!350057 () Bool)

(assert (=> b!227549 m!350057))

(declare-fun m!350059 () Bool)

(assert (=> b!227549 m!350059))

(declare-fun m!350061 () Bool)

(assert (=> b!227549 m!350061))

(declare-fun m!350063 () Bool)

(assert (=> b!227549 m!350063))

(declare-fun m!350065 () Bool)

(assert (=> b!227549 m!350065))

(declare-fun m!350067 () Bool)

(assert (=> b!227549 m!350067))

(declare-fun m!350069 () Bool)

(assert (=> b!227549 m!350069))

(declare-fun m!350071 () Bool)

(assert (=> b!227549 m!350071))

(declare-fun m!350073 () Bool)

(assert (=> b!227549 m!350073))

(declare-fun m!350075 () Bool)

(assert (=> b!227549 m!350075))

(push 1)

(assert (not b!227549))

(assert (not b!227550))

(assert (not start!47820))

(assert (not b!227547))

(check-sat)

(pop 1)

(push 1)

(check-sat)

