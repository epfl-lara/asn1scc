; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47814 () Bool)

(assert start!47814)

(declare-fun b!227512 () Bool)

(declare-fun res!190872 () Bool)

(declare-fun e!155710 () Bool)

(assert (=> b!227512 (=> (not res!190872) (not e!155710))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227512 (= res!190872 (bvslt i!761 to!496))))

(declare-fun b!227513 () Bool)

(assert (=> b!227513 (= e!155710 (not true))))

(declare-datatypes ((array!11430 0))(
  ( (array!11431 (arr!5991 (Array (_ BitVec 32) (_ BitVec 8))) (size!5013 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11430)

(declare-datatypes ((BitStream!9122 0))(
  ( (BitStream!9123 (buf!5554 array!11430) (currentByte!10398 (_ BitVec 32)) (currentBit!10393 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17000 0))(
  ( (Unit!17001) )
))
(declare-datatypes ((tuple3!1408 0))(
  ( (tuple3!1409 (_1!10626 Unit!17000) (_2!10626 BitStream!9122) (_3!846 array!11430)) )
))
(declare-fun lt!363861 () tuple3!1408)

(declare-fun arrayRangesEq!849 (array!11430 array!11430 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227513 (arrayRangesEq!849 arr!308 (_3!846 lt!363861) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363867 () Unit!17000)

(declare-fun lt!363863 () array!11430)

(declare-fun arrayRangesEqTransitive!272 (array!11430 array!11430 array!11430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17000)

(assert (=> b!227513 (= lt!363867 (arrayRangesEqTransitive!272 arr!308 lt!363863 (_3!846 lt!363861) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227513 (arrayRangesEq!849 arr!308 lt!363863 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363859 () Unit!17000)

(declare-datatypes ((tuple2!19560 0))(
  ( (tuple2!19561 (_1!10627 (_ BitVec 8)) (_2!10627 BitStream!9122)) )
))
(declare-fun lt!363862 () tuple2!19560)

(declare-fun arrayUpdatedAtPrefixLemma!408 (array!11430 (_ BitVec 32) (_ BitVec 8)) Unit!17000)

(assert (=> b!227513 (= lt!363859 (arrayUpdatedAtPrefixLemma!408 arr!308 i!761 (_1!10627 lt!363862)))))

(declare-fun lt!363858 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!9122)

(declare-fun lt!363866 () (_ BitVec 32))

(declare-fun lt!363864 () (_ BitVec 64))

(declare-fun lt!363860 () (_ BitVec 64))

(assert (=> b!227513 (and (= (bvadd lt!363860 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363866))) lt!363864) (= (bvadd lt!363858 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363864) (= (buf!5554 thiss!1870) (buf!5554 (_2!10626 lt!363861))) (= (size!5013 arr!308) (size!5013 (_3!846 lt!363861))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227513 (= lt!363864 (bitIndex!0 (size!5013 (buf!5554 (_2!10626 lt!363861))) (currentByte!10398 (_2!10626 lt!363861)) (currentBit!10393 (_2!10626 lt!363861))))))

(assert (=> b!227513 (= lt!363860 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363858))))

(assert (=> b!227513 (= lt!363860 (bitIndex!0 (size!5013 (buf!5554 (_2!10627 lt!363862))) (currentByte!10398 (_2!10627 lt!363862)) (currentBit!10393 (_2!10627 lt!363862))))))

(assert (=> b!227513 (= lt!363858 (bitIndex!0 (size!5013 (buf!5554 thiss!1870)) (currentByte!10398 thiss!1870) (currentBit!10393 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9122 array!11430 (_ BitVec 32) (_ BitVec 32)) tuple3!1408)

(assert (=> b!227513 (= lt!363861 (readByteArrayLoop!0 (_2!10627 lt!363862) lt!363863 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227513 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5013 (buf!5554 (_2!10627 lt!363862)))) ((_ sign_extend 32) (currentByte!10398 (_2!10627 lt!363862))) ((_ sign_extend 32) (currentBit!10393 (_2!10627 lt!363862))) lt!363866)))

(assert (=> b!227513 (= lt!363866 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363865 () Unit!17000)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9122 BitStream!9122 (_ BitVec 64) (_ BitVec 32)) Unit!17000)

(assert (=> b!227513 (= lt!363865 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10627 lt!363862) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227513 (= lt!363863 (array!11431 (store (arr!5991 arr!308) i!761 (_1!10627 lt!363862)) (size!5013 arr!308)))))

(declare-fun readByte!0 (BitStream!9122) tuple2!19560)

(assert (=> b!227513 (= lt!363862 (readByte!0 thiss!1870))))

(declare-fun b!227511 () Bool)

(declare-fun res!190873 () Bool)

(assert (=> b!227511 (=> (not res!190873) (not e!155710))))

(assert (=> b!227511 (= res!190873 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5013 (buf!5554 thiss!1870))) ((_ sign_extend 32) (currentByte!10398 thiss!1870)) ((_ sign_extend 32) (currentBit!10393 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227514 () Bool)

(declare-fun e!155711 () Bool)

(declare-fun array_inv!4754 (array!11430) Bool)

(assert (=> b!227514 (= e!155711 (array_inv!4754 (buf!5554 thiss!1870)))))

(declare-fun res!190871 () Bool)

(assert (=> start!47814 (=> (not res!190871) (not e!155710))))

(assert (=> start!47814 (= res!190871 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5013 arr!308))))))

(assert (=> start!47814 e!155710))

(assert (=> start!47814 true))

(assert (=> start!47814 (array_inv!4754 arr!308)))

(declare-fun inv!12 (BitStream!9122) Bool)

(assert (=> start!47814 (and (inv!12 thiss!1870) e!155711)))

(assert (= (and start!47814 res!190871) b!227511))

(assert (= (and b!227511 res!190873) b!227512))

(assert (= (and b!227512 res!190872) b!227513))

(assert (= start!47814 b!227514))

(declare-fun m!349949 () Bool)

(assert (=> b!227513 m!349949))

(declare-fun m!349951 () Bool)

(assert (=> b!227513 m!349951))

(declare-fun m!349953 () Bool)

(assert (=> b!227513 m!349953))

(declare-fun m!349955 () Bool)

(assert (=> b!227513 m!349955))

(declare-fun m!349957 () Bool)

(assert (=> b!227513 m!349957))

(declare-fun m!349959 () Bool)

(assert (=> b!227513 m!349959))

(declare-fun m!349961 () Bool)

(assert (=> b!227513 m!349961))

(declare-fun m!349963 () Bool)

(assert (=> b!227513 m!349963))

(declare-fun m!349965 () Bool)

(assert (=> b!227513 m!349965))

(declare-fun m!349967 () Bool)

(assert (=> b!227513 m!349967))

(declare-fun m!349969 () Bool)

(assert (=> b!227513 m!349969))

(declare-fun m!349971 () Bool)

(assert (=> b!227513 m!349971))

(declare-fun m!349973 () Bool)

(assert (=> b!227511 m!349973))

(declare-fun m!349975 () Bool)

(assert (=> b!227514 m!349975))

(declare-fun m!349977 () Bool)

(assert (=> start!47814 m!349977))

(declare-fun m!349979 () Bool)

(assert (=> start!47814 m!349979))

(push 1)

(assert (not start!47814))

(assert (not b!227514))

(assert (not b!227511))

(assert (not b!227513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

