; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30132 () Bool)

(assert start!30132)

(declare-fun res!129353 () Bool)

(declare-fun e!103941 () Bool)

(assert (=> start!30132 (=> (not res!129353) (not e!103941))))

(declare-datatypes ((array!7000 0))(
  ( (array!7001 (arr!3975 (Array (_ BitVec 32) (_ BitVec 8))) (size!3152 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5562 0))(
  ( (BitStream!5563 (buf!3655 array!7000) (currentByte!6680 (_ BitVec 32)) (currentBit!6675 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5562)

(declare-fun bs2!18 () BitStream!5562)

(assert (=> start!30132 (= res!129353 (= (size!3152 (buf!3655 bs1!10)) (size!3152 (buf!3655 bs2!18))))))

(assert (=> start!30132 e!103941))

(declare-fun e!103940 () Bool)

(declare-fun inv!12 (BitStream!5562) Bool)

(assert (=> start!30132 (and (inv!12 bs1!10) e!103940)))

(declare-fun e!103936 () Bool)

(assert (=> start!30132 (and (inv!12 bs2!18) e!103936)))

(declare-fun b!154572 () Bool)

(declare-fun e!103939 () Bool)

(declare-fun lt!240937 () (_ BitVec 64))

(assert (=> b!154572 (= e!103939 (and (bvslt lt!240937 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!240937 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun lt!240938 () (_ BitVec 64))

(assert (=> b!154572 (= lt!240937 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!240938 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-datatypes ((tuple2!13692 0))(
  ( (tuple2!13693 (_1!7248 BitStream!5562) (_2!7248 (_ BitVec 8))) )
))
(declare-fun lt!240936 () tuple2!13692)

(declare-fun readBytePure!0 (BitStream!5562) tuple2!13692)

(assert (=> b!154572 (= lt!240936 (readBytePure!0 (BitStream!5563 (buf!3655 bs2!18) (currentByte!6680 bs1!10) (currentBit!6675 bs1!10))))))

(declare-fun lt!240939 () tuple2!13692)

(assert (=> b!154572 (= lt!240939 (readBytePure!0 bs1!10))))

(declare-fun b!154573 () Bool)

(declare-fun array_inv!2941 (array!7000) Bool)

(assert (=> b!154573 (= e!103940 (array_inv!2941 (buf!3655 bs1!10)))))

(declare-fun b!154574 () Bool)

(assert (=> b!154574 (= e!103941 e!103939)))

(declare-fun res!129354 () Bool)

(assert (=> b!154574 (=> (not res!129354) (not e!103939))))

(declare-fun lt!240940 () (_ BitVec 64))

(assert (=> b!154574 (= res!129354 (bvsle lt!240940 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3152 (buf!3655 bs1!10))))))))

(assert (=> b!154574 (= lt!240940 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240938))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154574 (= lt!240938 (bitIndex!0 (size!3152 (buf!3655 bs1!10)) (currentByte!6680 bs1!10) (currentBit!6675 bs1!10)))))

(declare-fun b!154575 () Bool)

(declare-fun res!129351 () Bool)

(assert (=> b!154575 (=> (not res!129351) (not e!103939))))

(assert (=> b!154575 (= res!129351 (bvsle lt!240940 (bitIndex!0 (size!3152 (buf!3655 bs2!18)) (currentByte!6680 bs2!18) (currentBit!6675 bs2!18))))))

(declare-fun b!154576 () Bool)

(declare-fun res!129352 () Bool)

(assert (=> b!154576 (=> (not res!129352) (not e!103939))))

(declare-fun arrayBitRangesEq!0 (array!7000 array!7000 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154576 (= res!129352 (arrayBitRangesEq!0 (buf!3655 bs1!10) (buf!3655 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240940))))

(declare-fun b!154577 () Bool)

(assert (=> b!154577 (= e!103936 (array_inv!2941 (buf!3655 bs2!18)))))

(assert (= (and start!30132 res!129353) b!154574))

(assert (= (and b!154574 res!129354) b!154575))

(assert (= (and b!154575 res!129351) b!154576))

(assert (= (and b!154576 res!129352) b!154572))

(assert (= start!30132 b!154573))

(assert (= start!30132 b!154577))

(declare-fun m!240535 () Bool)

(assert (=> b!154572 m!240535))

(declare-fun m!240537 () Bool)

(assert (=> b!154572 m!240537))

(declare-fun m!240539 () Bool)

(assert (=> b!154574 m!240539))

(declare-fun m!240541 () Bool)

(assert (=> start!30132 m!240541))

(declare-fun m!240543 () Bool)

(assert (=> start!30132 m!240543))

(declare-fun m!240545 () Bool)

(assert (=> b!154576 m!240545))

(declare-fun m!240547 () Bool)

(assert (=> b!154573 m!240547))

(declare-fun m!240549 () Bool)

(assert (=> b!154577 m!240549))

(declare-fun m!240551 () Bool)

(assert (=> b!154575 m!240551))

(check-sat (not b!154572) (not start!30132) (not b!154574) (not b!154573) (not b!154577) (not b!154576) (not b!154575))
(check-sat)
(get-model)

(declare-fun d!50946 () Bool)

(declare-fun e!103962 () Bool)

(assert (=> d!50946 e!103962))

(declare-fun res!129371 () Bool)

(assert (=> d!50946 (=> (not res!129371) (not e!103962))))

(declare-fun lt!240968 () (_ BitVec 64))

(declare-fun lt!240971 () (_ BitVec 64))

(declare-fun lt!240969 () (_ BitVec 64))

(assert (=> d!50946 (= res!129371 (= lt!240971 (bvsub lt!240968 lt!240969)))))

(assert (=> d!50946 (or (= (bvand lt!240968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240968 lt!240969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50946 (= lt!240969 (remainingBits!0 ((_ sign_extend 32) (size!3152 (buf!3655 bs2!18))) ((_ sign_extend 32) (currentByte!6680 bs2!18)) ((_ sign_extend 32) (currentBit!6675 bs2!18))))))

(declare-fun lt!240972 () (_ BitVec 64))

(declare-fun lt!240970 () (_ BitVec 64))

(assert (=> d!50946 (= lt!240968 (bvmul lt!240972 lt!240970))))

(assert (=> d!50946 (or (= lt!240972 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240970 (bvsdiv (bvmul lt!240972 lt!240970) lt!240972)))))

(assert (=> d!50946 (= lt!240970 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50946 (= lt!240972 ((_ sign_extend 32) (size!3152 (buf!3655 bs2!18))))))

(assert (=> d!50946 (= lt!240971 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6680 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6675 bs2!18))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50946 (invariant!0 (currentBit!6675 bs2!18) (currentByte!6680 bs2!18) (size!3152 (buf!3655 bs2!18)))))

(assert (=> d!50946 (= (bitIndex!0 (size!3152 (buf!3655 bs2!18)) (currentByte!6680 bs2!18) (currentBit!6675 bs2!18)) lt!240971)))

(declare-fun b!154600 () Bool)

(declare-fun res!129372 () Bool)

(assert (=> b!154600 (=> (not res!129372) (not e!103962))))

(assert (=> b!154600 (= res!129372 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240971))))

(declare-fun b!154601 () Bool)

(declare-fun lt!240973 () (_ BitVec 64))

(assert (=> b!154601 (= e!103962 (bvsle lt!240971 (bvmul lt!240973 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154601 (or (= lt!240973 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240973 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240973)))))

(assert (=> b!154601 (= lt!240973 ((_ sign_extend 32) (size!3152 (buf!3655 bs2!18))))))

(assert (= (and d!50946 res!129371) b!154600))

(assert (= (and b!154600 res!129372) b!154601))

(declare-fun m!240571 () Bool)

(assert (=> d!50946 m!240571))

(declare-fun m!240573 () Bool)

(assert (=> d!50946 m!240573))

(assert (=> b!154575 d!50946))

(declare-fun d!50948 () Bool)

(assert (=> d!50948 (= (array_inv!2941 (buf!3655 bs2!18)) (bvsge (size!3152 (buf!3655 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154577 d!50948))

(declare-fun b!154620 () Bool)

(declare-fun e!103978 () Bool)

(declare-fun e!103981 () Bool)

(assert (=> b!154620 (= e!103978 e!103981)))

(declare-fun lt!240994 () (_ BitVec 32))

(declare-fun res!129387 () Bool)

(declare-datatypes ((tuple4!198 0))(
  ( (tuple4!199 (_1!7250 (_ BitVec 32)) (_2!7250 (_ BitVec 32)) (_3!402 (_ BitVec 32)) (_4!99 (_ BitVec 32))) )
))
(declare-fun lt!240993 () tuple4!198)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154620 (= res!129387 (byteRangesEq!0 (select (arr!3975 (buf!3655 bs1!10)) (_3!402 lt!240993)) (select (arr!3975 (buf!3655 bs2!18)) (_3!402 lt!240993)) lt!240994 #b00000000000000000000000000001000))))

(assert (=> b!154620 (=> (not res!129387) (not e!103981))))

(declare-fun d!50950 () Bool)

(declare-fun res!129390 () Bool)

(declare-fun e!103982 () Bool)

(assert (=> d!50950 (=> res!129390 e!103982)))

(assert (=> d!50950 (= res!129390 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240940))))

(assert (=> d!50950 (= (arrayBitRangesEq!0 (buf!3655 bs1!10) (buf!3655 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240940) e!103982)))

(declare-fun e!103980 () Bool)

(declare-fun b!154621 () Bool)

(declare-fun arrayRangesEq!392 (array!7000 array!7000 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154621 (= e!103980 (arrayRangesEq!392 (buf!3655 bs1!10) (buf!3655 bs2!18) (_1!7250 lt!240993) (_2!7250 lt!240993)))))

(declare-fun b!154622 () Bool)

(declare-fun e!103979 () Bool)

(declare-fun call!2207 () Bool)

(assert (=> b!154622 (= e!103979 call!2207)))

(declare-fun b!154623 () Bool)

(declare-fun res!129389 () Bool)

(declare-fun lt!240992 () (_ BitVec 32))

(assert (=> b!154623 (= res!129389 (= lt!240992 #b00000000000000000000000000000000))))

(assert (=> b!154623 (=> res!129389 e!103979)))

(assert (=> b!154623 (= e!103981 e!103979)))

(declare-fun b!154624 () Bool)

(assert (=> b!154624 (= e!103978 call!2207)))

(declare-fun b!154625 () Bool)

(declare-fun e!103977 () Bool)

(assert (=> b!154625 (= e!103982 e!103977)))

(declare-fun res!129388 () Bool)

(assert (=> b!154625 (=> (not res!129388) (not e!103977))))

(assert (=> b!154625 (= res!129388 e!103980)))

(declare-fun res!129391 () Bool)

(assert (=> b!154625 (=> res!129391 e!103980)))

(assert (=> b!154625 (= res!129391 (bvsge (_1!7250 lt!240993) (_2!7250 lt!240993)))))

(assert (=> b!154625 (= lt!240992 ((_ extract 31 0) (bvsrem lt!240940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154625 (= lt!240994 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!198)

(assert (=> b!154625 (= lt!240993 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240940))))

(declare-fun c!8223 () Bool)

(declare-fun bm!2204 () Bool)

(assert (=> bm!2204 (= call!2207 (byteRangesEq!0 (ite c!8223 (select (arr!3975 (buf!3655 bs1!10)) (_3!402 lt!240993)) (select (arr!3975 (buf!3655 bs1!10)) (_4!99 lt!240993))) (ite c!8223 (select (arr!3975 (buf!3655 bs2!18)) (_3!402 lt!240993)) (select (arr!3975 (buf!3655 bs2!18)) (_4!99 lt!240993))) (ite c!8223 lt!240994 #b00000000000000000000000000000000) lt!240992))))

(declare-fun b!154626 () Bool)

(assert (=> b!154626 (= e!103977 e!103978)))

(assert (=> b!154626 (= c!8223 (= (_3!402 lt!240993) (_4!99 lt!240993)))))

(assert (= (and d!50950 (not res!129390)) b!154625))

(assert (= (and b!154625 (not res!129391)) b!154621))

(assert (= (and b!154625 res!129388) b!154626))

(assert (= (and b!154626 c!8223) b!154624))

(assert (= (and b!154626 (not c!8223)) b!154620))

(assert (= (and b!154620 res!129387) b!154623))

(assert (= (and b!154623 (not res!129389)) b!154622))

(assert (= (or b!154624 b!154622) bm!2204))

(declare-fun m!240575 () Bool)

(assert (=> b!154620 m!240575))

(declare-fun m!240577 () Bool)

(assert (=> b!154620 m!240577))

(assert (=> b!154620 m!240575))

(assert (=> b!154620 m!240577))

(declare-fun m!240579 () Bool)

(assert (=> b!154620 m!240579))

(declare-fun m!240581 () Bool)

(assert (=> b!154621 m!240581))

(declare-fun m!240583 () Bool)

(assert (=> b!154625 m!240583))

(assert (=> bm!2204 m!240577))

(declare-fun m!240587 () Bool)

(assert (=> bm!2204 m!240587))

(declare-fun m!240591 () Bool)

(assert (=> bm!2204 m!240591))

(assert (=> bm!2204 m!240575))

(declare-fun m!240593 () Bool)

(assert (=> bm!2204 m!240593))

(assert (=> b!154576 d!50950))

(declare-fun d!50956 () Bool)

(assert (=> d!50956 (= (inv!12 bs1!10) (invariant!0 (currentBit!6675 bs1!10) (currentByte!6680 bs1!10) (size!3152 (buf!3655 bs1!10))))))

(declare-fun bs!12468 () Bool)

(assert (= bs!12468 d!50956))

(declare-fun m!240595 () Bool)

(assert (=> bs!12468 m!240595))

(assert (=> start!30132 d!50956))

(declare-fun d!50960 () Bool)

(assert (=> d!50960 (= (inv!12 bs2!18) (invariant!0 (currentBit!6675 bs2!18) (currentByte!6680 bs2!18) (size!3152 (buf!3655 bs2!18))))))

(declare-fun bs!12470 () Bool)

(assert (= bs!12470 d!50960))

(assert (=> bs!12470 m!240573))

(assert (=> start!30132 d!50960))

(declare-fun d!50964 () Bool)

(assert (=> d!50964 (= (array_inv!2941 (buf!3655 bs1!10)) (bvsge (size!3152 (buf!3655 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154573 d!50964))

(declare-fun d!50966 () Bool)

(declare-datatypes ((tuple2!13696 0))(
  ( (tuple2!13697 (_1!7251 (_ BitVec 8)) (_2!7251 BitStream!5562)) )
))
(declare-fun lt!241003 () tuple2!13696)

(declare-fun readByte!0 (BitStream!5562) tuple2!13696)

(assert (=> d!50966 (= lt!241003 (readByte!0 (BitStream!5563 (buf!3655 bs2!18) (currentByte!6680 bs1!10) (currentBit!6675 bs1!10))))))

(assert (=> d!50966 (= (readBytePure!0 (BitStream!5563 (buf!3655 bs2!18) (currentByte!6680 bs1!10) (currentBit!6675 bs1!10))) (tuple2!13693 (_2!7251 lt!241003) (_1!7251 lt!241003)))))

(declare-fun bs!12471 () Bool)

(assert (= bs!12471 d!50966))

(declare-fun m!240599 () Bool)

(assert (=> bs!12471 m!240599))

(assert (=> b!154572 d!50966))

(declare-fun d!50970 () Bool)

(declare-fun lt!241004 () tuple2!13696)

(assert (=> d!50970 (= lt!241004 (readByte!0 bs1!10))))

(assert (=> d!50970 (= (readBytePure!0 bs1!10) (tuple2!13693 (_2!7251 lt!241004) (_1!7251 lt!241004)))))

(declare-fun bs!12472 () Bool)

(assert (= bs!12472 d!50970))

(declare-fun m!240601 () Bool)

(assert (=> bs!12472 m!240601))

(assert (=> b!154572 d!50970))

(declare-fun d!50972 () Bool)

(declare-fun e!103984 () Bool)

(assert (=> d!50972 e!103984))

(declare-fun res!129394 () Bool)

(assert (=> d!50972 (=> (not res!129394) (not e!103984))))

(declare-fun lt!241008 () (_ BitVec 64))

(declare-fun lt!241006 () (_ BitVec 64))

(declare-fun lt!241005 () (_ BitVec 64))

(assert (=> d!50972 (= res!129394 (= lt!241008 (bvsub lt!241005 lt!241006)))))

(assert (=> d!50972 (or (= (bvand lt!241005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241006 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241005 lt!241006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50972 (= lt!241006 (remainingBits!0 ((_ sign_extend 32) (size!3152 (buf!3655 bs1!10))) ((_ sign_extend 32) (currentByte!6680 bs1!10)) ((_ sign_extend 32) (currentBit!6675 bs1!10))))))

(declare-fun lt!241009 () (_ BitVec 64))

(declare-fun lt!241007 () (_ BitVec 64))

(assert (=> d!50972 (= lt!241005 (bvmul lt!241009 lt!241007))))

(assert (=> d!50972 (or (= lt!241009 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241007 (bvsdiv (bvmul lt!241009 lt!241007) lt!241009)))))

(assert (=> d!50972 (= lt!241007 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50972 (= lt!241009 ((_ sign_extend 32) (size!3152 (buf!3655 bs1!10))))))

(assert (=> d!50972 (= lt!241008 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6680 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6675 bs1!10))))))

(assert (=> d!50972 (invariant!0 (currentBit!6675 bs1!10) (currentByte!6680 bs1!10) (size!3152 (buf!3655 bs1!10)))))

(assert (=> d!50972 (= (bitIndex!0 (size!3152 (buf!3655 bs1!10)) (currentByte!6680 bs1!10) (currentBit!6675 bs1!10)) lt!241008)))

(declare-fun b!154629 () Bool)

(declare-fun res!129395 () Bool)

(assert (=> b!154629 (=> (not res!129395) (not e!103984))))

(assert (=> b!154629 (= res!129395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241008))))

(declare-fun b!154630 () Bool)

(declare-fun lt!241010 () (_ BitVec 64))

(assert (=> b!154630 (= e!103984 (bvsle lt!241008 (bvmul lt!241010 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154630 (or (= lt!241010 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241010 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241010)))))

(assert (=> b!154630 (= lt!241010 ((_ sign_extend 32) (size!3152 (buf!3655 bs1!10))))))

(assert (= (and d!50972 res!129394) b!154629))

(assert (= (and b!154629 res!129395) b!154630))

(declare-fun m!240603 () Bool)

(assert (=> d!50972 m!240603))

(assert (=> d!50972 m!240595))

(assert (=> b!154574 d!50972))

(check-sat (not d!50970) (not d!50956) (not d!50966) (not bm!2204) (not d!50946) (not b!154625) (not b!154620) (not b!154621) (not d!50972) (not d!50960))
