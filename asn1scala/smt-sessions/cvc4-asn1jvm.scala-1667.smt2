; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46382 () Bool)

(assert start!46382)

(declare-fun b!223169 () Bool)

(declare-fun e!151866 () Bool)

(declare-datatypes ((array!10957 0))(
  ( (array!10958 (arr!5742 (Array (_ BitVec 32) (_ BitVec 8))) (size!4809 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8720 0))(
  ( (BitStream!8721 (buf!5353 array!10957) (currentByte!10035 (_ BitVec 32)) (currentBit!10030 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8720)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223169 (= e!151866 (not (invariant!0 (currentBit!10030 thiss!1870) (currentByte!10035 thiss!1870) (size!4809 (buf!5353 thiss!1870)))))))

(declare-fun arr!308 () array!10957)

(declare-datatypes ((tuple2!19050 0))(
  ( (tuple2!19051 (_1!10239 (_ BitVec 8)) (_2!10239 BitStream!8720)) )
))
(declare-fun lt!352186 () tuple2!19050)

(declare-datatypes ((Unit!16110 0))(
  ( (Unit!16111) )
))
(declare-datatypes ((tuple3!1144 0))(
  ( (tuple3!1145 (_1!10240 Unit!16110) (_2!10240 BitStream!8720) (_3!714 array!10957)) )
))
(declare-fun lt!352184 () tuple3!1144)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!8720 array!10957 (_ BitVec 32) (_ BitVec 32)) tuple3!1144)

(assert (=> b!223169 (= lt!352184 (readByteArrayLoop!0 (_2!10239 lt!352186) (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223169 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4809 (buf!5353 (_2!10239 lt!352186)))) ((_ sign_extend 32) (currentByte!10035 (_2!10239 lt!352186))) ((_ sign_extend 32) (currentBit!10030 (_2!10239 lt!352186))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!352185 () Unit!16110)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8720 BitStream!8720 (_ BitVec 64) (_ BitVec 32)) Unit!16110)

(assert (=> b!223169 (= lt!352185 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10239 lt!352186) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8720) tuple2!19050)

(assert (=> b!223169 (= lt!352186 (readByte!0 thiss!1870))))

(declare-fun b!223168 () Bool)

(declare-fun res!187352 () Bool)

(assert (=> b!223168 (=> (not res!187352) (not e!151866))))

(assert (=> b!223168 (= res!187352 (bvslt i!761 to!496))))

(declare-fun res!187351 () Bool)

(assert (=> start!46382 (=> (not res!187351) (not e!151866))))

(assert (=> start!46382 (= res!187351 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4809 arr!308))))))

(assert (=> start!46382 e!151866))

(assert (=> start!46382 true))

(declare-fun array_inv!4550 (array!10957) Bool)

(assert (=> start!46382 (array_inv!4550 arr!308)))

(declare-fun e!151865 () Bool)

(declare-fun inv!12 (BitStream!8720) Bool)

(assert (=> start!46382 (and (inv!12 thiss!1870) e!151865)))

(declare-fun b!223170 () Bool)

(assert (=> b!223170 (= e!151865 (array_inv!4550 (buf!5353 thiss!1870)))))

(declare-fun b!223167 () Bool)

(declare-fun res!187350 () Bool)

(assert (=> b!223167 (=> (not res!187350) (not e!151866))))

(assert (=> b!223167 (= res!187350 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4809 (buf!5353 thiss!1870))) ((_ sign_extend 32) (currentByte!10035 thiss!1870)) ((_ sign_extend 32) (currentBit!10030 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46382 res!187351) b!223167))

(assert (= (and b!223167 res!187350) b!223168))

(assert (= (and b!223168 res!187352) b!223169))

(assert (= start!46382 b!223170))

(declare-fun m!341733 () Bool)

(assert (=> b!223169 m!341733))

(declare-fun m!341735 () Bool)

(assert (=> b!223169 m!341735))

(declare-fun m!341737 () Bool)

