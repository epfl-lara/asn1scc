; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47816 () Bool)

(assert start!47816)

(declare-fun res!190881 () Bool)

(declare-fun e!155725 () Bool)

(assert (=> start!47816 (=> (not res!190881) (not e!155725))))

(declare-datatypes ((array!11432 0))(
  ( (array!11433 (arr!5992 (Array (_ BitVec 32) (_ BitVec 8))) (size!5014 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11432)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> start!47816 (= res!190881 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5014 arr!308))))))

(assert (=> start!47816 e!155725))

(assert (=> start!47816 true))

(declare-fun array_inv!4755 (array!11432) Bool)

(assert (=> start!47816 (array_inv!4755 arr!308)))

(declare-datatypes ((BitStream!9124 0))(
  ( (BitStream!9125 (buf!5555 array!11432) (currentByte!10399 (_ BitVec 32)) (currentBit!10394 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9124)

(declare-fun e!155723 () Bool)

(declare-fun inv!12 (BitStream!9124) Bool)

(assert (=> start!47816 (and (inv!12 thiss!1870) e!155723)))

(declare-fun b!227523 () Bool)

(declare-fun res!190882 () Bool)

(assert (=> b!227523 (=> (not res!190882) (not e!155725))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227523 (= res!190882 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5014 (buf!5555 thiss!1870))) ((_ sign_extend 32) (currentByte!10399 thiss!1870)) ((_ sign_extend 32) (currentBit!10394 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227526 () Bool)

(assert (=> b!227526 (= e!155723 (array_inv!4755 (buf!5555 thiss!1870)))))

(declare-fun b!227524 () Bool)

(declare-fun res!190880 () Bool)

(assert (=> b!227524 (=> (not res!190880) (not e!155725))))

(assert (=> b!227524 (= res!190880 (bvslt i!761 to!496))))

(declare-fun b!227525 () Bool)

(assert (=> b!227525 (= e!155725 (not (or (not (= (bvand i!761 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!761 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((Unit!17002 0))(
  ( (Unit!17003) )
))
(declare-datatypes ((tuple3!1410 0))(
  ( (tuple3!1411 (_1!10628 Unit!17002) (_2!10628 BitStream!9124) (_3!847 array!11432)) )
))
(declare-fun lt!363897 () tuple3!1410)

(declare-fun arrayRangesEq!850 (array!11432 array!11432 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227525 (arrayRangesEq!850 arr!308 (_3!847 lt!363897) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363891 () array!11432)

(declare-fun lt!363894 () Unit!17002)

(declare-fun arrayRangesEqTransitive!273 (array!11432 array!11432 array!11432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17002)

(assert (=> b!227525 (= lt!363894 (arrayRangesEqTransitive!273 arr!308 lt!363891 (_3!847 lt!363897) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227525 (arrayRangesEq!850 arr!308 lt!363891 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363888 () Unit!17002)

(declare-datatypes ((tuple2!19562 0))(
  ( (tuple2!19563 (_1!10629 (_ BitVec 8)) (_2!10629 BitStream!9124)) )
))
(declare-fun lt!363889 () tuple2!19562)

(declare-fun arrayUpdatedAtPrefixLemma!409 (array!11432 (_ BitVec 32) (_ BitVec 8)) Unit!17002)

(assert (=> b!227525 (= lt!363888 (arrayUpdatedAtPrefixLemma!409 arr!308 i!761 (_1!10629 lt!363889)))))

(declare-fun lt!363895 () (_ BitVec 64))

(declare-fun lt!363896 () (_ BitVec 64))

(declare-fun lt!363892 () (_ BitVec 64))

(declare-fun lt!363893 () (_ BitVec 32))

(assert (=> b!227525 (and (= (bvadd lt!363892 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363893))) lt!363895) (= (bvadd lt!363896 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363895) (= (buf!5555 thiss!1870) (buf!5555 (_2!10628 lt!363897))) (= (size!5014 arr!308) (size!5014 (_3!847 lt!363897))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227525 (= lt!363895 (bitIndex!0 (size!5014 (buf!5555 (_2!10628 lt!363897))) (currentByte!10399 (_2!10628 lt!363897)) (currentBit!10394 (_2!10628 lt!363897))))))

(assert (=> b!227525 (= lt!363892 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363896))))

(assert (=> b!227525 (= lt!363892 (bitIndex!0 (size!5014 (buf!5555 (_2!10629 lt!363889))) (currentByte!10399 (_2!10629 lt!363889)) (currentBit!10394 (_2!10629 lt!363889))))))

(assert (=> b!227525 (= lt!363896 (bitIndex!0 (size!5014 (buf!5555 thiss!1870)) (currentByte!10399 thiss!1870) (currentBit!10394 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9124 array!11432 (_ BitVec 32) (_ BitVec 32)) tuple3!1410)

(assert (=> b!227525 (= lt!363897 (readByteArrayLoop!0 (_2!10629 lt!363889) lt!363891 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227525 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5014 (buf!5555 (_2!10629 lt!363889)))) ((_ sign_extend 32) (currentByte!10399 (_2!10629 lt!363889))) ((_ sign_extend 32) (currentBit!10394 (_2!10629 lt!363889))) lt!363893)))

(assert (=> b!227525 (= lt!363893 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363890 () Unit!17002)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9124 BitStream!9124 (_ BitVec 64) (_ BitVec 32)) Unit!17002)

(assert (=> b!227525 (= lt!363890 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10629 lt!363889) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227525 (= lt!363891 (array!11433 (store (arr!5992 arr!308) i!761 (_1!10629 lt!363889)) (size!5014 arr!308)))))

(declare-fun readByte!0 (BitStream!9124) tuple2!19562)

(assert (=> b!227525 (= lt!363889 (readByte!0 thiss!1870))))

(assert (= (and start!47816 res!190881) b!227523))

(assert (= (and b!227523 res!190882) b!227524))

(assert (= (and b!227524 res!190880) b!227525))

(assert (= start!47816 b!227526))

(declare-fun m!349981 () Bool)

(assert (=> start!47816 m!349981))

(declare-fun m!349983 () Bool)

(assert (=> start!47816 m!349983))

(declare-fun m!349985 () Bool)

(assert (=> b!227523 m!349985))

(declare-fun m!349987 () Bool)

(assert (=> b!227526 m!349987))

(declare-fun m!349989 () Bool)

(assert (=> b!227525 m!349989))

(declare-fun m!349991 () Bool)

(assert (=> b!227525 m!349991))

(declare-fun m!349993 () Bool)

(assert (=> b!227525 m!349993))

(declare-fun m!349995 () Bool)

(assert (=> b!227525 m!349995))

(declare-fun m!349997 () Bool)

(assert (=> b!227525 m!349997))

(declare-fun m!349999 () Bool)

(assert (=> b!227525 m!349999))

(declare-fun m!350001 () Bool)

(assert (=> b!227525 m!350001))

(declare-fun m!350003 () Bool)

(assert (=> b!227525 m!350003))

(declare-fun m!350005 () Bool)

(assert (=> b!227525 m!350005))

(declare-fun m!350007 () Bool)

(assert (=> b!227525 m!350007))

(declare-fun m!350009 () Bool)

(assert (=> b!227525 m!350009))

(declare-fun m!350011 () Bool)

(assert (=> b!227525 m!350011))

(push 1)

(assert (not b!227526))

(assert (not start!47816))

(assert (not b!227523))

(assert (not b!227525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

