; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47818 () Bool)

(assert start!47818)

(declare-fun b!227536 () Bool)

(declare-fun res!190890 () Bool)

(declare-fun e!155735 () Bool)

(assert (=> b!227536 (=> (not res!190890) (not e!155735))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227536 (= res!190890 (bvslt i!761 to!496))))

(declare-fun b!227537 () Bool)

(assert (=> b!227537 (= e!155735 (not (or (not (= (bvand i!761 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!761 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((array!11434 0))(
  ( (array!11435 (arr!5993 (Array (_ BitVec 32) (_ BitVec 8))) (size!5015 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11434)

(declare-datatypes ((BitStream!9126 0))(
  ( (BitStream!9127 (buf!5556 array!11434) (currentByte!10400 (_ BitVec 32)) (currentBit!10395 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17004 0))(
  ( (Unit!17005) )
))
(declare-datatypes ((tuple3!1412 0))(
  ( (tuple3!1413 (_1!10630 Unit!17004) (_2!10630 BitStream!9126) (_3!848 array!11434)) )
))
(declare-fun lt!363922 () tuple3!1412)

(declare-fun arrayRangesEq!851 (array!11434 array!11434 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227537 (arrayRangesEq!851 arr!308 (_3!848 lt!363922) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363919 () array!11434)

(declare-fun lt!363927 () Unit!17004)

(declare-fun arrayRangesEqTransitive!274 (array!11434 array!11434 array!11434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17004)

(assert (=> b!227537 (= lt!363927 (arrayRangesEqTransitive!274 arr!308 lt!363919 (_3!848 lt!363922) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227537 (arrayRangesEq!851 arr!308 lt!363919 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363923 () Unit!17004)

(declare-datatypes ((tuple2!19564 0))(
  ( (tuple2!19565 (_1!10631 (_ BitVec 8)) (_2!10631 BitStream!9126)) )
))
(declare-fun lt!363925 () tuple2!19564)

(declare-fun arrayUpdatedAtPrefixLemma!410 (array!11434 (_ BitVec 32) (_ BitVec 8)) Unit!17004)

(assert (=> b!227537 (= lt!363923 (arrayUpdatedAtPrefixLemma!410 arr!308 i!761 (_1!10631 lt!363925)))))

(declare-fun lt!363926 () (_ BitVec 64))

(declare-fun lt!363924 () (_ BitVec 64))

(declare-fun lt!363920 () (_ BitVec 64))

(declare-fun lt!363918 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!9126)

(assert (=> b!227537 (and (= (bvadd lt!363926 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363918))) lt!363924) (= (bvadd lt!363920 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363924) (= (buf!5556 thiss!1870) (buf!5556 (_2!10630 lt!363922))) (= (size!5015 arr!308) (size!5015 (_3!848 lt!363922))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227537 (= lt!363924 (bitIndex!0 (size!5015 (buf!5556 (_2!10630 lt!363922))) (currentByte!10400 (_2!10630 lt!363922)) (currentBit!10395 (_2!10630 lt!363922))))))

(assert (=> b!227537 (= lt!363926 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363920))))

(assert (=> b!227537 (= lt!363926 (bitIndex!0 (size!5015 (buf!5556 (_2!10631 lt!363925))) (currentByte!10400 (_2!10631 lt!363925)) (currentBit!10395 (_2!10631 lt!363925))))))

(assert (=> b!227537 (= lt!363920 (bitIndex!0 (size!5015 (buf!5556 thiss!1870)) (currentByte!10400 thiss!1870) (currentBit!10395 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9126 array!11434 (_ BitVec 32) (_ BitVec 32)) tuple3!1412)

(assert (=> b!227537 (= lt!363922 (readByteArrayLoop!0 (_2!10631 lt!363925) lt!363919 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227537 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5015 (buf!5556 (_2!10631 lt!363925)))) ((_ sign_extend 32) (currentByte!10400 (_2!10631 lt!363925))) ((_ sign_extend 32) (currentBit!10395 (_2!10631 lt!363925))) lt!363918)))

(assert (=> b!227537 (= lt!363918 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363921 () Unit!17004)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9126 BitStream!9126 (_ BitVec 64) (_ BitVec 32)) Unit!17004)

(assert (=> b!227537 (= lt!363921 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10631 lt!363925) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227537 (= lt!363919 (array!11435 (store (arr!5993 arr!308) i!761 (_1!10631 lt!363925)) (size!5015 arr!308)))))

(declare-fun readByte!0 (BitStream!9126) tuple2!19564)

(assert (=> b!227537 (= lt!363925 (readByte!0 thiss!1870))))

(declare-fun b!227538 () Bool)

(declare-fun e!155736 () Bool)

(declare-fun array_inv!4756 (array!11434) Bool)

(assert (=> b!227538 (= e!155736 (array_inv!4756 (buf!5556 thiss!1870)))))

(declare-fun b!227535 () Bool)

(declare-fun res!190891 () Bool)

(assert (=> b!227535 (=> (not res!190891) (not e!155735))))

(assert (=> b!227535 (= res!190891 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5015 (buf!5556 thiss!1870))) ((_ sign_extend 32) (currentByte!10400 thiss!1870)) ((_ sign_extend 32) (currentBit!10395 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190889 () Bool)

(assert (=> start!47818 (=> (not res!190889) (not e!155735))))

(assert (=> start!47818 (= res!190889 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5015 arr!308))))))

(assert (=> start!47818 e!155735))

(assert (=> start!47818 true))

(assert (=> start!47818 (array_inv!4756 arr!308)))

(declare-fun inv!12 (BitStream!9126) Bool)

(assert (=> start!47818 (and (inv!12 thiss!1870) e!155736)))

(assert (= (and start!47818 res!190889) b!227535))

(assert (= (and b!227535 res!190891) b!227536))

(assert (= (and b!227536 res!190890) b!227537))

(assert (= start!47818 b!227538))

(declare-fun m!350013 () Bool)

(assert (=> b!227537 m!350013))

(declare-fun m!350015 () Bool)

(assert (=> b!227537 m!350015))

(declare-fun m!350017 () Bool)

(assert (=> b!227537 m!350017))

(declare-fun m!350019 () Bool)

(assert (=> b!227537 m!350019))

(declare-fun m!350021 () Bool)

(assert (=> b!227537 m!350021))

(declare-fun m!350023 () Bool)

(assert (=> b!227537 m!350023))

(declare-fun m!350025 () Bool)

(assert (=> b!227537 m!350025))

(declare-fun m!350027 () Bool)

(assert (=> b!227537 m!350027))

(declare-fun m!350029 () Bool)

(assert (=> b!227537 m!350029))

(declare-fun m!350031 () Bool)

(assert (=> b!227537 m!350031))

(declare-fun m!350033 () Bool)

(assert (=> b!227537 m!350033))

(declare-fun m!350035 () Bool)

(assert (=> b!227537 m!350035))

(declare-fun m!350037 () Bool)

(assert (=> b!227538 m!350037))

(declare-fun m!350039 () Bool)

(assert (=> b!227535 m!350039))

(declare-fun m!350041 () Bool)

(assert (=> start!47818 m!350041))

(declare-fun m!350043 () Bool)

(assert (=> start!47818 m!350043))

(check-sat (not b!227535) (not b!227537) (not b!227538) (not start!47818))
(check-sat)
