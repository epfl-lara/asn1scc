; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47834 () Bool)

(assert start!47834)

(declare-fun b!227631 () Bool)

(declare-fun res!190962 () Bool)

(declare-fun e!155833 () Bool)

(assert (=> b!227631 (=> (not res!190962) (not e!155833))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((array!11450 0))(
  ( (array!11451 (arr!6001 (Array (_ BitVec 32) (_ BitVec 8))) (size!5023 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9142 0))(
  ( (BitStream!9143 (buf!5564 array!11450) (currentByte!10408 (_ BitVec 32)) (currentBit!10403 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9142)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227631 (= res!190962 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5023 (buf!5564 thiss!1870))) ((_ sign_extend 32) (currentByte!10408 thiss!1870)) ((_ sign_extend 32) (currentBit!10403 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227634 () Bool)

(declare-fun e!155831 () Bool)

(declare-fun array_inv!4764 (array!11450) Bool)

(assert (=> b!227634 (= e!155831 (array_inv!4764 (buf!5564 thiss!1870)))))

(declare-fun res!190963 () Bool)

(assert (=> start!47834 (=> (not res!190963) (not e!155833))))

(declare-fun arr!308 () array!11450)

(assert (=> start!47834 (= res!190963 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5023 arr!308))))))

(assert (=> start!47834 e!155833))

(assert (=> start!47834 true))

(assert (=> start!47834 (array_inv!4764 arr!308)))

(declare-fun inv!12 (BitStream!9142) Bool)

(assert (=> start!47834 (and (inv!12 thiss!1870) e!155831)))

(declare-fun b!227632 () Bool)

(declare-fun res!190961 () Bool)

(assert (=> b!227632 (=> (not res!190961) (not e!155833))))

(assert (=> b!227632 (= res!190961 (bvslt i!761 to!496))))

(declare-fun b!227633 () Bool)

(assert (=> b!227633 (= e!155833 (not (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (size!5023 arr!308)))))))

(declare-datatypes ((Unit!17020 0))(
  ( (Unit!17021) )
))
(declare-datatypes ((tuple3!1428 0))(
  ( (tuple3!1429 (_1!10646 Unit!17020) (_2!10646 BitStream!9142) (_3!856 array!11450)) )
))
(declare-fun lt!364158 () tuple3!1428)

(declare-fun arrayRangesEq!859 (array!11450 array!11450 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227633 (arrayRangesEq!859 arr!308 (_3!856 lt!364158) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364167 () array!11450)

(declare-fun lt!364161 () Unit!17020)

(declare-fun arrayRangesEqTransitive!282 (array!11450 array!11450 array!11450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17020)

(assert (=> b!227633 (= lt!364161 (arrayRangesEqTransitive!282 arr!308 lt!364167 (_3!856 lt!364158) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227633 (arrayRangesEq!859 arr!308 lt!364167 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364165 () Unit!17020)

(declare-datatypes ((tuple2!19580 0))(
  ( (tuple2!19581 (_1!10647 (_ BitVec 8)) (_2!10647 BitStream!9142)) )
))
(declare-fun lt!364162 () tuple2!19580)

(declare-fun arrayUpdatedAtPrefixLemma!418 (array!11450 (_ BitVec 32) (_ BitVec 8)) Unit!17020)

(assert (=> b!227633 (= lt!364165 (arrayUpdatedAtPrefixLemma!418 arr!308 i!761 (_1!10647 lt!364162)))))

(declare-fun lt!364164 () (_ BitVec 64))

(declare-fun lt!364166 () (_ BitVec 32))

(declare-fun lt!364163 () (_ BitVec 64))

(declare-fun lt!364159 () (_ BitVec 64))

(assert (=> b!227633 (and (= (bvadd lt!364159 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364166))) lt!364163) (= (bvadd lt!364164 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364163) (= (buf!5564 thiss!1870) (buf!5564 (_2!10646 lt!364158))) (= (size!5023 arr!308) (size!5023 (_3!856 lt!364158))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227633 (= lt!364163 (bitIndex!0 (size!5023 (buf!5564 (_2!10646 lt!364158))) (currentByte!10408 (_2!10646 lt!364158)) (currentBit!10403 (_2!10646 lt!364158))))))

(assert (=> b!227633 (= lt!364159 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364164))))

(assert (=> b!227633 (= lt!364159 (bitIndex!0 (size!5023 (buf!5564 (_2!10647 lt!364162))) (currentByte!10408 (_2!10647 lt!364162)) (currentBit!10403 (_2!10647 lt!364162))))))

(assert (=> b!227633 (= lt!364164 (bitIndex!0 (size!5023 (buf!5564 thiss!1870)) (currentByte!10408 thiss!1870) (currentBit!10403 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9142 array!11450 (_ BitVec 32) (_ BitVec 32)) tuple3!1428)

(assert (=> b!227633 (= lt!364158 (readByteArrayLoop!0 (_2!10647 lt!364162) lt!364167 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227633 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5023 (buf!5564 (_2!10647 lt!364162)))) ((_ sign_extend 32) (currentByte!10408 (_2!10647 lt!364162))) ((_ sign_extend 32) (currentBit!10403 (_2!10647 lt!364162))) lt!364166)))

(assert (=> b!227633 (= lt!364166 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364160 () Unit!17020)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9142 BitStream!9142 (_ BitVec 64) (_ BitVec 32)) Unit!17020)

(assert (=> b!227633 (= lt!364160 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10647 lt!364162) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227633 (= lt!364167 (array!11451 (store (arr!6001 arr!308) i!761 (_1!10647 lt!364162)) (size!5023 arr!308)))))

(declare-fun readByte!0 (BitStream!9142) tuple2!19580)

(assert (=> b!227633 (= lt!364162 (readByte!0 thiss!1870))))

(assert (= (and start!47834 res!190963) b!227631))

(assert (= (and b!227631 res!190962) b!227632))

(assert (= (and b!227632 res!190961) b!227633))

(assert (= start!47834 b!227634))

(declare-fun m!350269 () Bool)

(assert (=> b!227631 m!350269))

(declare-fun m!350271 () Bool)

(assert (=> b!227634 m!350271))

(declare-fun m!350273 () Bool)

(assert (=> start!47834 m!350273))

(declare-fun m!350275 () Bool)

(assert (=> start!47834 m!350275))

(declare-fun m!350277 () Bool)

(assert (=> b!227633 m!350277))

(declare-fun m!350279 () Bool)

(assert (=> b!227633 m!350279))

(declare-fun m!350281 () Bool)

(assert (=> b!227633 m!350281))

(declare-fun m!350283 () Bool)

(assert (=> b!227633 m!350283))

(declare-fun m!350285 () Bool)

(assert (=> b!227633 m!350285))

(declare-fun m!350287 () Bool)

(assert (=> b!227633 m!350287))

(declare-fun m!350289 () Bool)

(assert (=> b!227633 m!350289))

(declare-fun m!350291 () Bool)

(assert (=> b!227633 m!350291))

(declare-fun m!350293 () Bool)

(assert (=> b!227633 m!350293))

(declare-fun m!350295 () Bool)

(assert (=> b!227633 m!350295))

(declare-fun m!350297 () Bool)

(assert (=> b!227633 m!350297))

(declare-fun m!350299 () Bool)

(assert (=> b!227633 m!350299))

(push 1)

(assert (not b!227634))

(assert (not start!47834))

(assert (not b!227631))

(assert (not b!227633))

(check-sat)

(pop 1)

(push 1)

(check-sat)