(assert (=> b!223169 m!341737))

(declare-fun m!341739 () Bool)

(assert (=> b!223169 m!341739))

(declare-fun m!341741 () Bool)

(assert (=> b!223169 m!341741))

(declare-fun m!341743 () Bool)

(assert (=> b!223169 m!341743))

(declare-fun m!341745 () Bool)

(assert (=> start!46382 m!341745))

(declare-fun m!341747 () Bool)

(assert (=> start!46382 m!341747))

(declare-fun m!341749 () Bool)

(assert (=> b!223170 m!341749))

(declare-fun m!341751 () Bool)

(assert (=> b!223167 m!341751))

(push 1)

(assert (not b!223167))

(assert (not start!46382))

(assert (not b!223169))

(assert (not b!223170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75560 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75560 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4809 (buf!5353 thiss!1870))) ((_ sign_extend 32) (currentByte!10035 thiss!1870)) ((_ sign_extend 32) (currentBit!10030 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4809 (buf!5353 thiss!1870))) ((_ sign_extend 32) (currentByte!10035 thiss!1870)) ((_ sign_extend 32) (currentBit!10030 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18442 () Bool)

(assert (= bs!18442 d!75560))

(declare-fun m!341757 () Bool)

(assert (=> bs!18442 m!341757))

(assert (=> b!223167 d!75560))

(declare-fun d!75562 () Bool)

(assert (=> d!75562 (= (array_inv!4550 arr!308) (bvsge (size!4809 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46382 d!75562))

(declare-fun d!75564 () Bool)

(assert (=> d!75564 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10030 thiss!1870) (currentByte!10035 thiss!1870) (size!4809 (buf!5353 thiss!1870))))))

(declare-fun bs!18443 () Bool)

(assert (= bs!18443 d!75564))

(assert (=> bs!18443 m!341739))

(assert (=> start!46382 d!75564))

(declare-fun d!75566 () Bool)

(assert (=> d!75566 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4809 (buf!5353 (_2!10239 lt!352186)))) ((_ sign_extend 32) (currentByte!10035 (_2!10239 lt!352186))) ((_ sign_extend 32) (currentBit!10030 (_2!10239 lt!352186))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4809 (buf!5353 (_2!10239 lt!352186)))) ((_ sign_extend 32) (currentByte!10035 (_2!10239 lt!352186))) ((_ sign_extend 32) (currentBit!10030 (_2!10239 lt!352186)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18444 () Bool)

(assert (= bs!18444 d!75566))

(declare-fun m!341759 () Bool)

(assert (=> bs!18444 m!341759))

(assert (=> b!223169 d!75566))

(declare-fun e!151892 () tuple3!1144)

(declare-fun b!223204 () Bool)

(declare-fun lt!352374 () Unit!16110)

(assert (=> b!223204 (= e!151892 (tuple3!1145 lt!352374 (_2!10239 lt!352186) (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))))))

(declare-fun call!3459 () (_ BitVec 64))

(assert (=> b!223204 (= call!3459 call!3459)))

(declare-fun lt!352383 () Unit!16110)

(declare-fun Unit!16122 () Unit!16110)

(assert (=> b!223204 (= lt!352383 Unit!16122)))

(declare-fun lt!352391 () Unit!16110)

(declare-fun arrayRangesEqReflexiveLemma!59 (array!10957) Unit!16110)

(assert (=> b!223204 (= lt!352391 (arrayRangesEqReflexiveLemma!59 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))))))

(declare-fun call!3458 () Bool)

(assert (=> b!223204 call!3458))

(declare-fun lt!352373 () Unit!16110)

(assert (=> b!223204 (= lt!352373 lt!352391)))

(declare-fun lt!352399 () array!10957)

(assert (=> b!223204 (= lt!352399 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)))))

(declare-fun lt!352402 () array!10957)

(assert (=> b!223204 (= lt!352402 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)))))

(declare-fun lt!352393 () (_ BitVec 32))

