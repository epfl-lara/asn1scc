; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15408 () Bool)

(assert start!15408)

(declare-fun b!78291 () Bool)

(declare-fun e!51388 () Bool)

(declare-fun e!51390 () Bool)

(assert (=> b!78291 (= e!51388 (not e!51390))))

(declare-fun res!64700 () Bool)

(assert (=> b!78291 (=> res!64700 e!51390)))

(declare-datatypes ((array!3334 0))(
  ( (array!3335 (arr!2145 (Array (_ BitVec 32) (_ BitVec 8))) (size!1544 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2650 0))(
  ( (BitStream!2651 (buf!1934 array!3334) (currentByte!3772 (_ BitVec 32)) (currentBit!3767 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5173 0))(
  ( (Unit!5174) )
))
(declare-datatypes ((tuple2!6974 0))(
  ( (tuple2!6975 (_1!3624 Unit!5173) (_2!3624 BitStream!2650)) )
))
(declare-fun lt!125248 () tuple2!6974)

(declare-fun thiss!1107 () BitStream!2650)

(assert (=> b!78291 (= res!64700 (not (= (size!1544 (buf!1934 (_2!3624 lt!125248))) (size!1544 (buf!1934 thiss!1107)))))))

(declare-fun e!51389 () Bool)

(assert (=> b!78291 e!51389))

(declare-fun res!64705 () Bool)

(assert (=> b!78291 (=> (not res!64705) (not e!51389))))

(assert (=> b!78291 (= res!64705 (= (size!1544 (buf!1934 thiss!1107)) (size!1544 (buf!1934 (_2!3624 lt!125248)))))))

(declare-fun lt!125247 () Bool)

(declare-fun appendBit!0 (BitStream!2650 Bool) tuple2!6974)

(assert (=> b!78291 (= lt!125248 (appendBit!0 thiss!1107 lt!125247))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!78291 (= lt!125247 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun res!64697 () Bool)

(assert (=> start!15408 (=> (not res!64697) (not e!51388))))

(assert (=> start!15408 (= res!64697 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15408 e!51388))

(assert (=> start!15408 true))

(declare-fun e!51386 () Bool)

(declare-fun inv!12 (BitStream!2650) Bool)

(assert (=> start!15408 (and (inv!12 thiss!1107) e!51386)))

(declare-fun b!78292 () Bool)

(declare-fun res!64698 () Bool)

(declare-fun e!51387 () Bool)

(assert (=> b!78292 (=> (not res!64698) (not e!51387))))

(declare-fun isPrefixOf!0 (BitStream!2650 BitStream!2650) Bool)

(assert (=> b!78292 (= res!64698 (isPrefixOf!0 thiss!1107 (_2!3624 lt!125248)))))

(declare-fun b!78293 () Bool)

(declare-fun array_inv!1390 (array!3334) Bool)

(assert (=> b!78293 (= e!51386 (array_inv!1390 (buf!1934 thiss!1107)))))

(declare-fun b!78294 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!78294 (= e!51390 (invariant!0 (currentBit!3767 (_2!3624 lt!125248)) (currentByte!3772 (_2!3624 lt!125248)) (size!1544 (buf!1934 (_2!3624 lt!125248)))))))

(declare-fun b!78295 () Bool)

(declare-fun e!51385 () Bool)

(declare-datatypes ((tuple2!6976 0))(
  ( (tuple2!6977 (_1!3625 BitStream!2650) (_2!3625 Bool)) )
))
(declare-fun lt!125246 () tuple2!6976)

(declare-fun lt!125250 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78295 (= e!51385 (= (bitIndex!0 (size!1544 (buf!1934 (_1!3625 lt!125246))) (currentByte!3772 (_1!3625 lt!125246)) (currentBit!3767 (_1!3625 lt!125246))) lt!125250))))

(declare-fun b!78296 () Bool)

(declare-fun res!64704 () Bool)

(assert (=> b!78296 (=> res!64704 e!51390)))

(assert (=> b!78296 (= res!64704 (not (= (bitIndex!0 (size!1544 (buf!1934 (_2!3624 lt!125248))) (currentByte!3772 (_2!3624 lt!125248)) (currentBit!3767 (_2!3624 lt!125248))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1544 (buf!1934 thiss!1107)) (currentByte!3772 thiss!1107) (currentBit!3767 thiss!1107))))))))

(declare-fun b!78297 () Bool)

(declare-fun res!64701 () Bool)

(assert (=> b!78297 (=> res!64701 e!51390)))

(assert (=> b!78297 (= res!64701 (not (isPrefixOf!0 thiss!1107 (_2!3624 lt!125248))))))

(declare-fun b!78298 () Bool)

(assert (=> b!78298 (= e!51389 e!51387)))

(declare-fun res!64702 () Bool)

(assert (=> b!78298 (=> (not res!64702) (not e!51387))))

(declare-fun lt!125249 () (_ BitVec 64))

(assert (=> b!78298 (= res!64702 (= lt!125250 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125249)))))

(assert (=> b!78298 (= lt!125250 (bitIndex!0 (size!1544 (buf!1934 (_2!3624 lt!125248))) (currentByte!3772 (_2!3624 lt!125248)) (currentBit!3767 (_2!3624 lt!125248))))))

(assert (=> b!78298 (= lt!125249 (bitIndex!0 (size!1544 (buf!1934 thiss!1107)) (currentByte!3772 thiss!1107) (currentBit!3767 thiss!1107)))))

(declare-fun b!78299 () Bool)

(declare-fun res!64703 () Bool)

(assert (=> b!78299 (=> (not res!64703) (not e!51388))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78299 (= res!64703 (validate_offset_bit!0 ((_ sign_extend 32) (size!1544 (buf!1934 thiss!1107))) ((_ sign_extend 32) (currentByte!3772 thiss!1107)) ((_ sign_extend 32) (currentBit!3767 thiss!1107))))))

(declare-fun b!78300 () Bool)

(assert (=> b!78300 (= e!51387 e!51385)))

(declare-fun res!64699 () Bool)

(assert (=> b!78300 (=> (not res!64699) (not e!51385))))

(assert (=> b!78300 (= res!64699 (and (= (_2!3625 lt!125246) lt!125247) (= (_1!3625 lt!125246) (_2!3624 lt!125248))))))

(declare-fun readBitPure!0 (BitStream!2650) tuple2!6976)

(declare-fun readerFrom!0 (BitStream!2650 (_ BitVec 32) (_ BitVec 32)) BitStream!2650)

(assert (=> b!78300 (= lt!125246 (readBitPure!0 (readerFrom!0 (_2!3624 lt!125248) (currentBit!3767 thiss!1107) (currentByte!3772 thiss!1107))))))

(assert (= (and start!15408 res!64697) b!78299))

(assert (= (and b!78299 res!64703) b!78291))

(assert (= (and b!78291 res!64705) b!78298))

(assert (= (and b!78298 res!64702) b!78292))

(assert (= (and b!78292 res!64698) b!78300))

(assert (= (and b!78300 res!64699) b!78295))

(assert (= (and b!78291 (not res!64700)) b!78296))

(assert (= (and b!78296 (not res!64704)) b!78297))

(assert (= (and b!78297 (not res!64701)) b!78294))

(assert (= start!15408 b!78293))

(declare-fun m!123867 () Bool)

(assert (=> b!78298 m!123867))

(declare-fun m!123869 () Bool)

(assert (=> b!78298 m!123869))

(declare-fun m!123871 () Bool)

(assert (=> b!78294 m!123871))

(declare-fun m!123873 () Bool)

(assert (=> b!78300 m!123873))

(assert (=> b!78300 m!123873))

(declare-fun m!123875 () Bool)

(assert (=> b!78300 m!123875))

(declare-fun m!123877 () Bool)

(assert (=> b!78297 m!123877))

(declare-fun m!123879 () Bool)

(assert (=> b!78299 m!123879))

(declare-fun m!123881 () Bool)

(assert (=> start!15408 m!123881))

(declare-fun m!123883 () Bool)

(assert (=> b!78295 m!123883))

(declare-fun m!123885 () Bool)

(assert (=> b!78291 m!123885))

(declare-fun m!123887 () Bool)

(assert (=> b!78291 m!123887))

(assert (=> b!78292 m!123877))

(declare-fun m!123889 () Bool)

(assert (=> b!78293 m!123889))

(assert (=> b!78296 m!123867))

(assert (=> b!78296 m!123869))

(push 1)

(assert (not b!78300))

(assert (not b!78293))

(assert (not b!78294))

(assert (not b!78297))

(assert (not b!78296))

(assert (not b!78298))

(assert (not b!78295))

(assert (not b!78292))

(assert (not b!78299))

(assert (not b!78291))

(assert (not start!15408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24724 () Bool)

(assert (=> d!24724 (= (invariant!0 (currentBit!3767 (_2!3624 lt!125248)) (currentByte!3772 (_2!3624 lt!125248)) (size!1544 (buf!1934 (_2!3624 lt!125248)))) (and (bvsge (currentBit!3767 (_2!3624 lt!125248)) #b00000000000000000000000000000000) (bvslt (currentBit!3767 (_2!3624 lt!125248)) #b00000000000000000000000000001000) (bvsge (currentByte!3772 (_2!3624 lt!125248)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3772 (_2!3624 lt!125248)) (size!1544 (buf!1934 (_2!3624 lt!125248)))) (and (= (currentBit!3767 (_2!3624 lt!125248)) #b00000000000000000000000000000000) (= (currentByte!3772 (_2!3624 lt!125248)) (size!1544 (buf!1934 (_2!3624 lt!125248))))))))))

(assert (=> b!78294 d!24724))

(declare-fun d!24726 () Bool)

(declare-datatypes ((tuple2!6988 0))(
  ( (tuple2!6989 (_1!3631 Bool) (_2!3631 BitStream!2650)) )
))
(declare-fun lt!125295 () tuple2!6988)

(declare-fun readBit!0 (BitStream!2650) tuple2!6988)

(assert (=> d!24726 (= lt!125295 (readBit!0 (readerFrom!0 (_2!3624 lt!125248) (currentBit!3767 thiss!1107) (currentByte!3772 thiss!1107))))))

(assert (=> d!24726 (= (readBitPure!0 (readerFrom!0 (_2!3624 lt!125248) (currentBit!3767 thiss!1107) (currentByte!3772 thiss!1107))) (tuple2!6977 (_2!3631 lt!125295) (_1!3631 lt!125295)))))

(declare-fun bs!6000 () Bool)

(assert (= bs!6000 d!24726))

(assert (=> bs!6000 m!123873))

(declare-fun m!123947 () Bool)

(assert (=> bs!6000 m!123947))

(assert (=> b!78300 d!24726))

(declare-fun d!24728 () Bool)

(declare-fun e!51447 () Bool)

(assert (=> d!24728 e!51447))

(declare-fun res!64784 () Bool)

(assert (=> d!24728 (=> (not res!64784) (not e!51447))))

(assert (=> d!24728 (= res!64784 (invariant!0 (currentBit!3767 (_2!3624 lt!125248)) (currentByte!3772 (_2!3624 lt!125248)) (size!1544 (buf!1934 (_2!3624 lt!125248)))))))

(assert (=> d!24728 (= (readerFrom!0 (_2!3624 lt!125248) (currentBit!3767 thiss!1107) (currentByte!3772 thiss!1107)) (BitStream!2651 (buf!1934 (_2!3624 lt!125248)) (currentByte!3772 thiss!1107) (currentBit!3767 thiss!1107)))))

(declare-fun b!78385 () Bool)

(assert (=> b!78385 (= e!51447 (invariant!0 (currentBit!3767 thiss!1107) (currentByte!3772 thiss!1107) (size!1544 (buf!1934 (_2!3624 lt!125248)))))))

(assert (= (and d!24728 res!64784) b!78385))

(assert (=> d!24728 m!123871))

(declare-fun m!123955 () Bool)

(assert (=> b!78385 m!123955))

(assert (=> b!78300 d!24728))

(declare-fun d!24732 () Bool)

(declare-fun e!51456 () Bool)

(assert (=> d!24732 e!51456))

(declare-fun res!64800 () Bool)

(assert (=> d!24732 (=> (not res!64800) (not e!51456))))

(declare-fun lt!125342 () (_ BitVec 64))

(declare-fun lt!125345 () (_ BitVec 64))

(declare-fun lt!125343 () (_ BitVec 64))

(assert (=> d!24732 (= res!64800 (= lt!125343 (bvsub lt!125342 lt!125345)))))

(assert (=> d!24732 (or (= (bvand lt!125342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125342 lt!125345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24732 (= lt!125345 (remainingBits!0 ((_ sign_extend 32) (size!1544 (buf!1934 (_1!3625 lt!125246)))) ((_ sign_extend 32) (currentByte!3772 (_1!3625 lt!125246))) ((_ sign_extend 32) (currentBit!3767 (_1!3625 lt!125246)))))))

(declare-fun lt!125344 () (_ BitVec 64))

(declare-fun lt!125346 () (_ BitVec 64))

(assert (=> d!24732 (= lt!125342 (bvmul lt!125344 lt!125346))))

(assert (=> d!24732 (or (= lt!125344 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125346 (bvsdiv (bvmul lt!125344 lt!125346) lt!125344)))))

(assert (=> d!24732 (= lt!125346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24732 (= lt!125344 ((_ sign_extend 32) (size!1544 (buf!1934 (_1!3625 lt!125246)))))))

(assert (=> d!24732 (= lt!125343 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3772 (_1!3625 lt!125246))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3767 (_1!3625 lt!125246)))))))

(assert (=> d!24732 (invariant!0 (currentBit!3767 (_1!3625 lt!125246)) (currentByte!3772 (_1!3625 lt!125246)) (size!1544 (buf!1934 (_1!3625 lt!125246))))))

(assert (=> d!24732 (= (bitIndex!0 (size!1544 (buf!1934 (_1!3625 lt!125246))) (currentByte!3772 (_1!3625 lt!125246)) (currentBit!3767 (_1!3625 lt!125246))) lt!125343)))

(declare-fun b!78398 () Bool)

(declare-fun res!64799 () Bool)

(assert (=> b!78398 (=> (not res!64799) (not e!51456))))

(assert (=> b!78398 (= res!64799 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125343))))

(declare-fun b!78399 () Bool)

(declare-fun lt!125347 () (_ BitVec 64))

(assert (=> b!78399 (= e!51456 (bvsle lt!125343 (bvmul lt!125347 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78399 (or (= lt!125347 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125347 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125347)))))

(assert (=> b!78399 (= lt!125347 ((_ sign_extend 32) (size!1544 (buf!1934 (_1!3625 lt!125246)))))))

(assert (= (and d!24732 res!64800) b!78398))

(assert (= (and b!78398 res!64799) b!78399))

(declare-fun m!123963 () Bool)

(assert (=> d!24732 m!123963))

(declare-fun m!123965 () Bool)

(assert (=> d!24732 m!123965))

(assert (=> b!78295 d!24732))

(declare-fun d!24740 () Bool)

(declare-fun e!51457 () Bool)

(assert (=> d!24740 e!51457))

(declare-fun res!64804 () Bool)

(assert (=> d!24740 (=> (not res!64804) (not e!51457))))

(declare-fun lt!125353 () (_ BitVec 64))

(declare-fun lt!125355 () (_ BitVec 64))

(declare-fun lt!125352 () (_ BitVec 64))

(assert (=> d!24740 (= res!64804 (= lt!125353 (bvsub lt!125352 lt!125355)))))

(assert (=> d!24740 (or (= (bvand lt!125352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125352 lt!125355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24740 (= lt!125355 (remainingBits!0 ((_ sign_extend 32) (size!1544 (buf!1934 (_2!3624 lt!125248)))) ((_ sign_extend 32) (currentByte!3772 (_2!3624 lt!125248))) ((_ sign_extend 32) (currentBit!3767 (_2!3624 lt!125248)))))))

(declare-fun lt!125354 () (_ BitVec 64))

(declare-fun lt!125356 () (_ BitVec 64))

(assert (=> d!24740 (= lt!125352 (bvmul lt!125354 lt!125356))))

(assert (=> d!24740 (or (= lt!125354 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125356 (bvsdiv (bvmul lt!125354 lt!125356) lt!125354)))))

(assert (=> d!24740 (= lt!125356 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24740 (= lt!125354 ((_ sign_extend 32) (size!1544 (buf!1934 (_2!3624 lt!125248)))))))

(assert (=> d!24740 (= lt!125353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3772 (_2!3624 lt!125248))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3767 (_2!3624 lt!125248)))))))

(assert (=> d!24740 (invariant!0 (currentBit!3767 (_2!3624 lt!125248)) (currentByte!3772 (_2!3624 lt!125248)) (size!1544 (buf!1934 (_2!3624 lt!125248))))))

(assert (=> d!24740 (= (bitIndex!0 (size!1544 (buf!1934 (_2!3624 lt!125248))) (currentByte!3772 (_2!3624 lt!125248)) (currentBit!3767 (_2!3624 lt!125248))) lt!125353)))

(declare-fun b!78404 () Bool)

(declare-fun res!64803 () Bool)

(assert (=> b!78404 (=> (not res!64803) (not e!51457))))

(assert (=> b!78404 (= res!64803 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125353))))

(declare-fun b!78405 () Bool)

(declare-fun lt!125357 () (_ BitVec 64))

(assert (=> b!78405 (= e!51457 (bvsle lt!125353 (bvmul lt!125357 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78405 (or (= lt!125357 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125357 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125357)))))

(assert (=> b!78405 (= lt!125357 ((_ sign_extend 32) (size!1544 (buf!1934 (_2!3624 lt!125248)))))))

(assert (= (and d!24740 res!64804) b!78404))

(assert (= (and b!78404 res!64803) b!78405))

(declare-fun m!123969 () Bool)

(assert (=> d!24740 m!123969))

(assert (=> d!24740 m!123871))

(assert (=> b!78296 d!24740))

(declare-fun d!24744 () Bool)

(declare-fun e!51458 () Bool)

(assert (=> d!24744 e!51458))

(declare-fun res!64806 () Bool)

(assert (=> d!24744 (=> (not res!64806) (not e!51458))))

(declare-fun lt!125362 () (_ BitVec 64))

(declare-fun lt!125359 () (_ BitVec 64))

(declare-fun lt!125360 () (_ BitVec 64))

(assert (=> d!24744 (= res!64806 (= lt!125360 (bvsub lt!125359 lt!125362)))))

(assert (=> d!24744 (or (= (bvand lt!125359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125362 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125359 lt!125362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24744 (= lt!125362 (remainingBits!0 ((_ sign_extend 32) (size!1544 (buf!1934 thiss!1107))) ((_ sign_extend 32) (currentByte!3772 thiss!1107)) ((_ sign_extend 32) (currentBit!3767 thiss!1107))))))

(declare-fun lt!125361 () (_ BitVec 64))

(declare-fun lt!125363 () (_ BitVec 64))

(assert (=> d!24744 (= lt!125359 (bvmul lt!125361 lt!125363))))

(assert (=> d!24744 (or (= lt!125361 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125363 (bvsdiv (bvmul lt!125361 lt!125363) lt!125361)))))

(assert (=> d!24744 (= lt!125363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24744 (= lt!125361 ((_ sign_extend 32) (size!1544 (buf!1934 thiss!1107))))))

(assert (=> d!24744 (= lt!125360 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3772 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3767 thiss!1107))))))

(assert (=> d!24744 (invariant!0 (currentBit!3767 thiss!1107) (currentByte!3772 thiss!1107) (size!1544 (buf!1934 thiss!1107)))))

(assert (=> d!24744 (= (bitIndex!0 (size!1544 (buf!1934 thiss!1107)) (currentByte!3772 thiss!1107) (currentBit!3767 thiss!1107)) lt!125360)))

(declare-fun b!78406 () Bool)

(declare-fun res!64805 () Bool)

(assert (=> b!78406 (=> (not res!64805) (not e!51458))))

(assert (=> b!78406 (= res!64805 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125360))))

(declare-fun b!78407 () Bool)

(declare-fun lt!125364 () (_ BitVec 64))

(assert (=> b!78407 (= e!51458 (bvsle lt!125360 (bvmul lt!125364 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78407 (or (= lt!125364 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125364 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125364)))))

(assert (=> b!78407 (= lt!125364 ((_ sign_extend 32) (size!1544 (buf!1934 thiss!1107))))))

(assert (= (and d!24744 res!64806) b!78406))

(assert (= (and b!78406 res!64805) b!78407))

(declare-fun m!123971 () Bool)

(assert (=> d!24744 m!123971))

(declare-fun m!123973 () Bool)

(assert (=> d!24744 m!123973))

(assert (=> b!78296 d!24744))

(declare-fun d!24746 () Bool)

(declare-fun e!51474 () Bool)

(assert (=> d!24746 e!51474))

(declare-fun res!64831 () Bool)

(assert (=> d!24746 (=> (not res!64831) (not e!51474))))

(declare-fun lt!125402 () tuple2!6974)

(assert (=> d!24746 (= res!64831 (= (size!1544 (buf!1934 thiss!1107)) (size!1544 (buf!1934 (_2!3624 lt!125402)))))))

(declare-fun choose!16 (BitStream!2650 Bool) tuple2!6974)

(assert (=> d!24746 (= lt!125402 (choose!16 thiss!1107 lt!125247))))

(assert (=> d!24746 (validate_offset_bit!0 ((_ sign_extend 32) (size!1544 (buf!1934 thiss!1107))) ((_ sign_extend 32) (currentByte!3772 thiss!1107)) ((_ sign_extend 32) (currentBit!3767 thiss!1107)))))

(assert (=> d!24746 (= (appendBit!0 thiss!1107 lt!125247) lt!125402)))

(declare-fun b!78434 () Bool)

(declare-fun e!51473 () Bool)

(declare-fun lt!125400 () tuple2!6976)

(assert (=> b!78434 (= e!51473 (= (bitIndex!0 (size!1544 (buf!1934 (_1!3625 lt!125400))) (currentByte!3772 (_1!3625 lt!125400)) (currentBit!3767 (_1!3625 lt!125400))) (bitIndex!0 (size!1544 (buf!1934 (_2!3624 lt!125402))) (currentByte!3772 (_2!3624 lt!125402)) (currentBit!3767 (_2!3624 lt!125402)))))))

(declare-fun b!78431 () Bool)

(declare-fun res!64834 () Bool)

(assert (=> b!78431 (=> (not res!64834) (not e!51474))))

(declare-fun lt!125403 () (_ BitVec 64))

(declare-fun lt!125401 () (_ BitVec 64))

(assert (=> b!78431 (= res!64834 (= (bitIndex!0 (size!1544 (buf!1934 (_2!3624 lt!125402))) (currentByte!3772 (_2!3624 lt!125402)) (currentBit!3767 (_2!3624 lt!125402))) (bvadd lt!125403 lt!125401)))))

(assert (=> b!78431 (or (not (= (bvand lt!125403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125401 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125403 lt!125401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78431 (= lt!125401 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78431 (= lt!125403 (bitIndex!0 (size!1544 (buf!1934 thiss!1107)) (currentByte!3772 thiss!1107) (currentBit!3767 thiss!1107)))))

(declare-fun b!78432 () Bool)

(declare-fun res!64832 () Bool)

(assert (=> b!78432 (=> (not res!64832) (not e!51474))))

(assert (=> b!78432 (= res!64832 (isPrefixOf!0 thiss!1107 (_2!3624 lt!125402)))))

(declare-fun b!78433 () Bool)

(assert (=> b!78433 (= e!51474 e!51473)))

(declare-fun res!64833 () Bool)

(assert (=> b!78433 (=> (not res!64833) (not e!51473))))

(assert (=> b!78433 (= res!64833 (and (= (_2!3625 lt!125400) lt!125247) (= (_1!3625 lt!125400) (_2!3624 lt!125402))))))

(assert (=> b!78433 (= lt!125400 (readBitPure!0 (readerFrom!0 (_2!3624 lt!125402) (currentBit!3767 thiss!1107) (currentByte!3772 thiss!1107))))))

(assert (= (and d!24746 res!64831) b!78431))

(assert (= (and b!78431 res!64834) b!78432))

(assert (= (and b!78432 res!64832) b!78433))

(assert (= (and b!78433 res!64833) b!78434))

(declare-fun m!123995 () Bool)

(assert (=> b!78432 m!123995))

(declare-fun m!123997 () Bool)

(assert (=> b!78431 m!123997))

(assert (=> b!78431 m!123869))

(declare-fun m!123999 () Bool)

(assert (=> d!24746 m!123999))

(assert (=> d!24746 m!123879))

(declare-fun m!124001 () Bool)

(assert (=> b!78433 m!124001))

(assert (=> b!78433 m!124001))

(declare-fun m!124003 () Bool)

(assert (=> b!78433 m!124003))

(declare-fun m!124005 () Bool)

(assert (=> b!78434 m!124005))

(assert (=> b!78434 m!123997))

(assert (=> b!78291 d!24746))

(declare-fun d!24764 () Bool)

(declare-fun res!64850 () Bool)

(declare-fun e!51483 () Bool)

(assert (=> d!24764 (=> (not res!64850) (not e!51483))))

(assert (=> d!24764 (= res!64850 (= (size!1544 (buf!1934 thiss!1107)) (size!1544 (buf!1934 (_2!3624 lt!125248)))))))

(assert (=> d!24764 (= (isPrefixOf!0 thiss!1107 (_2!3624 lt!125248)) e!51483)))

(declare-fun b!78450 () Bool)

(declare-fun res!64851 () Bool)

(assert (=> b!78450 (=> (not res!64851) (not e!51483))))

(assert (=> b!78450 (= res!64851 (bvsle (bitIndex!0 (size!1544 (buf!1934 thiss!1107)) (currentByte!3772 thiss!1107) (currentBit!3767 thiss!1107)) (bitIndex!0 (size!1544 (buf!1934 (_2!3624 lt!125248))) (currentByte!3772 (_2!3624 lt!125248)) (currentBit!3767 (_2!3624 lt!125248)))))))

(declare-fun b!78451 () Bool)

(declare-fun e!51484 () Bool)

(assert (=> b!78451 (= e!51483 e!51484)))

(declare-fun res!64849 () Bool)

(assert (=> b!78451 (=> res!64849 e!51484)))

(assert (=> b!78451 (= res!64849 (= (size!1544 (buf!1934 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78452 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3334 array!3334 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78452 (= e!51484 (arrayBitRangesEq!0 (buf!1934 thiss!1107) (buf!1934 (_2!3624 lt!125248)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1544 (buf!1934 thiss!1107)) (currentByte!3772 thiss!1107) (currentBit!3767 thiss!1107))))))

(assert (= (and d!24764 res!64850) b!78450))

(assert (= (and b!78450 res!64851) b!78451))

(assert (= (and b!78451 (not res!64849)) b!78452))

(assert (=> b!78450 m!123869))

(assert (=> b!78450 m!123867))

(assert (=> b!78452 m!123869))

(assert (=> b!78452 m!123869))

(declare-fun m!124007 () Bool)

(assert (=> b!78452 m!124007))

(assert (=> b!78297 d!24764))

(assert (=> b!78292 d!24764))

(declare-fun d!24766 () Bool)

(assert (=> d!24766 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3767 thiss!1107) (currentByte!3772 thiss!1107) (size!1544 (buf!1934 thiss!1107))))))

(declare-fun bs!6005 () Bool)

(assert (= bs!6005 d!24766))

(assert (=> bs!6005 m!123973))

(assert (=> start!15408 d!24766))

(assert (=> b!78298 d!24740))

(assert (=> b!78298 d!24744))

(declare-fun d!24768 () Bool)

(assert (=> d!24768 (= (array_inv!1390 (buf!1934 thiss!1107)) (bvsge (size!1544 (buf!1934 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78293 d!24768))

(declare-fun d!24770 () Bool)

(assert (=> d!24770 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1544 (buf!1934 thiss!1107))) ((_ sign_extend 32) (currentByte!3772 thiss!1107)) ((_ sign_extend 32) (currentBit!3767 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1544 (buf!1934 thiss!1107))) ((_ sign_extend 32) (currentByte!3772 thiss!1107)) ((_ sign_extend 32) (currentBit!3767 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6006 () Bool)

(assert (= bs!6006 d!24770))

(assert (=> bs!6006 m!123971))

(assert (=> b!78299 d!24770))

(push 1)

(assert (not d!24766))

(assert (not d!24744))

(assert (not d!24740))

(assert (not d!24726))

(assert (not b!78432))

(assert (not b!78385))

(assert (not d!24746))

(assert (not b!78450))

(assert (not b!78433))

(assert (not b!78452))

(assert (not b!78434))

(assert (not d!24728))

(assert (not b!78431))

(assert (not d!24770))

(assert (not d!24732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

