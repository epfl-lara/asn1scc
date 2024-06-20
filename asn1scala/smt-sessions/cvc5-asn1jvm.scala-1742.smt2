; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47912 () Bool)

(assert start!47912)

(declare-fun b!227891 () Bool)

(declare-fun e!156055 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(declare-datatypes ((array!11471 0))(
  ( (array!11472 (arr!6013 (Array (_ BitVec 32) (_ BitVec 8))) (size!5032 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9160 0))(
  ( (BitStream!9161 (buf!5573 array!11471) (currentByte!10423 (_ BitVec 32)) (currentBit!10418 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17071 0))(
  ( (Unit!17072) )
))
(declare-datatypes ((tuple3!1446 0))(
  ( (tuple3!1447 (_1!10670 Unit!17071) (_2!10670 BitStream!9160) (_3!865 array!11471)) )
))
(declare-fun lt!364959 () tuple3!1446)

(assert (=> b!227891 (= e!156055 (not (bvslt i!761 (size!5032 (_3!865 lt!364959)))))))

(declare-datatypes ((tuple2!19610 0))(
  ( (tuple2!19611 (_1!10671 (_ BitVec 8)) (_2!10671 BitStream!9160)) )
))
(declare-fun lt!364956 () tuple2!19610)

(assert (=> b!227891 (= (_1!10671 lt!364956) (select (arr!6013 (_3!865 lt!364959)) i!761))))

(declare-fun lt!364960 () array!11471)

(declare-fun lt!364958 () Unit!17071)

(declare-fun arrayRangesEqImpliesEq!124 (array!11471 array!11471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17071)

(assert (=> b!227891 (= lt!364958 (arrayRangesEqImpliesEq!124 lt!364960 (_3!865 lt!364959) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11471)

(declare-fun arrayRangesEq!868 (array!11471 array!11471 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227891 (arrayRangesEq!868 arr!308 (_3!865 lt!364959) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364962 () Unit!17071)

(declare-fun arrayRangesEqTransitive!291 (array!11471 array!11471 array!11471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17071)

(assert (=> b!227891 (= lt!364962 (arrayRangesEqTransitive!291 arr!308 lt!364960 (_3!865 lt!364959) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227891 (arrayRangesEq!868 arr!308 lt!364960 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364961 () Unit!17071)

(declare-fun arrayUpdatedAtPrefixLemma!427 (array!11471 (_ BitVec 32) (_ BitVec 8)) Unit!17071)

(assert (=> b!227891 (= lt!364961 (arrayUpdatedAtPrefixLemma!427 arr!308 i!761 (_1!10671 lt!364956)))))

(declare-fun lt!364957 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!9160)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!364955 () (_ BitVec 64))

(declare-fun lt!364952 () (_ BitVec 64))

(declare-fun lt!364953 () (_ BitVec 64))

(assert (=> b!227891 (and (= (bvadd lt!364953 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364957))) lt!364955) (= (bvadd lt!364952 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364955) (= (buf!5573 thiss!1870) (buf!5573 (_2!10670 lt!364959))) (= (size!5032 arr!308) (size!5032 (_3!865 lt!364959))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227891 (= lt!364955 (bitIndex!0 (size!5032 (buf!5573 (_2!10670 lt!364959))) (currentByte!10423 (_2!10670 lt!364959)) (currentBit!10418 (_2!10670 lt!364959))))))

(assert (=> b!227891 (= lt!364953 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364952))))

(assert (=> b!227891 (= lt!364953 (bitIndex!0 (size!5032 (buf!5573 (_2!10671 lt!364956))) (currentByte!10423 (_2!10671 lt!364956)) (currentBit!10418 (_2!10671 lt!364956))))))

(assert (=> b!227891 (= lt!364952 (bitIndex!0 (size!5032 (buf!5573 thiss!1870)) (currentByte!10423 thiss!1870) (currentBit!10418 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9160 array!11471 (_ BitVec 32) (_ BitVec 32)) tuple3!1446)

(assert (=> b!227891 (= lt!364959 (readByteArrayLoop!0 (_2!10671 lt!364956) lt!364960 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227891 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5032 (buf!5573 (_2!10671 lt!364956)))) ((_ sign_extend 32) (currentByte!10423 (_2!10671 lt!364956))) ((_ sign_extend 32) (currentBit!10418 (_2!10671 lt!364956))) lt!364957)))

(assert (=> b!227891 (= lt!364957 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364954 () Unit!17071)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9160 BitStream!9160 (_ BitVec 64) (_ BitVec 32)) Unit!17071)

(assert (=> b!227891 (= lt!364954 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10671 lt!364956) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227891 (= lt!364960 (array!11472 (store (arr!6013 arr!308) i!761 (_1!10671 lt!364956)) (size!5032 arr!308)))))

(declare-fun readByte!0 (BitStream!9160) tuple2!19610)

(assert (=> b!227891 (= lt!364956 (readByte!0 thiss!1870))))

(declare-fun b!227890 () Bool)

(declare-fun res!191179 () Bool)

(assert (=> b!227890 (=> (not res!191179) (not e!156055))))

(assert (=> b!227890 (= res!191179 (bvslt i!761 to!496))))

(declare-fun res!191178 () Bool)

(assert (=> start!47912 (=> (not res!191178) (not e!156055))))

(assert (=> start!47912 (= res!191178 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5032 arr!308))))))

(assert (=> start!47912 e!156055))

(assert (=> start!47912 true))

(declare-fun array_inv!4773 (array!11471) Bool)

(assert (=> start!47912 (array_inv!4773 arr!308)))

(declare-fun e!156056 () Bool)

(declare-fun inv!12 (BitStream!9160) Bool)

(assert (=> start!47912 (and (inv!12 thiss!1870) e!156056)))

(declare-fun b!227889 () Bool)

(declare-fun res!191177 () Bool)

(assert (=> b!227889 (=> (not res!191177) (not e!156055))))

(assert (=> b!227889 (= res!191177 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5032 (buf!5573 thiss!1870))) ((_ sign_extend 32) (currentByte!10423 thiss!1870)) ((_ sign_extend 32) (currentBit!10418 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227892 () Bool)

(assert (=> b!227892 (= e!156056 (array_inv!4773 (buf!5573 thiss!1870)))))

(assert (= (and start!47912 res!191178) b!227889))

(assert (= (and b!227889 res!191177) b!227890))

(assert (= (and b!227890 res!191179) b!227891))

(assert (= start!47912 b!227892))

(declare-fun m!350815 () Bool)

(assert (=> b!227891 m!350815))

(declare-fun m!350817 () Bool)

(assert (=> b!227891 m!350817))

(declare-fun m!350819 () Bool)

(assert (=> b!227891 m!350819))

(declare-fun m!350821 () Bool)

(assert (=> b!227891 m!350821))

(declare-fun m!350823 () Bool)

(assert (=> b!227891 m!350823))

(declare-fun m!350825 () Bool)

(assert (=> b!227891 m!350825))

(declare-fun m!350827 () Bool)

(assert (=> b!227891 m!350827))

(declare-fun m!350829 () Bool)

(assert (=> b!227891 m!350829))

(declare-fun m!350831 () Bool)

(assert (=> b!227891 m!350831))

(declare-fun m!350833 () Bool)

(assert (=> b!227891 m!350833))

(declare-fun m!350835 () Bool)

(assert (=> b!227891 m!350835))

(declare-fun m!350837 () Bool)

(assert (=> b!227891 m!350837))

(declare-fun m!350839 () Bool)

(assert (=> b!227891 m!350839))

(declare-fun m!350841 () Bool)

(assert (=> b!227891 m!350841))

(declare-fun m!350843 () Bool)

(assert (=> start!47912 m!350843))

(declare-fun m!350845 () Bool)

(assert (=> start!47912 m!350845))

(declare-fun m!350847 () Bool)

(assert (=> b!227889 m!350847))

(declare-fun m!350849 () Bool)

(assert (=> b!227892 m!350849))

(push 1)

(assert (not b!227892))

(assert (not b!227891))

(assert (not b!227889))

(assert (not start!47912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

