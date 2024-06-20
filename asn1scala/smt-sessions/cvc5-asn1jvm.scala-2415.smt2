; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61528 () Bool)

(assert start!61528)

(declare-fun b!276467 () Bool)

(declare-fun e!196409 () Bool)

(declare-fun lt!414623 () (_ BitVec 64))

(declare-datatypes ((array!15820 0))(
  ( (array!15821 (arr!7843 (Array (_ BitVec 32) (_ BitVec 8))) (size!6850 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12514 0))(
  ( (BitStream!12515 (buf!7318 array!15820) (currentByte!13538 (_ BitVec 32)) (currentBit!13533 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12514)

(assert (=> b!276467 (= e!196409 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414623) (bvsle lt!414623 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6850 (buf!7318 bs1!11))))))))))

(declare-datatypes ((tuple2!22542 0))(
  ( (tuple2!22543 (_1!12315 BitStream!12514) (_2!12315 Bool)) )
))
(declare-fun lt!414624 () tuple2!22542)

(declare-fun bs2!19 () BitStream!12514)

(declare-fun readBitPure!0 (BitStream!12514) tuple2!22542)

(assert (=> b!276467 (= lt!414624 (readBitPure!0 (BitStream!12515 (buf!7318 bs2!19) (currentByte!13538 bs1!11) (currentBit!13533 bs1!11))))))

(declare-fun lt!414622 () tuple2!22542)

(assert (=> b!276467 (= lt!414622 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276467 (invariant!0 (currentBit!13533 bs1!11) (currentByte!13538 bs1!11) (size!6850 (buf!7318 bs2!19)))))

(declare-fun res!229707 () Bool)

(declare-fun e!196408 () Bool)

(assert (=> start!61528 (=> (not res!229707) (not e!196408))))

(assert (=> start!61528 (= res!229707 (= (size!6850 (buf!7318 bs1!11)) (size!6850 (buf!7318 bs2!19))))))

(assert (=> start!61528 e!196408))

(declare-fun e!196406 () Bool)

(declare-fun inv!12 (BitStream!12514) Bool)

(assert (=> start!61528 (and (inv!12 bs1!11) e!196406)))

(declare-fun e!196407 () Bool)

(assert (=> start!61528 (and (inv!12 bs2!19) e!196407)))

(declare-fun b!276468 () Bool)

(declare-fun array_inv!6574 (array!15820) Bool)

(assert (=> b!276468 (= e!196406 (array_inv!6574 (buf!7318 bs1!11)))))

(declare-fun b!276469 () Bool)

(assert (=> b!276469 (= e!196408 e!196409)))

(declare-fun res!229708 () Bool)

(assert (=> b!276469 (=> (not res!229708) (not e!196409))))

(declare-fun arrayBitRangesEq!0 (array!15820 array!15820 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276469 (= res!229708 (arrayBitRangesEq!0 (buf!7318 bs1!11) (buf!7318 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414623))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276469 (= lt!414623 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6850 (buf!7318 bs1!11)) (currentByte!13538 bs1!11) (currentBit!13533 bs1!11))))))

(declare-fun b!276470 () Bool)

(declare-fun res!229706 () Bool)

(assert (=> b!276470 (=> (not res!229706) (not e!196408))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276470 (= res!229706 (validate_offset_bit!0 ((_ sign_extend 32) (size!6850 (buf!7318 bs1!11))) ((_ sign_extend 32) (currentByte!13538 bs1!11)) ((_ sign_extend 32) (currentBit!13533 bs1!11))))))

(declare-fun b!276471 () Bool)

(assert (=> b!276471 (= e!196407 (array_inv!6574 (buf!7318 bs2!19)))))

(assert (= (and start!61528 res!229707) b!276470))

(assert (= (and b!276470 res!229706) b!276469))

(assert (= (and b!276469 res!229708) b!276467))

(assert (= start!61528 b!276468))

(assert (= start!61528 b!276471))

(declare-fun m!409487 () Bool)

(assert (=> b!276468 m!409487))

(declare-fun m!409489 () Bool)

(assert (=> start!61528 m!409489))

(declare-fun m!409491 () Bool)

(assert (=> start!61528 m!409491))

(declare-fun m!409493 () Bool)

(assert (=> b!276467 m!409493))

(declare-fun m!409495 () Bool)

