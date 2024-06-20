; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47556 () Bool)

(assert start!47556)

(declare-fun lt!360884 () (_ BitVec 64))

(declare-datatypes ((array!11340 0))(
  ( (array!11341 (arr!5940 (Array (_ BitVec 32) (_ BitVec 8))) (size!4974 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9044 0))(
  ( (BitStream!9045 (buf!5515 array!11340) (currentByte!10335 (_ BitVec 32)) (currentBit!10330 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16792 0))(
  ( (Unit!16793) )
))
(declare-datatypes ((tuple3!1330 0))(
  ( (tuple3!1331 (_1!10524 Unit!16792) (_2!10524 BitStream!9044) (_3!807 array!11340)) )
))
(declare-fun lt!360887 () tuple3!1330)

(declare-fun lt!360886 () (_ BitVec 32))

(declare-fun e!154900 () Bool)

(declare-fun b!226568 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226568 (= e!154900 (not (= (bvadd lt!360884 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!360886))) (bitIndex!0 (size!4974 (buf!5515 (_2!10524 lt!360887))) (currentByte!10335 (_2!10524 lt!360887)) (currentBit!10330 (_2!10524 lt!360887))))))))

(declare-fun lt!360888 () (_ BitVec 64))

(assert (=> b!226568 (= lt!360884 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!360888))))

(declare-datatypes ((tuple2!19434 0))(
  ( (tuple2!19435 (_1!10525 (_ BitVec 8)) (_2!10525 BitStream!9044)) )
))
(declare-fun lt!360885 () tuple2!19434)

(assert (=> b!226568 (= lt!360884 (bitIndex!0 (size!4974 (buf!5515 (_2!10525 lt!360885))) (currentByte!10335 (_2!10525 lt!360885)) (currentBit!10330 (_2!10525 lt!360885))))))

(declare-fun thiss!1870 () BitStream!9044)

(assert (=> b!226568 (= lt!360888 (bitIndex!0 (size!4974 (buf!5515 thiss!1870)) (currentByte!10335 thiss!1870) (currentBit!10330 thiss!1870)))))

(declare-fun arr!308 () array!11340)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!9044 array!11340 (_ BitVec 32) (_ BitVec 32)) tuple3!1330)

(assert (=> b!226568 (= lt!360887 (readByteArrayLoop!0 (_2!10525 lt!360885) (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226568 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10525 lt!360885)))) ((_ sign_extend 32) (currentByte!10335 (_2!10525 lt!360885))) ((_ sign_extend 32) (currentBit!10330 (_2!10525 lt!360885))) lt!360886)))

(assert (=> b!226568 (= lt!360886 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360883 () Unit!16792)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9044 BitStream!9044 (_ BitVec 64) (_ BitVec 32)) Unit!16792)

(assert (=> b!226568 (= lt!360883 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10525 lt!360885) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9044) tuple2!19434)

(assert (=> b!226568 (= lt!360885 (readByte!0 thiss!1870))))

(declare-fun b!226569 () Bool)

(declare-fun e!154899 () Bool)

(declare-fun array_inv!4715 (array!11340) Bool)

(assert (=> b!226569 (= e!154899 (array_inv!4715 (buf!5515 thiss!1870)))))

(declare-fun b!226567 () Bool)

(declare-fun res!190103 () Bool)

(assert (=> b!226567 (=> (not res!190103) (not e!154900))))

(assert (=> b!226567 (= res!190103 (bvslt i!761 to!496))))

(declare-fun b!226566 () Bool)

(declare-fun res!190105 () Bool)

(assert (=> b!226566 (=> (not res!190105) (not e!154900))))

(assert (=> b!226566 (= res!190105 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4974 (buf!5515 thiss!1870))) ((_ sign_extend 32) (currentByte!10335 thiss!1870)) ((_ sign_extend 32) (currentBit!10330 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190104 () Bool)

(assert (=> start!47556 (=> (not res!190104) (not e!154900))))

(assert (=> start!47556 (= res!190104 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4974 arr!308))))))

(assert (=> start!47556 e!154900))

(assert (=> start!47556 true))

(assert (=> start!47556 (array_inv!4715 arr!308)))

(declare-fun inv!12 (BitStream!9044) Bool)

(assert (=> start!47556 (and (inv!12 thiss!1870) e!154899)))

(assert (= (and start!47556 res!190104) b!226566))

(assert (= (and b!226566 res!190105) b!226567))

(assert (= (and b!226567 res!190103) b!226568))

(assert (= start!47556 b!226569))

(declare-fun m!348085 () Bool)

(assert (=> b!226568 m!348085))

(declare-fun m!348087 () Bool)

(assert (=> b!226568 m!348087))

(declare-fun m!348089 () Bool)

(assert (=> b!226568 m!348089))

