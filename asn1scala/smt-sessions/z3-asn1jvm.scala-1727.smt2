; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47668 () Bool)

(assert start!47668)

(declare-fun b!226968 () Bool)

(declare-fun e!155230 () Bool)

(declare-datatypes ((array!11374 0))(
  ( (array!11375 (arr!5960 (Array (_ BitVec 32) (_ BitVec 8))) (size!4988 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9072 0))(
  ( (BitStream!9073 (buf!5529 array!11374) (currentByte!10361 (_ BitVec 32)) (currentBit!10356 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9072)

(declare-fun array_inv!4729 (array!11374) Bool)

(assert (=> b!226968 (= e!155230 (array_inv!4729 (buf!5529 thiss!1870)))))

(declare-fun b!226965 () Bool)

(declare-fun res!190432 () Bool)

(declare-fun e!155233 () Bool)

(assert (=> b!226965 (=> (not res!190432) (not e!155233))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226965 (= res!190432 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4988 (buf!5529 thiss!1870))) ((_ sign_extend 32) (currentByte!10361 thiss!1870)) ((_ sign_extend 32) (currentBit!10356 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226966 () Bool)

(declare-fun res!190430 () Bool)

(assert (=> b!226966 (=> (not res!190430) (not e!155233))))

(assert (=> b!226966 (= res!190430 (bvslt i!761 to!496))))

(declare-fun arr!308 () array!11374)

(declare-fun b!226967 () Bool)

(declare-datatypes ((Unit!16886 0))(
  ( (Unit!16887) )
))
(declare-datatypes ((tuple3!1358 0))(
  ( (tuple3!1359 (_1!10564 Unit!16886) (_2!10564 BitStream!9072) (_3!821 array!11374)) )
))
(declare-fun lt!362186 () tuple3!1358)

(assert (=> b!226967 (= e!155233 (not (and (= (buf!5529 thiss!1870) (buf!5529 (_2!10564 lt!362186))) (= (size!4988 arr!308) (size!4988 (_3!821 lt!362186))))))))

(declare-fun lt!362189 () (_ BitVec 64))

(declare-fun lt!362188 () (_ BitVec 64))

(declare-fun lt!362190 () (_ BitVec 32))

(declare-fun lt!362185 () (_ BitVec 64))

(assert (=> b!226967 (and (= (bvadd lt!362185 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362190))) lt!362189) (= (bvadd lt!362188 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362189))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226967 (= lt!362189 (bitIndex!0 (size!4988 (buf!5529 (_2!10564 lt!362186))) (currentByte!10361 (_2!10564 lt!362186)) (currentBit!10356 (_2!10564 lt!362186))))))

(assert (=> b!226967 (= lt!362185 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362188))))

(declare-datatypes ((tuple2!19486 0))(
  ( (tuple2!19487 (_1!10565 (_ BitVec 8)) (_2!10565 BitStream!9072)) )
))
(declare-fun lt!362187 () tuple2!19486)

(assert (=> b!226967 (= lt!362185 (bitIndex!0 (size!4988 (buf!5529 (_2!10565 lt!362187))) (currentByte!10361 (_2!10565 lt!362187)) (currentBit!10356 (_2!10565 lt!362187))))))

(assert (=> b!226967 (= lt!362188 (bitIndex!0 (size!4988 (buf!5529 thiss!1870)) (currentByte!10361 thiss!1870) (currentBit!10356 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9072 array!11374 (_ BitVec 32) (_ BitVec 32)) tuple3!1358)

(assert (=> b!226967 (= lt!362186 (readByteArrayLoop!0 (_2!10565 lt!362187) (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226967 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10565 lt!362187)))) ((_ sign_extend 32) (currentByte!10361 (_2!10565 lt!362187))) ((_ sign_extend 32) (currentBit!10356 (_2!10565 lt!362187))) lt!362190)))

(assert (=> b!226967 (= lt!362190 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362184 () Unit!16886)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9072 BitStream!9072 (_ BitVec 64) (_ BitVec 32)) Unit!16886)

(assert (=> b!226967 (= lt!362184 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10565 lt!362187) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9072) tuple2!19486)

(assert (=> b!226967 (= lt!362187 (readByte!0 thiss!1870))))

(declare-fun res!190431 () Bool)

(assert (=> start!47668 (=> (not res!190431) (not e!155233))))

(assert (=> start!47668 (= res!190431 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4988 arr!308))))))

(assert (=> start!47668 e!155233))

(assert (=> start!47668 true))

(assert (=> start!47668 (array_inv!4729 arr!308)))

(declare-fun inv!12 (BitStream!9072) Bool)

(assert (=> start!47668 (and (inv!12 thiss!1870) e!155230)))

(assert (= (and start!47668 res!190431) b!226965))

(assert (= (and b!226965 res!190432) b!226966))

(assert (= (and b!226966 res!190430) b!226967))

(assert (= start!47668 b!226968))

(declare-fun m!348817 () Bool)

(assert (=> b!226968 m!348817))

(declare-fun m!348819 () Bool)

(assert (=> b!226965 m!348819))

(declare-fun m!348821 () Bool)

(assert (=> b!226967 m!348821))

(declare-fun m!348823 () Bool)

(assert (=> b!226967 m!348823))

(declare-fun m!348825 () Bool)

(assert (=> b!226967 m!348825))

(declare-fun m!348827 () Bool)

(assert (=> b!226967 m!348827))

(declare-fun m!348829 () Bool)

(assert (=> b!226967 m!348829))

(declare-fun m!348831 () Bool)

(assert (=> b!226967 m!348831))

(declare-fun m!348833 () Bool)

(assert (=> b!226967 m!348833))

(declare-fun m!348835 () Bool)

(assert (=> b!226967 m!348835))

(declare-fun m!348837 () Bool)

(assert (=> start!47668 m!348837))

(declare-fun m!348839 () Bool)

(assert (=> start!47668 m!348839))

(check-sat (not b!226965) (not b!226967) (not start!47668) (not b!226968))
(check-sat)
(get-model)

(declare-fun d!77043 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77043 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4988 (buf!5529 thiss!1870))) ((_ sign_extend 32) (currentByte!10361 thiss!1870)) ((_ sign_extend 32) (currentBit!10356 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4988 (buf!5529 thiss!1870))) ((_ sign_extend 32) (currentByte!10361 thiss!1870)) ((_ sign_extend 32) (currentBit!10356 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18831 () Bool)

(assert (= bs!18831 d!77043))

(declare-fun m!348865 () Bool)

(assert (=> bs!18831 m!348865))

(assert (=> b!226965 d!77043))

(declare-fun d!77045 () Bool)

(declare-fun e!155248 () Bool)

(assert (=> d!77045 e!155248))

(declare-fun res!190444 () Bool)

(assert (=> d!77045 (=> (not res!190444) (not e!155248))))

(assert (=> d!77045 (= res!190444 (and (or (let ((rhs!3932 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3932 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3932) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77046 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77046 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77046 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3931 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3931 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3931) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!362219 () Unit!16886)

(declare-fun choose!57 (BitStream!9072 BitStream!9072 (_ BitVec 64) (_ BitVec 32)) Unit!16886)

(assert (=> d!77045 (= lt!362219 (choose!57 thiss!1870 (_2!10565 lt!362187) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77045 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10565 lt!362187) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!362219)))

(declare-fun lt!362220 () (_ BitVec 32))

(declare-fun b!226983 () Bool)

(assert (=> b!226983 (= e!155248 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10565 lt!362187)))) ((_ sign_extend 32) (currentByte!10361 (_2!10565 lt!362187))) ((_ sign_extend 32) (currentBit!10356 (_2!10565 lt!362187))) (bvsub (bvsub to!496 i!761) lt!362220)))))

(assert (=> b!226983 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!362220 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!362220) #b10000000000000000000000000000000)))))

(declare-fun lt!362218 () (_ BitVec 64))

(assert (=> b!226983 (= lt!362220 ((_ extract 31 0) lt!362218))))

(assert (=> b!226983 (and (bvslt lt!362218 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!362218 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226983 (= lt!362218 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77045 res!190444) b!226983))

(declare-fun m!348867 () Bool)

(assert (=> d!77045 m!348867))

(declare-fun m!348869 () Bool)

(assert (=> b!226983 m!348869))

(assert (=> b!226967 d!77045))

(declare-fun bm!3805 () Bool)

(declare-fun call!3808 () Bool)

(declare-fun c!11197 () Bool)

(declare-fun lt!362377 () tuple2!19486)

(declare-fun arrayRangesEq!826 (array!11374 array!11374 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3805 (= call!3808 (arrayRangesEq!826 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)) (ite c!11197 (array!11375 (store (arr!5960 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10565 lt!362377)) (size!4988 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)))) (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))) #b00000000000000000000000000000000 (ite c!11197 (bvadd #b00000000000000000000000000000001 i!761) (size!4988 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))))))))

(declare-fun d!77048 () Bool)

(declare-fun e!155269 () Bool)

(assert (=> d!77048 e!155269))

(declare-fun res!190471 () Bool)

(assert (=> d!77048 (=> res!190471 e!155269)))

(assert (=> d!77048 (= res!190471 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!362386 () Bool)

(declare-fun e!155271 () Bool)

(assert (=> d!77048 (= lt!362386 e!155271)))

(declare-fun res!190472 () Bool)

(assert (=> d!77048 (=> (not res!190472) (not e!155271))))

(declare-fun lt!362374 () (_ BitVec 64))

(declare-fun lt!362357 () tuple3!1358)

(declare-fun lt!362380 () (_ BitVec 64))

(assert (=> d!77048 (= res!190472 (= (bvadd lt!362380 lt!362374) (bitIndex!0 (size!4988 (buf!5529 (_2!10564 lt!362357))) (currentByte!10361 (_2!10564 lt!362357)) (currentBit!10356 (_2!10564 lt!362357)))))))

(assert (=> d!77048 (or (not (= (bvand lt!362380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362374 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!362380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!362380 lt!362374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!362361 () (_ BitVec 64))

(assert (=> d!77048 (= lt!362374 (bvmul lt!362361 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77048 (or (= lt!362361 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362361 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362361)))))

(assert (=> d!77048 (= lt!362361 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77048 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77048 (= lt!362380 (bitIndex!0 (size!4988 (buf!5529 (_2!10565 lt!362187))) (currentByte!10361 (_2!10565 lt!362187)) (currentBit!10356 (_2!10565 lt!362187))))))

(declare-fun e!155270 () tuple3!1358)

(assert (=> d!77048 (= lt!362357 e!155270)))

(assert (=> d!77048 (= c!11197 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77048 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4988 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)))))))

(assert (=> d!77048 (= (readByteArrayLoop!0 (_2!10565 lt!362187) (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!362357)))

(declare-fun b!227013 () Bool)

(declare-datatypes ((tuple2!19490 0))(
  ( (tuple2!19491 (_1!10568 BitStream!9072) (_2!10568 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9072) tuple2!19490)

(assert (=> b!227013 (= e!155269 (= (select (arr!5960 (_3!821 lt!362357)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10568 (readBytePure!0 (_2!10565 lt!362187)))))))

(assert (=> b!227013 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4988 (_3!821 lt!362357))))))

(declare-fun b!227014 () Bool)

(declare-fun res!190473 () Bool)

(assert (=> b!227014 (=> (not res!190473) (not e!155271))))

(assert (=> b!227014 (= res!190473 (and (= (buf!5529 (_2!10565 lt!362187)) (buf!5529 (_2!10564 lt!362357))) (= (size!4988 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))) (size!4988 (_3!821 lt!362357)))))))

(declare-fun call!3810 () (_ BitVec 64))

(declare-fun bm!3806 () Bool)

(assert (=> bm!3806 (= call!3810 (bitIndex!0 (ite c!11197 (size!4988 (buf!5529 (_2!10565 lt!362377))) (size!4988 (buf!5529 (_2!10565 lt!362187)))) (ite c!11197 (currentByte!10361 (_2!10565 lt!362377)) (currentByte!10361 (_2!10565 lt!362187))) (ite c!11197 (currentBit!10356 (_2!10565 lt!362377)) (currentBit!10356 (_2!10565 lt!362187)))))))

(declare-fun lt!362373 () array!11374)

(declare-fun call!3809 () Bool)

(declare-fun lt!362366 () (_ BitVec 32))

(declare-fun lt!362384 () (_ BitVec 32))

(declare-fun lt!362387 () tuple3!1358)

(declare-fun bm!3807 () Bool)

(declare-fun lt!362375 () array!11374)

(assert (=> bm!3807 (= call!3809 (arrayRangesEq!826 (ite c!11197 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)) lt!362375) (ite c!11197 (_3!821 lt!362387) lt!362373) (ite c!11197 #b00000000000000000000000000000000 lt!362366) (ite c!11197 (bvadd #b00000000000000000000000000000001 i!761) lt!362384)))))

(declare-fun b!227015 () Bool)

(declare-fun lt!362385 () Unit!16886)

(assert (=> b!227015 (= e!155270 (tuple3!1359 lt!362385 (_2!10564 lt!362387) (_3!821 lt!362387)))))

(assert (=> b!227015 (= lt!362377 (readByte!0 (_2!10565 lt!362187)))))

(declare-fun lt!362382 () array!11374)

(assert (=> b!227015 (= lt!362382 (array!11375 (store (arr!5960 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10565 lt!362377)) (size!4988 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)))))))

(declare-fun lt!362360 () (_ BitVec 64))

(assert (=> b!227015 (= lt!362360 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!362379 () (_ BitVec 32))

(assert (=> b!227015 (= lt!362379 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362358 () Unit!16886)

(assert (=> b!227015 (= lt!362358 (validateOffsetBytesFromBitIndexLemma!0 (_2!10565 lt!362187) (_2!10565 lt!362377) lt!362360 lt!362379))))

(assert (=> b!227015 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10565 lt!362377)))) ((_ sign_extend 32) (currentByte!10361 (_2!10565 lt!362377))) ((_ sign_extend 32) (currentBit!10356 (_2!10565 lt!362377))) (bvsub lt!362379 ((_ extract 31 0) (bvsdiv (bvadd lt!362360 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!362376 () Unit!16886)

(assert (=> b!227015 (= lt!362376 lt!362358)))

(assert (=> b!227015 (= lt!362387 (readByteArrayLoop!0 (_2!10565 lt!362377) lt!362382 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!227015 (= call!3810 (bvadd (bitIndex!0 (size!4988 (buf!5529 (_2!10565 lt!362187))) (currentByte!10361 (_2!10565 lt!362187)) (currentBit!10356 (_2!10565 lt!362187))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!362355 () Unit!16886)

(declare-fun Unit!16890 () Unit!16886)

(assert (=> b!227015 (= lt!362355 Unit!16890)))

(assert (=> b!227015 (= (bvadd call!3810 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4988 (buf!5529 (_2!10564 lt!362387))) (currentByte!10361 (_2!10564 lt!362387)) (currentBit!10356 (_2!10564 lt!362387))))))

(declare-fun lt!362362 () Unit!16886)

(declare-fun Unit!16891 () Unit!16886)

(assert (=> b!227015 (= lt!362362 Unit!16891)))

(assert (=> b!227015 (= (bvadd (bitIndex!0 (size!4988 (buf!5529 (_2!10565 lt!362187))) (currentByte!10361 (_2!10565 lt!362187)) (currentBit!10356 (_2!10565 lt!362187))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4988 (buf!5529 (_2!10564 lt!362387))) (currentByte!10361 (_2!10564 lt!362387)) (currentBit!10356 (_2!10564 lt!362387))))))

(declare-fun lt!362364 () Unit!16886)

(declare-fun Unit!16892 () Unit!16886)

(assert (=> b!227015 (= lt!362364 Unit!16892)))

(assert (=> b!227015 (and (= (buf!5529 (_2!10565 lt!362187)) (buf!5529 (_2!10564 lt!362387))) (= (size!4988 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))) (size!4988 (_3!821 lt!362387))))))

(declare-fun lt!362372 () Unit!16886)

(declare-fun Unit!16893 () Unit!16886)

(assert (=> b!227015 (= lt!362372 Unit!16893)))

(declare-fun lt!362363 () Unit!16886)

(declare-fun arrayUpdatedAtPrefixLemma!385 (array!11374 (_ BitVec 32) (_ BitVec 8)) Unit!16886)

(assert (=> b!227015 (= lt!362363 (arrayUpdatedAtPrefixLemma!385 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10565 lt!362377)))))

(assert (=> b!227015 call!3808))

(declare-fun lt!362368 () Unit!16886)

(assert (=> b!227015 (= lt!362368 lt!362363)))

(declare-fun lt!362370 () (_ BitVec 32))

(assert (=> b!227015 (= lt!362370 #b00000000000000000000000000000000)))

(declare-fun lt!362365 () Unit!16886)

(declare-fun arrayRangesEqTransitive!264 (array!11374 array!11374 array!11374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16886)

(assert (=> b!227015 (= lt!362365 (arrayRangesEqTransitive!264 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)) lt!362382 (_3!821 lt!362387) lt!362370 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227015 (arrayRangesEq!826 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)) (_3!821 lt!362387) lt!362370 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!362371 () Unit!16886)

(assert (=> b!227015 (= lt!362371 lt!362365)))

(assert (=> b!227015 call!3809))

(declare-fun lt!362359 () Unit!16886)

(declare-fun Unit!16894 () Unit!16886)

(assert (=> b!227015 (= lt!362359 Unit!16894)))

(declare-fun lt!362381 () Unit!16886)

(declare-fun arrayRangesEqImpliesEq!115 (array!11374 array!11374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16886)

(assert (=> b!227015 (= lt!362381 (arrayRangesEqImpliesEq!115 lt!362382 (_3!821 lt!362387) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227015 (= (select (store (arr!5960 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10565 lt!362377)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5960 (_3!821 lt!362387)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362356 () Unit!16886)

(assert (=> b!227015 (= lt!362356 lt!362381)))

(declare-fun lt!362367 () Bool)

(assert (=> b!227015 (= lt!362367 (= (select (arr!5960 (_3!821 lt!362387)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10565 lt!362377)))))

(declare-fun Unit!16895 () Unit!16886)

(assert (=> b!227015 (= lt!362385 Unit!16895)))

(assert (=> b!227015 lt!362367))

(declare-fun b!227016 () Bool)

(assert (=> b!227016 (= e!155271 (arrayRangesEq!826 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)) (_3!821 lt!362357) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362388 () Unit!16886)

(declare-fun b!227017 () Bool)

(assert (=> b!227017 (= e!155270 (tuple3!1359 lt!362388 (_2!10565 lt!362187) (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))))))

(assert (=> b!227017 (= call!3810 call!3810)))

(declare-fun lt!362369 () Unit!16886)

(declare-fun Unit!16896 () Unit!16886)

(assert (=> b!227017 (= lt!362369 Unit!16896)))

(declare-fun lt!362383 () Unit!16886)

(declare-fun arrayRangesEqReflexiveLemma!130 (array!11374) Unit!16886)

(assert (=> b!227017 (= lt!362383 (arrayRangesEqReflexiveLemma!130 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))))))

(assert (=> b!227017 call!3808))

(declare-fun lt!362353 () Unit!16886)

(assert (=> b!227017 (= lt!362353 lt!362383)))

(assert (=> b!227017 (= lt!362375 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)))))

(assert (=> b!227017 (= lt!362373 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308)))))

(declare-fun lt!362378 () (_ BitVec 32))

(assert (=> b!227017 (= lt!362378 #b00000000000000000000000000000000)))

(declare-fun lt!362354 () (_ BitVec 32))

(assert (=> b!227017 (= lt!362354 (size!4988 (array!11375 (store (arr!5960 arr!308) i!761 (_1!10565 lt!362187)) (size!4988 arr!308))))))

(assert (=> b!227017 (= lt!362366 #b00000000000000000000000000000000)))

(assert (=> b!227017 (= lt!362384 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!115 (array!11374 array!11374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16886)

(assert (=> b!227017 (= lt!362388 (arrayRangesEqSlicedLemma!115 lt!362375 lt!362373 lt!362378 lt!362354 lt!362366 lt!362384))))

(assert (=> b!227017 call!3809))

(assert (= (and d!77048 c!11197) b!227015))

(assert (= (and d!77048 (not c!11197)) b!227017))

(assert (= (or b!227015 b!227017) bm!3807))

(assert (= (or b!227015 b!227017) bm!3805))

(assert (= (or b!227015 b!227017) bm!3806))

(assert (= (and d!77048 res!190472) b!227014))

(assert (= (and b!227014 res!190473) b!227016))

(assert (= (and d!77048 (not res!190471)) b!227013))

(declare-fun m!348897 () Bool)

(assert (=> b!227013 m!348897))

(declare-fun m!348899 () Bool)

(assert (=> b!227013 m!348899))

(declare-fun m!348901 () Bool)

(assert (=> b!227017 m!348901))

(declare-fun m!348903 () Bool)

(assert (=> b!227017 m!348903))

(declare-fun m!348905 () Bool)

(assert (=> bm!3806 m!348905))

(declare-fun m!348907 () Bool)

(assert (=> b!227016 m!348907))

(declare-fun m!348909 () Bool)

(assert (=> b!227015 m!348909))

(declare-fun m!348911 () Bool)

(assert (=> b!227015 m!348911))

(declare-fun m!348913 () Bool)

(assert (=> b!227015 m!348913))

(declare-fun m!348915 () Bool)

(assert (=> b!227015 m!348915))

(declare-fun m!348917 () Bool)

(assert (=> b!227015 m!348917))

(declare-fun m!348919 () Bool)

(assert (=> b!227015 m!348919))

(declare-fun m!348921 () Bool)

(assert (=> b!227015 m!348921))

(assert (=> b!227015 m!348821))

(declare-fun m!348923 () Bool)

(assert (=> b!227015 m!348923))

(declare-fun m!348925 () Bool)

(assert (=> b!227015 m!348925))

(declare-fun m!348927 () Bool)

(assert (=> b!227015 m!348927))

(declare-fun m!348929 () Bool)

(assert (=> b!227015 m!348929))

(declare-fun m!348931 () Bool)

(assert (=> b!227015 m!348931))

(assert (=> bm!3805 m!348923))

(declare-fun m!348933 () Bool)

(assert (=> bm!3805 m!348933))

(declare-fun m!348935 () Bool)

(assert (=> d!77048 m!348935))

(assert (=> d!77048 m!348821))

(declare-fun m!348937 () Bool)

(assert (=> bm!3807 m!348937))

(assert (=> b!226967 d!77048))

(declare-fun d!77067 () Bool)

(declare-fun lt!362469 () (_ BitVec 8))

(declare-fun lt!362467 () (_ BitVec 8))

(assert (=> d!77067 (= lt!362469 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5960 (buf!5529 thiss!1870)) (currentByte!10361 thiss!1870))) ((_ sign_extend 24) lt!362467))))))

(assert (=> d!77067 (= lt!362467 ((_ extract 7 0) (currentBit!10356 thiss!1870)))))

(declare-fun e!155279 () Bool)

(assert (=> d!77067 e!155279))

(declare-fun res!190480 () Bool)

(assert (=> d!77067 (=> (not res!190480) (not e!155279))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77067 (= res!190480 (validate_offset_bits!1 ((_ sign_extend 32) (size!4988 (buf!5529 thiss!1870))) ((_ sign_extend 32) (currentByte!10361 thiss!1870)) ((_ sign_extend 32) (currentBit!10356 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19492 0))(
  ( (tuple2!19493 (_1!10569 Unit!16886) (_2!10569 (_ BitVec 8))) )
))
(declare-fun Unit!16897 () Unit!16886)

(declare-fun Unit!16898 () Unit!16886)

(assert (=> d!77067 (= (readByte!0 thiss!1870) (tuple2!19487 (_2!10569 (ite (bvsgt ((_ sign_extend 24) lt!362467) #b00000000000000000000000000000000) (tuple2!19493 Unit!16897 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!362469) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5960 (buf!5529 thiss!1870)) (bvadd (currentByte!10361 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!362467)))))))) (tuple2!19493 Unit!16898 lt!362469))) (BitStream!9073 (buf!5529 thiss!1870) (bvadd (currentByte!10361 thiss!1870) #b00000000000000000000000000000001) (currentBit!10356 thiss!1870))))))

(declare-fun b!227026 () Bool)

(declare-fun e!155278 () Bool)

(assert (=> b!227026 (= e!155279 e!155278)))

(declare-fun res!190479 () Bool)

(assert (=> b!227026 (=> (not res!190479) (not e!155278))))

(declare-fun lt!362472 () tuple2!19486)

(assert (=> b!227026 (= res!190479 (= (buf!5529 (_2!10565 lt!362472)) (buf!5529 thiss!1870)))))

(declare-fun lt!362471 () (_ BitVec 8))

(declare-fun lt!362470 () (_ BitVec 8))

(declare-fun Unit!16899 () Unit!16886)

(declare-fun Unit!16900 () Unit!16886)

(assert (=> b!227026 (= lt!362472 (tuple2!19487 (_2!10569 (ite (bvsgt ((_ sign_extend 24) lt!362471) #b00000000000000000000000000000000) (tuple2!19493 Unit!16899 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!362470) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5960 (buf!5529 thiss!1870)) (bvadd (currentByte!10361 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!362471)))))))) (tuple2!19493 Unit!16900 lt!362470))) (BitStream!9073 (buf!5529 thiss!1870) (bvadd (currentByte!10361 thiss!1870) #b00000000000000000000000000000001) (currentBit!10356 thiss!1870))))))

(assert (=> b!227026 (= lt!362470 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5960 (buf!5529 thiss!1870)) (currentByte!10361 thiss!1870))) ((_ sign_extend 24) lt!362471))))))

(assert (=> b!227026 (= lt!362471 ((_ extract 7 0) (currentBit!10356 thiss!1870)))))

(declare-fun lt!362473 () (_ BitVec 64))

(declare-fun lt!362468 () (_ BitVec 64))

(declare-fun b!227027 () Bool)

(assert (=> b!227027 (= e!155278 (= (bitIndex!0 (size!4988 (buf!5529 (_2!10565 lt!362472))) (currentByte!10361 (_2!10565 lt!362472)) (currentBit!10356 (_2!10565 lt!362472))) (bvadd lt!362468 lt!362473)))))

(assert (=> b!227027 (or (not (= (bvand lt!362468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362473 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!362468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!362468 lt!362473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!227027 (= lt!362473 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!227027 (= lt!362468 (bitIndex!0 (size!4988 (buf!5529 thiss!1870)) (currentByte!10361 thiss!1870) (currentBit!10356 thiss!1870)))))

(assert (= (and d!77067 res!190480) b!227026))

(assert (= (and b!227026 res!190479) b!227027))

(declare-fun m!348939 () Bool)

(assert (=> d!77067 m!348939))

(declare-fun m!348941 () Bool)

(assert (=> d!77067 m!348941))

(declare-fun m!348943 () Bool)

(assert (=> d!77067 m!348943))

(assert (=> b!227026 m!348943))

(assert (=> b!227026 m!348939))

(declare-fun m!348945 () Bool)

(assert (=> b!227027 m!348945))

(assert (=> b!227027 m!348833))

(assert (=> b!226967 d!77067))

(declare-fun d!77069 () Bool)

(declare-fun e!155286 () Bool)

(assert (=> d!77069 e!155286))

(declare-fun res!190491 () Bool)

(assert (=> d!77069 (=> (not res!190491) (not e!155286))))

(declare-fun lt!362498 () (_ BitVec 64))

(declare-fun lt!362499 () (_ BitVec 64))

(declare-fun lt!362494 () (_ BitVec 64))

(assert (=> d!77069 (= res!190491 (= lt!362498 (bvsub lt!362499 lt!362494)))))

(assert (=> d!77069 (or (= (bvand lt!362499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362499 lt!362494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77069 (= lt!362494 (remainingBits!0 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10565 lt!362187)))) ((_ sign_extend 32) (currentByte!10361 (_2!10565 lt!362187))) ((_ sign_extend 32) (currentBit!10356 (_2!10565 lt!362187)))))))

(declare-fun lt!362495 () (_ BitVec 64))

(declare-fun lt!362496 () (_ BitVec 64))

(assert (=> d!77069 (= lt!362499 (bvmul lt!362495 lt!362496))))

(assert (=> d!77069 (or (= lt!362495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362496 (bvsdiv (bvmul lt!362495 lt!362496) lt!362495)))))

(assert (=> d!77069 (= lt!362496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77069 (= lt!362495 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10565 lt!362187)))))))

(assert (=> d!77069 (= lt!362498 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10361 (_2!10565 lt!362187))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10356 (_2!10565 lt!362187)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77069 (invariant!0 (currentBit!10356 (_2!10565 lt!362187)) (currentByte!10361 (_2!10565 lt!362187)) (size!4988 (buf!5529 (_2!10565 lt!362187))))))

(assert (=> d!77069 (= (bitIndex!0 (size!4988 (buf!5529 (_2!10565 lt!362187))) (currentByte!10361 (_2!10565 lt!362187)) (currentBit!10356 (_2!10565 lt!362187))) lt!362498)))

(declare-fun b!227038 () Bool)

(declare-fun res!190492 () Bool)

(assert (=> b!227038 (=> (not res!190492) (not e!155286))))

(assert (=> b!227038 (= res!190492 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362498))))

(declare-fun b!227039 () Bool)

(declare-fun lt!362497 () (_ BitVec 64))

(assert (=> b!227039 (= e!155286 (bvsle lt!362498 (bvmul lt!362497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227039 (or (= lt!362497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362497)))))

(assert (=> b!227039 (= lt!362497 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10565 lt!362187)))))))

(assert (= (and d!77069 res!190491) b!227038))

(assert (= (and b!227038 res!190492) b!227039))

(declare-fun m!348947 () Bool)

(assert (=> d!77069 m!348947))

(declare-fun m!348949 () Bool)

(assert (=> d!77069 m!348949))

(assert (=> b!226967 d!77069))

(declare-fun d!77071 () Bool)

(declare-fun e!155287 () Bool)

(assert (=> d!77071 e!155287))

(declare-fun res!190493 () Bool)

(assert (=> d!77071 (=> (not res!190493) (not e!155287))))

(declare-fun lt!362505 () (_ BitVec 64))

(declare-fun lt!362500 () (_ BitVec 64))

(declare-fun lt!362504 () (_ BitVec 64))

(assert (=> d!77071 (= res!190493 (= lt!362504 (bvsub lt!362505 lt!362500)))))

(assert (=> d!77071 (or (= (bvand lt!362505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362505 lt!362500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77071 (= lt!362500 (remainingBits!0 ((_ sign_extend 32) (size!4988 (buf!5529 thiss!1870))) ((_ sign_extend 32) (currentByte!10361 thiss!1870)) ((_ sign_extend 32) (currentBit!10356 thiss!1870))))))

(declare-fun lt!362501 () (_ BitVec 64))

(declare-fun lt!362502 () (_ BitVec 64))

(assert (=> d!77071 (= lt!362505 (bvmul lt!362501 lt!362502))))

(assert (=> d!77071 (or (= lt!362501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362502 (bvsdiv (bvmul lt!362501 lt!362502) lt!362501)))))

(assert (=> d!77071 (= lt!362502 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77071 (= lt!362501 ((_ sign_extend 32) (size!4988 (buf!5529 thiss!1870))))))

(assert (=> d!77071 (= lt!362504 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10361 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10356 thiss!1870))))))

(assert (=> d!77071 (invariant!0 (currentBit!10356 thiss!1870) (currentByte!10361 thiss!1870) (size!4988 (buf!5529 thiss!1870)))))

(assert (=> d!77071 (= (bitIndex!0 (size!4988 (buf!5529 thiss!1870)) (currentByte!10361 thiss!1870) (currentBit!10356 thiss!1870)) lt!362504)))

(declare-fun b!227040 () Bool)

(declare-fun res!190494 () Bool)

(assert (=> b!227040 (=> (not res!190494) (not e!155287))))

(assert (=> b!227040 (= res!190494 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362504))))

(declare-fun b!227041 () Bool)

(declare-fun lt!362503 () (_ BitVec 64))

(assert (=> b!227041 (= e!155287 (bvsle lt!362504 (bvmul lt!362503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227041 (or (= lt!362503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362503)))))

(assert (=> b!227041 (= lt!362503 ((_ sign_extend 32) (size!4988 (buf!5529 thiss!1870))))))

(assert (= (and d!77071 res!190493) b!227040))

(assert (= (and b!227040 res!190494) b!227041))

(assert (=> d!77071 m!348865))

(declare-fun m!348951 () Bool)

(assert (=> d!77071 m!348951))

(assert (=> b!226967 d!77071))

(declare-fun d!77073 () Bool)

(assert (=> d!77073 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10565 lt!362187)))) ((_ sign_extend 32) (currentByte!10361 (_2!10565 lt!362187))) ((_ sign_extend 32) (currentBit!10356 (_2!10565 lt!362187))) lt!362190) (bvsle ((_ sign_extend 32) lt!362190) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10565 lt!362187)))) ((_ sign_extend 32) (currentByte!10361 (_2!10565 lt!362187))) ((_ sign_extend 32) (currentBit!10356 (_2!10565 lt!362187)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18833 () Bool)

(assert (= bs!18833 d!77073))

(assert (=> bs!18833 m!348947))

(assert (=> b!226967 d!77073))

(declare-fun d!77075 () Bool)

(declare-fun e!155291 () Bool)

(assert (=> d!77075 e!155291))

(declare-fun res!190498 () Bool)

(assert (=> d!77075 (=> (not res!190498) (not e!155291))))

(declare-fun lt!362547 () (_ BitVec 64))

(declare-fun lt!362542 () (_ BitVec 64))

(declare-fun lt!362546 () (_ BitVec 64))

(assert (=> d!77075 (= res!190498 (= lt!362546 (bvsub lt!362547 lt!362542)))))

(assert (=> d!77075 (or (= (bvand lt!362547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362542 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362547 lt!362542) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77075 (= lt!362542 (remainingBits!0 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10564 lt!362186)))) ((_ sign_extend 32) (currentByte!10361 (_2!10564 lt!362186))) ((_ sign_extend 32) (currentBit!10356 (_2!10564 lt!362186)))))))

(declare-fun lt!362543 () (_ BitVec 64))

(declare-fun lt!362544 () (_ BitVec 64))

(assert (=> d!77075 (= lt!362547 (bvmul lt!362543 lt!362544))))

(assert (=> d!77075 (or (= lt!362543 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362544 (bvsdiv (bvmul lt!362543 lt!362544) lt!362543)))))

(assert (=> d!77075 (= lt!362544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77075 (= lt!362543 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10564 lt!362186)))))))

(assert (=> d!77075 (= lt!362546 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10361 (_2!10564 lt!362186))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10356 (_2!10564 lt!362186)))))))

(assert (=> d!77075 (invariant!0 (currentBit!10356 (_2!10564 lt!362186)) (currentByte!10361 (_2!10564 lt!362186)) (size!4988 (buf!5529 (_2!10564 lt!362186))))))

(assert (=> d!77075 (= (bitIndex!0 (size!4988 (buf!5529 (_2!10564 lt!362186))) (currentByte!10361 (_2!10564 lt!362186)) (currentBit!10356 (_2!10564 lt!362186))) lt!362546)))

(declare-fun b!227047 () Bool)

(declare-fun res!190499 () Bool)

(assert (=> b!227047 (=> (not res!190499) (not e!155291))))

(assert (=> b!227047 (= res!190499 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362546))))

(declare-fun b!227048 () Bool)

(declare-fun lt!362545 () (_ BitVec 64))

(assert (=> b!227048 (= e!155291 (bvsle lt!362546 (bvmul lt!362545 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227048 (or (= lt!362545 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362545 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362545)))))

(assert (=> b!227048 (= lt!362545 ((_ sign_extend 32) (size!4988 (buf!5529 (_2!10564 lt!362186)))))))

(assert (= (and d!77075 res!190498) b!227047))

(assert (= (and b!227047 res!190499) b!227048))

(declare-fun m!348953 () Bool)

(assert (=> d!77075 m!348953))

(declare-fun m!348955 () Bool)

(assert (=> d!77075 m!348955))

(assert (=> b!226967 d!77075))

(declare-fun d!77077 () Bool)

(assert (=> d!77077 (= (array_inv!4729 arr!308) (bvsge (size!4988 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47668 d!77077))

(declare-fun d!77079 () Bool)

(assert (=> d!77079 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10356 thiss!1870) (currentByte!10361 thiss!1870) (size!4988 (buf!5529 thiss!1870))))))

(declare-fun bs!18834 () Bool)

(assert (= bs!18834 d!77079))

(assert (=> bs!18834 m!348951))

(assert (=> start!47668 d!77079))

(declare-fun d!77081 () Bool)

(assert (=> d!77081 (= (array_inv!4729 (buf!5529 thiss!1870)) (bvsge (size!4988 (buf!5529 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226968 d!77081))

(check-sat (not d!77048) (not bm!3805) (not d!77043) (not b!226983) (not d!77073) (not b!227015) (not d!77079) (not b!227027) (not b!227017) (not bm!3806) (not b!227016) (not d!77071) (not b!227013) (not d!77069) (not d!77067) (not bm!3807) (not d!77075) (not d!77045))