(assert (=> b!276467 m!409495))

(declare-fun m!409497 () Bool)

(assert (=> b!276467 m!409497))

(declare-fun m!409499 () Bool)

(assert (=> b!276471 m!409499))

(declare-fun m!409501 () Bool)

(assert (=> b!276469 m!409501))

(declare-fun m!409503 () Bool)

(assert (=> b!276469 m!409503))

(declare-fun m!409505 () Bool)

(assert (=> b!276470 m!409505))

(push 1)

(assert (not b!276468))

(assert (not b!276470))

(assert (not b!276467))

(assert (not b!276471))

(assert (not b!276469))

(assert (not start!61528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95210 () Bool)

(assert (=> d!95210 (= (inv!12 bs1!11) (invariant!0 (currentBit!13533 bs1!11) (currentByte!13538 bs1!11) (size!6850 (buf!7318 bs1!11))))))

(declare-fun bs!24012 () Bool)

(assert (= bs!24012 d!95210))

(declare-fun m!409547 () Bool)

(assert (=> bs!24012 m!409547))

(assert (=> start!61528 d!95210))

(declare-fun d!95212 () Bool)

(assert (=> d!95212 (= (inv!12 bs2!19) (invariant!0 (currentBit!13533 bs2!19) (currentByte!13538 bs2!19) (size!6850 (buf!7318 bs2!19))))))

(declare-fun bs!24013 () Bool)

(assert (= bs!24013 d!95212))

(declare-fun m!409549 () Bool)

(assert (=> bs!24013 m!409549))

(assert (=> start!61528 d!95212))

(declare-fun d!95214 () Bool)

(assert (=> d!95214 (= (array_inv!6574 (buf!7318 bs1!11)) (bvsge (size!6850 (buf!7318 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276468 d!95214))

(declare-fun d!95216 () Bool)

(declare-datatypes ((tuple2!22548 0))(
  ( (tuple2!22549 (_1!12318 Bool) (_2!12318 BitStream!12514)) )
))
(declare-fun lt!414645 () tuple2!22548)

(declare-fun readBit!0 (BitStream!12514) tuple2!22548)

(assert (=> d!95216 (= lt!414645 (readBit!0 (BitStream!12515 (buf!7318 bs2!19) (currentByte!13538 bs1!11) (currentBit!13533 bs1!11))))))

(assert (=> d!95216 (= (readBitPure!0 (BitStream!12515 (buf!7318 bs2!19) (currentByte!13538 bs1!11) (currentBit!13533 bs1!11))) (tuple2!22543 (_2!12318 lt!414645) (_1!12318 lt!414645)))))

(declare-fun bs!24014 () Bool)

(assert (= bs!24014 d!95216))

(declare-fun m!409551 () Bool)

(assert (=> bs!24014 m!409551))

(assert (=> b!276467 d!95216))

(declare-fun d!95218 () Bool)

(declare-fun lt!414646 () tuple2!22548)

(assert (=> d!95218 (= lt!414646 (readBit!0 bs1!11))))

(assert (=> d!95218 (= (readBitPure!0 bs1!11) (tuple2!22543 (_2!12318 lt!414646) (_1!12318 lt!414646)))))

(declare-fun bs!24015 () Bool)

(assert (= bs!24015 d!95218))

(declare-fun m!409553 () Bool)

(assert (=> bs!24015 m!409553))

(assert (=> b!276467 d!95218))

(declare-fun d!95220 () Bool)

(assert (=> d!95220 (= (invariant!0 (currentBit!13533 bs1!11) (currentByte!13538 bs1!11) (size!6850 (buf!7318 bs2!19))) (and (bvsge (currentBit!13533 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13533 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13538 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13538 bs1!11) (size!6850 (buf!7318 bs2!19))) (and (= (currentBit!13533 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13538 bs1!11) (size!6850 (buf!7318 bs2!19)))))))))

(assert (=> b!276467 d!95220))

(declare-fun d!95222 () Bool)

(assert (=> d!95222 (= (array_inv!6574 (buf!7318 bs2!19)) (bvsge (size!6850 (buf!7318 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276471 d!95222))

(declare-fun d!95224 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95224 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6850 (buf!7318 bs1!11))) ((_ sign_extend 32) (currentByte!13538 bs1!11)) ((_ sign_extend 32) (currentBit!13533 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6850 (buf!7318 bs1!11))) ((_ sign_extend 32) (currentByte!13538 bs1!11)) ((_ sign_extend 32) (currentBit!13533 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24016 () Bool)

(assert (= bs!24016 d!95224))

(declare-fun m!409555 () Bool)

(assert (=> bs!24016 m!409555))

(assert (=> b!276470 d!95224))

(declare-fun d!95226 () Bool)

(declare-fun res!229750 () Bool)

(declare-fun e!196472 () Bool)

(assert (=> d!95226 (=> res!229750 e!196472)))

(assert (=> d!95226 (= res!229750 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414623))))

(assert (=> d!95226 (= (arrayBitRangesEq!0 (buf!7318 bs1!11) (buf!7318 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414623) e!196472)))

(declare-datatypes ((tuple4!528 0))(
  ( (tuple4!529 (_1!12319 (_ BitVec 32)) (_2!12319 (_ BitVec 32)) (_3!1044 (_ BitVec 32)) (_4!264 (_ BitVec 32))) )
))
(declare-fun lt!414659 () tuple4!528)

(declare-fun b!276530 () Bool)

(declare-fun e!196475 () Bool)

(declare-fun arrayRangesEq!1157 (array!15820 array!15820 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276530 (= e!196475 (arrayRangesEq!1157 (buf!7318 bs1!11) (buf!7318 bs2!19) (_1!12319 lt!414659) (_2!12319 lt!414659)))))

(declare-fun b!276531 () Bool)

(declare-fun e!196474 () Bool)

(declare-fun call!4448 () Bool)

(assert (=> b!276531 (= e!196474 call!4448)))

(declare-fun bm!4445 () Bool)

(declare-fun c!12635 () Bool)

(declare-fun lt!414660 () (_ BitVec 32))

(declare-fun lt!414661 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4445 (= call!4448 (byteRangesEq!0 (select (arr!7843 (buf!7318 bs1!11)) (_3!1044 lt!414659)) (select (arr!7843 (buf!7318 bs2!19)) (_3!1044 lt!414659)) lt!414660 (ite c!12635 lt!414661 #b00000000000000000000000000001000)))))

(declare-fun b!276532 () Bool)

(declare-fun e!196471 () Bool)

(assert (=> b!276532 (= e!196474 e!196471)))

(declare-fun res!229749 () Bool)

(assert (=> b!276532 (= res!229749 call!4448)))

(assert (=> b!276532 (=> (not res!229749) (not e!196471))))

(declare-fun b!276533 () Bool)

(declare-fun e!196470 () Bool)

(assert (=> b!276533 (= e!196472 e!196470)))

(declare-fun res!229751 () Bool)

(assert (=> b!276533 (=> (not res!229751) (not e!196470))))

(assert (=> b!276533 (= res!229751 e!196475)))

(declare-fun res!229747 () Bool)

(assert (=> b!276533 (=> res!229747 e!196475)))

(assert (=> b!276533 (= res!229747 (bvsge (_1!12319 lt!414659) (_2!12319 lt!414659)))))

(assert (=> b!276533 (= lt!414661 ((_ extract 31 0) (bvsrem lt!414623 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276533 (= lt!414660 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!528)

(assert (=> b!276533 (= lt!414659 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414623))))

(declare-fun b!276534 () Bool)

(assert (=> b!276534 (= e!196470 e!196474)))

(assert (=> b!276534 (= c!12635 (= (_3!1044 lt!414659) (_4!264 lt!414659)))))

(declare-fun b!276535 () Bool)

(declare-fun e!196473 () Bool)

(assert (=> b!276535 (= e!196473 (byteRangesEq!0 (select (arr!7843 (buf!7318 bs1!11)) (_4!264 lt!414659)) (select (arr!7843 (buf!7318 bs2!19)) (_4!264 lt!414659)) #b00000000000000000000000000000000 lt!414661))))

(declare-fun b!276536 () Bool)

(declare-fun res!229748 () Bool)

(assert (=> b!276536 (= res!229748 (= lt!414661 #b00000000000000000000000000000000))))

(assert (=> b!276536 (=> res!229748 e!196473)))

(assert (=> b!276536 (= e!196471 e!196473)))

(assert (= (and d!95226 (not res!229750)) b!276533))

(assert (= (and b!276533 (not res!229747)) b!276530))

(assert (= (and b!276533 res!229751) b!276534))

(assert (= (and b!276534 c!12635) b!276531))

(assert (= (and b!276534 (not c!12635)) b!276532))

(assert (= (and b!276532 res!229749) b!276536))

(assert (= (and b!276536 (not res!229748)) b!276535))

(assert (= (or b!276531 b!276532) bm!4445))

(declare-fun m!409561 () Bool)

(assert (=> b!276530 m!409561))

(declare-fun m!409563 () Bool)

(assert (=> bm!4445 m!409563))

(declare-fun m!409565 () Bool)

(assert (=> bm!4445 m!409565))

(assert (=> bm!4445 m!409563))

(assert (=> bm!4445 m!409565))

(declare-fun m!409567 () Bool)

(assert (=> bm!4445 m!409567))

(declare-fun m!409569 () Bool)

(assert (=> b!276533 m!409569))

(declare-fun m!409571 () Bool)

(assert (=> b!276535 m!409571))

(declare-fun m!409573 () Bool)

(assert (=> b!276535 m!409573))

(assert (=> b!276535 m!409571))

(assert (=> b!276535 m!409573))

(declare-fun m!409575 () Bool)

(assert (=> b!276535 m!409575))

(assert (=> b!276469 d!95226))

(declare-fun d!95240 () Bool)

(declare-fun e!196496 () Bool)

(assert (=> d!95240 e!196496))

(declare-fun res!229772 () Bool)

(assert (=> d!95240 (=> (not res!229772) (not e!196496))))

(declare-fun lt!414686 () (_ BitVec 64))

(declare-fun lt!414688 () (_ BitVec 64))

(declare-fun lt!414684 () (_ BitVec 64))

(assert (=> d!95240 (= res!229772 (= lt!414688 (bvsub lt!414686 lt!414684)))))

(assert (=> d!95240 (or (= (bvand lt!414686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414686 lt!414684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95240 (= lt!414684 (remainingBits!0 ((_ sign_extend 32) (size!6850 (buf!7318 bs1!11))) ((_ sign_extend 32) (currentByte!13538 bs1!11)) ((_ sign_extend 32) (currentBit!13533 bs1!11))))))

(declare-fun lt!414683 () (_ BitVec 64))

(declare-fun lt!414687 () (_ BitVec 64))

(assert (=> d!95240 (= lt!414686 (bvmul lt!414683 lt!414687))))

(assert (=> d!95240 (or (= lt!414683 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414687 (bvsdiv (bvmul lt!414683 lt!414687) lt!414683)))))

(assert (=> d!95240 (= lt!414687 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95240 (= lt!414683 ((_ sign_extend 32) (size!6850 (buf!7318 bs1!11))))))

(assert (=> d!95240 (= lt!414688 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13538 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13533 bs1!11))))))

(assert (=> d!95240 (invariant!0 (currentBit!13533 bs1!11) (currentByte!13538 bs1!11) (size!6850 (buf!7318 bs1!11)))))

(assert (=> d!95240 (= (bitIndex!0 (size!6850 (buf!7318 bs1!11)) (currentByte!13538 bs1!11) (currentBit!13533 bs1!11)) lt!414688)))

(declare-fun b!276562 () Bool)

(declare-fun res!229771 () Bool)

(assert (=> b!276562 (=> (not res!229771) (not e!196496))))

(assert (=> b!276562 (= res!229771 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414688))))

(declare-fun b!276563 () Bool)

(declare-fun lt!414685 () (_ BitVec 64))

(assert (=> b!276563 (= e!196496 (bvsle lt!414688 (bvmul lt!414685 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276563 (or (= lt!414685 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414685 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414685)))))

(assert (=> b!276563 (= lt!414685 ((_ sign_extend 32) (size!6850 (buf!7318 bs1!11))))))

(assert (= (and d!95240 res!229772) b!276562))

(assert (= (and b!276562 res!229771) b!276563))

(assert (=> d!95240 m!409555))

(assert (=> d!95240 m!409547))

(assert (=> b!276469 d!95240))

(push 1)

(assert (not d!95216))

(assert (not d!95212))

(assert (not d!95240))

(assert (not d!95224))

(assert (not bm!4445))

(assert (not d!95218))

(assert (not b!276530))

(assert (not b!276533))

(assert (not d!95210))

(assert (not b!276535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