(declare-fun m!348091 () Bool)

(assert (=> b!226568 m!348091))

(declare-fun m!348093 () Bool)

(assert (=> b!226568 m!348093))

(declare-fun m!348095 () Bool)

(assert (=> b!226568 m!348095))

(declare-fun m!348097 () Bool)

(assert (=> b!226568 m!348097))

(declare-fun m!348099 () Bool)

(assert (=> b!226568 m!348099))

(declare-fun m!348101 () Bool)

(assert (=> b!226569 m!348101))

(declare-fun m!348103 () Bool)

(assert (=> b!226566 m!348103))

(declare-fun m!348105 () Bool)

(assert (=> start!47556 m!348105))

(declare-fun m!348107 () Bool)

(assert (=> start!47556 m!348107))

(push 1)

(assert (not b!226568))

(assert (not b!226569))

(assert (not start!47556))

(assert (not b!226566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76907 () Bool)

(declare-fun e!154907 () Bool)

(assert (=> d!76907 e!154907))

(declare-fun res!190119 () Bool)

(assert (=> d!76907 (=> (not res!190119) (not e!154907))))

(declare-fun lt!360928 () (_ BitVec 64))

(declare-fun lt!360926 () (_ BitVec 64))

(declare-fun lt!360925 () (_ BitVec 64))

(assert (=> d!76907 (= res!190119 (= lt!360925 (bvsub lt!360926 lt!360928)))))

(assert (=> d!76907 (or (= (bvand lt!360926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360928 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360926 lt!360928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76907 (= lt!360928 (remainingBits!0 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10525 lt!360885)))) ((_ sign_extend 32) (currentByte!10335 (_2!10525 lt!360885))) ((_ sign_extend 32) (currentBit!10330 (_2!10525 lt!360885)))))))

(declare-fun lt!360927 () (_ BitVec 64))

(declare-fun lt!360930 () (_ BitVec 64))

(assert (=> d!76907 (= lt!360926 (bvmul lt!360927 lt!360930))))

(assert (=> d!76907 (or (= lt!360927 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360930 (bvsdiv (bvmul lt!360927 lt!360930) lt!360927)))))

(assert (=> d!76907 (= lt!360930 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76907 (= lt!360927 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10525 lt!360885)))))))

(assert (=> d!76907 (= lt!360925 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10335 (_2!10525 lt!360885))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10330 (_2!10525 lt!360885)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76907 (invariant!0 (currentBit!10330 (_2!10525 lt!360885)) (currentByte!10335 (_2!10525 lt!360885)) (size!4974 (buf!5515 (_2!10525 lt!360885))))))

(assert (=> d!76907 (= (bitIndex!0 (size!4974 (buf!5515 (_2!10525 lt!360885))) (currentByte!10335 (_2!10525 lt!360885)) (currentBit!10330 (_2!10525 lt!360885))) lt!360925)))

(declare-fun b!226582 () Bool)

(declare-fun res!190120 () Bool)

(assert (=> b!226582 (=> (not res!190120) (not e!154907))))

(assert (=> b!226582 (= res!190120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360925))))

(declare-fun b!226583 () Bool)

(declare-fun lt!360929 () (_ BitVec 64))

(assert (=> b!226583 (= e!154907 (bvsle lt!360925 (bvmul lt!360929 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226583 (or (= lt!360929 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360929 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360929)))))

(assert (=> b!226583 (= lt!360929 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10525 lt!360885)))))))

(assert (= (and d!76907 res!190119) b!226582))

(assert (= (and b!226582 res!190120) b!226583))

(declare-fun m!348121 () Bool)

(assert (=> d!76907 m!348121))

(declare-fun m!348123 () Bool)

(assert (=> d!76907 m!348123))

(assert (=> b!226568 d!76907))

(declare-fun call!3756 () (_ BitVec 64))

(declare-fun bm!3751 () Bool)

(declare-fun c!11179 () Bool)

(declare-fun lt!361080 () tuple2!19434)

(assert (=> bm!3751 (= call!3756 (bitIndex!0 (ite c!11179 (size!4974 (buf!5515 (_2!10525 lt!361080))) (size!4974 (buf!5515 (_2!10525 lt!360885)))) (ite c!11179 (currentByte!10335 (_2!10525 lt!361080)) (currentByte!10335 (_2!10525 lt!360885))) (ite c!11179 (currentBit!10330 (_2!10525 lt!361080)) (currentBit!10330 (_2!10525 lt!360885)))))))

(declare-fun bm!3752 () Bool)

(declare-fun lt!361064 () tuple3!1330)

(declare-fun call!3755 () Bool)

