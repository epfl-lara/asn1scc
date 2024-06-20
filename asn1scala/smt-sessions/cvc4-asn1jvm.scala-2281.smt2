; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57820 () Bool)

(assert start!57820)

(declare-fun b!265372 () Bool)

(declare-fun e!185402 () Bool)

(declare-fun e!185397 () Bool)

(assert (=> b!265372 (= e!185402 e!185397)))

(declare-fun res!221759 () Bool)

(assert (=> b!265372 (=> res!221759 e!185397)))

(declare-fun e!185399 () Bool)

(assert (=> b!265372 (= res!221759 e!185399)))

(declare-fun res!221760 () Bool)

(assert (=> b!265372 (=> (not res!221760) (not e!185399))))

(declare-datatypes ((array!14787 0))(
  ( (array!14788 (arr!7437 (Array (_ BitVec 32) (_ BitVec 8))) (size!6450 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11714 0))(
  ( (BitStream!11715 (buf!6918 array!14787) (currentByte!12800 (_ BitVec 32)) (currentBit!12795 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11714)

(assert (=> b!265372 (= res!221760 (not (= (size!6450 (buf!6918 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18878 0))(
  ( (Unit!18879) )
))
(declare-fun lt!406457 () Unit!18878)

(declare-fun e!185394 () Unit!18878)

(assert (=> b!265372 (= lt!406457 e!185394)))

(declare-fun c!12201 () Bool)

(assert (=> b!265372 (= c!12201 (not (= (size!6450 (buf!6918 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!265373 () Bool)

(declare-fun w2!580 () BitStream!11714)

(declare-fun arrayBitRangesEq!0 (array!14787 array!14787 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265373 (= e!185399 (not (arrayBitRangesEq!0 (buf!6918 w2!580) (buf!6918 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584)))))))

(declare-fun b!265374 () Bool)

(declare-fun lt!406456 () Unit!18878)

(assert (=> b!265374 (= e!185394 lt!406456)))

(declare-fun lt!406455 () (_ BitVec 64))

(assert (=> b!265374 (= lt!406455 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14787 array!14787 (_ BitVec 64) (_ BitVec 64)) Unit!18878)

(assert (=> b!265374 (= lt!406456 (arrayBitRangesEqSymmetric!0 (buf!6918 w1!584) (buf!6918 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406455))))

(assert (=> b!265374 (arrayBitRangesEq!0 (buf!6918 w2!580) (buf!6918 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406455)))

(declare-fun b!265375 () Bool)

(declare-fun e!185396 () Bool)

(declare-fun array_inv!6174 (array!14787) Bool)

(assert (=> b!265375 (= e!185396 (array_inv!6174 (buf!6918 w2!580)))))

(declare-fun b!265376 () Bool)

(declare-fun e!185401 () Bool)

(assert (=> b!265376 (= e!185401 (array_inv!6174 (buf!6918 w1!584)))))

(declare-fun b!265377 () Bool)

(declare-fun e!185395 () Bool)

(assert (=> b!265377 (= e!185395 (not (arrayBitRangesEq!0 (buf!6918 w1!584) (buf!6918 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584)))))))

(declare-fun res!221758 () Bool)

(declare-fun e!185398 () Bool)

(assert (=> start!57820 (=> (not res!221758) (not e!185398))))

(declare-fun isPrefixOf!0 (BitStream!11714 BitStream!11714) Bool)

(assert (=> start!57820 (= res!221758 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57820 e!185398))

(declare-fun inv!12 (BitStream!11714) Bool)

(assert (=> start!57820 (and (inv!12 w1!584) e!185401)))

(assert (=> start!57820 (and (inv!12 w2!580) e!185396)))

(declare-fun b!265371 () Bool)

(declare-fun Unit!18880 () Unit!18878)

(assert (=> b!265371 (= e!185394 Unit!18880)))

(declare-fun b!265378 () Bool)

(assert (=> b!265378 (= e!185398 (not e!185402))))

(declare-fun res!221761 () Bool)

(assert (=> b!265378 (=> res!221761 e!185402)))

(assert (=> b!265378 (= res!221761 e!185395)))

(declare-fun res!221757 () Bool)

(assert (=> b!265378 (=> (not res!221757) (not e!185395))))

(assert (=> b!265378 (= res!221757 (not (= (size!6450 (buf!6918 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!265378 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406451 () Unit!18878)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11714) Unit!18878)

(assert (=> b!265378 (= lt!406451 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406452 () BitStream!11714)

(assert (=> b!265378 (isPrefixOf!0 lt!406452 lt!406452)))

(declare-fun lt!406453 () Unit!18878)

(assert (=> b!265378 (= lt!406453 (lemmaIsPrefixRefl!0 lt!406452))))

(assert (=> b!265378 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406454 () Unit!18878)

(assert (=> b!265378 (= lt!406454 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265378 (= lt!406452 (BitStream!11715 (buf!6918 w2!580) (currentByte!12800 w1!584) (currentBit!12795 w1!584)))))

(declare-fun b!265379 () Bool)

(assert (=> b!265379 (= e!185397 (isPrefixOf!0 lt!406452 w1!584))))

(assert (= (and start!57820 res!221758) b!265378))

(assert (= (and b!265378 res!221757) b!265377))

(assert (= (and b!265378 (not res!221761)) b!265372))

(assert (= (and b!265372 c!12201) b!265374))

(assert (= (and b!265372 (not c!12201)) b!265371))

(assert (= (and b!265372 res!221760) b!265373))

(assert (= (and b!265372 (not res!221759)) b!265379))

(assert (= start!57820 b!265376))

(assert (= start!57820 b!265375))

(declare-fun m!396067 () Bool)

(assert (=> b!265378 m!396067))

(declare-fun m!396069 () Bool)

(assert (=> b!265378 m!396069))

(declare-fun m!396071 () Bool)

(assert (=> b!265378 m!396071))

(declare-fun m!396073 () Bool)

(assert (=> b!265378 m!396073))

(declare-fun m!396075 () Bool)

(assert (=> b!265378 m!396075))

(declare-fun m!396077 () Bool)

(assert (=> b!265378 m!396077))

(declare-fun m!396079 () Bool)

(assert (=> b!265373 m!396079))

(assert (=> b!265373 m!396079))

(declare-fun m!396081 () Bool)

(assert (=> b!265373 m!396081))

(assert (=> b!265377 m!396079))

(assert (=> b!265377 m!396079))

(declare-fun m!396083 () Bool)

(assert (=> b!265377 m!396083))

(declare-fun m!396085 () Bool)

(assert (=> b!265379 m!396085))

(assert (=> b!265374 m!396079))

(declare-fun m!396087 () Bool)

(assert (=> b!265374 m!396087))

(declare-fun m!396089 () Bool)

(assert (=> b!265374 m!396089))

(declare-fun m!396091 () Bool)

(assert (=> b!265376 m!396091))

(declare-fun m!396093 () Bool)

(assert (=> start!57820 m!396093))

(declare-fun m!396095 () Bool)

(assert (=> start!57820 m!396095))

(declare-fun m!396097 () Bool)

(assert (=> start!57820 m!396097))

(declare-fun m!396099 () Bool)

(assert (=> b!265375 m!396099))

(push 1)

(assert (not b!265376))

(assert (not b!265379))

(assert (not start!57820))

(assert (not b!265377))

(assert (not b!265375))

(assert (not b!265374))

(assert (not b!265373))

(assert (not b!265378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89584 () Bool)

(declare-fun e!185451 () Bool)

(assert (=> d!89584 e!185451))

(declare-fun res!221824 () Bool)

(assert (=> d!89584 (=> (not res!221824) (not e!185451))))

(declare-fun lt!406510 () (_ BitVec 64))

(declare-fun lt!406511 () (_ BitVec 64))

(declare-fun lt!406507 () (_ BitVec 64))

(assert (=> d!89584 (= res!221824 (= lt!406510 (bvsub lt!406507 lt!406511)))))

(assert (=> d!89584 (or (= (bvand lt!406507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406511 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406507 lt!406511) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89584 (= lt!406511 (remainingBits!0 ((_ sign_extend 32) (size!6450 (buf!6918 w1!584))) ((_ sign_extend 32) (currentByte!12800 w1!584)) ((_ sign_extend 32) (currentBit!12795 w1!584))))))

(declare-fun lt!406508 () (_ BitVec 64))

(declare-fun lt!406509 () (_ BitVec 64))

(assert (=> d!89584 (= lt!406507 (bvmul lt!406508 lt!406509))))

(assert (=> d!89584 (or (= lt!406508 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406509 (bvsdiv (bvmul lt!406508 lt!406509) lt!406508)))))

(assert (=> d!89584 (= lt!406509 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89584 (= lt!406508 ((_ sign_extend 32) (size!6450 (buf!6918 w1!584))))))

(assert (=> d!89584 (= lt!406510 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12800 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12795 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89584 (invariant!0 (currentBit!12795 w1!584) (currentByte!12800 w1!584) (size!6450 (buf!6918 w1!584)))))

(assert (=> d!89584 (= (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584)) lt!406510)))

(declare-fun b!265447 () Bool)

(declare-fun res!221823 () Bool)

(assert (=> b!265447 (=> (not res!221823) (not e!185451))))

(assert (=> b!265447 (= res!221823 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406510))))

(declare-fun b!265448 () Bool)

(declare-fun lt!406512 () (_ BitVec 64))

(assert (=> b!265448 (= e!185451 (bvsle lt!406510 (bvmul lt!406512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265448 (or (= lt!406512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406512)))))

(assert (=> b!265448 (= lt!406512 ((_ sign_extend 32) (size!6450 (buf!6918 w1!584))))))

(assert (= (and d!89584 res!221824) b!265447))

(assert (= (and b!265447 res!221823) b!265448))

(declare-fun m!396159 () Bool)

(assert (=> d!89584 m!396159))

(declare-fun m!396161 () Bool)

(assert (=> d!89584 m!396161))

(assert (=> b!265374 d!89584))

(declare-fun d!89604 () Bool)

(assert (=> d!89604 (arrayBitRangesEq!0 (buf!6918 w2!580) (buf!6918 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406455)))

(declare-fun lt!406518 () Unit!18878)

(declare-fun choose!8 (array!14787 array!14787 (_ BitVec 64) (_ BitVec 64)) Unit!18878)

(assert (=> d!89604 (= lt!406518 (choose!8 (buf!6918 w1!584) (buf!6918 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406455))))

(assert (=> d!89604 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406455))))

(assert (=> d!89604 (= (arrayBitRangesEqSymmetric!0 (buf!6918 w1!584) (buf!6918 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406455) lt!406518)))

(declare-fun bs!22742 () Bool)

(assert (= bs!22742 d!89604))

(assert (=> bs!22742 m!396089))

(declare-fun m!396165 () Bool)

(assert (=> bs!22742 m!396165))

(assert (=> b!265374 d!89604))

(declare-fun c!12214 () Bool)

(declare-fun lt!406568 () (_ BitVec 32))

(declare-fun lt!406567 () (_ BitVec 32))

(declare-fun bm!4134 () Bool)

(declare-datatypes ((tuple4!370 0))(
  ( (tuple4!371 (_1!12165 (_ BitVec 32)) (_2!12165 (_ BitVec 32)) (_3!965 (_ BitVec 32)) (_4!185 (_ BitVec 32))) )
))
(declare-fun lt!406569 () tuple4!370)

(declare-fun call!4137 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4134 (= call!4137 (byteRangesEq!0 (select (arr!7437 (buf!6918 w2!580)) (_3!965 lt!406569)) (select (arr!7437 (buf!6918 w1!584)) (_3!965 lt!406569)) lt!406568 (ite c!12214 lt!406567 #b00000000000000000000000000001000)))))

(declare-fun b!265524 () Bool)

(declare-fun e!185515 () Bool)

(assert (=> b!265524 (= e!185515 call!4137)))

(declare-fun b!265525 () Bool)

(declare-fun e!185517 () Bool)

(assert (=> b!265525 (= e!185515 e!185517)))

(declare-fun res!221882 () Bool)

(assert (=> b!265525 (= res!221882 call!4137)))

(assert (=> b!265525 (=> (not res!221882) (not e!185517))))

(declare-fun e!185516 () Bool)

(declare-fun b!265526 () Bool)

(assert (=> b!265526 (= e!185516 (byteRangesEq!0 (select (arr!7437 (buf!6918 w2!580)) (_4!185 lt!406569)) (select (arr!7437 (buf!6918 w1!584)) (_4!185 lt!406569)) #b00000000000000000000000000000000 lt!406567))))

(declare-fun b!265527 () Bool)

(declare-fun e!185513 () Bool)

(assert (=> b!265527 (= e!185513 e!185515)))

(assert (=> b!265527 (= c!12214 (= (_3!965 lt!406569) (_4!185 lt!406569)))))

(declare-fun b!265529 () Bool)

(declare-fun res!221886 () Bool)

(assert (=> b!265529 (= res!221886 (= lt!406567 #b00000000000000000000000000000000))))

(assert (=> b!265529 (=> res!221886 e!185516)))

(assert (=> b!265529 (= e!185517 e!185516)))

(declare-fun b!265530 () Bool)

(declare-fun e!185518 () Bool)

(declare-fun arrayRangesEq!1021 (array!14787 array!14787 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265530 (= e!185518 (arrayRangesEq!1021 (buf!6918 w2!580) (buf!6918 w1!584) (_1!12165 lt!406569) (_2!12165 lt!406569)))))

(declare-fun d!89608 () Bool)

(declare-fun res!221883 () Bool)

(declare-fun e!185514 () Bool)

(assert (=> d!89608 (=> res!221883 e!185514)))

(assert (=> d!89608 (= res!221883 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!406455))))

(assert (=> d!89608 (= (arrayBitRangesEq!0 (buf!6918 w2!580) (buf!6918 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406455) e!185514)))

(declare-fun b!265528 () Bool)

(assert (=> b!265528 (= e!185514 e!185513)))

(declare-fun res!221884 () Bool)

(assert (=> b!265528 (=> (not res!221884) (not e!185513))))

(assert (=> b!265528 (= res!221884 e!185518)))

(declare-fun res!221885 () Bool)

(assert (=> b!265528 (=> res!221885 e!185518)))

(assert (=> b!265528 (= res!221885 (bvsge (_1!12165 lt!406569) (_2!12165 lt!406569)))))

(assert (=> b!265528 (= lt!406567 ((_ extract 31 0) (bvsrem lt!406455 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265528 (= lt!406568 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!370)

(assert (=> b!265528 (= lt!406569 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!406455))))

(assert (= (and d!89608 (not res!221883)) b!265528))

(assert (= (and b!265528 (not res!221885)) b!265530))

(assert (= (and b!265528 res!221884) b!265527))

(assert (= (and b!265527 c!12214) b!265524))

(assert (= (and b!265527 (not c!12214)) b!265525))

(assert (= (and b!265525 res!221882) b!265529))

(assert (= (and b!265529 (not res!221886)) b!265526))

(assert (= (or b!265524 b!265525) bm!4134))

(declare-fun m!396251 () Bool)

(assert (=> bm!4134 m!396251))

(declare-fun m!396253 () Bool)

(assert (=> bm!4134 m!396253))

(assert (=> bm!4134 m!396251))

(assert (=> bm!4134 m!396253))

(declare-fun m!396255 () Bool)

(assert (=> bm!4134 m!396255))

(declare-fun m!396257 () Bool)

(assert (=> b!265526 m!396257))

(declare-fun m!396259 () Bool)

(assert (=> b!265526 m!396259))

(assert (=> b!265526 m!396257))

(assert (=> b!265526 m!396259))

(declare-fun m!396261 () Bool)

(assert (=> b!265526 m!396261))

(declare-fun m!396263 () Bool)

(assert (=> b!265530 m!396263))

(declare-fun m!396265 () Bool)

(assert (=> b!265528 m!396265))

(assert (=> b!265374 d!89608))

(declare-fun d!89632 () Bool)

(assert (=> d!89632 (= (array_inv!6174 (buf!6918 w2!580)) (bvsge (size!6450 (buf!6918 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265375 d!89632))

(declare-fun d!89634 () Bool)

(assert (=> d!89634 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406572 () Unit!18878)

(declare-fun choose!11 (BitStream!11714) Unit!18878)

(assert (=> d!89634 (= lt!406572 (choose!11 w2!580))))

(assert (=> d!89634 (= (lemmaIsPrefixRefl!0 w2!580) lt!406572)))

(declare-fun bs!22747 () Bool)

(assert (= bs!22747 d!89634))

(assert (=> bs!22747 m!396071))

(declare-fun m!396267 () Bool)

(assert (=> bs!22747 m!396267))

(assert (=> b!265378 d!89634))

(declare-fun d!89636 () Bool)

(assert (=> d!89636 (isPrefixOf!0 lt!406452 lt!406452)))

(declare-fun lt!406573 () Unit!18878)

(assert (=> d!89636 (= lt!406573 (choose!11 lt!406452))))

(assert (=> d!89636 (= (lemmaIsPrefixRefl!0 lt!406452) lt!406573)))

(declare-fun bs!22748 () Bool)

(assert (= bs!22748 d!89636))

(assert (=> bs!22748 m!396067))

(declare-fun m!396269 () Bool)

(assert (=> bs!22748 m!396269))

(assert (=> b!265378 d!89636))

(declare-fun d!89638 () Bool)

(declare-fun res!221894 () Bool)

(declare-fun e!185523 () Bool)

(assert (=> d!89638 (=> (not res!221894) (not e!185523))))

(assert (=> d!89638 (= res!221894 (= (size!6450 (buf!6918 lt!406452)) (size!6450 (buf!6918 lt!406452))))))

(assert (=> d!89638 (= (isPrefixOf!0 lt!406452 lt!406452) e!185523)))

(declare-fun b!265537 () Bool)

(declare-fun res!221893 () Bool)

(assert (=> b!265537 (=> (not res!221893) (not e!185523))))

(assert (=> b!265537 (= res!221893 (bvsle (bitIndex!0 (size!6450 (buf!6918 lt!406452)) (currentByte!12800 lt!406452) (currentBit!12795 lt!406452)) (bitIndex!0 (size!6450 (buf!6918 lt!406452)) (currentByte!12800 lt!406452) (currentBit!12795 lt!406452))))))

(declare-fun b!265538 () Bool)

(declare-fun e!185524 () Bool)

(assert (=> b!265538 (= e!185523 e!185524)))

(declare-fun res!221895 () Bool)

(assert (=> b!265538 (=> res!221895 e!185524)))

(assert (=> b!265538 (= res!221895 (= (size!6450 (buf!6918 lt!406452)) #b00000000000000000000000000000000))))

(declare-fun b!265539 () Bool)

(assert (=> b!265539 (= e!185524 (arrayBitRangesEq!0 (buf!6918 lt!406452) (buf!6918 lt!406452) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 lt!406452)) (currentByte!12800 lt!406452) (currentBit!12795 lt!406452))))))

(assert (= (and d!89638 res!221894) b!265537))

(assert (= (and b!265537 res!221893) b!265538))

(assert (= (and b!265538 (not res!221895)) b!265539))

(declare-fun m!396271 () Bool)

(assert (=> b!265537 m!396271))

(assert (=> b!265537 m!396271))

(assert (=> b!265539 m!396271))

(assert (=> b!265539 m!396271))

(declare-fun m!396273 () Bool)

(assert (=> b!265539 m!396273))

(assert (=> b!265378 d!89638))

(declare-fun d!89640 () Bool)

(assert (=> d!89640 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406574 () Unit!18878)

(assert (=> d!89640 (= lt!406574 (choose!11 w1!584))))

(assert (=> d!89640 (= (lemmaIsPrefixRefl!0 w1!584) lt!406574)))

(declare-fun bs!22749 () Bool)

(assert (= bs!22749 d!89640))

(assert (=> bs!22749 m!396069))

(declare-fun m!396275 () Bool)

(assert (=> bs!22749 m!396275))

(assert (=> b!265378 d!89640))

(declare-fun d!89642 () Bool)

(declare-fun res!221897 () Bool)

(declare-fun e!185525 () Bool)

(assert (=> d!89642 (=> (not res!221897) (not e!185525))))

(assert (=> d!89642 (= res!221897 (= (size!6450 (buf!6918 w1!584)) (size!6450 (buf!6918 w1!584))))))

(assert (=> d!89642 (= (isPrefixOf!0 w1!584 w1!584) e!185525)))

(declare-fun b!265540 () Bool)

(declare-fun res!221896 () Bool)

(assert (=> b!265540 (=> (not res!221896) (not e!185525))))

(assert (=> b!265540 (= res!221896 (bvsle (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584)) (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))))))

(declare-fun b!265541 () Bool)

(declare-fun e!185526 () Bool)

(assert (=> b!265541 (= e!185525 e!185526)))

(declare-fun res!221898 () Bool)

(assert (=> b!265541 (=> res!221898 e!185526)))

(assert (=> b!265541 (= res!221898 (= (size!6450 (buf!6918 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265542 () Bool)

(assert (=> b!265542 (= e!185526 (arrayBitRangesEq!0 (buf!6918 w1!584) (buf!6918 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))))))

(assert (= (and d!89642 res!221897) b!265540))

(assert (= (and b!265540 res!221896) b!265541))

(assert (= (and b!265541 (not res!221898)) b!265542))

(assert (=> b!265540 m!396079))

(assert (=> b!265540 m!396079))

(assert (=> b!265542 m!396079))

(assert (=> b!265542 m!396079))

(declare-fun m!396277 () Bool)

(assert (=> b!265542 m!396277))

(assert (=> b!265378 d!89642))

(declare-fun d!89644 () Bool)

(declare-fun res!221900 () Bool)

(declare-fun e!185527 () Bool)

(assert (=> d!89644 (=> (not res!221900) (not e!185527))))

(assert (=> d!89644 (= res!221900 (= (size!6450 (buf!6918 w2!580)) (size!6450 (buf!6918 w2!580))))))

(assert (=> d!89644 (= (isPrefixOf!0 w2!580 w2!580) e!185527)))

(declare-fun b!265543 () Bool)

(declare-fun res!221899 () Bool)

(assert (=> b!265543 (=> (not res!221899) (not e!185527))))

(assert (=> b!265543 (= res!221899 (bvsle (bitIndex!0 (size!6450 (buf!6918 w2!580)) (currentByte!12800 w2!580) (currentBit!12795 w2!580)) (bitIndex!0 (size!6450 (buf!6918 w2!580)) (currentByte!12800 w2!580) (currentBit!12795 w2!580))))))

(declare-fun b!265544 () Bool)

(declare-fun e!185528 () Bool)

(assert (=> b!265544 (= e!185527 e!185528)))

(declare-fun res!221901 () Bool)

(assert (=> b!265544 (=> res!221901 e!185528)))

(assert (=> b!265544 (= res!221901 (= (size!6450 (buf!6918 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!265545 () Bool)

(assert (=> b!265545 (= e!185528 (arrayBitRangesEq!0 (buf!6918 w2!580) (buf!6918 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w2!580)) (currentByte!12800 w2!580) (currentBit!12795 w2!580))))))

(assert (= (and d!89644 res!221900) b!265543))

(assert (= (and b!265543 res!221899) b!265544))

(assert (= (and b!265544 (not res!221901)) b!265545))

(declare-fun m!396279 () Bool)

(assert (=> b!265543 m!396279))

(assert (=> b!265543 m!396279))

(assert (=> b!265545 m!396279))

(assert (=> b!265545 m!396279))

(declare-fun m!396281 () Bool)

(assert (=> b!265545 m!396281))

(assert (=> b!265378 d!89644))

(declare-fun lt!406576 () (_ BitVec 32))

(declare-fun lt!406577 () tuple4!370)

(declare-fun call!4138 () Bool)

(declare-fun bm!4135 () Bool)

(declare-fun c!12215 () Bool)

(declare-fun lt!406575 () (_ BitVec 32))

(assert (=> bm!4135 (= call!4138 (byteRangesEq!0 (select (arr!7437 (buf!6918 w2!580)) (_3!965 lt!406577)) (select (arr!7437 (buf!6918 w1!584)) (_3!965 lt!406577)) lt!406576 (ite c!12215 lt!406575 #b00000000000000000000000000001000)))))

(declare-fun b!265546 () Bool)

(declare-fun e!185531 () Bool)

(assert (=> b!265546 (= e!185531 call!4138)))

(declare-fun b!265547 () Bool)

(declare-fun e!185533 () Bool)

(assert (=> b!265547 (= e!185531 e!185533)))

(declare-fun res!221902 () Bool)

(assert (=> b!265547 (= res!221902 call!4138)))

(assert (=> b!265547 (=> (not res!221902) (not e!185533))))

(declare-fun e!185532 () Bool)

(declare-fun b!265548 () Bool)

(assert (=> b!265548 (= e!185532 (byteRangesEq!0 (select (arr!7437 (buf!6918 w2!580)) (_4!185 lt!406577)) (select (arr!7437 (buf!6918 w1!584)) (_4!185 lt!406577)) #b00000000000000000000000000000000 lt!406575))))

(declare-fun b!265549 () Bool)

(declare-fun e!185529 () Bool)

(assert (=> b!265549 (= e!185529 e!185531)))

(assert (=> b!265549 (= c!12215 (= (_3!965 lt!406577) (_4!185 lt!406577)))))

(declare-fun b!265551 () Bool)

(declare-fun res!221906 () Bool)

(assert (=> b!265551 (= res!221906 (= lt!406575 #b00000000000000000000000000000000))))

(assert (=> b!265551 (=> res!221906 e!185532)))

(assert (=> b!265551 (= e!185533 e!185532)))

(declare-fun e!185534 () Bool)

(declare-fun b!265552 () Bool)

(assert (=> b!265552 (= e!185534 (arrayRangesEq!1021 (buf!6918 w2!580) (buf!6918 w1!584) (_1!12165 lt!406577) (_2!12165 lt!406577)))))

(declare-fun d!89646 () Bool)

(declare-fun res!221903 () Bool)

(declare-fun e!185530 () Bool)

(assert (=> d!89646 (=> res!221903 e!185530)))

(assert (=> d!89646 (= res!221903 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))))))

(assert (=> d!89646 (= (arrayBitRangesEq!0 (buf!6918 w2!580) (buf!6918 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))) e!185530)))

(declare-fun b!265550 () Bool)

(assert (=> b!265550 (= e!185530 e!185529)))

(declare-fun res!221904 () Bool)

(assert (=> b!265550 (=> (not res!221904) (not e!185529))))

(assert (=> b!265550 (= res!221904 e!185534)))

(declare-fun res!221905 () Bool)

(assert (=> b!265550 (=> res!221905 e!185534)))

(assert (=> b!265550 (= res!221905 (bvsge (_1!12165 lt!406577) (_2!12165 lt!406577)))))

(assert (=> b!265550 (= lt!406575 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265550 (= lt!406576 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265550 (= lt!406577 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))))))

(assert (= (and d!89646 (not res!221903)) b!265550))

(assert (= (and b!265550 (not res!221905)) b!265552))

(assert (= (and b!265550 res!221904) b!265549))

(assert (= (and b!265549 c!12215) b!265546))

(assert (= (and b!265549 (not c!12215)) b!265547))

(assert (= (and b!265547 res!221902) b!265551))

(assert (= (and b!265551 (not res!221906)) b!265548))

(assert (= (or b!265546 b!265547) bm!4135))

(declare-fun m!396283 () Bool)

(assert (=> bm!4135 m!396283))

(declare-fun m!396285 () Bool)

(assert (=> bm!4135 m!396285))

(assert (=> bm!4135 m!396283))

(assert (=> bm!4135 m!396285))

(declare-fun m!396287 () Bool)

(assert (=> bm!4135 m!396287))

(declare-fun m!396289 () Bool)

(assert (=> b!265548 m!396289))

(declare-fun m!396291 () Bool)

(assert (=> b!265548 m!396291))

(assert (=> b!265548 m!396289))

(assert (=> b!265548 m!396291))

(declare-fun m!396293 () Bool)

(assert (=> b!265548 m!396293))

(declare-fun m!396295 () Bool)

(assert (=> b!265552 m!396295))

(assert (=> b!265550 m!396079))

(declare-fun m!396297 () Bool)

(assert (=> b!265550 m!396297))

(assert (=> b!265373 d!89646))

(assert (=> b!265373 d!89584))

(declare-fun d!89648 () Bool)

(declare-fun res!221908 () Bool)

(declare-fun e!185535 () Bool)

(assert (=> d!89648 (=> (not res!221908) (not e!185535))))

(assert (=> d!89648 (= res!221908 (= (size!6450 (buf!6918 lt!406452)) (size!6450 (buf!6918 w1!584))))))

(assert (=> d!89648 (= (isPrefixOf!0 lt!406452 w1!584) e!185535)))

(declare-fun b!265553 () Bool)

(declare-fun res!221907 () Bool)

(assert (=> b!265553 (=> (not res!221907) (not e!185535))))

(assert (=> b!265553 (= res!221907 (bvsle (bitIndex!0 (size!6450 (buf!6918 lt!406452)) (currentByte!12800 lt!406452) (currentBit!12795 lt!406452)) (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))))))

(declare-fun b!265554 () Bool)

(declare-fun e!185536 () Bool)

(assert (=> b!265554 (= e!185535 e!185536)))

(declare-fun res!221909 () Bool)

(assert (=> b!265554 (=> res!221909 e!185536)))

(assert (=> b!265554 (= res!221909 (= (size!6450 (buf!6918 lt!406452)) #b00000000000000000000000000000000))))

(declare-fun b!265555 () Bool)

(assert (=> b!265555 (= e!185536 (arrayBitRangesEq!0 (buf!6918 lt!406452) (buf!6918 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 lt!406452)) (currentByte!12800 lt!406452) (currentBit!12795 lt!406452))))))

(assert (= (and d!89648 res!221908) b!265553))

(assert (= (and b!265553 res!221907) b!265554))

(assert (= (and b!265554 (not res!221909)) b!265555))

(assert (=> b!265553 m!396271))

(assert (=> b!265553 m!396079))

(assert (=> b!265555 m!396271))

(assert (=> b!265555 m!396271))

(declare-fun m!396299 () Bool)

(assert (=> b!265555 m!396299))

(assert (=> b!265379 d!89648))

(declare-fun d!89650 () Bool)

(declare-fun res!221911 () Bool)

(declare-fun e!185537 () Bool)

(assert (=> d!89650 (=> (not res!221911) (not e!185537))))

(assert (=> d!89650 (= res!221911 (= (size!6450 (buf!6918 w1!584)) (size!6450 (buf!6918 w2!580))))))

(assert (=> d!89650 (= (isPrefixOf!0 w1!584 w2!580) e!185537)))

(declare-fun b!265556 () Bool)

(declare-fun res!221910 () Bool)

(assert (=> b!265556 (=> (not res!221910) (not e!185537))))

(assert (=> b!265556 (= res!221910 (bvsle (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584)) (bitIndex!0 (size!6450 (buf!6918 w2!580)) (currentByte!12800 w2!580) (currentBit!12795 w2!580))))))

(declare-fun b!265557 () Bool)

(declare-fun e!185538 () Bool)

(assert (=> b!265557 (= e!185537 e!185538)))

(declare-fun res!221912 () Bool)

(assert (=> b!265557 (=> res!221912 e!185538)))

(assert (=> b!265557 (= res!221912 (= (size!6450 (buf!6918 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265558 () Bool)

(assert (=> b!265558 (= e!185538 (arrayBitRangesEq!0 (buf!6918 w1!584) (buf!6918 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))))))

(assert (= (and d!89650 res!221911) b!265556))

(assert (= (and b!265556 res!221910) b!265557))

(assert (= (and b!265557 (not res!221912)) b!265558))

(assert (=> b!265556 m!396079))

(assert (=> b!265556 m!396279))

(assert (=> b!265558 m!396079))

(assert (=> b!265558 m!396079))

(assert (=> b!265558 m!396083))

(assert (=> start!57820 d!89650))

(declare-fun d!89652 () Bool)

(assert (=> d!89652 (= (inv!12 w1!584) (invariant!0 (currentBit!12795 w1!584) (currentByte!12800 w1!584) (size!6450 (buf!6918 w1!584))))))

(declare-fun bs!22750 () Bool)

(assert (= bs!22750 d!89652))

(assert (=> bs!22750 m!396161))

(assert (=> start!57820 d!89652))

(declare-fun d!89654 () Bool)

(assert (=> d!89654 (= (inv!12 w2!580) (invariant!0 (currentBit!12795 w2!580) (currentByte!12800 w2!580) (size!6450 (buf!6918 w2!580))))))

(declare-fun bs!22751 () Bool)

(assert (= bs!22751 d!89654))

(declare-fun m!396301 () Bool)

(assert (=> bs!22751 m!396301))

(assert (=> start!57820 d!89654))

(declare-fun bm!4136 () Bool)

(declare-fun call!4139 () Bool)

(declare-fun lt!406579 () (_ BitVec 32))

(declare-fun lt!406578 () (_ BitVec 32))

(declare-fun lt!406580 () tuple4!370)

(declare-fun c!12216 () Bool)

(assert (=> bm!4136 (= call!4139 (byteRangesEq!0 (select (arr!7437 (buf!6918 w1!584)) (_3!965 lt!406580)) (select (arr!7437 (buf!6918 w2!580)) (_3!965 lt!406580)) lt!406579 (ite c!12216 lt!406578 #b00000000000000000000000000001000)))))

(declare-fun b!265559 () Bool)

(declare-fun e!185541 () Bool)

(assert (=> b!265559 (= e!185541 call!4139)))

(declare-fun b!265560 () Bool)

(declare-fun e!185543 () Bool)

(assert (=> b!265560 (= e!185541 e!185543)))

(declare-fun res!221913 () Bool)

(assert (=> b!265560 (= res!221913 call!4139)))

(assert (=> b!265560 (=> (not res!221913) (not e!185543))))

(declare-fun b!265561 () Bool)

(declare-fun e!185542 () Bool)

(assert (=> b!265561 (= e!185542 (byteRangesEq!0 (select (arr!7437 (buf!6918 w1!584)) (_4!185 lt!406580)) (select (arr!7437 (buf!6918 w2!580)) (_4!185 lt!406580)) #b00000000000000000000000000000000 lt!406578))))

(declare-fun b!265562 () Bool)

(declare-fun e!185539 () Bool)

(assert (=> b!265562 (= e!185539 e!185541)))

(assert (=> b!265562 (= c!12216 (= (_3!965 lt!406580) (_4!185 lt!406580)))))

(declare-fun b!265564 () Bool)

(declare-fun res!221917 () Bool)

(assert (=> b!265564 (= res!221917 (= lt!406578 #b00000000000000000000000000000000))))

(assert (=> b!265564 (=> res!221917 e!185542)))

(assert (=> b!265564 (= e!185543 e!185542)))

(declare-fun e!185544 () Bool)

(declare-fun b!265565 () Bool)

(assert (=> b!265565 (= e!185544 (arrayRangesEq!1021 (buf!6918 w1!584) (buf!6918 w2!580) (_1!12165 lt!406580) (_2!12165 lt!406580)))))

(declare-fun d!89656 () Bool)

(declare-fun res!221914 () Bool)

(declare-fun e!185540 () Bool)

(assert (=> d!89656 (=> res!221914 e!185540)))

(assert (=> d!89656 (= res!221914 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))))))

(assert (=> d!89656 (= (arrayBitRangesEq!0 (buf!6918 w1!584) (buf!6918 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))) e!185540)))

(declare-fun b!265563 () Bool)

(assert (=> b!265563 (= e!185540 e!185539)))

(declare-fun res!221915 () Bool)

(assert (=> b!265563 (=> (not res!221915) (not e!185539))))

(assert (=> b!265563 (= res!221915 e!185544)))

(declare-fun res!221916 () Bool)

(assert (=> b!265563 (=> res!221916 e!185544)))

(assert (=> b!265563 (= res!221916 (bvsge (_1!12165 lt!406580) (_2!12165 lt!406580)))))

(assert (=> b!265563 (= lt!406578 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265563 (= lt!406579 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265563 (= lt!406580 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6450 (buf!6918 w1!584)) (currentByte!12800 w1!584) (currentBit!12795 w1!584))))))

(assert (= (and d!89656 (not res!221914)) b!265563))

(assert (= (and b!265563 (not res!221916)) b!265565))

(assert (= (and b!265563 res!221915) b!265562))

(assert (= (and b!265562 c!12216) b!265559))

(assert (= (and b!265562 (not c!12216)) b!265560))

(assert (= (and b!265560 res!221913) b!265564))

(assert (= (and b!265564 (not res!221917)) b!265561))

(assert (= (or b!265559 b!265560) bm!4136))

(declare-fun m!396303 () Bool)

(assert (=> bm!4136 m!396303))

(declare-fun m!396305 () Bool)

(assert (=> bm!4136 m!396305))

(assert (=> bm!4136 m!396303))

(assert (=> bm!4136 m!396305))

(declare-fun m!396307 () Bool)

(assert (=> bm!4136 m!396307))

(declare-fun m!396309 () Bool)

(assert (=> b!265561 m!396309))

(declare-fun m!396311 () Bool)

(assert (=> b!265561 m!396311))

(assert (=> b!265561 m!396309))

(assert (=> b!265561 m!396311))

(declare-fun m!396313 () Bool)

(assert (=> b!265561 m!396313))

(declare-fun m!396315 () Bool)

(assert (=> b!265565 m!396315))

(assert (=> b!265563 m!396079))

(assert (=> b!265563 m!396297))

(assert (=> b!265377 d!89656))

(assert (=> b!265377 d!89584))

(declare-fun d!89658 () Bool)

(assert (=> d!89658 (= (array_inv!6174 (buf!6918 w1!584)) (bvsge (size!6450 (buf!6918 w1!584)) #b00000000000000000000000000000000))))

