; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15412 () Bool)

(assert start!15412)

(declare-fun b!78351 () Bool)

(declare-fun res!64756 () Bool)

(declare-fun e!51429 () Bool)

(assert (=> b!78351 (=> (not res!64756) (not e!51429))))

(declare-datatypes ((array!3338 0))(
  ( (array!3339 (arr!2147 (Array (_ BitVec 32) (_ BitVec 8))) (size!1546 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2654 0))(
  ( (BitStream!2655 (buf!1936 array!3338) (currentByte!3774 (_ BitVec 32)) (currentBit!3769 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2654)

(declare-datatypes ((Unit!5177 0))(
  ( (Unit!5178) )
))
(declare-datatypes ((tuple2!6982 0))(
  ( (tuple2!6983 (_1!3628 Unit!5177) (_2!3628 BitStream!2654)) )
))
(declare-fun lt!125279 () tuple2!6982)

(declare-fun isPrefixOf!0 (BitStream!2654 BitStream!2654) Bool)

(assert (=> b!78351 (= res!64756 (isPrefixOf!0 thiss!1107 (_2!3628 lt!125279)))))

(declare-fun b!78352 () Bool)

(declare-fun e!51427 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!78352 (= e!51427 (invariant!0 (currentBit!3769 (_2!3628 lt!125279)) (currentByte!3774 (_2!3628 lt!125279)) (size!1546 (buf!1936 (_2!3628 lt!125279)))))))

(declare-fun b!78353 () Bool)

(declare-fun res!64759 () Bool)

(declare-fun e!51431 () Bool)

(assert (=> b!78353 (=> (not res!64759) (not e!51431))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78353 (= res!64759 (validate_offset_bit!0 ((_ sign_extend 32) (size!1546 (buf!1936 thiss!1107))) ((_ sign_extend 32) (currentByte!3774 thiss!1107)) ((_ sign_extend 32) (currentBit!3769 thiss!1107))))))

(declare-fun res!64751 () Bool)

(assert (=> start!15412 (=> (not res!64751) (not e!51431))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15412 (= res!64751 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15412 e!51431))

(assert (=> start!15412 true))

(declare-fun e!51432 () Bool)

(declare-fun inv!12 (BitStream!2654) Bool)

(assert (=> start!15412 (and (inv!12 thiss!1107) e!51432)))

(declare-fun b!78354 () Bool)

(declare-fun e!51426 () Bool)

(declare-datatypes ((tuple2!6984 0))(
  ( (tuple2!6985 (_1!3629 BitStream!2654) (_2!3629 Bool)) )
))
(declare-fun lt!125276 () tuple2!6984)

(declare-fun lt!125277 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78354 (= e!51426 (= (bitIndex!0 (size!1546 (buf!1936 (_1!3629 lt!125276))) (currentByte!3774 (_1!3629 lt!125276)) (currentBit!3769 (_1!3629 lt!125276))) lt!125277))))

(declare-fun b!78355 () Bool)

(assert (=> b!78355 (= e!51431 (not e!51427))))

(declare-fun res!64757 () Bool)

(assert (=> b!78355 (=> res!64757 e!51427)))

(assert (=> b!78355 (= res!64757 (not (= (size!1546 (buf!1936 (_2!3628 lt!125279))) (size!1546 (buf!1936 thiss!1107)))))))

(declare-fun e!51428 () Bool)

(assert (=> b!78355 e!51428))

(declare-fun res!64758 () Bool)

(assert (=> b!78355 (=> (not res!64758) (not e!51428))))

(assert (=> b!78355 (= res!64758 (= (size!1546 (buf!1936 thiss!1107)) (size!1546 (buf!1936 (_2!3628 lt!125279)))))))

(declare-fun lt!125278 () Bool)

(declare-fun appendBit!0 (BitStream!2654 Bool) tuple2!6982)

(assert (=> b!78355 (= lt!125279 (appendBit!0 thiss!1107 lt!125278))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!78355 (= lt!125278 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78356 () Bool)

(declare-fun res!64754 () Bool)

(assert (=> b!78356 (=> res!64754 e!51427)))

(assert (=> b!78356 (= res!64754 (not (isPrefixOf!0 thiss!1107 (_2!3628 lt!125279))))))

(declare-fun b!78357 () Bool)

(assert (=> b!78357 (= e!51428 e!51429)))

(declare-fun res!64753 () Bool)

(assert (=> b!78357 (=> (not res!64753) (not e!51429))))

(declare-fun lt!125280 () (_ BitVec 64))

(assert (=> b!78357 (= res!64753 (= lt!125277 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125280)))))

(assert (=> b!78357 (= lt!125277 (bitIndex!0 (size!1546 (buf!1936 (_2!3628 lt!125279))) (currentByte!3774 (_2!3628 lt!125279)) (currentBit!3769 (_2!3628 lt!125279))))))

(assert (=> b!78357 (= lt!125280 (bitIndex!0 (size!1546 (buf!1936 thiss!1107)) (currentByte!3774 thiss!1107) (currentBit!3769 thiss!1107)))))

(declare-fun b!78358 () Bool)

(declare-fun array_inv!1392 (array!3338) Bool)

(assert (=> b!78358 (= e!51432 (array_inv!1392 (buf!1936 thiss!1107)))))

(declare-fun b!78359 () Bool)

(declare-fun res!64752 () Bool)

(assert (=> b!78359 (=> res!64752 e!51427)))

(assert (=> b!78359 (= res!64752 (not (= (bitIndex!0 (size!1546 (buf!1936 (_2!3628 lt!125279))) (currentByte!3774 (_2!3628 lt!125279)) (currentBit!3769 (_2!3628 lt!125279))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1546 (buf!1936 thiss!1107)) (currentByte!3774 thiss!1107) (currentBit!3769 thiss!1107))))))))

(declare-fun b!78360 () Bool)

(assert (=> b!78360 (= e!51429 e!51426)))

(declare-fun res!64755 () Bool)

(assert (=> b!78360 (=> (not res!64755) (not e!51426))))

(assert (=> b!78360 (= res!64755 (and (= (_2!3629 lt!125276) lt!125278) (= (_1!3629 lt!125276) (_2!3628 lt!125279))))))

(declare-fun readBitPure!0 (BitStream!2654) tuple2!6984)

(declare-fun readerFrom!0 (BitStream!2654 (_ BitVec 32) (_ BitVec 32)) BitStream!2654)

(assert (=> b!78360 (= lt!125276 (readBitPure!0 (readerFrom!0 (_2!3628 lt!125279) (currentBit!3769 thiss!1107) (currentByte!3774 thiss!1107))))))

(assert (= (and start!15412 res!64751) b!78353))

(assert (= (and b!78353 res!64759) b!78355))

(assert (= (and b!78355 res!64758) b!78357))

(assert (= (and b!78357 res!64753) b!78351))

(assert (= (and b!78351 res!64756) b!78360))

(assert (= (and b!78360 res!64755) b!78354))

(assert (= (and b!78355 (not res!64757)) b!78359))

(assert (= (and b!78359 (not res!64752)) b!78356))

(assert (= (and b!78356 (not res!64754)) b!78352))

(assert (= start!15412 b!78358))

(declare-fun m!123915 () Bool)

(assert (=> b!78352 m!123915))

(declare-fun m!123917 () Bool)

(assert (=> b!78360 m!123917))

(assert (=> b!78360 m!123917))

(declare-fun m!123919 () Bool)

(assert (=> b!78360 m!123919))

(declare-fun m!123921 () Bool)

(assert (=> start!15412 m!123921))

(declare-fun m!123923 () Bool)

(assert (=> b!78358 m!123923))

(declare-fun m!123925 () Bool)

(assert (=> b!78351 m!123925))

(assert (=> b!78356 m!123925))

(declare-fun m!123927 () Bool)

(assert (=> b!78355 m!123927))

(declare-fun m!123929 () Bool)

(assert (=> b!78355 m!123929))

(declare-fun m!123931 () Bool)

(assert (=> b!78353 m!123931))

(declare-fun m!123933 () Bool)

(assert (=> b!78359 m!123933))

(declare-fun m!123935 () Bool)

(assert (=> b!78359 m!123935))

(assert (=> b!78357 m!123933))

(assert (=> b!78357 m!123935))

(declare-fun m!123937 () Bool)

(assert (=> b!78354 m!123937))

(push 1)

(assert (not b!78358))

(assert (not b!78357))

(assert (not b!78351))

(assert (not b!78356))

(assert (not b!78353))

(assert (not b!78352))

(assert (not b!78359))

(assert (not b!78354))

(assert (not b!78360))

(assert (not b!78355))

(assert (not start!15412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24734 () Bool)

(declare-fun e!51459 () Bool)

(assert (=> d!24734 e!51459))

(declare-fun res!64808 () Bool)

(assert (=> d!24734 (=> (not res!64808) (not e!51459))))

(declare-fun lt!125368 () (_ BitVec 64))

(declare-fun lt!125369 () (_ BitVec 64))

(declare-fun lt!125366 () (_ BitVec 64))

(assert (=> d!24734 (= res!64808 (= lt!125368 (bvsub lt!125366 lt!125369)))))

(assert (=> d!24734 (or (= (bvand lt!125366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125369 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125366 lt!125369) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24734 (= lt!125369 (remainingBits!0 ((_ sign_extend 32) (size!1546 (buf!1936 (_2!3628 lt!125279)))) ((_ sign_extend 32) (currentByte!3774 (_2!3628 lt!125279))) ((_ sign_extend 32) (currentBit!3769 (_2!3628 lt!125279)))))))

(declare-fun lt!125365 () (_ BitVec 64))

(declare-fun lt!125367 () (_ BitVec 64))

(assert (=> d!24734 (= lt!125366 (bvmul lt!125365 lt!125367))))

(assert (=> d!24734 (or (= lt!125365 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125367 (bvsdiv (bvmul lt!125365 lt!125367) lt!125365)))))

(assert (=> d!24734 (= lt!125367 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24734 (= lt!125365 ((_ sign_extend 32) (size!1546 (buf!1936 (_2!3628 lt!125279)))))))

(assert (=> d!24734 (= lt!125368 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3774 (_2!3628 lt!125279))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3769 (_2!3628 lt!125279)))))))

(assert (=> d!24734 (invariant!0 (currentBit!3769 (_2!3628 lt!125279)) (currentByte!3774 (_2!3628 lt!125279)) (size!1546 (buf!1936 (_2!3628 lt!125279))))))

(assert (=> d!24734 (= (bitIndex!0 (size!1546 (buf!1936 (_2!3628 lt!125279))) (currentByte!3774 (_2!3628 lt!125279)) (currentBit!3769 (_2!3628 lt!125279))) lt!125368)))

(declare-fun b!78408 () Bool)

(declare-fun res!64809 () Bool)

(assert (=> b!78408 (=> (not res!64809) (not e!51459))))

(assert (=> b!78408 (= res!64809 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125368))))

(declare-fun b!78409 () Bool)

(declare-fun lt!125370 () (_ BitVec 64))

(assert (=> b!78409 (= e!51459 (bvsle lt!125368 (bvmul lt!125370 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78409 (or (= lt!125370 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125370 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125370)))))

(assert (=> b!78409 (= lt!125370 ((_ sign_extend 32) (size!1546 (buf!1936 (_2!3628 lt!125279)))))))

(assert (= (and d!24734 res!64808) b!78408))

(assert (= (and b!78408 res!64809) b!78409))

(declare-fun m!123975 () Bool)

(assert (=> d!24734 m!123975))

(assert (=> d!24734 m!123915))

(assert (=> b!78359 d!24734))

(declare-fun d!24748 () Bool)

(declare-fun e!51460 () Bool)

(assert (=> d!24748 e!51460))

(declare-fun res!64810 () Bool)

(assert (=> d!24748 (=> (not res!64810) (not e!51460))))

(declare-fun lt!125375 () (_ BitVec 64))

(declare-fun lt!125374 () (_ BitVec 64))

(declare-fun lt!125372 () (_ BitVec 64))

(assert (=> d!24748 (= res!64810 (= lt!125374 (bvsub lt!125372 lt!125375)))))

(assert (=> d!24748 (or (= (bvand lt!125372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125375 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125372 lt!125375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24748 (= lt!125375 (remainingBits!0 ((_ sign_extend 32) (size!1546 (buf!1936 thiss!1107))) ((_ sign_extend 32) (currentByte!3774 thiss!1107)) ((_ sign_extend 32) (currentBit!3769 thiss!1107))))))

(declare-fun lt!125371 () (_ BitVec 64))

(declare-fun lt!125373 () (_ BitVec 64))

(assert (=> d!24748 (= lt!125372 (bvmul lt!125371 lt!125373))))

(assert (=> d!24748 (or (= lt!125371 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125373 (bvsdiv (bvmul lt!125371 lt!125373) lt!125371)))))

(assert (=> d!24748 (= lt!125373 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24748 (= lt!125371 ((_ sign_extend 32) (size!1546 (buf!1936 thiss!1107))))))

(assert (=> d!24748 (= lt!125374 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3774 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3769 thiss!1107))))))

(assert (=> d!24748 (invariant!0 (currentBit!3769 thiss!1107) (currentByte!3774 thiss!1107) (size!1546 (buf!1936 thiss!1107)))))

(assert (=> d!24748 (= (bitIndex!0 (size!1546 (buf!1936 thiss!1107)) (currentByte!3774 thiss!1107) (currentBit!3769 thiss!1107)) lt!125374)))

(declare-fun b!78410 () Bool)

(declare-fun res!64811 () Bool)

(assert (=> b!78410 (=> (not res!64811) (not e!51460))))

(assert (=> b!78410 (= res!64811 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125374))))

(declare-fun b!78411 () Bool)

(declare-fun lt!125376 () (_ BitVec 64))

(assert (=> b!78411 (= e!51460 (bvsle lt!125374 (bvmul lt!125376 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78411 (or (= lt!125376 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125376 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125376)))))

(assert (=> b!78411 (= lt!125376 ((_ sign_extend 32) (size!1546 (buf!1936 thiss!1107))))))

(assert (= (and d!24748 res!64810) b!78410))

(assert (= (and b!78410 res!64811) b!78411))

(declare-fun m!123977 () Bool)

(assert (=> d!24748 m!123977))

(declare-fun m!123979 () Bool)

(assert (=> d!24748 m!123979))

(assert (=> b!78359 d!24748))

(declare-fun d!24750 () Bool)

(declare-fun e!51463 () Bool)

(assert (=> d!24750 e!51463))

(declare-fun res!64814 () Bool)

(assert (=> d!24750 (=> (not res!64814) (not e!51463))))

(declare-fun lt!125378 () (_ BitVec 64))

(declare-fun lt!125381 () (_ BitVec 64))

(declare-fun lt!125380 () (_ BitVec 64))

(assert (=> d!24750 (= res!64814 (= lt!125380 (bvsub lt!125378 lt!125381)))))

(assert (=> d!24750 (or (= (bvand lt!125378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125378 lt!125381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24750 (= lt!125381 (remainingBits!0 ((_ sign_extend 32) (size!1546 (buf!1936 (_1!3629 lt!125276)))) ((_ sign_extend 32) (currentByte!3774 (_1!3629 lt!125276))) ((_ sign_extend 32) (currentBit!3769 (_1!3629 lt!125276)))))))

(declare-fun lt!125377 () (_ BitVec 64))

(declare-fun lt!125379 () (_ BitVec 64))

(assert (=> d!24750 (= lt!125378 (bvmul lt!125377 lt!125379))))

(assert (=> d!24750 (or (= lt!125377 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125379 (bvsdiv (bvmul lt!125377 lt!125379) lt!125377)))))

(assert (=> d!24750 (= lt!125379 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24750 (= lt!125377 ((_ sign_extend 32) (size!1546 (buf!1936 (_1!3629 lt!125276)))))))

(assert (=> d!24750 (= lt!125380 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3774 (_1!3629 lt!125276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3769 (_1!3629 lt!125276)))))))

(assert (=> d!24750 (invariant!0 (currentBit!3769 (_1!3629 lt!125276)) (currentByte!3774 (_1!3629 lt!125276)) (size!1546 (buf!1936 (_1!3629 lt!125276))))))

(assert (=> d!24750 (= (bitIndex!0 (size!1546 (buf!1936 (_1!3629 lt!125276))) (currentByte!3774 (_1!3629 lt!125276)) (currentBit!3769 (_1!3629 lt!125276))) lt!125380)))

(declare-fun b!78414 () Bool)

(declare-fun res!64815 () Bool)

(assert (=> b!78414 (=> (not res!64815) (not e!51463))))

(assert (=> b!78414 (= res!64815 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125380))))

(declare-fun b!78415 () Bool)

(declare-fun lt!125382 () (_ BitVec 64))

(assert (=> b!78415 (= e!51463 (bvsle lt!125380 (bvmul lt!125382 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78415 (or (= lt!125382 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125382 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125382)))))

(assert (=> b!78415 (= lt!125382 ((_ sign_extend 32) (size!1546 (buf!1936 (_1!3629 lt!125276)))))))

(assert (= (and d!24750 res!64814) b!78414))

(assert (= (and b!78414 res!64815) b!78415))

(declare-fun m!123981 () Bool)

(assert (=> d!24750 m!123981))

(declare-fun m!123983 () Bool)

(assert (=> d!24750 m!123983))

(assert (=> b!78354 d!24750))

(declare-fun d!24752 () Bool)

(declare-datatypes ((tuple2!6990 0))(
  ( (tuple2!6991 (_1!3632 Bool) (_2!3632 BitStream!2654)) )
))
(declare-fun lt!125391 () tuple2!6990)

(declare-fun readBit!0 (BitStream!2654) tuple2!6990)

(assert (=> d!24752 (= lt!125391 (readBit!0 (readerFrom!0 (_2!3628 lt!125279) (currentBit!3769 thiss!1107) (currentByte!3774 thiss!1107))))))

(assert (=> d!24752 (= (readBitPure!0 (readerFrom!0 (_2!3628 lt!125279) (currentBit!3769 thiss!1107) (currentByte!3774 thiss!1107))) (tuple2!6985 (_2!3632 lt!125391) (_1!3632 lt!125391)))))

(declare-fun bs!6004 () Bool)

(assert (= bs!6004 d!24752))

(assert (=> bs!6004 m!123917))

(declare-fun m!123987 () Bool)

(assert (=> bs!6004 m!123987))

(assert (=> b!78360 d!24752))

(declare-fun d!24760 () Bool)

(declare-fun e!51468 () Bool)

(assert (=> d!24760 e!51468))

(declare-fun res!64822 () Bool)

(assert (=> d!24760 (=> (not res!64822) (not e!51468))))

(assert (=> d!24760 (= res!64822 (invariant!0 (currentBit!3769 (_2!3628 lt!125279)) (currentByte!3774 (_2!3628 lt!125279)) (size!1546 (buf!1936 (_2!3628 lt!125279)))))))

(assert (=> d!24760 (= (readerFrom!0 (_2!3628 lt!125279) (currentBit!3769 thiss!1107) (currentByte!3774 thiss!1107)) (BitStream!2655 (buf!1936 (_2!3628 lt!125279)) (currentByte!3774 thiss!1107) (currentBit!3769 thiss!1107)))))

(declare-fun b!78421 () Bool)

(assert (=> b!78421 (= e!51468 (invariant!0 (currentBit!3769 thiss!1107) (currentByte!3774 thiss!1107) (size!1546 (buf!1936 (_2!3628 lt!125279)))))))

(assert (= (and d!24760 res!64822) b!78421))

(assert (=> d!24760 m!123915))

(declare-fun m!123993 () Bool)

(assert (=> b!78421 m!123993))

(assert (=> b!78360 d!24760))

(declare-fun b!78453 () Bool)

(declare-fun res!64852 () Bool)

(declare-fun e!51486 () Bool)

(assert (=> b!78453 (=> (not res!64852) (not e!51486))))

(declare-fun lt!125412 () (_ BitVec 64))

(declare-fun lt!125414 () (_ BitVec 64))

(declare-fun lt!125413 () tuple2!6982)

(assert (=> b!78453 (= res!64852 (= (bitIndex!0 (size!1546 (buf!1936 (_2!3628 lt!125413))) (currentByte!3774 (_2!3628 lt!125413)) (currentBit!3769 (_2!3628 lt!125413))) (bvadd lt!125414 lt!125412)))))

(assert (=> b!78453 (or (not (= (bvand lt!125414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125412 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125414 lt!125412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78453 (= lt!125412 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78453 (= lt!125414 (bitIndex!0 (size!1546 (buf!1936 thiss!1107)) (currentByte!3774 thiss!1107) (currentBit!3769 thiss!1107)))))

(declare-fun b!78456 () Bool)

(declare-fun e!51485 () Bool)

(declare-fun lt!125415 () tuple2!6984)

(assert (=> b!78456 (= e!51485 (= (bitIndex!0 (size!1546 (buf!1936 (_1!3629 lt!125415))) (currentByte!3774 (_1!3629 lt!125415)) (currentBit!3769 (_1!3629 lt!125415))) (bitIndex!0 (size!1546 (buf!1936 (_2!3628 lt!125413))) (currentByte!3774 (_2!3628 lt!125413)) (currentBit!3769 (_2!3628 lt!125413)))))))

(declare-fun d!24762 () Bool)

(assert (=> d!24762 e!51486))

(declare-fun res!64855 () Bool)

(assert (=> d!24762 (=> (not res!64855) (not e!51486))))

(assert (=> d!24762 (= res!64855 (= (size!1546 (buf!1936 thiss!1107)) (size!1546 (buf!1936 (_2!3628 lt!125413)))))))

(declare-fun choose!16 (BitStream!2654 Bool) tuple2!6982)

(assert (=> d!24762 (= lt!125413 (choose!16 thiss!1107 lt!125278))))

(assert (=> d!24762 (validate_offset_bit!0 ((_ sign_extend 32) (size!1546 (buf!1936 thiss!1107))) ((_ sign_extend 32) (currentByte!3774 thiss!1107)) ((_ sign_extend 32) (currentBit!3769 thiss!1107)))))

(assert (=> d!24762 (= (appendBit!0 thiss!1107 lt!125278) lt!125413)))

(declare-fun b!78454 () Bool)

(declare-fun res!64854 () Bool)

(assert (=> b!78454 (=> (not res!64854) (not e!51486))))

(assert (=> b!78454 (= res!64854 (isPrefixOf!0 thiss!1107 (_2!3628 lt!125413)))))

(declare-fun b!78455 () Bool)

(assert (=> b!78455 (= e!51486 e!51485)))

(declare-fun res!64853 () Bool)

(assert (=> b!78455 (=> (not res!64853) (not e!51485))))

(assert (=> b!78455 (= res!64853 (and (= (_2!3629 lt!125415) lt!125278) (= (_1!3629 lt!125415) (_2!3628 lt!125413))))))

(assert (=> b!78455 (= lt!125415 (readBitPure!0 (readerFrom!0 (_2!3628 lt!125413) (currentBit!3769 thiss!1107) (currentByte!3774 thiss!1107))))))

(assert (= (and d!24762 res!64855) b!78453))

(assert (= (and b!78453 res!64852) b!78454))

(assert (= (and b!78454 res!64854) b!78455))

(assert (= (and b!78455 res!64853) b!78456))

(declare-fun m!124009 () Bool)

(assert (=> b!78455 m!124009))

(assert (=> b!78455 m!124009))

(declare-fun m!124011 () Bool)

(assert (=> b!78455 m!124011))

(declare-fun m!124013 () Bool)

(assert (=> b!78456 m!124013))

(declare-fun m!124015 () Bool)

(assert (=> b!78456 m!124015))

(assert (=> b!78453 m!124015))

(assert (=> b!78453 m!123935))

(declare-fun m!124017 () Bool)

(assert (=> d!24762 m!124017))

(assert (=> d!24762 m!123931))

(declare-fun m!124019 () Bool)

(assert (=> b!78454 m!124019))

(assert (=> b!78355 d!24762))

(declare-fun d!24772 () Bool)

(declare-fun res!64863 () Bool)

(declare-fun e!51491 () Bool)

(assert (=> d!24772 (=> (not res!64863) (not e!51491))))

(assert (=> d!24772 (= res!64863 (= (size!1546 (buf!1936 thiss!1107)) (size!1546 (buf!1936 (_2!3628 lt!125279)))))))

(assert (=> d!24772 (= (isPrefixOf!0 thiss!1107 (_2!3628 lt!125279)) e!51491)))

(declare-fun b!78463 () Bool)

(declare-fun res!64864 () Bool)

(assert (=> b!78463 (=> (not res!64864) (not e!51491))))

(assert (=> b!78463 (= res!64864 (bvsle (bitIndex!0 (size!1546 (buf!1936 thiss!1107)) (currentByte!3774 thiss!1107) (currentBit!3769 thiss!1107)) (bitIndex!0 (size!1546 (buf!1936 (_2!3628 lt!125279))) (currentByte!3774 (_2!3628 lt!125279)) (currentBit!3769 (_2!3628 lt!125279)))))))

(declare-fun b!78464 () Bool)

(declare-fun e!51492 () Bool)

(assert (=> b!78464 (= e!51491 e!51492)))

(declare-fun res!64862 () Bool)

(assert (=> b!78464 (=> res!64862 e!51492)))

(assert (=> b!78464 (= res!64862 (= (size!1546 (buf!1936 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78465 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3338 array!3338 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78465 (= e!51492 (arrayBitRangesEq!0 (buf!1936 thiss!1107) (buf!1936 (_2!3628 lt!125279)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1546 (buf!1936 thiss!1107)) (currentByte!3774 thiss!1107) (currentBit!3769 thiss!1107))))))

(assert (= (and d!24772 res!64863) b!78463))

(assert (= (and b!78463 res!64864) b!78464))

(assert (= (and b!78464 (not res!64862)) b!78465))

(assert (=> b!78463 m!123935))

(assert (=> b!78463 m!123933))

(assert (=> b!78465 m!123935))

(assert (=> b!78465 m!123935))

(declare-fun m!124021 () Bool)

(assert (=> b!78465 m!124021))

(assert (=> b!78356 d!24772))

(assert (=> b!78351 d!24772))

(assert (=> b!78357 d!24734))

(assert (=> b!78357 d!24748))

(declare-fun d!24774 () Bool)

(assert (=> d!24774 (= (invariant!0 (currentBit!3769 (_2!3628 lt!125279)) (currentByte!3774 (_2!3628 lt!125279)) (size!1546 (buf!1936 (_2!3628 lt!125279)))) (and (bvsge (currentBit!3769 (_2!3628 lt!125279)) #b00000000000000000000000000000000) (bvslt (currentBit!3769 (_2!3628 lt!125279)) #b00000000000000000000000000001000) (bvsge (currentByte!3774 (_2!3628 lt!125279)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3774 (_2!3628 lt!125279)) (size!1546 (buf!1936 (_2!3628 lt!125279)))) (and (= (currentBit!3769 (_2!3628 lt!125279)) #b00000000000000000000000000000000) (= (currentByte!3774 (_2!3628 lt!125279)) (size!1546 (buf!1936 (_2!3628 lt!125279))))))))))

(assert (=> b!78352 d!24774))

(declare-fun d!24776 () Bool)

(assert (=> d!24776 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3769 thiss!1107) (currentByte!3774 thiss!1107) (size!1546 (buf!1936 thiss!1107))))))

(declare-fun bs!6007 () Bool)

(assert (= bs!6007 d!24776))

(assert (=> bs!6007 m!123979))

(assert (=> start!15412 d!24776))

(declare-fun d!24778 () Bool)

(assert (=> d!24778 (= (array_inv!1392 (buf!1936 thiss!1107)) (bvsge (size!1546 (buf!1936 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78358 d!24778))

(declare-fun d!24780 () Bool)

(assert (=> d!24780 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1546 (buf!1936 thiss!1107))) ((_ sign_extend 32) (currentByte!3774 thiss!1107)) ((_ sign_extend 32) (currentBit!3769 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1546 (buf!1936 thiss!1107))) ((_ sign_extend 32) (currentByte!3774 thiss!1107)) ((_ sign_extend 32) (currentBit!3769 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6008 () Bool)

