; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46844 () Bool)

(assert start!46844)

(declare-fun b!224549 () Bool)

(declare-fun e!153056 () Bool)

(declare-datatypes ((array!11091 0))(
  ( (array!11092 (arr!5818 (Array (_ BitVec 32) (_ BitVec 8))) (size!4867 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8836 0))(
  ( (BitStream!8837 (buf!5411 array!11091) (currentByte!10148 (_ BitVec 32)) (currentBit!10143 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8836)

(declare-fun array_inv!4608 (array!11091) Bool)

(assert (=> b!224549 (= e!153056 (array_inv!4608 (buf!5411 thiss!1870)))))

(declare-fun res!188461 () Bool)

(declare-fun e!153055 () Bool)

(assert (=> start!46844 (=> (not res!188461) (not e!153055))))

(declare-fun arr!308 () array!11091)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46844 (= res!188461 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4867 arr!308))))))

(assert (=> start!46844 e!153055))

(assert (=> start!46844 true))

(assert (=> start!46844 (array_inv!4608 arr!308)))

(declare-fun inv!12 (BitStream!8836) Bool)

(assert (=> start!46844 (and (inv!12 thiss!1870) e!153056)))

(declare-fun b!224548 () Bool)

(declare-datatypes ((Unit!16436 0))(
  ( (Unit!16437) )
))
(declare-datatypes ((tuple3!1260 0))(
  ( (tuple3!1261 (_1!10389 Unit!16436) (_2!10389 BitStream!8836) (_3!772 array!11091)) )
))
(declare-fun lt!356761 () tuple3!1260)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224548 (= e!153055 (not (invariant!0 (currentBit!10143 (_2!10389 lt!356761)) (currentByte!10148 (_2!10389 lt!356761)) (size!4867 (buf!5411 (_2!10389 lt!356761))))))))

(declare-datatypes ((tuple2!19234 0))(
  ( (tuple2!19235 (_1!10390 (_ BitVec 8)) (_2!10390 BitStream!8836)) )
))
(declare-fun lt!356763 () tuple2!19234)

(assert (=> b!224548 (and (= (_1!10390 lt!356763) (select (arr!5818 (_3!772 lt!356761)) i!761)) (= (select (arr!5818 (_3!772 lt!356761)) i!761) (_1!10390 lt!356763)))))

(declare-fun lt!356762 () array!11091)

(declare-fun lt!356767 () Unit!16436)

