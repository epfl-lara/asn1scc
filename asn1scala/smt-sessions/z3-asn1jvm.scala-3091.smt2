; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71196 () Bool)

(assert start!71196)

(declare-fun b!321244 () Bool)

(declare-fun e!231287 () Bool)

(declare-datatypes ((array!20315 0))(
  ( (array!20316 (arr!9944 (Array (_ BitVec 32) (_ BitVec 8))) (size!8852 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13866 0))(
  ( (BitStream!13867 (buf!7994 array!20315) (currentByte!14753 (_ BitVec 32)) (currentBit!14748 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13866)

(declare-fun array_inv!8404 (array!20315) Bool)

(assert (=> b!321244 (= e!231287 (array_inv!8404 (buf!7994 thiss!1780)))))

(declare-fun e!231286 () Bool)

(declare-fun b!321243 () Bool)

(declare-datatypes ((tuple2!23498 0))(
  ( (tuple2!23499 (_1!13378 (_ BitVec 64)) (_2!13378 BitStream!13866)) )
))
(declare-fun lt!444515 () tuple2!23498)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321243 (= e!231286 (not (= (bitIndex!0 (size!8852 (buf!7994 (_2!13378 lt!444515))) (currentByte!14753 (_2!13378 lt!444515)) (currentBit!14748 (_2!13378 lt!444515))) (bvadd (bitIndex!0 (size!8852 (buf!7994 thiss!1780)) (currentByte!14753 thiss!1780) (currentBit!14748 thiss!1780)) ((_ sign_extend 32) nBits!542)))))))

(declare-fun b!321241 () Bool)

(declare-fun res!263834 () Bool)

(declare-fun e!231288 () Bool)

(assert (=> b!321241 (=> (not res!263834) (not e!231288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321241 (= res!263834 (validate_offset_bits!1 ((_ sign_extend 32) (size!8852 (buf!7994 thiss!1780))) ((_ sign_extend 32) (currentByte!14753 thiss!1780)) ((_ sign_extend 32) (currentBit!14748 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!321242 () Bool)

(assert (=> b!321242 (= e!231288 e!231286)))

(declare-fun res!263836 () Bool)

(assert (=> b!321242 (=> res!263836 e!231286)))

(assert (=> b!321242 (= res!263836 (not (= (buf!7994 (_2!13378 lt!444515)) (buf!7994 thiss!1780))))))

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23498)

(assert (=> b!321242 (= lt!444515 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!263835 () Bool)

(assert (=> start!71196 (=> (not res!263835) (not e!231288))))

(assert (=> start!71196 (= res!263835 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71196 e!231288))

(assert (=> start!71196 true))

(declare-fun inv!12 (BitStream!13866) Bool)

(assert (=> start!71196 (and (inv!12 thiss!1780) e!231287)))

(assert (= (and start!71196 res!263835) b!321241))

(assert (= (and b!321241 res!263834) b!321242))

(assert (= (and b!321242 (not res!263836)) b!321243))

(assert (= start!71196 b!321244))

(declare-fun m!459543 () Bool)

(assert (=> start!71196 m!459543))

(declare-fun m!459545 () Bool)

(assert (=> b!321243 m!459545))

(declare-fun m!459547 () Bool)

(assert (=> b!321243 m!459547))

(declare-fun m!459549 () Bool)

(assert (=> b!321242 m!459549))

(declare-fun m!459551 () Bool)

(assert (=> b!321244 m!459551))

(declare-fun m!459553 () Bool)

(assert (=> b!321241 m!459553))

(check-sat (not start!71196) (not b!321241) (not b!321244) (not b!321243) (not b!321242))
(check-sat)
(get-model)

(declare-fun d!105216 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105216 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8852 (buf!7994 thiss!1780))) ((_ sign_extend 32) (currentByte!14753 thiss!1780)) ((_ sign_extend 32) (currentBit!14748 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8852 (buf!7994 thiss!1780))) ((_ sign_extend 32) (currentByte!14753 thiss!1780)) ((_ sign_extend 32) (currentBit!14748 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27669 () Bool)

(assert (= bs!27669 d!105216))

(declare-fun m!459567 () Bool)

(assert (=> bs!27669 m!459567))

(assert (=> b!321241 d!105216))

(declare-fun b!321271 () Bool)

(declare-fun e!231307 () tuple2!23498)

(declare-fun lt!444534 () tuple2!23498)

(assert (=> b!321271 (= e!231307 (tuple2!23499 (_1!13378 lt!444534) (_2!13378 lt!444534)))))

(declare-datatypes ((tuple2!23502 0))(
  ( (tuple2!23503 (_1!13380 Bool) (_2!13380 BitStream!13866)) )
))
(declare-fun lt!444535 () tuple2!23502)

(declare-fun readBit!0 (BitStream!13866) tuple2!23502)

(assert (=> b!321271 (= lt!444535 (readBit!0 thiss!1780))))

(assert (=> b!321271 (= lt!444534 (readNBitsLSBFirstsLoop!0 (_2!13380 lt!444535) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13380 lt!444535) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321272 () Bool)

(declare-fun res!263856 () Bool)

(declare-fun e!231308 () Bool)

(assert (=> b!321272 (=> (not res!263856) (not e!231308))))

(declare-fun lt!444536 () (_ BitVec 64))

(declare-fun lt!444532 () tuple2!23498)

(declare-fun lt!444531 () (_ BitVec 64))

(assert (=> b!321272 (= res!263856 (= (bitIndex!0 (size!8852 (buf!7994 (_2!13378 lt!444532))) (currentByte!14753 (_2!13378 lt!444532)) (currentBit!14748 (_2!13378 lt!444532))) (bvadd lt!444531 lt!444536)))))

(assert (=> b!321272 (or (not (= (bvand lt!444531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444536 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444531 lt!444536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321272 (= lt!444536 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!321272 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!321272 (= lt!444531 (bitIndex!0 (size!8852 (buf!7994 thiss!1780)) (currentByte!14753 thiss!1780) (currentBit!14748 thiss!1780)))))

(declare-fun b!321273 () Bool)

(assert (=> b!321273 (= e!231307 (tuple2!23499 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun b!321274 () Bool)

(declare-fun res!263860 () Bool)

(assert (=> b!321274 (=> (not res!263860) (not e!231308))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321274 (= res!263860 (= (bvand (_1!13378 lt!444532) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun b!321275 () Bool)

(declare-fun e!231309 () Bool)

(assert (=> b!321275 (= e!231308 e!231309)))

(declare-fun res!263859 () Bool)

(assert (=> b!321275 (=> res!263859 e!231309)))

(assert (=> b!321275 (= res!263859 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun d!105218 () Bool)

(assert (=> d!105218 e!231308))

(declare-fun res!263857 () Bool)

(assert (=> d!105218 (=> (not res!263857) (not e!231308))))

(assert (=> d!105218 (= res!263857 (= (buf!7994 (_2!13378 lt!444532)) (buf!7994 thiss!1780)))))

(assert (=> d!105218 (= lt!444532 e!231307)))

(declare-fun c!15406 () Bool)

(assert (=> d!105218 (= c!15406 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105218 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105218 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444532)))

(declare-fun lt!444533 () (_ BitVec 64))

(declare-fun b!321276 () Bool)

(declare-datatypes ((tuple2!23504 0))(
  ( (tuple2!23505 (_1!13381 BitStream!13866) (_2!13381 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13866) tuple2!23504)

(assert (=> b!321276 (= e!231309 (= (= (bvand (bvlshr (_1!13378 lt!444532) lt!444533) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13381 (readBitPure!0 thiss!1780))))))

(assert (=> b!321276 (and (bvsge lt!444533 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444533 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!321276 (= lt!444533 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun b!321277 () Bool)

(declare-fun res!263858 () Bool)

(assert (=> b!321277 (=> (not res!263858) (not e!231308))))

(assert (=> b!321277 (= res!263858 (= (bvand (_1!13378 lt!444532) (onesLSBLong!0 nBits!542)) (_1!13378 lt!444532)))))

(assert (= (and d!105218 c!15406) b!321273))

(assert (= (and d!105218 (not c!15406)) b!321271))

(assert (= (and d!105218 res!263857) b!321272))

(assert (= (and b!321272 res!263856) b!321274))

(assert (= (and b!321274 res!263860) b!321277))

(assert (= (and b!321277 res!263858) b!321275))

(assert (= (and b!321275 (not res!263859)) b!321276))

(declare-fun m!459573 () Bool)

(assert (=> b!321274 m!459573))

(declare-fun m!459575 () Bool)

(assert (=> b!321272 m!459575))

(assert (=> b!321272 m!459547))

(declare-fun m!459577 () Bool)

(assert (=> b!321276 m!459577))

(declare-fun m!459579 () Bool)

(assert (=> b!321277 m!459579))

(declare-fun m!459581 () Bool)

(assert (=> b!321271 m!459581))

(declare-fun m!459583 () Bool)

(assert (=> b!321271 m!459583))

(assert (=> b!321242 d!105218))

(declare-fun d!105228 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105228 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14748 thiss!1780) (currentByte!14753 thiss!1780) (size!8852 (buf!7994 thiss!1780))))))

(declare-fun bs!27672 () Bool)

(assert (= bs!27672 d!105228))

(declare-fun m!459585 () Bool)

(assert (=> bs!27672 m!459585))

(assert (=> start!71196 d!105228))

(declare-fun d!105230 () Bool)

(assert (=> d!105230 (= (array_inv!8404 (buf!7994 thiss!1780)) (bvsge (size!8852 (buf!7994 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!321244 d!105230))

(declare-fun d!105232 () Bool)

(declare-fun e!231327 () Bool)

(assert (=> d!105232 e!231327))

(declare-fun res!263891 () Bool)

(assert (=> d!105232 (=> (not res!263891) (not e!231327))))

(declare-fun lt!444584 () (_ BitVec 64))

(declare-fun lt!444582 () (_ BitVec 64))

(declare-fun lt!444579 () (_ BitVec 64))

(assert (=> d!105232 (= res!263891 (= lt!444584 (bvsub lt!444579 lt!444582)))))

(assert (=> d!105232 (or (= (bvand lt!444579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444582 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444579 lt!444582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105232 (= lt!444582 (remainingBits!0 ((_ sign_extend 32) (size!8852 (buf!7994 (_2!13378 lt!444515)))) ((_ sign_extend 32) (currentByte!14753 (_2!13378 lt!444515))) ((_ sign_extend 32) (currentBit!14748 (_2!13378 lt!444515)))))))

(declare-fun lt!444581 () (_ BitVec 64))

(declare-fun lt!444583 () (_ BitVec 64))

(assert (=> d!105232 (= lt!444579 (bvmul lt!444581 lt!444583))))

(assert (=> d!105232 (or (= lt!444581 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444583 (bvsdiv (bvmul lt!444581 lt!444583) lt!444581)))))

(assert (=> d!105232 (= lt!444583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105232 (= lt!444581 ((_ sign_extend 32) (size!8852 (buf!7994 (_2!13378 lt!444515)))))))

(assert (=> d!105232 (= lt!444584 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14753 (_2!13378 lt!444515))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14748 (_2!13378 lt!444515)))))))

(assert (=> d!105232 (invariant!0 (currentBit!14748 (_2!13378 lt!444515)) (currentByte!14753 (_2!13378 lt!444515)) (size!8852 (buf!7994 (_2!13378 lt!444515))))))

(assert (=> d!105232 (= (bitIndex!0 (size!8852 (buf!7994 (_2!13378 lt!444515))) (currentByte!14753 (_2!13378 lt!444515)) (currentBit!14748 (_2!13378 lt!444515))) lt!444584)))

(declare-fun b!321317 () Bool)

(declare-fun res!263890 () Bool)

(assert (=> b!321317 (=> (not res!263890) (not e!231327))))

(assert (=> b!321317 (= res!263890 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444584))))

(declare-fun b!321318 () Bool)

(declare-fun lt!444580 () (_ BitVec 64))

(assert (=> b!321318 (= e!231327 (bvsle lt!444584 (bvmul lt!444580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!321318 (or (= lt!444580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444580)))))

(assert (=> b!321318 (= lt!444580 ((_ sign_extend 32) (size!8852 (buf!7994 (_2!13378 lt!444515)))))))

(assert (= (and d!105232 res!263891) b!321317))

(assert (= (and b!321317 res!263890) b!321318))

(declare-fun m!459601 () Bool)

(assert (=> d!105232 m!459601))

(declare-fun m!459603 () Bool)

(assert (=> d!105232 m!459603))

(assert (=> b!321243 d!105232))

(declare-fun d!105240 () Bool)

(declare-fun e!231331 () Bool)

(assert (=> d!105240 e!231331))

(declare-fun res!263898 () Bool)

(assert (=> d!105240 (=> (not res!263898) (not e!231331))))

(declare-fun lt!444594 () (_ BitVec 64))

(declare-fun lt!444591 () (_ BitVec 64))

(declare-fun lt!444596 () (_ BitVec 64))

(assert (=> d!105240 (= res!263898 (= lt!444596 (bvsub lt!444591 lt!444594)))))

(assert (=> d!105240 (or (= (bvand lt!444591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444594 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444591 lt!444594) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105240 (= lt!444594 (remainingBits!0 ((_ sign_extend 32) (size!8852 (buf!7994 thiss!1780))) ((_ sign_extend 32) (currentByte!14753 thiss!1780)) ((_ sign_extend 32) (currentBit!14748 thiss!1780))))))

(declare-fun lt!444593 () (_ BitVec 64))

(declare-fun lt!444595 () (_ BitVec 64))

(assert (=> d!105240 (= lt!444591 (bvmul lt!444593 lt!444595))))

(assert (=> d!105240 (or (= lt!444593 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444595 (bvsdiv (bvmul lt!444593 lt!444595) lt!444593)))))

(assert (=> d!105240 (= lt!444595 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105240 (= lt!444593 ((_ sign_extend 32) (size!8852 (buf!7994 thiss!1780))))))

(assert (=> d!105240 (= lt!444596 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14753 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14748 thiss!1780))))))

(assert (=> d!105240 (invariant!0 (currentBit!14748 thiss!1780) (currentByte!14753 thiss!1780) (size!8852 (buf!7994 thiss!1780)))))

(assert (=> d!105240 (= (bitIndex!0 (size!8852 (buf!7994 thiss!1780)) (currentByte!14753 thiss!1780) (currentBit!14748 thiss!1780)) lt!444596)))

(declare-fun b!321326 () Bool)

(declare-fun res!263897 () Bool)

(assert (=> b!321326 (=> (not res!263897) (not e!231331))))

(assert (=> b!321326 (= res!263897 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444596))))

(declare-fun b!321327 () Bool)

(declare-fun lt!444592 () (_ BitVec 64))

(assert (=> b!321327 (= e!231331 (bvsle lt!444596 (bvmul lt!444592 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!321327 (or (= lt!444592 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444592 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444592)))))

(assert (=> b!321327 (= lt!444592 ((_ sign_extend 32) (size!8852 (buf!7994 thiss!1780))))))

(assert (= (and d!105240 res!263898) b!321326))

(assert (= (and b!321326 res!263897) b!321327))

(assert (=> d!105240 m!459567))

(assert (=> d!105240 m!459585))

(assert (=> b!321243 d!105240))

(check-sat (not b!321277) (not b!321276) (not d!105216) (not b!321272) (not d!105228) (not b!321271) (not d!105240) (not b!321274) (not d!105232))
