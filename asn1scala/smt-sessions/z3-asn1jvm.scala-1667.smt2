; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46380 () Bool)

(assert start!46380)

(declare-fun b!223155 () Bool)

(declare-fun res!187341 () Bool)

(declare-fun e!151854 () Bool)

(assert (=> b!223155 (=> (not res!187341) (not e!151854))))

(declare-datatypes ((array!10955 0))(
  ( (array!10956 (arr!5741 (Array (_ BitVec 32) (_ BitVec 8))) (size!4808 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8718 0))(
  ( (BitStream!8719 (buf!5352 array!10955) (currentByte!10034 (_ BitVec 32)) (currentBit!10029 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8718)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223155 (= res!187341 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4808 (buf!5352 thiss!1870))) ((_ sign_extend 32) (currentByte!10034 thiss!1870)) ((_ sign_extend 32) (currentBit!10029 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223157 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223157 (= e!151854 (not (invariant!0 (currentBit!10029 thiss!1870) (currentByte!10034 thiss!1870) (size!4808 (buf!5352 thiss!1870)))))))

(declare-datatypes ((Unit!16108 0))(
  ( (Unit!16109) )
))
(declare-datatypes ((tuple3!1142 0))(
  ( (tuple3!1143 (_1!10237 Unit!16108) (_2!10237 BitStream!8718) (_3!713 array!10955)) )
))
(declare-fun lt!352176 () tuple3!1142)

(declare-datatypes ((tuple2!19048 0))(
  ( (tuple2!19049 (_1!10238 (_ BitVec 8)) (_2!10238 BitStream!8718)) )
))
(declare-fun lt!352177 () tuple2!19048)

(declare-fun arr!308 () array!10955)

(declare-fun readByteArrayLoop!0 (BitStream!8718 array!10955 (_ BitVec 32) (_ BitVec 32)) tuple3!1142)

(assert (=> b!223157 (= lt!352176 (readByteArrayLoop!0 (_2!10238 lt!352177) (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223157 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4808 (buf!5352 (_2!10238 lt!352177)))) ((_ sign_extend 32) (currentByte!10034 (_2!10238 lt!352177))) ((_ sign_extend 32) (currentBit!10029 (_2!10238 lt!352177))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!352175 () Unit!16108)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8718 BitStream!8718 (_ BitVec 64) (_ BitVec 32)) Unit!16108)

(assert (=> b!223157 (= lt!352175 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10238 lt!352177) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8718) tuple2!19048)

(assert (=> b!223157 (= lt!352177 (readByte!0 thiss!1870))))

(declare-fun res!187343 () Bool)

(assert (=> start!46380 (=> (not res!187343) (not e!151854))))

(assert (=> start!46380 (= res!187343 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4808 arr!308))))))

(assert (=> start!46380 e!151854))

(assert (=> start!46380 true))

(declare-fun array_inv!4549 (array!10955) Bool)

(assert (=> start!46380 (array_inv!4549 arr!308)))

(declare-fun e!151852 () Bool)

(declare-fun inv!12 (BitStream!8718) Bool)

(assert (=> start!46380 (and (inv!12 thiss!1870) e!151852)))

(declare-fun b!223156 () Bool)

(declare-fun res!187342 () Bool)

(assert (=> b!223156 (=> (not res!187342) (not e!151854))))

(assert (=> b!223156 (= res!187342 (bvslt i!761 to!496))))

(declare-fun b!223158 () Bool)

(assert (=> b!223158 (= e!151852 (array_inv!4549 (buf!5352 thiss!1870)))))

(assert (= (and start!46380 res!187343) b!223155))

(assert (= (and b!223155 res!187341) b!223156))

(assert (= (and b!223156 res!187342) b!223157))

(assert (= start!46380 b!223158))

(declare-fun m!341713 () Bool)

(assert (=> b!223155 m!341713))

(declare-fun m!341715 () Bool)

(assert (=> b!223157 m!341715))

(declare-fun m!341717 () Bool)

(assert (=> b!223157 m!341717))

(declare-fun m!341719 () Bool)

(assert (=> b!223157 m!341719))

(declare-fun m!341721 () Bool)

(assert (=> b!223157 m!341721))

(declare-fun m!341723 () Bool)

(assert (=> b!223157 m!341723))

(declare-fun m!341725 () Bool)

(assert (=> b!223157 m!341725))

(declare-fun m!341727 () Bool)

(assert (=> start!46380 m!341727))

(declare-fun m!341729 () Bool)

(assert (=> start!46380 m!341729))

(declare-fun m!341731 () Bool)

(assert (=> b!223158 m!341731))

(check-sat (not b!223155) (not b!223158) (not start!46380) (not b!223157))
(check-sat)
(get-model)

(declare-fun d!75572 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75572 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4808 (buf!5352 thiss!1870))) ((_ sign_extend 32) (currentByte!10034 thiss!1870)) ((_ sign_extend 32) (currentBit!10029 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4808 (buf!5352 thiss!1870))) ((_ sign_extend 32) (currentByte!10034 thiss!1870)) ((_ sign_extend 32) (currentBit!10029 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18445 () Bool)

(assert (= bs!18445 d!75572))

(declare-fun m!341771 () Bool)

(assert (=> bs!18445 m!341771))

(assert (=> b!223155 d!75572))

(declare-fun d!75574 () Bool)

(assert (=> d!75574 (= (array_inv!4549 (buf!5352 thiss!1870)) (bvsge (size!4808 (buf!5352 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223158 d!75574))

(declare-fun d!75576 () Bool)

(assert (=> d!75576 (= (array_inv!4549 arr!308) (bvsge (size!4808 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46380 d!75576))

(declare-fun d!75578 () Bool)

(assert (=> d!75578 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10029 thiss!1870) (currentByte!10034 thiss!1870) (size!4808 (buf!5352 thiss!1870))))))

(declare-fun bs!18446 () Bool)

(assert (= bs!18446 d!75578))

(assert (=> bs!18446 m!341721))

(assert (=> start!46380 d!75578))

(declare-fun d!75580 () Bool)

(declare-fun lt!352225 () (_ BitVec 8))

(declare-fun lt!352222 () (_ BitVec 8))

(assert (=> d!75580 (= lt!352225 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5741 (buf!5352 thiss!1870)) (currentByte!10034 thiss!1870))) ((_ sign_extend 24) lt!352222))))))

(assert (=> d!75580 (= lt!352222 ((_ extract 7 0) (currentBit!10029 thiss!1870)))))

(declare-fun e!151877 () Bool)

(assert (=> d!75580 e!151877))

(declare-fun res!187365 () Bool)

(assert (=> d!75580 (=> (not res!187365) (not e!151877))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75580 (= res!187365 (validate_offset_bits!1 ((_ sign_extend 32) (size!4808 (buf!5352 thiss!1870))) ((_ sign_extend 32) (currentByte!10034 thiss!1870)) ((_ sign_extend 32) (currentBit!10029 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19056 0))(
  ( (tuple2!19057 (_1!10243 Unit!16108) (_2!10243 (_ BitVec 8))) )
))
(declare-fun Unit!16124 () Unit!16108)

(declare-fun Unit!16125 () Unit!16108)

(assert (=> d!75580 (= (readByte!0 thiss!1870) (tuple2!19049 (_2!10243 (ite (bvsgt ((_ sign_extend 24) lt!352222) #b00000000000000000000000000000000) (tuple2!19057 Unit!16124 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352225) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5741 (buf!5352 thiss!1870)) (bvadd (currentByte!10034 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352222)))))))) (tuple2!19057 Unit!16125 lt!352225))) (BitStream!8719 (buf!5352 thiss!1870) (bvadd (currentByte!10034 thiss!1870) #b00000000000000000000000000000001) (currentBit!10029 thiss!1870))))))

(declare-fun b!223181 () Bool)

(declare-fun e!151878 () Bool)

(assert (=> b!223181 (= e!151877 e!151878)))

(declare-fun res!187366 () Bool)

(assert (=> b!223181 (=> (not res!187366) (not e!151878))))

(declare-fun lt!352227 () tuple2!19048)

(assert (=> b!223181 (= res!187366 (= (buf!5352 (_2!10238 lt!352227)) (buf!5352 thiss!1870)))))

(declare-fun lt!352223 () (_ BitVec 8))

(declare-fun lt!352228 () (_ BitVec 8))

(declare-fun Unit!16126 () Unit!16108)

(declare-fun Unit!16127 () Unit!16108)

(assert (=> b!223181 (= lt!352227 (tuple2!19049 (_2!10243 (ite (bvsgt ((_ sign_extend 24) lt!352223) #b00000000000000000000000000000000) (tuple2!19057 Unit!16126 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352228) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5741 (buf!5352 thiss!1870)) (bvadd (currentByte!10034 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352223)))))))) (tuple2!19057 Unit!16127 lt!352228))) (BitStream!8719 (buf!5352 thiss!1870) (bvadd (currentByte!10034 thiss!1870) #b00000000000000000000000000000001) (currentBit!10029 thiss!1870))))))

(assert (=> b!223181 (= lt!352228 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5741 (buf!5352 thiss!1870)) (currentByte!10034 thiss!1870))) ((_ sign_extend 24) lt!352223))))))

(assert (=> b!223181 (= lt!352223 ((_ extract 7 0) (currentBit!10029 thiss!1870)))))

(declare-fun lt!352226 () (_ BitVec 64))

(declare-fun b!223182 () Bool)

(declare-fun lt!352224 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223182 (= e!151878 (= (bitIndex!0 (size!4808 (buf!5352 (_2!10238 lt!352227))) (currentByte!10034 (_2!10238 lt!352227)) (currentBit!10029 (_2!10238 lt!352227))) (bvadd lt!352224 lt!352226)))))

(assert (=> b!223182 (or (not (= (bvand lt!352224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352226 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352224 lt!352226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223182 (= lt!352226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223182 (= lt!352224 (bitIndex!0 (size!4808 (buf!5352 thiss!1870)) (currentByte!10034 thiss!1870) (currentBit!10029 thiss!1870)))))

(assert (= (and d!75580 res!187365) b!223181))

(assert (= (and b!223181 res!187366) b!223182))

(declare-fun m!341773 () Bool)

(assert (=> d!75580 m!341773))

(declare-fun m!341775 () Bool)

(assert (=> d!75580 m!341775))

(declare-fun m!341777 () Bool)

(assert (=> d!75580 m!341777))

(assert (=> b!223181 m!341777))

(assert (=> b!223181 m!341773))

(declare-fun m!341779 () Bool)

(assert (=> b!223182 m!341779))

(declare-fun m!341781 () Bool)

(assert (=> b!223182 m!341781))

(assert (=> b!223157 d!75580))

(declare-fun lt!352579 () (_ BitVec 32))

(declare-fun c!11084 () Bool)

(declare-fun lt!352547 () array!10955)

(declare-fun lt!352581 () array!10955)

(declare-fun lt!352580 () tuple2!19048)

(declare-fun lt!352554 () (_ BitVec 32))

(declare-fun bm!3466 () Bool)

(declare-fun call!3470 () Bool)

(declare-fun arrayRangesEq!709 (array!10955 array!10955 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3466 (= call!3470 (arrayRangesEq!709 (ite c!11084 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)) lt!352547) (ite c!11084 (array!10956 (store (arr!5741 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10238 lt!352580)) (size!4808 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)))) lt!352581) (ite c!11084 #b00000000000000000000000000000000 lt!352579) (ite c!11084 (bvadd #b00000000000000000000000000000001 i!761) lt!352554)))))

(declare-fun d!75582 () Bool)

(declare-fun e!151914 () Bool)

(assert (=> d!75582 e!151914))

(declare-fun res!187403 () Bool)

(assert (=> d!75582 (=> res!187403 e!151914)))

(assert (=> d!75582 (= res!187403 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!352576 () Bool)

(declare-fun e!151913 () Bool)

(assert (=> d!75582 (= lt!352576 e!151913)))

(declare-fun res!187402 () Bool)

(assert (=> d!75582 (=> (not res!187402) (not e!151913))))

(declare-fun lt!352570 () (_ BitVec 64))

(declare-fun lt!352566 () tuple3!1142)

(declare-fun lt!352560 () (_ BitVec 64))

(assert (=> d!75582 (= res!187402 (= (bvadd lt!352560 lt!352570) (bitIndex!0 (size!4808 (buf!5352 (_2!10237 lt!352566))) (currentByte!10034 (_2!10237 lt!352566)) (currentBit!10029 (_2!10237 lt!352566)))))))

(assert (=> d!75582 (or (not (= (bvand lt!352560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352570 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352560 lt!352570) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!352572 () (_ BitVec 64))

(assert (=> d!75582 (= lt!352570 (bvmul lt!352572 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75582 (or (= lt!352572 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352572 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352572)))))

(assert (=> d!75582 (= lt!352572 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75582 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75582 (= lt!352560 (bitIndex!0 (size!4808 (buf!5352 (_2!10238 lt!352177))) (currentByte!10034 (_2!10238 lt!352177)) (currentBit!10029 (_2!10238 lt!352177))))))

(declare-fun e!151912 () tuple3!1142)

(assert (=> d!75582 (= lt!352566 e!151912)))

(assert (=> d!75582 (= c!11084 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75582 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4808 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)))))))

(assert (=> d!75582 (= (readByteArrayLoop!0 (_2!10238 lt!352177) (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!352566)))

(declare-fun bm!3467 () Bool)

(declare-fun call!3469 () Bool)

(declare-fun lt!352550 () tuple3!1142)

(assert (=> bm!3467 (= call!3469 (arrayRangesEq!709 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)) (ite c!11084 (_3!713 lt!352550) (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))) #b00000000000000000000000000000000 (ite c!11084 (bvadd #b00000000000000000000000000000001 i!761) (size!4808 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))))))))

(declare-fun lt!352582 () Unit!16108)

(declare-fun b!223232 () Bool)

(assert (=> b!223232 (= e!151912 (tuple3!1143 lt!352582 (_2!10238 lt!352177) (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))))))

(declare-fun call!3471 () (_ BitVec 64))

(assert (=> b!223232 (= call!3471 call!3471)))

(declare-fun lt!352569 () Unit!16108)

(declare-fun Unit!16132 () Unit!16108)

(assert (=> b!223232 (= lt!352569 Unit!16132)))

(declare-fun lt!352564 () Unit!16108)

(declare-fun arrayRangesEqReflexiveLemma!61 (array!10955) Unit!16108)

(assert (=> b!223232 (= lt!352564 (arrayRangesEqReflexiveLemma!61 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))))))

(assert (=> b!223232 call!3469))

(declare-fun lt!352548 () Unit!16108)

(assert (=> b!223232 (= lt!352548 lt!352564)))

(assert (=> b!223232 (= lt!352547 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)))))

(assert (=> b!223232 (= lt!352581 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)))))

(declare-fun lt!352556 () (_ BitVec 32))

(assert (=> b!223232 (= lt!352556 #b00000000000000000000000000000000)))

(declare-fun lt!352549 () (_ BitVec 32))

(assert (=> b!223232 (= lt!352549 (size!4808 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))))))

(assert (=> b!223232 (= lt!352579 #b00000000000000000000000000000000)))

(assert (=> b!223232 (= lt!352554 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!61 (array!10955 array!10955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16108)

(assert (=> b!223232 (= lt!352582 (arrayRangesEqSlicedLemma!61 lt!352547 lt!352581 lt!352556 lt!352549 lt!352579 lt!352554))))

(assert (=> b!223232 call!3470))

(declare-fun b!223233 () Bool)

(declare-fun res!187401 () Bool)

(assert (=> b!223233 (=> (not res!187401) (not e!151913))))

(assert (=> b!223233 (= res!187401 (and (= (buf!5352 (_2!10238 lt!352177)) (buf!5352 (_2!10237 lt!352566))) (= (size!4808 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))) (size!4808 (_3!713 lt!352566)))))))

(declare-fun b!223234 () Bool)

(declare-datatypes ((tuple2!19058 0))(
  ( (tuple2!19059 (_1!10244 BitStream!8718) (_2!10244 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8718) tuple2!19058)

(assert (=> b!223234 (= e!151914 (= (select (arr!5741 (_3!713 lt!352566)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10244 (readBytePure!0 (_2!10238 lt!352177)))))))

(assert (=> b!223234 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4808 (_3!713 lt!352566))))))

(declare-fun b!223235 () Bool)

(declare-fun lt!352567 () Unit!16108)

(assert (=> b!223235 (= e!151912 (tuple3!1143 lt!352567 (_2!10237 lt!352550) (_3!713 lt!352550)))))

(assert (=> b!223235 (= lt!352580 (readByte!0 (_2!10238 lt!352177)))))

(declare-fun lt!352571 () array!10955)

(assert (=> b!223235 (= lt!352571 (array!10956 (store (arr!5741 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10238 lt!352580)) (size!4808 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)))))))

(declare-fun lt!352551 () (_ BitVec 64))

(assert (=> b!223235 (= lt!352551 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!352553 () (_ BitVec 32))

(assert (=> b!223235 (= lt!352553 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!352552 () Unit!16108)

(assert (=> b!223235 (= lt!352552 (validateOffsetBytesFromBitIndexLemma!0 (_2!10238 lt!352177) (_2!10238 lt!352580) lt!352551 lt!352553))))

(assert (=> b!223235 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4808 (buf!5352 (_2!10238 lt!352580)))) ((_ sign_extend 32) (currentByte!10034 (_2!10238 lt!352580))) ((_ sign_extend 32) (currentBit!10029 (_2!10238 lt!352580))) (bvsub lt!352553 ((_ extract 31 0) (bvsdiv (bvadd lt!352551 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!352562 () Unit!16108)

(assert (=> b!223235 (= lt!352562 lt!352552)))

(assert (=> b!223235 (= lt!352550 (readByteArrayLoop!0 (_2!10238 lt!352580) lt!352571 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223235 (= call!3471 (bvadd (bitIndex!0 (size!4808 (buf!5352 (_2!10238 lt!352177))) (currentByte!10034 (_2!10238 lt!352177)) (currentBit!10029 (_2!10238 lt!352177))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!352559 () Unit!16108)

(declare-fun Unit!16135 () Unit!16108)

(assert (=> b!223235 (= lt!352559 Unit!16135)))

(assert (=> b!223235 (= (bvadd call!3471 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4808 (buf!5352 (_2!10237 lt!352550))) (currentByte!10034 (_2!10237 lt!352550)) (currentBit!10029 (_2!10237 lt!352550))))))

(declare-fun lt!352573 () Unit!16108)

(declare-fun Unit!16136 () Unit!16108)

(assert (=> b!223235 (= lt!352573 Unit!16136)))

(assert (=> b!223235 (= (bvadd (bitIndex!0 (size!4808 (buf!5352 (_2!10238 lt!352177))) (currentByte!10034 (_2!10238 lt!352177)) (currentBit!10029 (_2!10238 lt!352177))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4808 (buf!5352 (_2!10237 lt!352550))) (currentByte!10034 (_2!10237 lt!352550)) (currentBit!10029 (_2!10237 lt!352550))))))

(declare-fun lt!352568 () Unit!16108)

(declare-fun Unit!16137 () Unit!16108)

(assert (=> b!223235 (= lt!352568 Unit!16137)))

(assert (=> b!223235 (and (= (buf!5352 (_2!10238 lt!352177)) (buf!5352 (_2!10237 lt!352550))) (= (size!4808 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))) (size!4808 (_3!713 lt!352550))))))

(declare-fun lt!352555 () Unit!16108)

(declare-fun Unit!16138 () Unit!16108)

(assert (=> b!223235 (= lt!352555 Unit!16138)))

(declare-fun lt!352575 () Unit!16108)

(declare-fun arrayUpdatedAtPrefixLemma!301 (array!10955 (_ BitVec 32) (_ BitVec 8)) Unit!16108)

(assert (=> b!223235 (= lt!352575 (arrayUpdatedAtPrefixLemma!301 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10238 lt!352580)))))

(assert (=> b!223235 call!3470))

(declare-fun lt!352565 () Unit!16108)

(assert (=> b!223235 (= lt!352565 lt!352575)))

(declare-fun lt!352577 () (_ BitVec 32))

(assert (=> b!223235 (= lt!352577 #b00000000000000000000000000000000)))

(declare-fun lt!352558 () Unit!16108)

(declare-fun arrayRangesEqTransitive!195 (array!10955 array!10955 array!10955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16108)

(assert (=> b!223235 (= lt!352558 (arrayRangesEqTransitive!195 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)) lt!352571 (_3!713 lt!352550) lt!352577 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223235 (arrayRangesEq!709 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308)) (_3!713 lt!352550) lt!352577 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!352574 () Unit!16108)

(assert (=> b!223235 (= lt!352574 lt!352558)))

(assert (=> b!223235 call!3469))

(declare-fun lt!352561 () Unit!16108)

(declare-fun Unit!16139 () Unit!16108)

(assert (=> b!223235 (= lt!352561 Unit!16139)))

(declare-fun lt!352563 () Unit!16108)

(declare-fun arrayRangesEqImpliesEq!70 (array!10955 array!10955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16108)

(assert (=> b!223235 (= lt!352563 (arrayRangesEqImpliesEq!70 lt!352571 (_3!713 lt!352550) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223235 (= (select (store (arr!5741 (array!10956 (store (arr!5741 arr!308) i!761 (_1!10238 lt!352177)) (size!4808 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10238 lt!352580)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5741 (_3!713 lt!352550)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!352578 () Unit!16108)

(assert (=> b!223235 (= lt!352578 lt!352563)))

(declare-fun lt!352557 () Bool)

(assert (=> b!223235 (= lt!352557 (= (select (arr!5741 (_3!713 lt!352550)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10238 lt!352580)))))

(declare-fun Unit!16140 () Unit!16108)

(assert (=> b!223235 (= lt!352567 Unit!16140)))

(assert (=> b!223235 lt!352557))

(declare-fun b!223236 () Bool)