(declare-fun arrayRangesEqImpliesEq!85 (array!11091 array!11091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16436)

(assert (=> b!224548 (= lt!356767 (arrayRangesEqImpliesEq!85 lt!356762 (_3!772 lt!356761) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!763 (array!11091 array!11091 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224548 (arrayRangesEq!763 arr!308 (_3!772 lt!356761) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356765 () Unit!16436)

(declare-fun arrayRangesEqTransitive!234 (array!11091 array!11091 array!11091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16436)

(assert (=> b!224548 (= lt!356765 (arrayRangesEqTransitive!234 arr!308 lt!356762 (_3!772 lt!356761) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224548 (arrayRangesEq!763 arr!308 lt!356762 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356759 () Unit!16436)

(declare-fun arrayUpdatedAtPrefixLemma!355 (array!11091 (_ BitVec 32) (_ BitVec 8)) Unit!16436)

(assert (=> b!224548 (= lt!356759 (arrayUpdatedAtPrefixLemma!355 arr!308 i!761 (_1!10390 lt!356763)))))

(declare-fun lt!356764 () (_ BitVec 64))

(declare-fun lt!356768 () (_ BitVec 32))

(declare-fun lt!356769 () (_ BitVec 64))

(declare-fun lt!356760 () (_ BitVec 64))

(assert (=> b!224548 (and (= (bvadd lt!356760 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356768))) lt!356764) (= (bvadd lt!356769 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356764) (= (buf!5411 thiss!1870) (buf!5411 (_2!10389 lt!356761))) (= (size!4867 arr!308) (size!4867 (_3!772 lt!356761))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224548 (= lt!356764 (bitIndex!0 (size!4867 (buf!5411 (_2!10389 lt!356761))) (currentByte!10148 (_2!10389 lt!356761)) (currentBit!10143 (_2!10389 lt!356761))))))

(assert (=> b!224548 (= lt!356760 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356769))))

(assert (=> b!224548 (= lt!356760 (bitIndex!0 (size!4867 (buf!5411 (_2!10390 lt!356763))) (currentByte!10148 (_2!10390 lt!356763)) (currentBit!10143 (_2!10390 lt!356763))))))

(assert (=> b!224548 (= lt!356769 (bitIndex!0 (size!4867 (buf!5411 thiss!1870)) (currentByte!10148 thiss!1870) (currentBit!10143 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8836 array!11091 (_ BitVec 32) (_ BitVec 32)) tuple3!1260)

(assert (=> b!224548 (= lt!356761 (readByteArrayLoop!0 (_2!10390 lt!356763) lt!356762 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224548 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10390 lt!356763)))) ((_ sign_extend 32) (currentByte!10148 (_2!10390 lt!356763))) ((_ sign_extend 32) (currentBit!10143 (_2!10390 lt!356763))) lt!356768)))

(assert (=> b!224548 (= lt!356768 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356766 () Unit!16436)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8836 BitStream!8836 (_ BitVec 64) (_ BitVec 32)) Unit!16436)

(assert (=> b!224548 (= lt!356766 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10390 lt!356763) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224548 (= lt!356762 (array!11092 (store (arr!5818 arr!308) i!761 (_1!10390 lt!356763)) (size!4867 arr!308)))))

(declare-fun readByte!0 (BitStream!8836) tuple2!19234)

(assert (=> b!224548 (= lt!356763 (readByte!0 thiss!1870))))

(declare-fun b!224546 () Bool)

(declare-fun res!188463 () Bool)

(assert (=> b!224546 (=> (not res!188463) (not e!153055))))

(assert (=> b!224546 (= res!188463 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4867 (buf!5411 thiss!1870))) ((_ sign_extend 32) (currentByte!10148 thiss!1870)) ((_ sign_extend 32) (currentBit!10143 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224547 () Bool)

(declare-fun res!188462 () Bool)

(assert (=> b!224547 (=> (not res!188462) (not e!153055))))

(assert (=> b!224547 (= res!188462 (bvslt i!761 to!496))))

(assert (= (and start!46844 res!188461) b!224546))

(assert (= (and b!224546 res!188463) b!224547))

(assert (= (and b!224547 res!188462) b!224548))

(assert (= start!46844 b!224549))

(declare-fun m!344837 () Bool)

(assert (=> b!224549 m!344837))

(declare-fun m!344839 () Bool)

(assert (=> start!46844 m!344839))

(declare-fun m!344841 () Bool)

(assert (=> start!46844 m!344841))

(declare-fun m!344843 () Bool)

(assert (=> b!224548 m!344843))

(declare-fun m!344845 () Bool)

(assert (=> b!224548 m!344845))

(declare-fun m!344847 () Bool)

(assert (=> b!224548 m!344847))

(declare-fun m!344849 () Bool)

(assert (=> b!224548 m!344849))

(declare-fun m!344851 () Bool)

(assert (=> b!224548 m!344851))

(declare-fun m!344853 () Bool)

(assert (=> b!224548 m!344853))

(declare-fun m!344855 () Bool)

(assert (=> b!224548 m!344855))

(declare-fun m!344857 () Bool)

(assert (=> b!224548 m!344857))

(declare-fun m!344859 () Bool)

(assert (=> b!224548 m!344859))

(declare-fun m!344861 () Bool)

(assert (=> b!224548 m!344861))

(declare-fun m!344863 () Bool)

(assert (=> b!224548 m!344863))

(declare-fun m!344865 () Bool)

(assert (=> b!224548 m!344865))

(declare-fun m!344867 () Bool)

(assert (=> b!224548 m!344867))

(declare-fun m!344869 () Bool)

(assert (=> b!224548 m!344869))

(declare-fun m!344871 () Bool)

(assert (=> b!224548 m!344871))

(declare-fun m!344873 () Bool)

(assert (=> b!224546 m!344873))

(push 1)

(assert (not start!46844))

(assert (not b!224549))

(assert (not b!224548))

(assert (not b!224546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76150 () Bool)

(assert (=> d!76150 (= (array_inv!4608 arr!308) (bvsge (size!4867 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46844 d!76150))

(declare-fun d!76152 () Bool)

(assert (=> d!76152 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10143 thiss!1870) (currentByte!10148 thiss!1870) (size!4867 (buf!5411 thiss!1870))))))

(declare-fun bs!18580 () Bool)

(assert (= bs!18580 d!76152))

(declare-fun m!344957 () Bool)

(assert (=> bs!18580 m!344957))

(assert (=> start!46844 d!76152))

(declare-fun d!76154 () Bool)

(assert (=> d!76154 (= (array_inv!4608 (buf!5411 thiss!1870)) (bvsge (size!4867 (buf!5411 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!224549 d!76154))

(declare-fun d!76156 () Bool)

(declare-fun res!188487 () Bool)

(declare-fun e!153085 () Bool)

(assert (=> d!76156 (=> res!188487 e!153085)))

(assert (=> d!76156 (= res!188487 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76156 (= (arrayRangesEq!763 arr!308 (_3!772 lt!356761) #b00000000000000000000000000000000 i!761) e!153085)))

(declare-fun b!224578 () Bool)

(declare-fun e!153086 () Bool)

(assert (=> b!224578 (= e!153085 e!153086)))

(declare-fun res!188488 () Bool)

(assert (=> b!224578 (=> (not res!188488) (not e!153086))))

(assert (=> b!224578 (= res!188488 (= (select (arr!5818 arr!308) #b00000000000000000000000000000000) (select (arr!5818 (_3!772 lt!356761)) #b00000000000000000000000000000000)))))

(declare-fun b!224579 () Bool)

(assert (=> b!224579 (= e!153086 (arrayRangesEq!763 arr!308 (_3!772 lt!356761) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76156 (not res!188487)) b!224578))

(assert (= (and b!224578 res!188488) b!224579))

(declare-fun m!344959 () Bool)

(assert (=> b!224578 m!344959))

(declare-fun m!344961 () Bool)

(assert (=> b!224578 m!344961))

(declare-fun m!344963 () Bool)

(assert (=> b!224579 m!344963))

(assert (=> b!224548 d!76156))

(declare-fun d!76158 () Bool)

(declare-fun res!188489 () Bool)

(declare-fun e!153087 () Bool)

(assert (=> d!76158 (=> res!188489 e!153087)))

(assert (=> d!76158 (= res!188489 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76158 (= (arrayRangesEq!763 arr!308 lt!356762 #b00000000000000000000000000000000 i!761) e!153087)))

(declare-fun b!224580 () Bool)

(declare-fun e!153088 () Bool)

(assert (=> b!224580 (= e!153087 e!153088)))

(declare-fun res!188490 () Bool)

(assert (=> b!224580 (=> (not res!188490) (not e!153088))))

(assert (=> b!224580 (= res!188490 (= (select (arr!5818 arr!308) #b00000000000000000000000000000000) (select (arr!5818 lt!356762) #b00000000000000000000000000000000)))))

(declare-fun b!224581 () Bool)

(assert (=> b!224581 (= e!153088 (arrayRangesEq!763 arr!308 lt!356762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76158 (not res!188489)) b!224580))

(assert (= (and b!224580 res!188490) b!224581))

(assert (=> b!224580 m!344959))

(declare-fun m!344965 () Bool)

(assert (=> b!224580 m!344965))

(declare-fun m!344967 () Bool)

(assert (=> b!224581 m!344967))

(assert (=> b!224548 d!76158))

(declare-fun d!76160 () Bool)

(declare-fun lt!356878 () (_ BitVec 8))

(declare-fun lt!356879 () (_ BitVec 8))

(assert (=> d!76160 (= lt!356878 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5818 (buf!5411 thiss!1870)) (currentByte!10148 thiss!1870))) ((_ sign_extend 24) lt!356879))))))

(assert (=> d!76160 (= lt!356879 ((_ extract 7 0) (currentBit!10143 thiss!1870)))))

(declare-fun e!153102 () Bool)

(assert (=> d!76160 e!153102))

(declare-fun res!188506 () Bool)

(assert (=> d!76160 (=> (not res!188506) (not e!153102))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76160 (= res!188506 (validate_offset_bits!1 ((_ sign_extend 32) (size!4867 (buf!5411 thiss!1870))) ((_ sign_extend 32) (currentByte!10148 thiss!1870)) ((_ sign_extend 32) (currentBit!10143 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19242 0))(
  ( (tuple2!19243 (_1!10396 Unit!16436) (_2!10396 (_ BitVec 8))) )
))
(declare-fun Unit!16446 () Unit!16436)

(declare-fun Unit!16447 () Unit!16436)

(assert (=> d!76160 (= (readByte!0 thiss!1870) (tuple2!19235 (_2!10396 (ite (bvsgt ((_ sign_extend 24) lt!356879) #b00000000000000000000000000000000) (tuple2!19243 Unit!16446 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356878) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5818 (buf!5411 thiss!1870)) (bvadd (currentByte!10148 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356879)))))))) (tuple2!19243 Unit!16447 lt!356878))) (BitStream!8837 (buf!5411 thiss!1870) (bvadd (currentByte!10148 thiss!1870) #b00000000000000000000000000000001) (currentBit!10143 thiss!1870))))))

(declare-fun b!224595 () Bool)

(declare-fun e!153103 () Bool)

(assert (=> b!224595 (= e!153102 e!153103)))

(declare-fun res!188505 () Bool)

(assert (=> b!224595 (=> (not res!188505) (not e!153103))))

(declare-fun lt!356877 () tuple2!19234)

(assert (=> b!224595 (= res!188505 (= (buf!5411 (_2!10390 lt!356877)) (buf!5411 thiss!1870)))))

(declare-fun lt!356875 () (_ BitVec 8))

(declare-fun lt!356874 () (_ BitVec 8))

(declare-fun Unit!16448 () Unit!16436)

(declare-fun Unit!16449 () Unit!16436)

(assert (=> b!224595 (= lt!356877 (tuple2!19235 (_2!10396 (ite (bvsgt ((_ sign_extend 24) lt!356875) #b00000000000000000000000000000000) (tuple2!19243 Unit!16448 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356874) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5818 (buf!5411 thiss!1870)) (bvadd (currentByte!10148 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356875)))))))) (tuple2!19243 Unit!16449 lt!356874))) (BitStream!8837 (buf!5411 thiss!1870) (bvadd (currentByte!10148 thiss!1870) #b00000000000000000000000000000001) (currentBit!10143 thiss!1870))))))

(assert (=> b!224595 (= lt!356874 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5818 (buf!5411 thiss!1870)) (currentByte!10148 thiss!1870))) ((_ sign_extend 24) lt!356875))))))

(assert (=> b!224595 (= lt!356875 ((_ extract 7 0) (currentBit!10143 thiss!1870)))))

(declare-fun b!224596 () Bool)

(declare-fun lt!356880 () (_ BitVec 64))

(declare-fun lt!356876 () (_ BitVec 64))

(assert (=> b!224596 (= e!153103 (= (bitIndex!0 (size!4867 (buf!5411 (_2!10390 lt!356877))) (currentByte!10148 (_2!10390 lt!356877)) (currentBit!10143 (_2!10390 lt!356877))) (bvadd lt!356880 lt!356876)))))

(assert (=> b!224596 (or (not (= (bvand lt!356880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356876 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!356880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!356880 lt!356876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!224596 (= lt!356876 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!224596 (= lt!356880 (bitIndex!0 (size!4867 (buf!5411 thiss!1870)) (currentByte!10148 thiss!1870) (currentBit!10143 thiss!1870)))))

(assert (= (and d!76160 res!188506) b!224595))

(assert (= (and b!224595 res!188505) b!224596))

(declare-fun m!344981 () Bool)

(assert (=> d!76160 m!344981))

(declare-fun m!344983 () Bool)

(assert (=> d!76160 m!344983))

(declare-fun m!344985 () Bool)

(assert (=> d!76160 m!344985))

(assert (=> b!224595 m!344985))

(assert (=> b!224595 m!344981))

(declare-fun m!344987 () Bool)

(assert (=> b!224596 m!344987))

(assert (=> b!224596 m!344869))

(assert (=> b!224548 d!76160))

(declare-fun d!76167 () Bool)

(declare-fun e!153120 () Bool)

(assert (=> d!76167 e!153120))

(declare-fun res!188524 () Bool)

(assert (=> d!76167 (=> res!188524 e!153120)))

(assert (=> d!76167 (= res!188524 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!357065 () Bool)

(declare-fun e!153119 () Bool)

(assert (=> d!76167 (= lt!357065 e!153119)))

(declare-fun res!188523 () Bool)

(assert (=> d!76167 (=> (not res!188523) (not e!153119))))

(declare-fun lt!357039 () (_ BitVec 64))

(declare-fun lt!357067 () tuple3!1260)

(declare-fun lt!357053 () (_ BitVec 64))

(assert (=> d!76167 (= res!188523 (= (bvadd lt!357039 lt!357053) (bitIndex!0 (size!4867 (buf!5411 (_2!10389 lt!357067))) (currentByte!10148 (_2!10389 lt!357067)) (currentBit!10143 (_2!10389 lt!357067)))))))

(assert (=> d!76167 (or (not (= (bvand lt!357039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357053 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!357039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!357039 lt!357053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!357063 () (_ BitVec 64))

(assert (=> d!76167 (= lt!357053 (bvmul lt!357063 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76167 (or (= lt!357063 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357063 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357063)))))

(assert (=> d!76167 (= lt!357063 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76167 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76167 (= lt!357039 (bitIndex!0 (size!4867 (buf!5411 (_2!10390 lt!356763))) (currentByte!10148 (_2!10390 lt!356763)) (currentBit!10143 (_2!10390 lt!356763))))))

(declare-fun e!153121 () tuple3!1260)

(assert (=> d!76167 (= lt!357067 e!153121)))

(declare-fun c!11136 () Bool)

(assert (=> d!76167 (= c!11136 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76167 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4867 lt!356762)))))

(assert (=> d!76167 (= (readByteArrayLoop!0 (_2!10390 lt!356763) lt!356762 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!357067)))

(declare-fun call!3625 () Bool)

(declare-fun lt!357051 () tuple3!1260)

(declare-fun bm!3622 () Bool)

(assert (=> bm!3622 (= call!3625 (arrayRangesEq!763 lt!356762 (ite c!11136 (_3!772 lt!357051) lt!356762) #b00000000000000000000000000000000 (ite c!11136 (bvadd #b00000000000000000000000000000001 i!761) (size!4867 lt!356762))))))

(declare-fun b!224620 () Bool)

(assert (=> b!224620 (= e!153119 (arrayRangesEq!763 lt!356762 (_3!772 lt!357067) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3623 () Bool)

(declare-fun call!3626 () (_ BitVec 64))

(assert (=> bm!3623 (= call!3626 (bitIndex!0 (size!4867 (buf!5411 (_2!10390 lt!356763))) (currentByte!10148 (_2!10390 lt!356763)) (currentBit!10143 (_2!10390 lt!356763))))))

(declare-fun b!224621 () Bool)

(declare-datatypes ((tuple2!19244 0))(
  ( (tuple2!19245 (_1!10397 BitStream!8836) (_2!10397 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8836) tuple2!19244)

(assert (=> b!224621 (= e!153120 (= (select (arr!5818 (_3!772 lt!357067)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10397 (readBytePure!0 (_2!10390 lt!356763)))))))

(assert (=> b!224621 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4867 (_3!772 lt!357067))))))

(declare-fun b!224622 () Bool)

(declare-fun lt!357056 () Unit!16436)

(assert (=> b!224622 (= e!153121 (tuple3!1261 lt!357056 (_2!10390 lt!356763) lt!356762))))

(assert (=> b!224622 (= call!3626 call!3626)))

(declare-fun lt!357069 () Unit!16436)

(declare-fun Unit!16457 () Unit!16436)

(assert (=> b!224622 (= lt!357069 Unit!16457)))

(declare-fun lt!357058 () Unit!16436)

(declare-fun arrayRangesEqReflexiveLemma!78 (array!11091) Unit!16436)

(assert (=> b!224622 (= lt!357058 (arrayRangesEqReflexiveLemma!78 lt!356762))))

(assert (=> b!224622 call!3625))

(declare-fun lt!357047 () Unit!16436)

(assert (=> b!224622 (= lt!357047 lt!357058)))

(declare-fun lt!357052 () array!11091)

(assert (=> b!224622 (= lt!357052 lt!356762)))

(declare-fun lt!357057 () array!11091)

(assert (=> b!224622 (= lt!357057 lt!356762)))

(declare-fun lt!357054 () (_ BitVec 32))

(assert (=> b!224622 (= lt!357054 #b00000000000000000000000000000000)))

(declare-fun lt!357061 () (_ BitVec 32))

(assert (=> b!224622 (= lt!357061 (size!4867 lt!356762))))

(declare-fun lt!357066 () (_ BitVec 32))

(assert (=> b!224622 (= lt!357066 #b00000000000000000000000000000000)))

(declare-fun lt!357068 () (_ BitVec 32))

(assert (=> b!224622 (= lt!357068 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!78 (array!11091 array!11091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16436)

(assert (=> b!224622 (= lt!357056 (arrayRangesEqSlicedLemma!78 lt!357052 lt!357057 lt!357054 lt!357061 lt!357066 lt!357068))))

(declare-fun call!3627 () Bool)

(assert (=> b!224622 call!3627))

(declare-fun b!224623 () Bool)

(declare-fun lt!357055 () Unit!16436)

(assert (=> b!224623 (= e!153121 (tuple3!1261 lt!357055 (_2!10389 lt!357051) (_3!772 lt!357051)))))

(declare-fun lt!357037 () tuple2!19234)

(assert (=> b!224623 (= lt!357037 (readByte!0 (_2!10390 lt!356763)))))

(declare-fun lt!357045 () array!11091)

(assert (=> b!224623 (= lt!357045 (array!11092 (store (arr!5818 lt!356762) (bvadd #b00000000000000000000000000000001 i!761) (_1!10390 lt!357037)) (size!4867 lt!356762)))))

(declare-fun lt!357049 () (_ BitVec 64))

(assert (=> b!224623 (= lt!357049 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!357060 () (_ BitVec 32))

(assert (=> b!224623 (= lt!357060 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!357038 () Unit!16436)

(assert (=> b!224623 (= lt!357038 (validateOffsetBytesFromBitIndexLemma!0 (_2!10390 lt!356763) (_2!10390 lt!357037) lt!357049 lt!357060))))

(assert (=> b!224623 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10390 lt!357037)))) ((_ sign_extend 32) (currentByte!10148 (_2!10390 lt!357037))) ((_ sign_extend 32) (currentBit!10143 (_2!10390 lt!357037))) (bvsub lt!357060 ((_ extract 31 0) (bvsdiv (bvadd lt!357049 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!357036 () Unit!16436)

(assert (=> b!224623 (= lt!357036 lt!357038)))

(assert (=> b!224623 (= lt!357051 (readByteArrayLoop!0 (_2!10390 lt!357037) lt!357045 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!224623 (= (bitIndex!0 (size!4867 (buf!5411 (_2!10390 lt!357037))) (currentByte!10148 (_2!10390 lt!357037)) (currentBit!10143 (_2!10390 lt!357037))) (bvadd call!3626 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!357040 () Unit!16436)

(declare-fun Unit!16458 () Unit!16436)

(assert (=> b!224623 (= lt!357040 Unit!16458)))

(assert (=> b!224623 (= (bvadd (bitIndex!0 (size!4867 (buf!5411 (_2!10390 lt!357037))) (currentByte!10148 (_2!10390 lt!357037)) (currentBit!10143 (_2!10390 lt!357037))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4867 (buf!5411 (_2!10389 lt!357051))) (currentByte!10148 (_2!10389 lt!357051)) (currentBit!10143 (_2!10389 lt!357051))))))

(declare-fun lt!357059 () Unit!16436)

(declare-fun Unit!16459 () Unit!16436)

(assert (=> b!224623 (= lt!357059 Unit!16459)))

(assert (=> b!224623 (= (bvadd call!3626 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4867 (buf!5411 (_2!10389 lt!357051))) (currentByte!10148 (_2!10389 lt!357051)) (currentBit!10143 (_2!10389 lt!357051))))))

(declare-fun lt!357035 () Unit!16436)

(declare-fun Unit!16460 () Unit!16436)

(assert (=> b!224623 (= lt!357035 Unit!16460)))

(assert (=> b!224623 (and (= (buf!5411 (_2!10390 lt!356763)) (buf!5411 (_2!10389 lt!357051))) (= (size!4867 lt!356762) (size!4867 (_3!772 lt!357051))))))

(declare-fun lt!357034 () Unit!16436)

(declare-fun Unit!16461 () Unit!16436)

(assert (=> b!224623 (= lt!357034 Unit!16461)))

(declare-fun lt!357044 () Unit!16436)

(assert (=> b!224623 (= lt!357044 (arrayUpdatedAtPrefixLemma!355 lt!356762 (bvadd #b00000000000000000000000000000001 i!761) (_1!10390 lt!357037)))))

(assert (=> b!224623 (arrayRangesEq!763 lt!356762 (array!11092 (store (arr!5818 lt!356762) (bvadd #b00000000000000000000000000000001 i!761) (_1!10390 lt!357037)) (size!4867 lt!356762)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!357048 () Unit!16436)

(assert (=> b!224623 (= lt!357048 lt!357044)))

(declare-fun lt!357042 () (_ BitVec 32))

(assert (=> b!224623 (= lt!357042 #b00000000000000000000000000000000)))

(declare-fun lt!357046 () Unit!16436)

(assert (=> b!224623 (= lt!357046 (arrayRangesEqTransitive!234 lt!356762 lt!357045 (_3!772 lt!357051) lt!357042 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224623 call!3627))

(declare-fun lt!357064 () Unit!16436)

(assert (=> b!224623 (= lt!357064 lt!357046)))

(assert (=> b!224623 call!3625))

(declare-fun lt!357050 () Unit!16436)

(declare-fun Unit!16462 () Unit!16436)

(assert (=> b!224623 (= lt!357050 Unit!16462)))

(declare-fun lt!357041 () Unit!16436)

(assert (=> b!224623 (= lt!357041 (arrayRangesEqImpliesEq!85 lt!357045 (_3!772 lt!357051) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224623 (= (select (store (arr!5818 lt!356762) (bvadd #b00000000000000000000000000000001 i!761) (_1!10390 lt!357037)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5818 (_3!772 lt!357051)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!357043 () Unit!16436)

(assert (=> b!224623 (= lt!357043 lt!357041)))

(declare-fun lt!357062 () Bool)

(assert (=> b!224623 (= lt!357062 (= (select (arr!5818 (_3!772 lt!357051)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10390 lt!357037)))))

(declare-fun Unit!16463 () Unit!16436)

(assert (=> b!224623 (= lt!357055 Unit!16463)))

(assert (=> b!224623 lt!357062))

(declare-fun b!224624 () Bool)

(declare-fun res!188522 () Bool)

(assert (=> b!224624 (=> (not res!188522) (not e!153119))))

(assert (=> b!224624 (= res!188522 (and (= (buf!5411 (_2!10390 lt!356763)) (buf!5411 (_2!10389 lt!357067))) (= (size!4867 lt!356762) (size!4867 (_3!772 lt!357067)))))))

(declare-fun bm!3624 () Bool)

(assert (=> bm!3624 (= call!3627 (arrayRangesEq!763 (ite c!11136 lt!356762 lt!357052) (ite c!11136 (_3!772 lt!357051) lt!357057) (ite c!11136 lt!357042 lt!357066) (ite c!11136 (bvadd #b00000000000000000000000000000001 i!761) lt!357068)))))

(assert (= (and d!76167 c!11136) b!224623))

(assert (= (and d!76167 (not c!11136)) b!224622))

(assert (= (or b!224623 b!224622) bm!3622))

(assert (= (or b!224623 b!224622) bm!3624))

(assert (= (or b!224623 b!224622) bm!3623))

(assert (= (and d!76167 res!188523) b!224624))

(assert (= (and b!224624 res!188522) b!224620))

(assert (= (and d!76167 (not res!188524)) b!224621))

(declare-fun m!344997 () Bool)

(assert (=> b!224622 m!344997))

(declare-fun m!344999 () Bool)

(assert (=> b!224622 m!344999))

(declare-fun m!345001 () Bool)

(assert (=> bm!3622 m!345001))

(declare-fun m!345003 () Bool)

(assert (=> b!224623 m!345003))

(declare-fun m!345005 () Bool)

(assert (=> b!224623 m!345005))

(declare-fun m!345007 () Bool)

(assert (=> b!224623 m!345007))

(declare-fun m!345009 () Bool)

(assert (=> b!224623 m!345009))

(declare-fun m!345011 () Bool)

(assert (=> b!224623 m!345011))

(declare-fun m!345013 () Bool)

(assert (=> b!224623 m!345013))

(declare-fun m!345015 () Bool)

(assert (=> b!224623 m!345015))

(declare-fun m!345017 () Bool)

(assert (=> b!224623 m!345017))

(declare-fun m!345019 () Bool)

(assert (=> b!224623 m!345019))

(declare-fun m!345021 () Bool)

(assert (=> b!224623 m!345021))

(declare-fun m!345023 () Bool)

(assert (=> b!224623 m!345023))

(declare-fun m!345025 () Bool)

(assert (=> b!224623 m!345025))

(declare-fun m!345027 () Bool)

(assert (=> b!224623 m!345027))

(declare-fun m!345029 () Bool)

(assert (=> bm!3624 m!345029))

(declare-fun m!345031 () Bool)

(assert (=> d!76167 m!345031))

(assert (=> d!76167 m!344861))

(assert (=> bm!3623 m!344861))

(declare-fun m!345033 () Bool)

(assert (=> b!224620 m!345033))

(declare-fun m!345035 () Bool)

(assert (=> b!224621 m!345035))

(declare-fun m!345037 () Bool)

(assert (=> b!224621 m!345037))

(assert (=> b!224548 d!76167))

(declare-fun d!76179 () Bool)

(assert (=> d!76179 (arrayRangesEq!763 arr!308 (_3!772 lt!356761) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357072 () Unit!16436)

(declare-fun choose!291 (array!11091 array!11091 array!11091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16436)

(assert (=> d!76179 (= lt!357072 (choose!291 arr!308 lt!356762 (_3!772 lt!356761) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76179 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76179 (= (arrayRangesEqTransitive!234 arr!308 lt!356762 (_3!772 lt!356761) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!357072)))

(declare-fun bs!18583 () Bool)

(assert (= bs!18583 d!76179))

(assert (=> bs!18583 m!344849))

(declare-fun m!345039 () Bool)

(assert (=> bs!18583 m!345039))

(assert (=> b!224548 d!76179))

(declare-fun d!76181 () Bool)

(declare-fun e!153127 () Bool)

(assert (=> d!76181 e!153127))

(declare-fun res!188532 () Bool)

(assert (=> d!76181 (=> (not res!188532) (not e!153127))))

(declare-fun lt!357124 () (_ BitVec 64))

(declare-fun lt!357125 () (_ BitVec 64))

(declare-fun lt!357126 () (_ BitVec 64))

(assert (=> d!76181 (= res!188532 (= lt!357124 (bvsub lt!357125 lt!357126)))))

(assert (=> d!76181 (or (= (bvand lt!357125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357125 lt!357126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76181 (= lt!357126 (remainingBits!0 ((_ sign_extend 32) (size!4867 (buf!5411 thiss!1870))) ((_ sign_extend 32) (currentByte!10148 thiss!1870)) ((_ sign_extend 32) (currentBit!10143 thiss!1870))))))

(declare-fun lt!357121 () (_ BitVec 64))

(declare-fun lt!357122 () (_ BitVec 64))

(assert (=> d!76181 (= lt!357125 (bvmul lt!357121 lt!357122))))

(assert (=> d!76181 (or (= lt!357121 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357122 (bvsdiv (bvmul lt!357121 lt!357122) lt!357121)))))

(assert (=> d!76181 (= lt!357122 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76181 (= lt!357121 ((_ sign_extend 32) (size!4867 (buf!5411 thiss!1870))))))

(assert (=> d!76181 (= lt!357124 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10148 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10143 thiss!1870))))))

(assert (=> d!76181 (invariant!0 (currentBit!10143 thiss!1870) (currentByte!10148 thiss!1870) (size!4867 (buf!5411 thiss!1870)))))

(assert (=> d!76181 (= (bitIndex!0 (size!4867 (buf!5411 thiss!1870)) (currentByte!10148 thiss!1870) (currentBit!10143 thiss!1870)) lt!357124)))

(declare-fun b!224634 () Bool)

(declare-fun res!188533 () Bool)

(assert (=> b!224634 (=> (not res!188533) (not e!153127))))

(assert (=> b!224634 (= res!188533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357124))))

(declare-fun b!224635 () Bool)

(declare-fun lt!357123 () (_ BitVec 64))

(assert (=> b!224635 (= e!153127 (bvsle lt!357124 (bvmul lt!357123 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224635 (or (= lt!357123 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357123 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357123)))))

(assert (=> b!224635 (= lt!357123 ((_ sign_extend 32) (size!4867 (buf!5411 thiss!1870))))))

(assert (= (and d!76181 res!188532) b!224634))

(assert (= (and b!224634 res!188533) b!224635))

(declare-fun m!345083 () Bool)

(assert (=> d!76181 m!345083))

(assert (=> d!76181 m!344957))

(assert (=> b!224548 d!76181))

(declare-fun d!76185 () Bool)

(assert (=> d!76185 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4867 lt!356762)) (bvslt i!761 (size!4867 (_3!772 lt!356761))) (= (select (arr!5818 lt!356762) i!761) (select (arr!5818 (_3!772 lt!356761)) i!761)))))

(declare-fun lt!357147 () Unit!16436)

(declare-fun choose!292 (array!11091 array!11091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16436)

(assert (=> d!76185 (= lt!357147 (choose!292 lt!356762 (_3!772 lt!356761) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76185 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76185 (= (arrayRangesEqImpliesEq!85 lt!356762 (_3!772 lt!356761) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!357147)))

(declare-fun bs!18584 () Bool)

(assert (= bs!18584 d!76185))

(declare-fun m!345085 () Bool)

(assert (=> bs!18584 m!345085))

(assert (=> bs!18584 m!344851))

(declare-fun m!345087 () Bool)

(assert (=> bs!18584 m!345087))

(assert (=> b!224548 d!76185))

(declare-fun d!76189 () Bool)

(declare-fun e!153143 () Bool)

(assert (=> d!76189 e!153143))

(declare-fun res!188554 () Bool)

(assert (=> d!76189 (=> (not res!188554) (not e!153143))))

(assert (=> d!76189 (= res!188554 (and (or (let ((rhs!3760 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3760 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3760) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76192 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76192 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76192 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3759 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3759 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3759) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!357172 () Unit!16436)

(declare-fun choose!57 (BitStream!8836 BitStream!8836 (_ BitVec 64) (_ BitVec 32)) Unit!16436)

(assert (=> d!76189 (= lt!357172 (choose!57 thiss!1870 (_2!10390 lt!356763) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76189 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10390 lt!356763) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!357172)))

(declare-fun lt!357173 () (_ BitVec 32))

(declare-fun b!224656 () Bool)

(assert (=> b!224656 (= e!153143 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10390 lt!356763)))) ((_ sign_extend 32) (currentByte!10148 (_2!10390 lt!356763))) ((_ sign_extend 32) (currentBit!10143 (_2!10390 lt!356763))) (bvsub (bvsub to!496 i!761) lt!357173)))))

(assert (=> b!224656 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!357173 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!357173) #b10000000000000000000000000000000)))))

(declare-fun lt!357171 () (_ BitVec 64))

(assert (=> b!224656 (= lt!357173 ((_ extract 31 0) lt!357171))))

(assert (=> b!224656 (and (bvslt lt!357171 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!357171 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!224656 (= lt!357171 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76189 res!188554) b!224656))

(declare-fun m!345105 () Bool)

(assert (=> d!76189 m!345105))

(declare-fun m!345107 () Bool)

(assert (=> b!224656 m!345107))

(assert (=> b!224548 d!76189))

(declare-fun d!76204 () Bool)

(declare-fun e!153144 () Bool)

(assert (=> d!76204 e!153144))

(declare-fun res!188555 () Bool)

(assert (=> d!76204 (=> (not res!188555) (not e!153144))))

(declare-fun lt!357178 () (_ BitVec 64))

(declare-fun lt!357179 () (_ BitVec 64))

(declare-fun lt!357180 () (_ BitVec 64))

(assert (=> d!76204 (= res!188555 (= lt!357178 (bvsub lt!357179 lt!357180)))))

(assert (=> d!76204 (or (= (bvand lt!357179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357180 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357179 lt!357180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76204 (= lt!357180 (remainingBits!0 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10390 lt!356763)))) ((_ sign_extend 32) (currentByte!10148 (_2!10390 lt!356763))) ((_ sign_extend 32) (currentBit!10143 (_2!10390 lt!356763)))))))

(declare-fun lt!357175 () (_ BitVec 64))

(declare-fun lt!357176 () (_ BitVec 64))

(assert (=> d!76204 (= lt!357179 (bvmul lt!357175 lt!357176))))

(assert (=> d!76204 (or (= lt!357175 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357176 (bvsdiv (bvmul lt!357175 lt!357176) lt!357175)))))

(assert (=> d!76204 (= lt!357176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76204 (= lt!357175 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10390 lt!356763)))))))

(assert (=> d!76204 (= lt!357178 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10148 (_2!10390 lt!356763))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10143 (_2!10390 lt!356763)))))))

(assert (=> d!76204 (invariant!0 (currentBit!10143 (_2!10390 lt!356763)) (currentByte!10148 (_2!10390 lt!356763)) (size!4867 (buf!5411 (_2!10390 lt!356763))))))

(assert (=> d!76204 (= (bitIndex!0 (size!4867 (buf!5411 (_2!10390 lt!356763))) (currentByte!10148 (_2!10390 lt!356763)) (currentBit!10143 (_2!10390 lt!356763))) lt!357178)))

(declare-fun b!224657 () Bool)

(declare-fun res!188556 () Bool)

(assert (=> b!224657 (=> (not res!188556) (not e!153144))))

(assert (=> b!224657 (= res!188556 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357178))))

(declare-fun b!224658 () Bool)

(declare-fun lt!357177 () (_ BitVec 64))

(assert (=> b!224658 (= e!153144 (bvsle lt!357178 (bvmul lt!357177 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224658 (or (= lt!357177 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357177 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357177)))))

(assert (=> b!224658 (= lt!357177 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10390 lt!356763)))))))

(assert (= (and d!76204 res!188555) b!224657))

(assert (= (and b!224657 res!188556) b!224658))

(declare-fun m!345113 () Bool)

(assert (=> d!76204 m!345113))

(declare-fun m!345115 () Bool)

(assert (=> d!76204 m!345115))

(assert (=> b!224548 d!76204))

(declare-fun d!76206 () Bool)

(assert (=> d!76206 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10390 lt!356763)))) ((_ sign_extend 32) (currentByte!10148 (_2!10390 lt!356763))) ((_ sign_extend 32) (currentBit!10143 (_2!10390 lt!356763))) lt!356768) (bvsle ((_ sign_extend 32) lt!356768) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10390 lt!356763)))) ((_ sign_extend 32) (currentByte!10148 (_2!10390 lt!356763))) ((_ sign_extend 32) (currentBit!10143 (_2!10390 lt!356763)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18587 () Bool)

(assert (= bs!18587 d!76206))

(assert (=> bs!18587 m!345113))

(assert (=> b!224548 d!76206))

(declare-fun d!76208 () Bool)

(assert (=> d!76208 (= (invariant!0 (currentBit!10143 (_2!10389 lt!356761)) (currentByte!10148 (_2!10389 lt!356761)) (size!4867 (buf!5411 (_2!10389 lt!356761)))) (and (bvsge (currentBit!10143 (_2!10389 lt!356761)) #b00000000000000000000000000000000) (bvslt (currentBit!10143 (_2!10389 lt!356761)) #b00000000000000000000000000001000) (bvsge (currentByte!10148 (_2!10389 lt!356761)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10148 (_2!10389 lt!356761)) (size!4867 (buf!5411 (_2!10389 lt!356761)))) (and (= (currentBit!10143 (_2!10389 lt!356761)) #b00000000000000000000000000000000) (= (currentByte!10148 (_2!10389 lt!356761)) (size!4867 (buf!5411 (_2!10389 lt!356761))))))))))

(assert (=> b!224548 d!76208))

(declare-fun d!76210 () Bool)

(declare-fun e!153145 () Bool)

(assert (=> d!76210 e!153145))

(declare-fun res!188557 () Bool)

(assert (=> d!76210 (=> (not res!188557) (not e!153145))))

(declare-fun lt!357185 () (_ BitVec 64))

(declare-fun lt!357186 () (_ BitVec 64))

(declare-fun lt!357184 () (_ BitVec 64))

(assert (=> d!76210 (= res!188557 (= lt!357184 (bvsub lt!357185 lt!357186)))))

(assert (=> d!76210 (or (= (bvand lt!357185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357186 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357185 lt!357186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76210 (= lt!357186 (remainingBits!0 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10389 lt!356761)))) ((_ sign_extend 32) (currentByte!10148 (_2!10389 lt!356761))) ((_ sign_extend 32) (currentBit!10143 (_2!10389 lt!356761)))))))

(declare-fun lt!357181 () (_ BitVec 64))

(declare-fun lt!357182 () (_ BitVec 64))

(assert (=> d!76210 (= lt!357185 (bvmul lt!357181 lt!357182))))

(assert (=> d!76210 (or (= lt!357181 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357182 (bvsdiv (bvmul lt!357181 lt!357182) lt!357181)))))

(assert (=> d!76210 (= lt!357182 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76210 (= lt!357181 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10389 lt!356761)))))))

(assert (=> d!76210 (= lt!357184 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10148 (_2!10389 lt!356761))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10143 (_2!10389 lt!356761)))))))

(assert (=> d!76210 (invariant!0 (currentBit!10143 (_2!10389 lt!356761)) (currentByte!10148 (_2!10389 lt!356761)) (size!4867 (buf!5411 (_2!10389 lt!356761))))))

(assert (=> d!76210 (= (bitIndex!0 (size!4867 (buf!5411 (_2!10389 lt!356761))) (currentByte!10148 (_2!10389 lt!356761)) (currentBit!10143 (_2!10389 lt!356761))) lt!357184)))

(declare-fun b!224659 () Bool)

(declare-fun res!188558 () Bool)

(assert (=> b!224659 (=> (not res!188558) (not e!153145))))

(assert (=> b!224659 (= res!188558 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357184))))

(declare-fun b!224660 () Bool)

(declare-fun lt!357183 () (_ BitVec 64))

(assert (=> b!224660 (= e!153145 (bvsle lt!357184 (bvmul lt!357183 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224660 (or (= lt!357183 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357183 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357183)))))

(assert (=> b!224660 (= lt!357183 ((_ sign_extend 32) (size!4867 (buf!5411 (_2!10389 lt!356761)))))))

(assert (= (and d!76210 res!188557) b!224659))

(assert (= (and b!224659 res!188558) b!224660))

(declare-fun m!345117 () Bool)

(assert (=> d!76210 m!345117))

(assert (=> d!76210 m!344859))

(assert (=> b!224548 d!76210))

(declare-fun d!76212 () Bool)

(declare-fun e!153148 () Bool)

(assert (=> d!76212 e!153148))

(declare-fun res!188561 () Bool)

(assert (=> d!76212 (=> (not res!188561) (not e!153148))))

(assert (=> d!76212 (= res!188561 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4867 arr!308))))))

(declare-fun lt!357189 () Unit!16436)

(declare-fun choose!294 (array!11091 (_ BitVec 32) (_ BitVec 8)) Unit!16436)

(assert (=> d!76212 (= lt!357189 (choose!294 arr!308 i!761 (_1!10390 lt!356763)))))

(assert (=> d!76212 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!4867 arr!308)))))

(assert (=> d!76212 (= (arrayUpdatedAtPrefixLemma!355 arr!308 i!761 (_1!10390 lt!356763)) lt!357189)))

(declare-fun b!224663 () Bool)

(assert (=> b!224663 (= e!153148 (arrayRangesEq!763 arr!308 (array!11092 (store (arr!5818 arr!308) i!761 (_1!10390 lt!356763)) (size!4867 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!76212 res!188561) b!224663))

(declare-fun m!345119 () Bool)

(assert (=> d!76212 m!345119))

(assert (=> b!224663 m!344865))

(declare-fun m!345121 () Bool)

(assert (=> b!224663 m!345121))

(assert (=> b!224548 d!76212))

(declare-fun d!76214 () Bool)

(assert (=> d!76214 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4867 (buf!5411 thiss!1870))) ((_ sign_extend 32) (currentByte!10148 thiss!1870)) ((_ sign_extend 32) (currentBit!10143 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4867 (buf!5411 thiss!1870))) ((_ sign_extend 32) (currentByte!10148 thiss!1870)) ((_ sign_extend 32) (currentBit!10143 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18588 () Bool)

(assert (= bs!18588 d!76214))

(assert (=> bs!18588 m!345083))

(assert (=> b!224546 d!76214))

(push 1)

(assert (not d!76206))

(assert (not d!76152))

(assert (not b!224596))

(assert (not bm!3622))

(assert (not d!76179))

(assert (not b!224663))

(assert (not d!76160))

(assert (not b!224579))

(assert (not d!76181))

(assert (not b!224656))

(assert (not b!224620))

(assert (not d!76214))

(assert (not b!224621))

(assert (not d!76185))

(assert (not b!224581))

(assert (not bm!3624))

(assert (not d!76189))

(assert (not b!224622))

(assert (not bm!3623))

(assert (not d!76204))

(assert (not d!76212))

(assert (not d!76210))

(assert (not d!76167))

(assert (not b!224623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

