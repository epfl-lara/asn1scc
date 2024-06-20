; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30354 () Bool)

(assert start!30354)

(declare-fun b!155384 () Bool)

(declare-fun e!104643 () Bool)

(declare-fun e!104648 () Bool)

(assert (=> b!155384 (= e!104643 e!104648)))

(declare-fun res!129978 () Bool)

(assert (=> b!155384 (=> (not res!129978) (not e!104648))))

(declare-fun lt!241808 () (_ BitVec 32))

(declare-datatypes ((array!7049 0))(
  ( (array!7050 (arr!3992 (Array (_ BitVec 32) (_ BitVec 8))) (size!3169 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5596 0))(
  ( (BitStream!5597 (buf!3672 array!7049) (currentByte!6718 (_ BitVec 32)) (currentBit!6713 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5596)

(assert (=> b!155384 (= res!129978 (and (bvsle #b00000000000000000000000000000000 lt!241808) (bvsle lt!241808 (size!3169 (buf!3672 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6718 bs1!10)) (bvslt (currentByte!6718 bs1!10) lt!241808)))))

(declare-fun lt!241810 () (_ BitVec 64))

(assert (=> b!155384 (= lt!241808 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241810 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13762 0))(
  ( (tuple2!13763 (_1!7298 BitStream!5596) (_2!7298 (_ BitVec 8))) )
))
(declare-fun lt!241807 () tuple2!13762)

(declare-fun bs2!18 () BitStream!5596)

(declare-fun readBytePure!0 (BitStream!5596) tuple2!13762)

(assert (=> b!155384 (= lt!241807 (readBytePure!0 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))))))

(declare-fun lt!241805 () tuple2!13762)

(assert (=> b!155384 (= lt!241805 (readBytePure!0 bs1!10))))

(declare-fun b!155385 () Bool)

(declare-fun res!129974 () Bool)

(assert (=> b!155385 (=> (not res!129974) (not e!104643))))

(declare-fun lt!241809 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155385 (= res!129974 (bvsle lt!241809 (bitIndex!0 (size!3169 (buf!3672 bs2!18)) (currentByte!6718 bs2!18) (currentBit!6713 bs2!18))))))

(declare-fun b!155386 () Bool)

(declare-fun e!104641 () Bool)

(assert (=> b!155386 (= e!104641 e!104643)))

(declare-fun res!129976 () Bool)

(assert (=> b!155386 (=> (not res!129976) (not e!104643))))

(assert (=> b!155386 (= res!129976 (bvsle lt!241809 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3169 (buf!3672 bs1!10))))))))

(assert (=> b!155386 (= lt!241809 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241810))))

(assert (=> b!155386 (= lt!241810 (bitIndex!0 (size!3169 (buf!3672 bs1!10)) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))))

(declare-fun res!129980 () Bool)

(assert (=> start!30354 (=> (not res!129980) (not e!104641))))

(assert (=> start!30354 (= res!129980 (= (size!3169 (buf!3672 bs1!10)) (size!3169 (buf!3672 bs2!18))))))

(assert (=> start!30354 e!104641))

(declare-fun e!104646 () Bool)

(declare-fun inv!12 (BitStream!5596) Bool)

(assert (=> start!30354 (and (inv!12 bs1!10) e!104646)))

(declare-fun e!104645 () Bool)

(assert (=> start!30354 (and (inv!12 bs2!18) e!104645)))

(declare-fun b!155387 () Bool)

(declare-fun array_inv!2958 (array!7049) Bool)

(assert (=> b!155387 (= e!104646 (array_inv!2958 (buf!3672 bs1!10)))))

(declare-fun b!155388 () Bool)

(declare-fun res!129975 () Bool)

(assert (=> b!155388 (=> (not res!129975) (not e!104643))))

(declare-fun arrayBitRangesEq!0 (array!7049 array!7049 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155388 (= res!129975 (arrayBitRangesEq!0 (buf!3672 bs1!10) (buf!3672 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241809))))

(declare-fun b!155389 () Bool)

(declare-fun e!104644 () Bool)

(assert (=> b!155389 (= e!104644 (= (_2!7298 lt!241805) (_2!7298 lt!241807)))))

(declare-fun b!155390 () Bool)

(assert (=> b!155390 (= e!104648 (not e!104644))))

(declare-fun res!129979 () Bool)

(assert (=> b!155390 (=> (not res!129979) (not e!104644))))

(assert (=> b!155390 (= res!129979 (= (bitIndex!0 (size!3169 (buf!3672 (_1!7298 lt!241805))) (currentByte!6718 (_1!7298 lt!241805)) (currentBit!6713 (_1!7298 lt!241805))) (bitIndex!0 (size!3169 (buf!3672 (_1!7298 lt!241807))) (currentByte!6718 (_1!7298 lt!241807)) (currentBit!6713 (_1!7298 lt!241807)))))))

(assert (=> b!155390 (= (select (arr!3992 (buf!3672 bs1!10)) (currentByte!6718 bs1!10)) (select (arr!3992 (buf!3672 bs2!18)) (currentByte!6718 bs1!10)))))

(declare-datatypes ((Unit!9781 0))(
  ( (Unit!9782) )
))
(declare-fun lt!241806 () Unit!9781)

(declare-fun arrayRangesEqImpliesEq!27 (array!7049 array!7049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9781)

(assert (=> b!155390 (= lt!241806 (arrayRangesEqImpliesEq!27 (buf!3672 bs1!10) (buf!3672 bs2!18) #b00000000000000000000000000000000 (currentByte!6718 bs1!10) lt!241808))))

(declare-fun b!155391 () Bool)

(assert (=> b!155391 (= e!104645 (array_inv!2958 (buf!3672 bs2!18)))))

(declare-fun b!155392 () Bool)

(declare-fun res!129977 () Bool)

(assert (=> b!155392 (=> (not res!129977) (not e!104648))))

(declare-fun arrayRangesEq!407 (array!7049 array!7049 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155392 (= res!129977 (arrayRangesEq!407 (buf!3672 bs1!10) (buf!3672 bs2!18) #b00000000000000000000000000000000 lt!241808))))

(assert (= (and start!30354 res!129980) b!155386))

(assert (= (and b!155386 res!129976) b!155385))

(assert (= (and b!155385 res!129974) b!155388))

(assert (= (and b!155388 res!129975) b!155384))

(assert (= (and b!155384 res!129978) b!155392))

(assert (= (and b!155392 res!129977) b!155390))

(assert (= (and b!155390 res!129979) b!155389))

(assert (= start!30354 b!155387))

(assert (= start!30354 b!155391))

(declare-fun m!241393 () Bool)

(assert (=> b!155391 m!241393))

(declare-fun m!241395 () Bool)

(assert (=> b!155387 m!241395))

(declare-fun m!241397 () Bool)

(assert (=> b!155385 m!241397))

(declare-fun m!241399 () Bool)

(assert (=> b!155386 m!241399))

(declare-fun m!241401 () Bool)

(assert (=> b!155384 m!241401))

(declare-fun m!241403 () Bool)

(assert (=> b!155384 m!241403))

(declare-fun m!241405 () Bool)

(assert (=> b!155388 m!241405))

(declare-fun m!241407 () Bool)

(assert (=> b!155392 m!241407))

(declare-fun m!241409 () Bool)

(assert (=> b!155390 m!241409))

(declare-fun m!241411 () Bool)

(assert (=> b!155390 m!241411))

(declare-fun m!241413 () Bool)

(assert (=> b!155390 m!241413))

(declare-fun m!241415 () Bool)

(assert (=> b!155390 m!241415))

(declare-fun m!241417 () Bool)

(assert (=> b!155390 m!241417))

(declare-fun m!241419 () Bool)

(assert (=> start!30354 m!241419))

(declare-fun m!241421 () Bool)

(assert (=> start!30354 m!241421))

(push 1)

(assert (not b!155392))

(assert (not start!30354))

(assert (not b!155385))

(assert (not b!155388))

(assert (not b!155390))

(assert (not b!155386))

(assert (not b!155384))

(assert (not b!155391))

(assert (not b!155387))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51320 () Bool)

(declare-fun e!104729 () Bool)

(assert (=> d!51320 e!104729))

(declare-fun res!130061 () Bool)

(assert (=> d!51320 (=> (not res!130061) (not e!104729))))

(declare-fun lt!241913 () (_ BitVec 64))

(declare-fun lt!241915 () (_ BitVec 64))

(declare-fun lt!241914 () (_ BitVec 64))

(assert (=> d!51320 (= res!130061 (= lt!241915 (bvsub lt!241913 lt!241914)))))

(assert (=> d!51320 (or (= (bvand lt!241913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241914 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241913 lt!241914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51320 (= lt!241914 (remainingBits!0 ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241805)))) ((_ sign_extend 32) (currentByte!6718 (_1!7298 lt!241805))) ((_ sign_extend 32) (currentBit!6713 (_1!7298 lt!241805)))))))

(declare-fun lt!241912 () (_ BitVec 64))

(declare-fun lt!241916 () (_ BitVec 64))

(assert (=> d!51320 (= lt!241913 (bvmul lt!241912 lt!241916))))

(assert (=> d!51320 (or (= lt!241912 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241916 (bvsdiv (bvmul lt!241912 lt!241916) lt!241912)))))

(assert (=> d!51320 (= lt!241916 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51320 (= lt!241912 ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241805)))))))

(assert (=> d!51320 (= lt!241915 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6718 (_1!7298 lt!241805))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6713 (_1!7298 lt!241805)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51320 (invariant!0 (currentBit!6713 (_1!7298 lt!241805)) (currentByte!6718 (_1!7298 lt!241805)) (size!3169 (buf!3672 (_1!7298 lt!241805))))))

(assert (=> d!51320 (= (bitIndex!0 (size!3169 (buf!3672 (_1!7298 lt!241805))) (currentByte!6718 (_1!7298 lt!241805)) (currentBit!6713 (_1!7298 lt!241805))) lt!241915)))

(declare-fun b!155490 () Bool)

(declare-fun res!130060 () Bool)

(assert (=> b!155490 (=> (not res!130060) (not e!104729))))

(assert (=> b!155490 (= res!130060 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241915))))

(declare-fun b!155491 () Bool)

(declare-fun lt!241911 () (_ BitVec 64))

(assert (=> b!155491 (= e!104729 (bvsle lt!241915 (bvmul lt!241911 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155491 (or (= lt!241911 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241911 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241911)))))

(assert (=> b!155491 (= lt!241911 ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241805)))))))

(assert (= (and d!51320 res!130061) b!155490))

(assert (= (and b!155490 res!130060) b!155491))

(declare-fun m!241527 () Bool)

(assert (=> d!51320 m!241527))

(declare-fun m!241529 () Bool)

(assert (=> d!51320 m!241529))

(assert (=> b!155390 d!51320))

(declare-fun d!51328 () Bool)

(declare-fun e!104730 () Bool)

(assert (=> d!51328 e!104730))

(declare-fun res!130063 () Bool)

(assert (=> d!51328 (=> (not res!130063) (not e!104730))))

(declare-fun lt!241920 () (_ BitVec 64))

(declare-fun lt!241921 () (_ BitVec 64))

(declare-fun lt!241919 () (_ BitVec 64))

(assert (=> d!51328 (= res!130063 (= lt!241921 (bvsub lt!241919 lt!241920)))))

(assert (=> d!51328 (or (= (bvand lt!241919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241920 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241919 lt!241920) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51328 (= lt!241920 (remainingBits!0 ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241807)))) ((_ sign_extend 32) (currentByte!6718 (_1!7298 lt!241807))) ((_ sign_extend 32) (currentBit!6713 (_1!7298 lt!241807)))))))

(declare-fun lt!241918 () (_ BitVec 64))

(declare-fun lt!241922 () (_ BitVec 64))

(assert (=> d!51328 (= lt!241919 (bvmul lt!241918 lt!241922))))

(assert (=> d!51328 (or (= lt!241918 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241922 (bvsdiv (bvmul lt!241918 lt!241922) lt!241918)))))

(assert (=> d!51328 (= lt!241922 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51328 (= lt!241918 ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241807)))))))

(assert (=> d!51328 (= lt!241921 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6718 (_1!7298 lt!241807))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6713 (_1!7298 lt!241807)))))))

