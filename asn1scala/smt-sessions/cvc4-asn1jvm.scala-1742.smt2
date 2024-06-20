; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47916 () Bool)

(assert start!47916)

(declare-fun b!227915 () Bool)

(declare-fun e!156082 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(declare-datatypes ((array!11475 0))(
  ( (array!11476 (arr!6015 (Array (_ BitVec 32) (_ BitVec 8))) (size!5034 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9164 0))(
  ( (BitStream!9165 (buf!5575 array!11475) (currentByte!10425 (_ BitVec 32)) (currentBit!10420 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17075 0))(
  ( (Unit!17076) )
))
(declare-datatypes ((tuple3!1450 0))(
  ( (tuple3!1451 (_1!10674 Unit!17075) (_2!10674 BitStream!9164) (_3!867 array!11475)) )
))
(declare-fun lt!365024 () tuple3!1450)

(assert (=> b!227915 (= e!156082 (not (bvslt i!761 (size!5034 (_3!867 lt!365024)))))))

(declare-datatypes ((tuple2!19614 0))(
  ( (tuple2!19615 (_1!10675 (_ BitVec 8)) (_2!10675 BitStream!9164)) )
))
(declare-fun lt!365026 () tuple2!19614)

(assert (=> b!227915 (= (_1!10675 lt!365026) (select (arr!6015 (_3!867 lt!365024)) i!761))))

(declare-fun lt!365025 () Unit!17075)

(declare-fun lt!365018 () array!11475)

(declare-fun arrayRangesEqImpliesEq!126 (array!11475 array!11475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17075)

(assert (=> b!227915 (= lt!365025 (arrayRangesEqImpliesEq!126 lt!365018 (_3!867 lt!365024) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11475)

(declare-fun arrayRangesEq!870 (array!11475 array!11475 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227915 (arrayRangesEq!870 arr!308 (_3!867 lt!365024) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365022 () Unit!17075)

(declare-fun arrayRangesEqTransitive!293 (array!11475 array!11475 array!11475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17075)

(assert (=> b!227915 (= lt!365022 (arrayRangesEqTransitive!293 arr!308 lt!365018 (_3!867 lt!365024) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227915 (arrayRangesEq!870 arr!308 lt!365018 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365021 () Unit!17075)

(declare-fun arrayUpdatedAtPrefixLemma!429 (array!11475 (_ BitVec 32) (_ BitVec 8)) Unit!17075)

(assert (=> b!227915 (= lt!365021 (arrayUpdatedAtPrefixLemma!429 arr!308 i!761 (_1!10675 lt!365026)))))

(declare-fun lt!365020 () (_ BitVec 64))

(declare-fun lt!365019 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!9164)

(declare-fun lt!365027 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!365028 () (_ BitVec 64))

(assert (=> b!227915 (and (= (bvadd lt!365020 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365019))) lt!365027) (= (bvadd lt!365028 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365027) (= (buf!5575 thiss!1870) (buf!5575 (_2!10674 lt!365024))) (= (size!5034 arr!308) (size!5034 (_3!867 lt!365024))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227915 (= lt!365027 (bitIndex!0 (size!5034 (buf!5575 (_2!10674 lt!365024))) (currentByte!10425 (_2!10674 lt!365024)) (currentBit!10420 (_2!10674 lt!365024))))))

(assert (=> b!227915 (= lt!365020 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365028))))

(assert (=> b!227915 (= lt!365020 (bitIndex!0 (size!5034 (buf!5575 (_2!10675 lt!365026))) (currentByte!10425 (_2!10675 lt!365026)) (currentBit!10420 (_2!10675 lt!365026))))))

(assert (=> b!227915 (= lt!365028 (bitIndex!0 (size!5034 (buf!5575 thiss!1870)) (currentByte!10425 thiss!1870) (currentBit!10420 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9164 array!11475 (_ BitVec 32) (_ BitVec 32)) tuple3!1450)

(assert (=> b!227915 (= lt!365024 (readByteArrayLoop!0 (_2!10675 lt!365026) lt!365018 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227915 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5034 (buf!5575 (_2!10675 lt!365026)))) ((_ sign_extend 32) (currentByte!10425 (_2!10675 lt!365026))) ((_ sign_extend 32) (currentBit!10420 (_2!10675 lt!365026))) lt!365019)))

(assert (=> b!227915 (= lt!365019 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365023 () Unit!17075)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9164 BitStream!9164 (_ BitVec 64) (_ BitVec 32)) Unit!17075)

(assert (=> b!227915 (= lt!365023 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10675 lt!365026) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227915 (= lt!365018 (array!11476 (store (arr!6015 arr!308) i!761 (_1!10675 lt!365026)) (size!5034 arr!308)))))

(declare-fun readByte!0 (BitStream!9164) tuple2!19614)

(assert (=> b!227915 (= lt!365026 (readByte!0 thiss!1870))))

(declare-fun b!227914 () Bool)

(declare-fun res!191196 () Bool)

(assert (=> b!227914 (=> (not res!191196) (not e!156082))))

(assert (=> b!227914 (= res!191196 (bvslt i!761 to!496))))

(declare-fun b!227913 () Bool)

(declare-fun res!191197 () Bool)

(assert (=> b!227913 (=> (not res!191197) (not e!156082))))

(assert (=> b!227913 (= res!191197 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5034 (buf!5575 thiss!1870))) ((_ sign_extend 32) (currentByte!10425 thiss!1870)) ((_ sign_extend 32) (currentBit!10420 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191195 () Bool)

(assert (=> start!47916 (=> (not res!191195) (not e!156082))))

(assert (=> start!47916 (= res!191195 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5034 arr!308))))))

(assert (=> start!47916 e!156082))

(assert (=> start!47916 true))

(declare-fun array_inv!4775 (array!11475) Bool)

(assert (=> start!47916 (array_inv!4775 arr!308)))

(declare-fun e!156080 () Bool)

(declare-fun inv!12 (BitStream!9164) Bool)

(assert (=> start!47916 (and (inv!12 thiss!1870) e!156080)))

(declare-fun b!227916 () Bool)

(assert (=> b!227916 (= e!156080 (array_inv!4775 (buf!5575 thiss!1870)))))

(assert (= (and start!47916 res!191195) b!227913))

(assert (= (and b!227913 res!191197) b!227914))

(assert (= (and b!227914 res!191196) b!227915))

(assert (= start!47916 b!227916))

(declare-fun m!350887 () Bool)

(assert (=> b!227915 m!350887))

(declare-fun m!350889 () Bool)

(assert (=> b!227915 m!350889))

(declare-fun m!350891 () Bool)

(assert (=> b!227915 m!350891))

(declare-fun m!350893 () Bool)

(assert (=> b!227915 m!350893))

(declare-fun m!350895 () Bool)

(assert (=> b!227915 m!350895))

(declare-fun m!350897 () Bool)

(assert (=> b!227915 m!350897))

(declare-fun m!350899 () Bool)

(assert (=> b!227915 m!350899))

(declare-fun m!350901 () Bool)

(assert (=> b!227915 m!350901))

(declare-fun m!350903 () Bool)

(assert (=> b!227915 m!350903))

(declare-fun m!350905 () Bool)

(assert (=> b!227915 m!350905))

(declare-fun m!350907 () Bool)

(assert (=> b!227915 m!350907))

(declare-fun m!350909 () Bool)

(assert (=> b!227915 m!350909))

(declare-fun m!350911 () Bool)

(assert (=> b!227915 m!350911))

(declare-fun m!350913 () Bool)

(assert (=> b!227915 m!350913))

(declare-fun m!350915 () Bool)

(assert (=> b!227913 m!350915))

(declare-fun m!350917 () Bool)

(assert (=> start!47916 m!350917))

(declare-fun m!350919 () Bool)

(assert (=> start!47916 m!350919))

(declare-fun m!350921 () Bool)

(assert (=> b!227916 m!350921))

(push 1)

(assert (not b!227915))

(assert (not b!227916))

(assert (not start!47916))

(assert (not b!227913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