(declare-fun arrayRangesEq!820 (array!11340 array!11340 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3752 (= call!3755 (arrayRangesEq!820 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)) (ite c!11179 (_3!807 lt!361064) (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))) #b00000000000000000000000000000000 (ite c!11179 (bvadd #b00000000000000000000000000000001 i!761) (size!4974 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))))))))

(declare-fun lt!361086 () tuple3!1330)

(declare-fun e!154930 () Bool)

(declare-fun b!226613 () Bool)

(assert (=> b!226613 (= e!154930 (arrayRangesEq!820 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)) (_3!807 lt!361086) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!226614 () Bool)

(declare-fun res!190146 () Bool)

(assert (=> b!226614 (=> (not res!190146) (not e!154930))))

(assert (=> b!226614 (= res!190146 (and (= (buf!5515 (_2!10525 lt!360885)) (buf!5515 (_2!10524 lt!361086))) (= (size!4974 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))) (size!4974 (_3!807 lt!361086)))))))

(declare-fun b!226615 () Bool)

(declare-fun lt!361095 () Unit!16792)

(declare-fun e!154928 () tuple3!1330)

(assert (=> b!226615 (= e!154928 (tuple3!1331 lt!361095 (_2!10525 lt!360885) (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))))))

(assert (=> b!226615 (= call!3756 call!3756)))

(declare-fun lt!361078 () Unit!16792)

(declare-fun Unit!16798 () Unit!16792)

(assert (=> b!226615 (= lt!361078 Unit!16798)))

(declare-fun lt!361088 () Unit!16792)

(declare-fun arrayRangesEqReflexiveLemma!124 (array!11340) Unit!16792)

(assert (=> b!226615 (= lt!361088 (arrayRangesEqReflexiveLemma!124 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))))))

(assert (=> b!226615 call!3755))

(declare-fun lt!361091 () Unit!16792)

(assert (=> b!226615 (= lt!361091 lt!361088)))

(declare-fun lt!361097 () array!11340)

(assert (=> b!226615 (= lt!361097 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)))))

(declare-fun lt!361084 () array!11340)

(assert (=> b!226615 (= lt!361084 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)))))

(declare-fun lt!361098 () (_ BitVec 32))