(assert (=> d!51328 (invariant!0 (currentBit!6713 (_1!7298 lt!241807)) (currentByte!6718 (_1!7298 lt!241807)) (size!3169 (buf!3672 (_1!7298 lt!241807))))))

(assert (=> d!51328 (= (bitIndex!0 (size!3169 (buf!3672 (_1!7298 lt!241807))) (currentByte!6718 (_1!7298 lt!241807)) (currentBit!6713 (_1!7298 lt!241807))) lt!241921)))

(declare-fun b!155492 () Bool)

(declare-fun res!130062 () Bool)

(assert (=> b!155492 (=> (not res!130062) (not e!104730))))

(assert (=> b!155492 (= res!130062 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241921))))

(declare-fun b!155493 () Bool)

(declare-fun lt!241917 () (_ BitVec 64))

(assert (=> b!155493 (= e!104730 (bvsle lt!241921 (bvmul lt!241917 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155493 (or (= lt!241917 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241917 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241917)))))

(assert (=> b!155493 (= lt!241917 ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241807)))))))

(assert (= (and d!51328 res!130063) b!155492))

(assert (= (and b!155492 res!130062) b!155493))

(declare-fun m!241531 () Bool)

(assert (=> d!51328 m!241531))

(declare-fun m!241533 () Bool)