(assert (=> b!223204 (= lt!352393 #b00000000000000000000000000000000)))

(declare-fun lt!352386 () (_ BitVec 32))

(assert (=> b!223204 (= lt!352386 (size!4809 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))))))

(declare-fun lt!352387 () (_ BitVec 32))

(assert (=> b!223204 (= lt!352387 #b00000000000000000000000000000000)))

(declare-fun lt!352406 () (_ BitVec 32))

(assert (=> b!223204 (= lt!352406 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!60 (array!10957 array!10957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16110)

(assert (=> b!223204 (= lt!352374 (arrayRangesEqSlicedLemma!60 lt!352399 lt!352402 lt!352393 lt!352386 lt!352387 lt!352406))))

(declare-fun call!3457 () Bool)

(assert (=> b!223204 call!3457))

(declare-fun c!11080 () Bool)

(declare-fun lt!352380 () tuple2!19050)

(declare-fun bm!3454 () Bool)

(declare-fun arrayRangesEq!708 (array!10957 array!10957 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3454 (= call!3457 (arrayRangesEq!708 (ite c!11080 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)) lt!352399) (ite c!11080 (array!10958 (store (arr!5742 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10239 lt!352380)) (size!4809 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)))) lt!352402) (ite c!11080 #b00000000000000000000000000000000 lt!352387) (ite c!11080 (bvadd #b00000000000000000000000000000001 i!761) lt!352406)))))

(declare-fun d!75568 () Bool)

(declare-fun e!151893 () Bool)

(assert (=> d!75568 e!151893))

(declare-fun res!187381 () Bool)

(assert (=> d!75568 (=> res!187381 e!151893)))

(assert (=> d!75568 (= res!187381 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!352381 () Bool)

(declare-fun e!151891 () Bool)

(assert (=> d!75568 (= lt!352381 e!151891)))

(declare-fun res!187379 () Bool)

(assert (=> d!75568 (=> (not res!187379) (not e!151891))))

(declare-fun lt!352395 () (_ BitVec 64))

(declare-fun lt!352404 () tuple3!1144)

(declare-fun lt!352385 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!75568 (= res!187379 (= (bvadd lt!352395 lt!352385) (bitIndex!0 (size!4809 (buf!5353 (_2!10240 lt!352404))) (currentByte!10035 (_2!10240 lt!352404)) (currentBit!10030 (_2!10240 lt!352404)))))))

(assert (=> d!75568 (or (not (= (bvand lt!352395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352385 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352395 lt!352385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!352390 () (_ BitVec 64))

(assert (=> d!75568 (= lt!352385 (bvmul lt!352390 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75568 (or (= lt!352390 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352390 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352390)))))

(assert (=> d!75568 (= lt!352390 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75568 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75568 (= lt!352395 (bitIndex!0 (size!4809 (buf!5353 (_2!10239 lt!352186))) (currentByte!10035 (_2!10239 lt!352186)) (currentBit!10030 (_2!10239 lt!352186))))))

(assert (=> d!75568 (= lt!352404 e!151892)))

(assert (=> d!75568 (= c!11080 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75568 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4809 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)))))))

(assert (=> d!75568 (= (readByteArrayLoop!0 (_2!10239 lt!352186) (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!352404)))

(declare-fun b!223203 () Bool)

(declare-fun lt!352376 () Unit!16110)

(declare-fun lt!352389 () tuple3!1144)

(assert (=> b!223203 (= e!151892 (tuple3!1145 lt!352376 (_2!10240 lt!352389) (_3!714 lt!352389)))))

(assert (=> b!223203 (= lt!352380 (readByte!0 (_2!10239 lt!352186)))))

(declare-fun lt!352400 () array!10957)

(assert (=> b!223203 (= lt!352400 (array!10958 (store (arr!5742 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10239 lt!352380)) (size!4809 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)))))))

(declare-fun lt!352379 () (_ BitVec 64))

(assert (=> b!223203 (= lt!352379 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!352397 () (_ BitVec 32))

(assert (=> b!223203 (= lt!352397 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!352394 () Unit!16110)

(assert (=> b!223203 (= lt!352394 (validateOffsetBytesFromBitIndexLemma!0 (_2!10239 lt!352186) (_2!10239 lt!352380) lt!352379 lt!352397))))

(assert (=> b!223203 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4809 (buf!5353 (_2!10239 lt!352380)))) ((_ sign_extend 32) (currentByte!10035 (_2!10239 lt!352380))) ((_ sign_extend 32) (currentBit!10030 (_2!10239 lt!352380))) (bvsub lt!352397 ((_ extract 31 0) (bvsdiv (bvadd lt!352379 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!352384 () Unit!16110)

(assert (=> b!223203 (= lt!352384 lt!352394)))

(assert (=> b!223203 (= lt!352389 (readByteArrayLoop!0 (_2!10239 lt!352380) lt!352400 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223203 (= call!3459 (bvadd (bitIndex!0 (size!4809 (buf!5353 (_2!10239 lt!352186))) (currentByte!10035 (_2!10239 lt!352186)) (currentBit!10030 (_2!10239 lt!352186))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!352398 () Unit!16110)

(declare-fun Unit!16128 () Unit!16110)

(assert (=> b!223203 (= lt!352398 Unit!16128)))

(assert (=> b!223203 (= (bvadd call!3459 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4809 (buf!5353 (_2!10240 lt!352389))) (currentByte!10035 (_2!10240 lt!352389)) (currentBit!10030 (_2!10240 lt!352389))))))

(declare-fun lt!352408 () Unit!16110)

(declare-fun Unit!16129 () Unit!16110)

(assert (=> b!223203 (= lt!352408 Unit!16129)))

(assert (=> b!223203 (= (bvadd (bitIndex!0 (size!4809 (buf!5353 (_2!10239 lt!352186))) (currentByte!10035 (_2!10239 lt!352186)) (currentBit!10030 (_2!10239 lt!352186))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4809 (buf!5353 (_2!10240 lt!352389))) (currentByte!10035 (_2!10240 lt!352389)) (currentBit!10030 (_2!10240 lt!352389))))))

(declare-fun lt!352388 () Unit!16110)

(declare-fun Unit!16130 () Unit!16110)

(assert (=> b!223203 (= lt!352388 Unit!16130)))

(assert (=> b!223203 (and (= (buf!5353 (_2!10239 lt!352186)) (buf!5353 (_2!10240 lt!352389))) (= (size!4809 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))) (size!4809 (_3!714 lt!352389))))))

(declare-fun lt!352392 () Unit!16110)

(declare-fun Unit!16131 () Unit!16110)

(assert (=> b!223203 (= lt!352392 Unit!16131)))

(declare-fun lt!352377 () Unit!16110)

(declare-fun arrayUpdatedAtPrefixLemma!300 (array!10957 (_ BitVec 32) (_ BitVec 8)) Unit!16110)

(assert (=> b!223203 (= lt!352377 (arrayUpdatedAtPrefixLemma!300 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10239 lt!352380)))))

(assert (=> b!223203 call!3457))

(declare-fun lt!352403 () Unit!16110)

(assert (=> b!223203 (= lt!352403 lt!352377)))

(declare-fun lt!352407 () (_ BitVec 32))

(assert (=> b!223203 (= lt!352407 #b00000000000000000000000000000000)))

(declare-fun lt!352382 () Unit!16110)

(declare-fun arrayRangesEqTransitive!194 (array!10957 array!10957 array!10957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16110)

(assert (=> b!223203 (= lt!352382 (arrayRangesEqTransitive!194 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)) lt!352400 (_3!714 lt!352389) lt!352407 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223203 call!3458))

(declare-fun lt!352375 () Unit!16110)

(assert (=> b!223203 (= lt!352375 lt!352382)))

(assert (=> b!223203 (arrayRangesEq!708 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)) (_3!714 lt!352389) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!352401 () Unit!16110)

(declare-fun Unit!16133 () Unit!16110)

(assert (=> b!223203 (= lt!352401 Unit!16133)))

(declare-fun lt!352396 () Unit!16110)

(declare-fun arrayRangesEqImpliesEq!69 (array!10957 array!10957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16110)

(assert (=> b!223203 (= lt!352396 (arrayRangesEqImpliesEq!69 lt!352400 (_3!714 lt!352389) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223203 (= (select (store (arr!5742 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10239 lt!352380)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5742 (_3!714 lt!352389)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!352405 () Unit!16110)

(assert (=> b!223203 (= lt!352405 lt!352396)))

(declare-fun lt!352378 () Bool)

(assert (=> b!223203 (= lt!352378 (= (select (arr!5742 (_3!714 lt!352389)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10239 lt!352380)))))

(declare-fun Unit!16134 () Unit!16110)

(assert (=> b!223203 (= lt!352376 Unit!16134)))

(assert (=> b!223203 lt!352378))

(declare-fun b!223205 () Bool)

(declare-fun res!187380 () Bool)

(assert (=> b!223205 (=> (not res!187380) (not e!151891))))

(assert (=> b!223205 (= res!187380 (and (= (buf!5353 (_2!10239 lt!352186)) (buf!5353 (_2!10240 lt!352404))) (= (size!4809 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))) (size!4809 (_3!714 lt!352404)))))))

(declare-fun bm!3455 () Bool)

(assert (=> bm!3455 (= call!3459 (bitIndex!0 (ite c!11080 (size!4809 (buf!5353 (_2!10239 lt!352380))) (size!4809 (buf!5353 (_2!10239 lt!352186)))) (ite c!11080 (currentByte!10035 (_2!10239 lt!352380)) (currentByte!10035 (_2!10239 lt!352186))) (ite c!11080 (currentBit!10030 (_2!10239 lt!352380)) (currentBit!10030 (_2!10239 lt!352186)))))))

(declare-fun b!223206 () Bool)

(assert (=> b!223206 (= e!151891 (arrayRangesEq!708 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)) (_3!714 lt!352404) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!223207 () Bool)

(declare-datatypes ((tuple2!19060 0))(
  ( (tuple2!19061 (_1!10245 BitStream!8720) (_2!10245 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8720) tuple2!19060)

(assert (=> b!223207 (= e!151893 (= (select (arr!5742 (_3!714 lt!352404)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10245 (readBytePure!0 (_2!10239 lt!352186)))))))

(assert (=> b!223207 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4809 (_3!714 lt!352404))))))

(declare-fun bm!3456 () Bool)

(assert (=> bm!3456 (= call!3458 (arrayRangesEq!708 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308)) (ite c!11080 (_3!714 lt!352389) (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))) (ite c!11080 lt!352407 #b00000000000000000000000000000000) (ite c!11080 (bvadd #b00000000000000000000000000000001 i!761) (size!4809 (array!10958 (store (arr!5742 arr!308) i!761 (_1!10239 lt!352186)) (size!4809 arr!308))))))))

(assert (= (and d!75568 c!11080) b!223203))

(assert (= (and d!75568 (not c!11080)) b!223204))

(assert (= (or b!223203 b!223204) bm!3454))

(assert (= (or b!223203 b!223204) bm!3456))

(assert (= (or b!223203 b!223204) bm!3455))

(assert (= (and d!75568 res!187379) b!223205))

(assert (= (and b!223205 res!187380) b!223206))

(assert (= (and d!75568 (not res!187381)) b!223207))

(declare-fun m!341783 () Bool)

(assert (=> b!223203 m!341783))

(declare-fun m!341785 () Bool)

(assert (=> b!223203 m!341785))

(declare-fun m!341787 () Bool)

(assert (=> b!223203 m!341787))

(declare-fun m!341789 () Bool)

(assert (=> b!223203 m!341789))

(declare-fun m!341791 () Bool)

(assert (=> b!223203 m!341791))