(assert (=> b!226615 (= lt!361098 #b00000000000000000000000000000000)))

(declare-fun lt!361082 () (_ BitVec 32))

(assert (=> b!226615 (= lt!361082 (size!4974 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))))))

(declare-fun lt!361069 () (_ BitVec 32))

(assert (=> b!226615 (= lt!361069 #b00000000000000000000000000000000)))

(declare-fun lt!361093 () (_ BitVec 32))

(assert (=> b!226615 (= lt!361093 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!109 (array!11340 array!11340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16792)

(assert (=> b!226615 (= lt!361095 (arrayRangesEqSlicedLemma!109 lt!361097 lt!361084 lt!361098 lt!361082 lt!361069 lt!361093))))

(declare-fun call!3754 () Bool)

(assert (=> b!226615 call!3754))

(declare-fun d!76913 () Bool)

(declare-fun e!154929 () Bool)

(assert (=> d!76913 e!154929))

(declare-fun res!190147 () Bool)

(assert (=> d!76913 (=> res!190147 e!154929)))

(assert (=> d!76913 (= res!190147 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!361068 () Bool)

(assert (=> d!76913 (= lt!361068 e!154930)))

(declare-fun res!190148 () Bool)

(assert (=> d!76913 (=> (not res!190148) (not e!154930))))

(declare-fun lt!361083 () (_ BitVec 64))

(declare-fun lt!361072 () (_ BitVec 64))

(assert (=> d!76913 (= res!190148 (= (bvadd lt!361072 lt!361083) (bitIndex!0 (size!4974 (buf!5515 (_2!10524 lt!361086))) (currentByte!10335 (_2!10524 lt!361086)) (currentBit!10330 (_2!10524 lt!361086)))))))

(assert (=> d!76913 (or (not (= (bvand lt!361072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361083 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361072 lt!361083) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!361075 () (_ BitVec 64))

(assert (=> d!76913 (= lt!361083 (bvmul lt!361075 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76913 (or (= lt!361075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361075)))))

(assert (=> d!76913 (= lt!361075 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76913 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76913 (= lt!361072 (bitIndex!0 (size!4974 (buf!5515 (_2!10525 lt!360885))) (currentByte!10335 (_2!10525 lt!360885)) (currentBit!10330 (_2!10525 lt!360885))))))

(assert (=> d!76913 (= lt!361086 e!154928)))

(assert (=> d!76913 (= c!11179 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76913 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4974 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)))))))

(assert (=> d!76913 (= (readByteArrayLoop!0 (_2!10525 lt!360885) (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!361086)))

(declare-fun b!226616 () Bool)

(declare-datatypes ((tuple2!19440 0))(
  ( (tuple2!19441 (_1!10528 BitStream!9044) (_2!10528 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9044) tuple2!19440)

(assert (=> b!226616 (= e!154929 (= (select (arr!5940 (_3!807 lt!361086)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10528 (readBytePure!0 (_2!10525 lt!360885)))))))

(assert (=> b!226616 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4974 (_3!807 lt!361086))))))

(declare-fun bm!3753 () Bool)

(assert (=> bm!3753 (= call!3754 (arrayRangesEq!820 (ite c!11179 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)) lt!361097) (ite c!11179 (array!11341 (store (arr!5940 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10525 lt!361080)) (size!4974 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)))) lt!361084) (ite c!11179 #b00000000000000000000000000000000 lt!361069) (ite c!11179 (bvadd #b00000000000000000000000000000001 i!761) lt!361093)))))

(declare-fun b!226617 () Bool)

(declare-fun lt!361085 () Unit!16792)

(assert (=> b!226617 (= e!154928 (tuple3!1331 lt!361085 (_2!10524 lt!361064) (_3!807 lt!361064)))))

(assert (=> b!226617 (= lt!361080 (readByte!0 (_2!10525 lt!360885)))))

(declare-fun lt!361067 () array!11340)

(assert (=> b!226617 (= lt!361067 (array!11341 (store (arr!5940 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10525 lt!361080)) (size!4974 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)))))))

(declare-fun lt!361090 () (_ BitVec 64))

(assert (=> b!226617 (= lt!361090 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!361063 () (_ BitVec 32))

(assert (=> b!226617 (= lt!361063 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361074 () Unit!16792)

(assert (=> b!226617 (= lt!361074 (validateOffsetBytesFromBitIndexLemma!0 (_2!10525 lt!360885) (_2!10525 lt!361080) lt!361090 lt!361063))))

(assert (=> b!226617 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10525 lt!361080)))) ((_ sign_extend 32) (currentByte!10335 (_2!10525 lt!361080))) ((_ sign_extend 32) (currentBit!10330 (_2!10525 lt!361080))) (bvsub lt!361063 ((_ extract 31 0) (bvsdiv (bvadd lt!361090 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!361094 () Unit!16792)

(assert (=> b!226617 (= lt!361094 lt!361074)))

(assert (=> b!226617 (= lt!361064 (readByteArrayLoop!0 (_2!10525 lt!361080) lt!361067 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226617 (= call!3756 (bvadd (bitIndex!0 (size!4974 (buf!5515 (_2!10525 lt!360885))) (currentByte!10335 (_2!10525 lt!360885)) (currentBit!10330 (_2!10525 lt!360885))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!361076 () Unit!16792)

(declare-fun Unit!16805 () Unit!16792)

(assert (=> b!226617 (= lt!361076 Unit!16805)))

(assert (=> b!226617 (= (bvadd call!3756 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4974 (buf!5515 (_2!10524 lt!361064))) (currentByte!10335 (_2!10524 lt!361064)) (currentBit!10330 (_2!10524 lt!361064))))))

(declare-fun lt!361065 () Unit!16792)

(declare-fun Unit!16806 () Unit!16792)

(assert (=> b!226617 (= lt!361065 Unit!16806)))

(assert (=> b!226617 (= (bvadd (bitIndex!0 (size!4974 (buf!5515 (_2!10525 lt!360885))) (currentByte!10335 (_2!10525 lt!360885)) (currentBit!10330 (_2!10525 lt!360885))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4974 (buf!5515 (_2!10524 lt!361064))) (currentByte!10335 (_2!10524 lt!361064)) (currentBit!10330 (_2!10524 lt!361064))))))

(declare-fun lt!361073 () Unit!16792)

(declare-fun Unit!16808 () Unit!16792)

(assert (=> b!226617 (= lt!361073 Unit!16808)))

(assert (=> b!226617 (and (= (buf!5515 (_2!10525 lt!360885)) (buf!5515 (_2!10524 lt!361064))) (= (size!4974 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))) (size!4974 (_3!807 lt!361064))))))

(declare-fun lt!361092 () Unit!16792)

(declare-fun Unit!16809 () Unit!16792)

(assert (=> b!226617 (= lt!361092 Unit!16809)))

(declare-fun lt!361077 () Unit!16792)

(declare-fun arrayUpdatedAtPrefixLemma!380 (array!11340 (_ BitVec 32) (_ BitVec 8)) Unit!16792)

(assert (=> b!226617 (= lt!361077 (arrayUpdatedAtPrefixLemma!380 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10525 lt!361080)))))

(assert (=> b!226617 call!3754))

(declare-fun lt!361087 () Unit!16792)

(assert (=> b!226617 (= lt!361087 lt!361077)))

(declare-fun lt!361070 () (_ BitVec 32))

(assert (=> b!226617 (= lt!361070 #b00000000000000000000000000000000)))

(declare-fun lt!361071 () Unit!16792)

(declare-fun arrayRangesEqTransitive!259 (array!11340 array!11340 array!11340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16792)

(assert (=> b!226617 (= lt!361071 (arrayRangesEqTransitive!259 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)) lt!361067 (_3!807 lt!361064) lt!361070 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226617 (arrayRangesEq!820 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308)) (_3!807 lt!361064) lt!361070 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!361089 () Unit!16792)

(assert (=> b!226617 (= lt!361089 lt!361071)))

(assert (=> b!226617 call!3755))

(declare-fun lt!361081 () Unit!16792)

(declare-fun Unit!16810 () Unit!16792)

(assert (=> b!226617 (= lt!361081 Unit!16810)))

(declare-fun lt!361096 () Unit!16792)

(declare-fun arrayRangesEqImpliesEq!110 (array!11340 array!11340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16792)

(assert (=> b!226617 (= lt!361096 (arrayRangesEqImpliesEq!110 lt!361067 (_3!807 lt!361064) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226617 (= (select (store (arr!5940 (array!11341 (store (arr!5940 arr!308) i!761 (_1!10525 lt!360885)) (size!4974 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10525 lt!361080)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5940 (_3!807 lt!361064)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361079 () Unit!16792)

(assert (=> b!226617 (= lt!361079 lt!361096)))

(declare-fun lt!361066 () Bool)

(assert (=> b!226617 (= lt!361066 (= (select (arr!5940 (_3!807 lt!361064)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10525 lt!361080)))))

(declare-fun Unit!16811 () Unit!16792)

(assert (=> b!226617 (= lt!361085 Unit!16811)))

(assert (=> b!226617 lt!361066))

(assert (= (and d!76913 c!11179) b!226617))

(assert (= (and d!76913 (not c!11179)) b!226615))

(assert (= (or b!226617 b!226615) bm!3753))

(assert (= (or b!226617 b!226615) bm!3752))

(assert (= (or b!226617 b!226615) bm!3751))

(assert (= (and d!76913 res!190148) b!226614))

(assert (= (and b!226614 res!190146) b!226613))

(assert (= (and d!76913 (not res!190147)) b!226616))

(declare-fun m!348145 () Bool)

(assert (=> b!226616 m!348145))

(declare-fun m!348147 () Bool)

(assert (=> b!226616 m!348147))

(declare-fun m!348149 () Bool)

(assert (=> b!226615 m!348149))

(declare-fun m!348151 () Bool)

(assert (=> b!226615 m!348151))

(declare-fun m!348153 () Bool)

(assert (=> bm!3752 m!348153))

(declare-fun m!348155 () Bool)

(assert (=> bm!3753 m!348155))

(declare-fun m!348157 () Bool)

(assert (=> bm!3753 m!348157))

(declare-fun m!348159 () Bool)

(assert (=> b!226613 m!348159))

(declare-fun m!348161 () Bool)

(assert (=> bm!3751 m!348161))

(declare-fun m!348163 () Bool)

(assert (=> d!76913 m!348163))

(assert (=> d!76913 m!348087))

(assert (=> b!226617 m!348087))

(declare-fun m!348165 () Bool)

(assert (=> b!226617 m!348165))

(declare-fun m!348167 () Bool)

(assert (=> b!226617 m!348167))

(declare-fun m!348169 () Bool)

(assert (=> b!226617 m!348169))

(declare-fun m!348171 () Bool)

(assert (=> b!226617 m!348171))

(assert (=> b!226617 m!348155))

(declare-fun m!348173 () Bool)

(assert (=> b!226617 m!348173))

(declare-fun m!348175 () Bool)

(assert (=> b!226617 m!348175))

(declare-fun m!348177 () Bool)

(assert (=> b!226617 m!348177))

(declare-fun m!348179 () Bool)

(assert (=> b!226617 m!348179))

(declare-fun m!348181 () Bool)

(assert (=> b!226617 m!348181))

(declare-fun m!348183 () Bool)

(assert (=> b!226617 m!348183))

(declare-fun m!348185 () Bool)

(assert (=> b!226617 m!348185))

(assert (=> b!226568 d!76913))

(declare-fun d!76928 () Bool)

(declare-fun lt!361223 () (_ BitVec 8))

(declare-fun lt!361226 () (_ BitVec 8))

(assert (=> d!76928 (= lt!361223 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5940 (buf!5515 thiss!1870)) (currentByte!10335 thiss!1870))) ((_ sign_extend 24) lt!361226))))))

(assert (=> d!76928 (= lt!361226 ((_ extract 7 0) (currentBit!10330 thiss!1870)))))

(declare-fun e!154945 () Bool)

(assert (=> d!76928 e!154945))

(declare-fun res!190164 () Bool)

(assert (=> d!76928 (=> (not res!190164) (not e!154945))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76928 (= res!190164 (validate_offset_bits!1 ((_ sign_extend 32) (size!4974 (buf!5515 thiss!1870))) ((_ sign_extend 32) (currentByte!10335 thiss!1870)) ((_ sign_extend 32) (currentBit!10330 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19442 0))(
  ( (tuple2!19443 (_1!10529 Unit!16792) (_2!10529 (_ BitVec 8))) )
))
(declare-fun Unit!16812 () Unit!16792)

(declare-fun Unit!16813 () Unit!16792)

(assert (=> d!76928 (= (readByte!0 thiss!1870) (tuple2!19435 (_2!10529 (ite (bvsgt ((_ sign_extend 24) lt!361226) #b00000000000000000000000000000000) (tuple2!19443 Unit!16812 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361223) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5940 (buf!5515 thiss!1870)) (bvadd (currentByte!10335 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361226)))))))) (tuple2!19443 Unit!16813 lt!361223))) (BitStream!9045 (buf!5515 thiss!1870) (bvadd (currentByte!10335 thiss!1870) #b00000000000000000000000000000001) (currentBit!10330 thiss!1870))))))

(declare-fun b!226637 () Bool)

(declare-fun e!154944 () Bool)

(assert (=> b!226637 (= e!154945 e!154944)))

(declare-fun res!190163 () Bool)

(assert (=> b!226637 (=> (not res!190163) (not e!154944))))

(declare-fun lt!361221 () tuple2!19434)

(assert (=> b!226637 (= res!190163 (= (buf!5515 (_2!10525 lt!361221)) (buf!5515 thiss!1870)))))

(declare-fun lt!361224 () (_ BitVec 8))

(declare-fun lt!361227 () (_ BitVec 8))

(declare-fun Unit!16814 () Unit!16792)

(declare-fun Unit!16815 () Unit!16792)

(assert (=> b!226637 (= lt!361221 (tuple2!19435 (_2!10529 (ite (bvsgt ((_ sign_extend 24) lt!361224) #b00000000000000000000000000000000) (tuple2!19443 Unit!16814 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361227) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5940 (buf!5515 thiss!1870)) (bvadd (currentByte!10335 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361224)))))))) (tuple2!19443 Unit!16815 lt!361227))) (BitStream!9045 (buf!5515 thiss!1870) (bvadd (currentByte!10335 thiss!1870) #b00000000000000000000000000000001) (currentBit!10330 thiss!1870))))))

(assert (=> b!226637 (= lt!361227 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5940 (buf!5515 thiss!1870)) (currentByte!10335 thiss!1870))) ((_ sign_extend 24) lt!361224))))))

(assert (=> b!226637 (= lt!361224 ((_ extract 7 0) (currentBit!10330 thiss!1870)))))

(declare-fun b!226638 () Bool)

(declare-fun lt!361225 () (_ BitVec 64))

(declare-fun lt!361222 () (_ BitVec 64))

(assert (=> b!226638 (= e!154944 (= (bitIndex!0 (size!4974 (buf!5515 (_2!10525 lt!361221))) (currentByte!10335 (_2!10525 lt!361221)) (currentBit!10330 (_2!10525 lt!361221))) (bvadd lt!361222 lt!361225)))))

(assert (=> b!226638 (or (not (= (bvand lt!361222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361225 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361222 lt!361225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226638 (= lt!361225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226638 (= lt!361222 (bitIndex!0 (size!4974 (buf!5515 thiss!1870)) (currentByte!10335 thiss!1870) (currentBit!10330 thiss!1870)))))

(assert (= (and d!76928 res!190164) b!226637))

(assert (= (and b!226637 res!190163) b!226638))

(declare-fun m!348191 () Bool)

(assert (=> d!76928 m!348191))

(declare-fun m!348195 () Bool)

(assert (=> d!76928 m!348195))

(declare-fun m!348197 () Bool)

(assert (=> d!76928 m!348197))

(assert (=> b!226637 m!348197))

(assert (=> b!226637 m!348191))

(declare-fun m!348207 () Bool)

(assert (=> b!226638 m!348207))

(assert (=> b!226638 m!348091))

(assert (=> b!226568 d!76928))

(declare-fun d!76930 () Bool)

(declare-fun e!154946 () Bool)

(assert (=> d!76930 e!154946))

(declare-fun res!190165 () Bool)

(assert (=> d!76930 (=> (not res!190165) (not e!154946))))

(declare-fun lt!361231 () (_ BitVec 64))

(declare-fun lt!361228 () (_ BitVec 64))

(declare-fun lt!361229 () (_ BitVec 64))

(assert (=> d!76930 (= res!190165 (= lt!361228 (bvsub lt!361229 lt!361231)))))

(assert (=> d!76930 (or (= (bvand lt!361229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361231 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361229 lt!361231) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76930 (= lt!361231 (remainingBits!0 ((_ sign_extend 32) (size!4974 (buf!5515 thiss!1870))) ((_ sign_extend 32) (currentByte!10335 thiss!1870)) ((_ sign_extend 32) (currentBit!10330 thiss!1870))))))

(declare-fun lt!361230 () (_ BitVec 64))

(declare-fun lt!361233 () (_ BitVec 64))

(assert (=> d!76930 (= lt!361229 (bvmul lt!361230 lt!361233))))

(assert (=> d!76930 (or (= lt!361230 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361233 (bvsdiv (bvmul lt!361230 lt!361233) lt!361230)))))

(assert (=> d!76930 (= lt!361233 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76930 (= lt!361230 ((_ sign_extend 32) (size!4974 (buf!5515 thiss!1870))))))

(assert (=> d!76930 (= lt!361228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10335 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10330 thiss!1870))))))

(assert (=> d!76930 (invariant!0 (currentBit!10330 thiss!1870) (currentByte!10335 thiss!1870) (size!4974 (buf!5515 thiss!1870)))))

(assert (=> d!76930 (= (bitIndex!0 (size!4974 (buf!5515 thiss!1870)) (currentByte!10335 thiss!1870) (currentBit!10330 thiss!1870)) lt!361228)))

(declare-fun b!226639 () Bool)

(declare-fun res!190166 () Bool)

(assert (=> b!226639 (=> (not res!190166) (not e!154946))))

(assert (=> b!226639 (= res!190166 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361228))))

(declare-fun b!226640 () Bool)

(declare-fun lt!361232 () (_ BitVec 64))

(assert (=> b!226640 (= e!154946 (bvsle lt!361228 (bvmul lt!361232 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226640 (or (= lt!361232 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361232 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361232)))))

(assert (=> b!226640 (= lt!361232 ((_ sign_extend 32) (size!4974 (buf!5515 thiss!1870))))))

(assert (= (and d!76930 res!190165) b!226639))

(assert (= (and b!226639 res!190166) b!226640))

(declare-fun m!348227 () Bool)

(assert (=> d!76930 m!348227))

(declare-fun m!348231 () Bool)

(assert (=> d!76930 m!348231))

(assert (=> b!226568 d!76930))

(declare-fun d!76932 () Bool)

(assert (=> d!76932 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10525 lt!360885)))) ((_ sign_extend 32) (currentByte!10335 (_2!10525 lt!360885))) ((_ sign_extend 32) (currentBit!10330 (_2!10525 lt!360885))) lt!360886) (bvsle ((_ sign_extend 32) lt!360886) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10525 lt!360885)))) ((_ sign_extend 32) (currentByte!10335 (_2!10525 lt!360885))) ((_ sign_extend 32) (currentBit!10330 (_2!10525 lt!360885)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18801 () Bool)

(assert (= bs!18801 d!76932))

(assert (=> bs!18801 m!348121))

(assert (=> b!226568 d!76932))

(declare-fun d!76934 () Bool)

(declare-fun e!154949 () Bool)

(assert (=> d!76934 e!154949))

(declare-fun res!190167 () Bool)

(assert (=> d!76934 (=> (not res!190167) (not e!154949))))

(declare-fun lt!361243 () (_ BitVec 64))

(declare-fun lt!361240 () (_ BitVec 64))

(declare-fun lt!361241 () (_ BitVec 64))

(assert (=> d!76934 (= res!190167 (= lt!361240 (bvsub lt!361241 lt!361243)))))

(assert (=> d!76934 (or (= (bvand lt!361241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361243 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361241 lt!361243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76934 (= lt!361243 (remainingBits!0 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10524 lt!360887)))) ((_ sign_extend 32) (currentByte!10335 (_2!10524 lt!360887))) ((_ sign_extend 32) (currentBit!10330 (_2!10524 lt!360887)))))))

(declare-fun lt!361242 () (_ BitVec 64))

(declare-fun lt!361245 () (_ BitVec 64))

(assert (=> d!76934 (= lt!361241 (bvmul lt!361242 lt!361245))))

(assert (=> d!76934 (or (= lt!361242 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361245 (bvsdiv (bvmul lt!361242 lt!361245) lt!361242)))))

(assert (=> d!76934 (= lt!361245 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76934 (= lt!361242 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10524 lt!360887)))))))

(assert (=> d!76934 (= lt!361240 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10335 (_2!10524 lt!360887))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10330 (_2!10524 lt!360887)))))))

(assert (=> d!76934 (invariant!0 (currentBit!10330 (_2!10524 lt!360887)) (currentByte!10335 (_2!10524 lt!360887)) (size!4974 (buf!5515 (_2!10524 lt!360887))))))

(assert (=> d!76934 (= (bitIndex!0 (size!4974 (buf!5515 (_2!10524 lt!360887))) (currentByte!10335 (_2!10524 lt!360887)) (currentBit!10330 (_2!10524 lt!360887))) lt!361240)))

(declare-fun b!226645 () Bool)

(declare-fun res!190168 () Bool)

(assert (=> b!226645 (=> (not res!190168) (not e!154949))))

(assert (=> b!226645 (= res!190168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361240))))

(declare-fun b!226646 () Bool)

(declare-fun lt!361244 () (_ BitVec 64))

(assert (=> b!226646 (= e!154949 (bvsle lt!361240 (bvmul lt!361244 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226646 (or (= lt!361244 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361244 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361244)))))

(assert (=> b!226646 (= lt!361244 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10524 lt!360887)))))))

(assert (= (and d!76934 res!190167) b!226645))

(assert (= (and b!226645 res!190168) b!226646))

(declare-fun m!348241 () Bool)

(assert (=> d!76934 m!348241))

(declare-fun m!348243 () Bool)

(assert (=> d!76934 m!348243))

(assert (=> b!226568 d!76934))

(declare-fun d!76936 () Bool)

(declare-fun e!154956 () Bool)

(assert (=> d!76936 e!154956))

(declare-fun res!190177 () Bool)

(assert (=> d!76936 (=> (not res!190177) (not e!154956))))

(assert (=> d!76936 (= res!190177 (and (or (let ((rhs!3901 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3901 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3901) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76937 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76937 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76937 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3900 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3900 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3900) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!361319 () Unit!16792)

(declare-fun choose!57 (BitStream!9044 BitStream!9044 (_ BitVec 64) (_ BitVec 32)) Unit!16792)

(assert (=> d!76936 (= lt!361319 (choose!57 thiss!1870 (_2!10525 lt!360885) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76936 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10525 lt!360885) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!361319)))

(declare-fun b!226655 () Bool)

(declare-fun lt!361320 () (_ BitVec 32))

(assert (=> b!226655 (= e!154956 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4974 (buf!5515 (_2!10525 lt!360885)))) ((_ sign_extend 32) (currentByte!10335 (_2!10525 lt!360885))) ((_ sign_extend 32) (currentBit!10330 (_2!10525 lt!360885))) (bvsub (bvsub to!496 i!761) lt!361320)))))

(assert (=> b!226655 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!361320 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!361320) #b10000000000000000000000000000000)))))

(declare-fun lt!361318 () (_ BitVec 64))

(assert (=> b!226655 (= lt!361320 ((_ extract 31 0) lt!361318))))

(assert (=> b!226655 (and (bvslt lt!361318 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!361318 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226655 (= lt!361318 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76936 res!190177) b!226655))

(declare-fun m!348245 () Bool)

(assert (=> d!76936 m!348245))

(declare-fun m!348247 () Bool)

(assert (=> b!226655 m!348247))

(assert (=> b!226568 d!76936))

(declare-fun d!76939 () Bool)

(assert (=> d!76939 (= (array_inv!4715 (buf!5515 thiss!1870)) (bvsge (size!4974 (buf!5515 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226569 d!76939))

(declare-fun d!76941 () Bool)

(assert (=> d!76941 (= (array_inv!4715 arr!308) (bvsge (size!4974 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47556 d!76941))

(declare-fun d!76943 () Bool)

(assert (=> d!76943 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10330 thiss!1870) (currentByte!10335 thiss!1870) (size!4974 (buf!5515 thiss!1870))))))

(declare-fun bs!18802 () Bool)

(assert (= bs!18802 d!76943))

(assert (=> bs!18802 m!348231))

(assert (=> start!47556 d!76943))

(declare-fun d!76945 () Bool)

(assert (=> d!76945 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4974 (buf!5515 thiss!1870))) ((_ sign_extend 32) (currentByte!10335 thiss!1870)) ((_ sign_extend 32) (currentBit!10330 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4974 (buf!5515 thiss!1870))) ((_ sign_extend 32) (currentByte!10335 thiss!1870)) ((_ sign_extend 32) (currentBit!10330 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18803 () Bool)

(assert (= bs!18803 d!76945))

(assert (=> bs!18803 m!348227))

(assert (=> b!226566 d!76945))

(push 1)

(assert (not b!226638))

(assert (not b!226616))

(assert (not d!76932))

(assert (not d!76928))

(assert (not d!76943))

(assert (not bm!3752))

(assert (not d!76913))

(assert (not bm!3751))

(assert (not d!76930))

(assert (not d!76907))

(assert (not d!76945))

(assert (not d!76934))

(assert (not b!226617))

(assert (not b!226613))

(assert (not b!226655))

(assert (not d!76936))

(assert (not bm!3753))

(assert (not b!226615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