(assert (=> d!51328 m!241533))

(assert (=> b!155390 d!51328))

(declare-fun d!51330 () Bool)

(assert (=> d!51330 (and (bvsge (currentByte!6718 bs1!10) #b00000000000000000000000000000000) (bvslt (currentByte!6718 bs1!10) (size!3169 (buf!3672 bs1!10))) (bvslt (currentByte!6718 bs1!10) (size!3169 (buf!3672 bs2!18))) (= (select (arr!3992 (buf!3672 bs1!10)) (currentByte!6718 bs1!10)) (select (arr!3992 (buf!3672 bs2!18)) (currentByte!6718 bs1!10))))))

(declare-fun lt!241931 () Unit!9781)

(declare-fun choose!111 (array!7049 array!7049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9781)

(assert (=> d!51330 (= lt!241931 (choose!111 (buf!3672 bs1!10) (buf!3672 bs2!18) #b00000000000000000000000000000000 (currentByte!6718 bs1!10) lt!241808))))

(assert (=> d!51330 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 lt!241808))))

(assert (=> d!51330 (= (arrayRangesEqImpliesEq!27 (buf!3672 bs1!10) (buf!3672 bs2!18) #b00000000000000000000000000000000 (currentByte!6718 bs1!10) lt!241808) lt!241931)))

(declare-fun bs!12556 () Bool)

(assert (= bs!12556 d!51330))

(assert (=> bs!12556 m!241413))

(assert (=> bs!12556 m!241409))

(declare-fun m!241535 () Bool)

(assert (=> bs!12556 m!241535))

(assert (=> b!155390 d!51330))

(declare-fun d!51332 () Bool)

(declare-fun e!104743 () Bool)

(assert (=> d!51332 e!104743))

(declare-fun res!130075 () Bool)

(assert (=> d!51332 (=> (not res!130075) (not e!104743))))

(declare-fun lt!241935 () (_ BitVec 64))

(declare-fun lt!241936 () (_ BitVec 64))

(declare-fun lt!241934 () (_ BitVec 64))

(assert (=> d!51332 (= res!130075 (= lt!241936 (bvsub lt!241934 lt!241935)))))

(assert (=> d!51332 (or (= (bvand lt!241934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241935 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241934 lt!241935) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51332 (= lt!241935 (remainingBits!0 ((_ sign_extend 32) (size!3169 (buf!3672 bs2!18))) ((_ sign_extend 32) (currentByte!6718 bs2!18)) ((_ sign_extend 32) (currentBit!6713 bs2!18))))))

(declare-fun lt!241933 () (_ BitVec 64))

(declare-fun lt!241937 () (_ BitVec 64))

(assert (=> d!51332 (= lt!241934 (bvmul lt!241933 lt!241937))))

(assert (=> d!51332 (or (= lt!241933 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241937 (bvsdiv (bvmul lt!241933 lt!241937) lt!241933)))))

(assert (=> d!51332 (= lt!241937 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51332 (= lt!241933 ((_ sign_extend 32) (size!3169 (buf!3672 bs2!18))))))

(assert (=> d!51332 (= lt!241936 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6718 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6713 bs2!18))))))

(assert (=> d!51332 (invariant!0 (currentBit!6713 bs2!18) (currentByte!6718 bs2!18) (size!3169 (buf!3672 bs2!18)))))

(assert (=> d!51332 (= (bitIndex!0 (size!3169 (buf!3672 bs2!18)) (currentByte!6718 bs2!18) (currentBit!6713 bs2!18)) lt!241936)))

(declare-fun b!155508 () Bool)

(declare-fun res!130074 () Bool)

(assert (=> b!155508 (=> (not res!130074) (not e!104743))))

(assert (=> b!155508 (= res!130074 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241936))))

(declare-fun b!155509 () Bool)

(declare-fun lt!241932 () (_ BitVec 64))

(assert (=> b!155509 (= e!104743 (bvsle lt!241936 (bvmul lt!241932 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155509 (or (= lt!241932 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241932 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241932)))))

(assert (=> b!155509 (= lt!241932 ((_ sign_extend 32) (size!3169 (buf!3672 bs2!18))))))

(assert (= (and d!51332 res!130075) b!155508))

(assert (= (and b!155508 res!130074) b!155509))

(declare-fun m!241537 () Bool)

(assert (=> d!51332 m!241537))

(declare-fun m!241539 () Bool)

(assert (=> d!51332 m!241539))

(assert (=> b!155385 d!51332))

(declare-fun d!51334 () Bool)

(declare-datatypes ((tuple2!13770 0))(
  ( (tuple2!13771 (_1!7304 (_ BitVec 8)) (_2!7304 BitStream!5596)) )
))
(declare-fun lt!241943 () tuple2!13770)

(declare-fun readByte!0 (BitStream!5596) tuple2!13770)

(assert (=> d!51334 (= lt!241943 (readByte!0 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))))))

(assert (=> d!51334 (= (readBytePure!0 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))) (tuple2!13763 (_2!7304 lt!241943) (_1!7304 lt!241943)))))

(declare-fun bs!12559 () Bool)

(assert (= bs!12559 d!51334))

(declare-fun m!241561 () Bool)

(assert (=> bs!12559 m!241561))

(assert (=> b!155384 d!51334))

(declare-fun d!51342 () Bool)

(declare-fun lt!241944 () tuple2!13770)

(assert (=> d!51342 (= lt!241944 (readByte!0 bs1!10))))

(assert (=> d!51342 (= (readBytePure!0 bs1!10) (tuple2!13763 (_2!7304 lt!241944) (_1!7304 lt!241944)))))

(declare-fun bs!12560 () Bool)

(assert (= bs!12560 d!51342))

(declare-fun m!241563 () Bool)

(assert (=> bs!12560 m!241563))

(assert (=> b!155384 d!51342))

(declare-fun d!51344 () Bool)

(assert (=> d!51344 (= (array_inv!2958 (buf!3672 bs1!10)) (bvsge (size!3169 (buf!3672 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!155387 d!51344))

(declare-fun d!51346 () Bool)

(assert (=> d!51346 (= (inv!12 bs1!10) (invariant!0 (currentBit!6713 bs1!10) (currentByte!6718 bs1!10) (size!3169 (buf!3672 bs1!10))))))

(declare-fun bs!12561 () Bool)

(assert (= bs!12561 d!51346))

(declare-fun m!241565 () Bool)

(assert (=> bs!12561 m!241565))

(assert (=> start!30354 d!51346))

(declare-fun d!51348 () Bool)

(assert (=> d!51348 (= (inv!12 bs2!18) (invariant!0 (currentBit!6713 bs2!18) (currentByte!6718 bs2!18) (size!3169 (buf!3672 bs2!18))))))

(declare-fun bs!12562 () Bool)

(assert (= bs!12562 d!51348))

(assert (=> bs!12562 m!241539))

(assert (=> start!30354 d!51348))

(declare-fun d!51350 () Bool)

(declare-fun res!130104 () Bool)

(declare-fun e!104769 () Bool)

(assert (=> d!51350 (=> res!130104 e!104769)))

(assert (=> d!51350 (= res!130104 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241809))))

(assert (=> d!51350 (= (arrayBitRangesEq!0 (buf!3672 bs1!10) (buf!3672 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241809) e!104769)))

(declare-datatypes ((tuple4!232 0))(
  ( (tuple4!233 (_1!7305 (_ BitVec 32)) (_2!7305 (_ BitVec 32)) (_3!419 (_ BitVec 32)) (_4!116 (_ BitVec 32))) )
))
(declare-fun lt!241985 () tuple4!232)

(declare-fun b!155541 () Bool)

(declare-fun lt!241984 () (_ BitVec 32))

(declare-fun e!104768 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155541 (= e!104768 (byteRangesEq!0 (select (arr!3992 (buf!3672 bs1!10)) (_4!116 lt!241985)) (select (arr!3992 (buf!3672 bs2!18)) (_4!116 lt!241985)) #b00000000000000000000000000000000 lt!241984))))

(declare-fun b!155542 () Bool)

(declare-fun e!104767 () Bool)

(declare-fun call!2258 () Bool)

(assert (=> b!155542 (= e!104767 call!2258)))

(declare-fun b!155543 () Bool)

(declare-fun e!104771 () Bool)

(assert (=> b!155543 (= e!104767 e!104771)))

(declare-fun res!130103 () Bool)

(assert (=> b!155543 (= res!130103 call!2258)))

(assert (=> b!155543 (=> (not res!130103) (not e!104771))))

(declare-fun b!155544 () Bool)

(declare-fun e!104770 () Bool)

(assert (=> b!155544 (= e!104769 e!104770)))

(declare-fun res!130101 () Bool)

(assert (=> b!155544 (=> (not res!130101) (not e!104770))))

(declare-fun e!104772 () Bool)

(assert (=> b!155544 (= res!130101 e!104772)))

(declare-fun res!130105 () Bool)

(assert (=> b!155544 (=> res!130105 e!104772)))

(assert (=> b!155544 (= res!130105 (bvsge (_1!7305 lt!241985) (_2!7305 lt!241985)))))

(assert (=> b!155544 (= lt!241984 ((_ extract 31 0) (bvsrem lt!241809 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!241986 () (_ BitVec 32))

(assert (=> b!155544 (= lt!241986 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!232)

(assert (=> b!155544 (= lt!241985 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241809))))

(declare-fun bm!2255 () Bool)

(declare-fun c!8274 () Bool)

(assert (=> bm!2255 (= call!2258 (byteRangesEq!0 (select (arr!3992 (buf!3672 bs1!10)) (_3!419 lt!241985)) (select (arr!3992 (buf!3672 bs2!18)) (_3!419 lt!241985)) lt!241986 (ite c!8274 lt!241984 #b00000000000000000000000000001000)))))

(declare-fun b!155545 () Bool)

(assert (=> b!155545 (= e!104770 e!104767)))

(assert (=> b!155545 (= c!8274 (= (_3!419 lt!241985) (_4!116 lt!241985)))))

(declare-fun b!155546 () Bool)

(assert (=> b!155546 (= e!104772 (arrayRangesEq!407 (buf!3672 bs1!10) (buf!3672 bs2!18) (_1!7305 lt!241985) (_2!7305 lt!241985)))))

(declare-fun b!155547 () Bool)

(declare-fun res!130102 () Bool)

(assert (=> b!155547 (= res!130102 (= lt!241984 #b00000000000000000000000000000000))))

(assert (=> b!155547 (=> res!130102 e!104768)))

(assert (=> b!155547 (= e!104771 e!104768)))

(assert (= (and d!51350 (not res!130104)) b!155544))

(assert (= (and b!155544 (not res!130105)) b!155546))

(assert (= (and b!155544 res!130101) b!155545))

(assert (= (and b!155545 c!8274) b!155542))

(assert (= (and b!155545 (not c!8274)) b!155543))

(assert (= (and b!155543 res!130103) b!155547))

(assert (= (and b!155547 (not res!130102)) b!155541))

(assert (= (or b!155542 b!155543) bm!2255))

(declare-fun m!241579 () Bool)

(assert (=> b!155541 m!241579))

(declare-fun m!241581 () Bool)

(assert (=> b!155541 m!241581))

(assert (=> b!155541 m!241579))

(assert (=> b!155541 m!241581))

(declare-fun m!241583 () Bool)

(assert (=> b!155541 m!241583))

(declare-fun m!241585 () Bool)

(assert (=> b!155544 m!241585))

(declare-fun m!241587 () Bool)

(assert (=> bm!2255 m!241587))

(declare-fun m!241589 () Bool)

(assert (=> bm!2255 m!241589))

(assert (=> bm!2255 m!241587))

(assert (=> bm!2255 m!241589))

(declare-fun m!241591 () Bool)

(assert (=> bm!2255 m!241591))

(declare-fun m!241593 () Bool)

(assert (=> b!155546 m!241593))

(assert (=> b!155388 d!51350))

(declare-fun d!51364 () Bool)

(assert (=> d!51364 (= (array_inv!2958 (buf!3672 bs2!18)) (bvsge (size!3169 (buf!3672 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!155391 d!51364))

(declare-fun d!51366 () Bool)

(declare-fun e!104773 () Bool)

(assert (=> d!51366 e!104773))

(declare-fun res!130107 () Bool)

(assert (=> d!51366 (=> (not res!130107) (not e!104773))))

(declare-fun lt!241991 () (_ BitVec 64))

(declare-fun lt!241994 () (_ BitVec 64))

(declare-fun lt!241992 () (_ BitVec 64))

(assert (=> d!51366 (= res!130107 (= lt!241994 (bvsub lt!241991 lt!241992)))))

(assert (=> d!51366 (or (= (bvand lt!241991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241992 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241991 lt!241992) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51366 (= lt!241992 (remainingBits!0 ((_ sign_extend 32) (size!3169 (buf!3672 bs1!10))) ((_ sign_extend 32) (currentByte!6718 bs1!10)) ((_ sign_extend 32) (currentBit!6713 bs1!10))))))

(declare-fun lt!241990 () (_ BitVec 64))

(declare-fun lt!241995 () (_ BitVec 64))

(assert (=> d!51366 (= lt!241991 (bvmul lt!241990 lt!241995))))

(assert (=> d!51366 (or (= lt!241990 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241995 (bvsdiv (bvmul lt!241990 lt!241995) lt!241990)))))

(assert (=> d!51366 (= lt!241995 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51366 (= lt!241990 ((_ sign_extend 32) (size!3169 (buf!3672 bs1!10))))))

(assert (=> d!51366 (= lt!241994 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6718 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6713 bs1!10))))))

(assert (=> d!51366 (invariant!0 (currentBit!6713 bs1!10) (currentByte!6718 bs1!10) (size!3169 (buf!3672 bs1!10)))))

(assert (=> d!51366 (= (bitIndex!0 (size!3169 (buf!3672 bs1!10)) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)) lt!241994)))

(declare-fun b!155548 () Bool)

(declare-fun res!130106 () Bool)

(assert (=> b!155548 (=> (not res!130106) (not e!104773))))

(assert (=> b!155548 (= res!130106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241994))))

(declare-fun b!155549 () Bool)

(declare-fun lt!241989 () (_ BitVec 64))

(assert (=> b!155549 (= e!104773 (bvsle lt!241994 (bvmul lt!241989 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155549 (or (= lt!241989 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241989 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241989)))))

(assert (=> b!155549 (= lt!241989 ((_ sign_extend 32) (size!3169 (buf!3672 bs1!10))))))

(assert (= (and d!51366 res!130107) b!155548))

(assert (= (and b!155548 res!130106) b!155549))

(declare-fun m!241599 () Bool)

(assert (=> d!51366 m!241599))

(assert (=> d!51366 m!241565))

(assert (=> b!155386 d!51366))

(declare-fun d!51372 () Bool)

(declare-fun res!130118 () Bool)

(declare-fun e!104783 () Bool)

(assert (=> d!51372 (=> res!130118 e!104783)))

(assert (=> d!51372 (= res!130118 (= #b00000000000000000000000000000000 lt!241808))))

(assert (=> d!51372 (= (arrayRangesEq!407 (buf!3672 bs1!10) (buf!3672 bs2!18) #b00000000000000000000000000000000 lt!241808) e!104783)))

(declare-fun b!155560 () Bool)

(declare-fun e!104784 () Bool)

(assert (=> b!155560 (= e!104783 e!104784)))

(declare-fun res!130119 () Bool)

(assert (=> b!155560 (=> (not res!130119) (not e!104784))))

(assert (=> b!155560 (= res!130119 (= (select (arr!3992 (buf!3672 bs1!10)) #b00000000000000000000000000000000) (select (arr!3992 (buf!3672 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!155561 () Bool)

(assert (=> b!155561 (= e!104784 (arrayRangesEq!407 (buf!3672 bs1!10) (buf!3672 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241808))))

(assert (= (and d!51372 (not res!130118)) b!155560))

(assert (= (and b!155560 res!130119) b!155561))

(declare-fun m!241603 () Bool)

(assert (=> b!155560 m!241603))

(declare-fun m!241605 () Bool)

(assert (=> b!155560 m!241605))

(declare-fun m!241607 () Bool)

(assert (=> b!155561 m!241607))

(assert (=> b!155392 d!51372))

(push 1)

(assert (not d!51330))

(assert (not b!155546))

(assert (not b!155541))

(assert (not b!155544))

(assert (not d!51346))

(assert (not d!51332))

(assert (not d!51328))

(assert (not d!51320))

(assert (not d!51366))

(assert (not b!155561))

(assert (not d!51342))

(assert (not bm!2255))

(assert (not d!51348))

(assert (not d!51334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51408 () Bool)

(assert (=> d!51408 (= (invariant!0 (currentBit!6713 bs2!18) (currentByte!6718 bs2!18) (size!3169 (buf!3672 bs2!18))) (and (bvsge (currentBit!6713 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6713 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6718 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6718 bs2!18) (size!3169 (buf!3672 bs2!18))) (and (= (currentBit!6713 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6718 bs2!18) (size!3169 (buf!3672 bs2!18)))))))))

(assert (=> d!51348 d!51408))

(declare-fun d!51410 () Bool)

(assert (=> d!51410 (= (remainingBits!0 ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241805)))) ((_ sign_extend 32) (currentByte!6718 (_1!7298 lt!241805))) ((_ sign_extend 32) (currentBit!6713 (_1!7298 lt!241805)))) (bvsub (bvmul ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241805)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6718 (_1!7298 lt!241805))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6713 (_1!7298 lt!241805))))))))

(assert (=> d!51320 d!51410))

(declare-fun d!51412 () Bool)

(assert (=> d!51412 (= (invariant!0 (currentBit!6713 (_1!7298 lt!241805)) (currentByte!6718 (_1!7298 lt!241805)) (size!3169 (buf!3672 (_1!7298 lt!241805)))) (and (bvsge (currentBit!6713 (_1!7298 lt!241805)) #b00000000000000000000000000000000) (bvslt (currentBit!6713 (_1!7298 lt!241805)) #b00000000000000000000000000001000) (bvsge (currentByte!6718 (_1!7298 lt!241805)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6718 (_1!7298 lt!241805)) (size!3169 (buf!3672 (_1!7298 lt!241805)))) (and (= (currentBit!6713 (_1!7298 lt!241805)) #b00000000000000000000000000000000) (= (currentByte!6718 (_1!7298 lt!241805)) (size!3169 (buf!3672 (_1!7298 lt!241805))))))))))

(assert (=> d!51320 d!51412))

(declare-fun d!51414 () Bool)

(assert (=> d!51414 (= (select (arr!3992 (buf!3672 bs1!10)) (currentByte!6718 bs1!10)) (select (arr!3992 (buf!3672 bs2!18)) (currentByte!6718 bs1!10)))))

(assert (=> d!51414 true))

(declare-fun _$12!78 () Unit!9781)

(assert (=> d!51414 (= (choose!111 (buf!3672 bs1!10) (buf!3672 bs2!18) #b00000000000000000000000000000000 (currentByte!6718 bs1!10) lt!241808) _$12!78)))

(declare-fun bs!12569 () Bool)

(assert (= bs!12569 d!51414))

(assert (=> bs!12569 m!241413))

(assert (=> bs!12569 m!241409))

(assert (=> d!51330 d!51414))

(declare-fun d!51416 () Bool)

(declare-fun res!130135 () Bool)

(declare-fun e!104799 () Bool)

(assert (=> d!51416 (=> res!130135 e!104799)))

(assert (=> d!51416 (= res!130135 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241808))))

(assert (=> d!51416 (= (arrayRangesEq!407 (buf!3672 bs1!10) (buf!3672 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241808) e!104799)))

(declare-fun b!155576 () Bool)

(declare-fun e!104800 () Bool)

(assert (=> b!155576 (= e!104799 e!104800)))

(declare-fun res!130136 () Bool)

(assert (=> b!155576 (=> (not res!130136) (not e!104800))))

(assert (=> b!155576 (= res!130136 (= (select (arr!3992 (buf!3672 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3992 (buf!3672 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!155577 () Bool)

(assert (=> b!155577 (= e!104800 (arrayRangesEq!407 (buf!3672 bs1!10) (buf!3672 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!241808))))

(assert (= (and d!51416 (not res!130135)) b!155576))

(assert (= (and b!155576 res!130136) b!155577))

(declare-fun m!241651 () Bool)

(assert (=> b!155576 m!241651))

(declare-fun m!241653 () Bool)

(assert (=> b!155576 m!241653))

(declare-fun m!241655 () Bool)

(assert (=> b!155577 m!241655))

(assert (=> b!155561 d!51416))

(declare-fun d!51418 () Bool)

(declare-fun res!130137 () Bool)

(declare-fun e!104801 () Bool)

(assert (=> d!51418 (=> res!130137 e!104801)))

(assert (=> d!51418 (= res!130137 (= (_1!7305 lt!241985) (_2!7305 lt!241985)))))

(assert (=> d!51418 (= (arrayRangesEq!407 (buf!3672 bs1!10) (buf!3672 bs2!18) (_1!7305 lt!241985) (_2!7305 lt!241985)) e!104801)))

(declare-fun b!155578 () Bool)

(declare-fun e!104802 () Bool)

(assert (=> b!155578 (= e!104801 e!104802)))

(declare-fun res!130138 () Bool)

(assert (=> b!155578 (=> (not res!130138) (not e!104802))))

(assert (=> b!155578 (= res!130138 (= (select (arr!3992 (buf!3672 bs1!10)) (_1!7305 lt!241985)) (select (arr!3992 (buf!3672 bs2!18)) (_1!7305 lt!241985))))))

(declare-fun b!155579 () Bool)

(assert (=> b!155579 (= e!104802 (arrayRangesEq!407 (buf!3672 bs1!10) (buf!3672 bs2!18) (bvadd (_1!7305 lt!241985) #b00000000000000000000000000000001) (_2!7305 lt!241985)))))

(assert (= (and d!51418 (not res!130137)) b!155578))

(assert (= (and b!155578 res!130138) b!155579))

(declare-fun m!241657 () Bool)

(assert (=> b!155578 m!241657))

(declare-fun m!241659 () Bool)

(assert (=> b!155578 m!241659))

(declare-fun m!241661 () Bool)

(assert (=> b!155579 m!241661))

(assert (=> b!155546 d!51418))

(declare-fun d!51420 () Bool)

(assert (=> d!51420 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241809) (tuple4!233 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!241809 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!241809 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!155544 d!51420))

(declare-fun d!51422 () Bool)

(assert (=> d!51422 (= (remainingBits!0 ((_ sign_extend 32) (size!3169 (buf!3672 bs2!18))) ((_ sign_extend 32) (currentByte!6718 bs2!18)) ((_ sign_extend 32) (currentBit!6713 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3169 (buf!3672 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6718 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6713 bs2!18)))))))

(assert (=> d!51332 d!51422))

(assert (=> d!51332 d!51408))

(declare-fun d!51424 () Bool)

(assert (=> d!51424 (= (byteRangesEq!0 (select (arr!3992 (buf!3672 bs1!10)) (_3!419 lt!241985)) (select (arr!3992 (buf!3672 bs2!18)) (_3!419 lt!241985)) lt!241986 (ite c!8274 lt!241984 #b00000000000000000000000000001000)) (or (= lt!241986 (ite c!8274 lt!241984 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3992 (buf!3672 bs1!10)) (_3!419 lt!241985))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8274 lt!241984 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241986)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3992 (buf!3672 bs2!18)) (_3!419 lt!241985))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8274 lt!241984 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241986)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12570 () Bool)

(assert (= bs!12570 d!51424))

(declare-fun m!241663 () Bool)

(assert (=> bs!12570 m!241663))

(declare-fun m!241665 () Bool)

(assert (=> bs!12570 m!241665))

(assert (=> bm!2255 d!51424))

(declare-fun lt!242055 () (_ BitVec 8))

(declare-fun lt!242052 () (_ BitVec 8))

(declare-fun d!51430 () Bool)

(assert (=> d!51430 (= lt!242052 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3992 (buf!3672 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))) (currentByte!6718 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))))) ((_ sign_extend 24) lt!242055))))))

(assert (=> d!51430 (= lt!242055 ((_ extract 7 0) (currentBit!6713 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))))))

(declare-fun e!104809 () Bool)

(assert (=> d!51430 e!104809))

(declare-fun res!130147 () Bool)

(assert (=> d!51430 (=> (not res!130147) (not e!104809))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51430 (= res!130147 (validate_offset_bits!1 ((_ sign_extend 32) (size!3169 (buf!3672 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))))) ((_ sign_extend 32) (currentByte!6718 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))) ((_ sign_extend 32) (currentBit!6713 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13776 0))(
  ( (tuple2!13777 (_1!7308 Unit!9781) (_2!7308 (_ BitVec 8))) )
))
(declare-fun Unit!9795 () Unit!9781)

(declare-fun Unit!9796 () Unit!9781)

(assert (=> d!51430 (= (readByte!0 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))) (tuple2!13771 (_2!7308 (ite (bvsgt ((_ sign_extend 24) lt!242055) #b00000000000000000000000000000000) (tuple2!13777 Unit!9795 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242052) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3992 (buf!3672 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))) (bvadd (currentByte!6718 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242055)))))))) (tuple2!13777 Unit!9796 lt!242052))) (BitStream!5597 (buf!3672 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))) (bvadd (currentByte!6718 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))) #b00000000000000000000000000000001) (currentBit!6713 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))))))))

(declare-fun b!155586 () Bool)

(declare-fun e!104810 () Bool)

(assert (=> b!155586 (= e!104809 e!104810)))

(declare-fun res!130148 () Bool)

(assert (=> b!155586 (=> (not res!130148) (not e!104810))))

(declare-fun lt!242056 () tuple2!13770)

(assert (=> b!155586 (= res!130148 (= (buf!3672 (_2!7304 lt!242056)) (buf!3672 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))))))

(declare-fun lt!242054 () (_ BitVec 8))

(declare-fun lt!242053 () (_ BitVec 8))

(declare-fun Unit!9797 () Unit!9781)

(declare-fun Unit!9798 () Unit!9781)

(assert (=> b!155586 (= lt!242056 (tuple2!13771 (_2!7308 (ite (bvsgt ((_ sign_extend 24) lt!242053) #b00000000000000000000000000000000) (tuple2!13777 Unit!9797 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242054) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3992 (buf!3672 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))) (bvadd (currentByte!6718 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242053)))))))) (tuple2!13777 Unit!9798 lt!242054))) (BitStream!5597 (buf!3672 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))) (bvadd (currentByte!6718 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))) #b00000000000000000000000000000001) (currentBit!6713 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))))))))

(assert (=> b!155586 (= lt!242054 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3992 (buf!3672 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))) (currentByte!6718 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))))) ((_ sign_extend 24) lt!242053))))))

(assert (=> b!155586 (= lt!242053 ((_ extract 7 0) (currentBit!6713 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))))))

(declare-fun lt!242051 () (_ BitVec 64))

(declare-fun lt!242057 () (_ BitVec 64))

(declare-fun b!155587 () Bool)

(assert (=> b!155587 (= e!104810 (= (bitIndex!0 (size!3169 (buf!3672 (_2!7304 lt!242056))) (currentByte!6718 (_2!7304 lt!242056)) (currentBit!6713 (_2!7304 lt!242056))) (bvadd lt!242057 lt!242051)))))

(assert (=> b!155587 (or (not (= (bvand lt!242057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242051 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242057 lt!242051) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155587 (= lt!242051 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155587 (= lt!242057 (bitIndex!0 (size!3169 (buf!3672 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))) (currentByte!6718 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10))) (currentBit!6713 (BitStream!5597 (buf!3672 bs2!18) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))))))

(assert (= (and d!51430 res!130147) b!155586))

(assert (= (and b!155586 res!130148) b!155587))

(declare-fun m!241671 () Bool)

(assert (=> d!51430 m!241671))

(declare-fun m!241673 () Bool)

(assert (=> d!51430 m!241673))

(declare-fun m!241675 () Bool)

(assert (=> d!51430 m!241675))

(assert (=> b!155586 m!241675))

(assert (=> b!155586 m!241671))

(declare-fun m!241677 () Bool)

(assert (=> b!155587 m!241677))

(declare-fun m!241679 () Bool)

(assert (=> b!155587 m!241679))

(assert (=> d!51334 d!51430))

(declare-fun d!51438 () Bool)

(assert (=> d!51438 (= (invariant!0 (currentBit!6713 bs1!10) (currentByte!6718 bs1!10) (size!3169 (buf!3672 bs1!10))) (and (bvsge (currentBit!6713 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6713 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6718 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6718 bs1!10) (size!3169 (buf!3672 bs1!10))) (and (= (currentBit!6713 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6718 bs1!10) (size!3169 (buf!3672 bs1!10)))))))))

(assert (=> d!51346 d!51438))

(declare-fun d!51440 () Bool)

(assert (=> d!51440 (= (remainingBits!0 ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241807)))) ((_ sign_extend 32) (currentByte!6718 (_1!7298 lt!241807))) ((_ sign_extend 32) (currentBit!6713 (_1!7298 lt!241807)))) (bvsub (bvmul ((_ sign_extend 32) (size!3169 (buf!3672 (_1!7298 lt!241807)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6718 (_1!7298 lt!241807))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6713 (_1!7298 lt!241807))))))))

(assert (=> d!51328 d!51440))

(declare-fun d!51442 () Bool)

(assert (=> d!51442 (= (invariant!0 (currentBit!6713 (_1!7298 lt!241807)) (currentByte!6718 (_1!7298 lt!241807)) (size!3169 (buf!3672 (_1!7298 lt!241807)))) (and (bvsge (currentBit!6713 (_1!7298 lt!241807)) #b00000000000000000000000000000000) (bvslt (currentBit!6713 (_1!7298 lt!241807)) #b00000000000000000000000000001000) (bvsge (currentByte!6718 (_1!7298 lt!241807)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6718 (_1!7298 lt!241807)) (size!3169 (buf!3672 (_1!7298 lt!241807)))) (and (= (currentBit!6713 (_1!7298 lt!241807)) #b00000000000000000000000000000000) (= (currentByte!6718 (_1!7298 lt!241807)) (size!3169 (buf!3672 (_1!7298 lt!241807))))))))))

(assert (=> d!51328 d!51442))

(declare-fun d!51444 () Bool)

(assert (=> d!51444 (= (byteRangesEq!0 (select (arr!3992 (buf!3672 bs1!10)) (_4!116 lt!241985)) (select (arr!3992 (buf!3672 bs2!18)) (_4!116 lt!241985)) #b00000000000000000000000000000000 lt!241984) (or (= #b00000000000000000000000000000000 lt!241984) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3992 (buf!3672 bs1!10)) (_4!116 lt!241985))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241984))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3992 (buf!3672 bs2!18)) (_4!116 lt!241985))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241984))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12573 () Bool)

(assert (= bs!12573 d!51444))

(declare-fun m!241681 () Bool)

(assert (=> bs!12573 m!241681))

(declare-fun m!241683 () Bool)

(assert (=> bs!12573 m!241683))

(assert (=> b!155541 d!51444))

(declare-fun d!51446 () Bool)

(assert (=> d!51446 (= (remainingBits!0 ((_ sign_extend 32) (size!3169 (buf!3672 bs1!10))) ((_ sign_extend 32) (currentByte!6718 bs1!10)) ((_ sign_extend 32) (currentBit!6713 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3169 (buf!3672 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6718 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6713 bs1!10)))))))

(assert (=> d!51366 d!51446))

(assert (=> d!51366 d!51438))

(declare-fun d!51448 () Bool)

(declare-fun lt!242067 () (_ BitVec 8))

(declare-fun lt!242070 () (_ BitVec 8))

(assert (=> d!51448 (= lt!242067 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3992 (buf!3672 bs1!10)) (currentByte!6718 bs1!10))) ((_ sign_extend 24) lt!242070))))))

(assert (=> d!51448 (= lt!242070 ((_ extract 7 0) (currentBit!6713 bs1!10)))))

(declare-fun e!104813 () Bool)

(assert (=> d!51448 e!104813))

(declare-fun res!130151 () Bool)

(assert (=> d!51448 (=> (not res!130151) (not e!104813))))

(assert (=> d!51448 (= res!130151 (validate_offset_bits!1 ((_ sign_extend 32) (size!3169 (buf!3672 bs1!10))) ((_ sign_extend 32) (currentByte!6718 bs1!10)) ((_ sign_extend 32) (currentBit!6713 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9803 () Unit!9781)

(declare-fun Unit!9804 () Unit!9781)

(assert (=> d!51448 (= (readByte!0 bs1!10) (tuple2!13771 (_2!7308 (ite (bvsgt ((_ sign_extend 24) lt!242070) #b00000000000000000000000000000000) (tuple2!13777 Unit!9803 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242067) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3992 (buf!3672 bs1!10)) (bvadd (currentByte!6718 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242070)))))))) (tuple2!13777 Unit!9804 lt!242067))) (BitStream!5597 (buf!3672 bs1!10) (bvadd (currentByte!6718 bs1!10) #b00000000000000000000000000000001) (currentBit!6713 bs1!10))))))

(declare-fun b!155590 () Bool)

(declare-fun e!104814 () Bool)

(assert (=> b!155590 (= e!104813 e!104814)))

(declare-fun res!130152 () Bool)

(assert (=> b!155590 (=> (not res!130152) (not e!104814))))

(declare-fun lt!242071 () tuple2!13770)

(assert (=> b!155590 (= res!130152 (= (buf!3672 (_2!7304 lt!242071)) (buf!3672 bs1!10)))))

(declare-fun lt!242068 () (_ BitVec 8))

(declare-fun lt!242069 () (_ BitVec 8))

(declare-fun Unit!9805 () Unit!9781)

(declare-fun Unit!9806 () Unit!9781)

(assert (=> b!155590 (= lt!242071 (tuple2!13771 (_2!7308 (ite (bvsgt ((_ sign_extend 24) lt!242068) #b00000000000000000000000000000000) (tuple2!13777 Unit!9805 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242069) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3992 (buf!3672 bs1!10)) (bvadd (currentByte!6718 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242068)))))))) (tuple2!13777 Unit!9806 lt!242069))) (BitStream!5597 (buf!3672 bs1!10) (bvadd (currentByte!6718 bs1!10) #b00000000000000000000000000000001) (currentBit!6713 bs1!10))))))

(assert (=> b!155590 (= lt!242069 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3992 (buf!3672 bs1!10)) (currentByte!6718 bs1!10))) ((_ sign_extend 24) lt!242068))))))

(assert (=> b!155590 (= lt!242068 ((_ extract 7 0) (currentBit!6713 bs1!10)))))

(declare-fun b!155591 () Bool)

(declare-fun lt!242072 () (_ BitVec 64))

(declare-fun lt!242066 () (_ BitVec 64))

(assert (=> b!155591 (= e!104814 (= (bitIndex!0 (size!3169 (buf!3672 (_2!7304 lt!242071))) (currentByte!6718 (_2!7304 lt!242071)) (currentBit!6713 (_2!7304 lt!242071))) (bvadd lt!242072 lt!242066)))))

(assert (=> b!155591 (or (not (= (bvand lt!242072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242066 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242072 lt!242066) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155591 (= lt!242066 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155591 (= lt!242072 (bitIndex!0 (size!3169 (buf!3672 bs1!10)) (currentByte!6718 bs1!10) (currentBit!6713 bs1!10)))))

(assert (= (and d!51448 res!130151) b!155590))

(assert (= (and b!155590 res!130152) b!155591))

(assert (=> d!51448 m!241413))

(declare-fun m!241685 () Bool)

(assert (=> d!51448 m!241685))

(declare-fun m!241687 () Bool)

(assert (=> d!51448 m!241687))

(assert (=> b!155590 m!241687))

(assert (=> b!155590 m!241413))

(declare-fun m!241689 () Bool)

(assert (=> b!155591 m!241689))

(assert (=> b!155591 m!241399))

(assert (=> d!51342 d!51448))

(push 1)

(assert (not b!155579))

(assert (not d!51448))

(assert (not b!155591))

(assert (not b!155587))

(assert (not d!51430))

(assert (not b!155577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

