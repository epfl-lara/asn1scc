; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57416 () Bool)

(assert start!57416)

(declare-fun b!263197 () Bool)

(declare-fun e!183451 () Bool)

(declare-datatypes ((array!14692 0))(
  ( (array!14693 (arr!7400 (Array (_ BitVec 32) (_ BitVec 8))) (size!6413 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11640 0))(
  ( (BitStream!11641 (buf!6881 array!14692) (currentByte!12733 (_ BitVec 32)) (currentBit!12728 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11640)

(declare-fun w2!580 () BitStream!11640)

(declare-fun arrayBitRangesEq!0 (array!14692 array!14692 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263197 (= e!183451 (not (arrayBitRangesEq!0 (buf!6881 w1!584) (buf!6881 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584)))))))

(declare-fun b!263198 () Bool)

(declare-datatypes ((Unit!18770 0))(
  ( (Unit!18771) )
))
(declare-fun e!183448 () Unit!18770)

(declare-fun lt!404716 () Unit!18770)

(assert (=> b!263198 (= e!183448 lt!404716)))

(declare-fun lt!404718 () (_ BitVec 64))

(assert (=> b!263198 (= lt!404718 (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14692 array!14692 (_ BitVec 64) (_ BitVec 64)) Unit!18770)

(assert (=> b!263198 (= lt!404716 (arrayBitRangesEqSymmetric!0 (buf!6881 w1!584) (buf!6881 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404718))))

(assert (=> b!263198 (arrayBitRangesEq!0 (buf!6881 w2!580) (buf!6881 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404718)))

(declare-fun b!263200 () Bool)

(declare-fun Unit!18772 () Unit!18770)

(assert (=> b!263200 (= e!183448 Unit!18772)))

(declare-fun b!263201 () Bool)

(declare-fun e!183449 () Bool)

(declare-fun e!183452 () Bool)

(assert (=> b!263201 (= e!183449 e!183452)))

(declare-fun res!220194 () Bool)

(assert (=> b!263201 (=> res!220194 e!183452)))

(assert (=> b!263201 (= res!220194 (= (size!6413 (buf!6881 w1!584)) #b00000000000000000000000000000000))))

(declare-fun lt!404717 () Unit!18770)

(assert (=> b!263201 (= lt!404717 e!183448)))

(declare-fun c!12009 () Bool)

(assert (=> b!263201 (= c!12009 (not (= (size!6413 (buf!6881 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263202 () Bool)

(declare-fun e!183455 () Bool)

(declare-fun array_inv!6137 (array!14692) Bool)

(assert (=> b!263202 (= e!183455 (array_inv!6137 (buf!6881 w1!584)))))

(declare-fun b!263203 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263203 (= e!183452 (invariant!0 (currentBit!12728 w1!584) (currentByte!12733 w1!584) (size!6413 (buf!6881 w1!584))))))

(declare-fun b!263204 () Bool)

(declare-fun e!183450 () Bool)

(assert (=> b!263204 (= e!183450 (not e!183449))))

(declare-fun res!220195 () Bool)

(assert (=> b!263204 (=> res!220195 e!183449)))

(assert (=> b!263204 (= res!220195 e!183451)))

(declare-fun res!220193 () Bool)

(assert (=> b!263204 (=> (not res!220193) (not e!183451))))

(assert (=> b!263204 (= res!220193 (not (= (size!6413 (buf!6881 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11640 BitStream!11640) Bool)

(assert (=> b!263204 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404719 () Unit!18770)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11640) Unit!18770)

(assert (=> b!263204 (= lt!404719 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404714 () BitStream!11640)

(assert (=> b!263204 (isPrefixOf!0 lt!404714 lt!404714)))

(declare-fun lt!404720 () Unit!18770)

(assert (=> b!263204 (= lt!404720 (lemmaIsPrefixRefl!0 lt!404714))))

(assert (=> b!263204 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404715 () Unit!18770)

(assert (=> b!263204 (= lt!404715 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263204 (= lt!404714 (BitStream!11641 (buf!6881 w2!580) (currentByte!12733 w1!584) (currentBit!12728 w1!584)))))

(declare-fun res!220192 () Bool)

(assert (=> start!57416 (=> (not res!220192) (not e!183450))))

(assert (=> start!57416 (= res!220192 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57416 e!183450))

(declare-fun inv!12 (BitStream!11640) Bool)

(assert (=> start!57416 (and (inv!12 w1!584) e!183455)))

(declare-fun e!183454 () Bool)

(assert (=> start!57416 (and (inv!12 w2!580) e!183454)))

(declare-fun b!263199 () Bool)

(assert (=> b!263199 (= e!183454 (array_inv!6137 (buf!6881 w2!580)))))

(assert (= (and start!57416 res!220192) b!263204))

(assert (= (and b!263204 res!220193) b!263197))

(assert (= (and b!263204 (not res!220195)) b!263201))

(assert (= (and b!263201 c!12009) b!263198))

(assert (= (and b!263201 (not c!12009)) b!263200))

(assert (= (and b!263201 (not res!220194)) b!263203))

(assert (= start!57416 b!263202))

(assert (= start!57416 b!263199))

(declare-fun m!393463 () Bool)

(assert (=> b!263202 m!393463))

(declare-fun m!393465 () Bool)

(assert (=> b!263197 m!393465))

(assert (=> b!263197 m!393465))

(declare-fun m!393467 () Bool)

(assert (=> b!263197 m!393467))

(declare-fun m!393469 () Bool)

(assert (=> start!57416 m!393469))

(declare-fun m!393471 () Bool)

(assert (=> start!57416 m!393471))

(declare-fun m!393473 () Bool)

(assert (=> start!57416 m!393473))

(declare-fun m!393475 () Bool)

(assert (=> b!263204 m!393475))

(declare-fun m!393477 () Bool)

(assert (=> b!263204 m!393477))

(declare-fun m!393479 () Bool)

(assert (=> b!263204 m!393479))

(declare-fun m!393481 () Bool)

(assert (=> b!263204 m!393481))

(declare-fun m!393483 () Bool)

(assert (=> b!263204 m!393483))

(declare-fun m!393485 () Bool)

(assert (=> b!263204 m!393485))

(declare-fun m!393487 () Bool)

(assert (=> b!263199 m!393487))

(declare-fun m!393489 () Bool)

(assert (=> b!263203 m!393489))

(assert (=> b!263198 m!393465))

(declare-fun m!393491 () Bool)

(assert (=> b!263198 m!393491))

(declare-fun m!393493 () Bool)

(assert (=> b!263198 m!393493))

(check-sat (not start!57416) (not b!263198) (not b!263197) (not b!263203) (not b!263204) (not b!263199) (not b!263202))
(check-sat)
(get-model)

(declare-fun d!88804 () Bool)

(declare-fun res!220251 () Bool)

(declare-fun e!183529 () Bool)

(assert (=> d!88804 (=> res!220251 e!183529)))

(assert (=> d!88804 (= res!220251 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584))))))

(assert (=> d!88804 (= (arrayBitRangesEq!0 (buf!6881 w1!584) (buf!6881 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584))) e!183529)))

(declare-fun b!263282 () Bool)

(declare-fun e!183527 () Bool)

(declare-fun call!4040 () Bool)

(assert (=> b!263282 (= e!183527 call!4040)))

(declare-fun b!263283 () Bool)

(declare-fun res!220253 () Bool)

(declare-fun lt!404763 () (_ BitVec 32))

(assert (=> b!263283 (= res!220253 (= lt!404763 #b00000000000000000000000000000000))))

(declare-fun e!183526 () Bool)

(assert (=> b!263283 (=> res!220253 e!183526)))

(declare-fun e!183528 () Bool)

(assert (=> b!263283 (= e!183528 e!183526)))

(declare-fun e!183530 () Bool)

(declare-fun b!263284 () Bool)

(declare-datatypes ((tuple4!326 0))(
  ( (tuple4!327 (_1!12143 (_ BitVec 32)) (_2!12143 (_ BitVec 32)) (_3!943 (_ BitVec 32)) (_4!163 (_ BitVec 32))) )
))
(declare-fun lt!404762 () tuple4!326)

(declare-fun arrayRangesEq!998 (array!14692 array!14692 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263284 (= e!183530 (arrayRangesEq!998 (buf!6881 w1!584) (buf!6881 w2!580) (_1!12143 lt!404762) (_2!12143 lt!404762)))))

(declare-fun bm!4037 () Bool)

(declare-fun lt!404764 () (_ BitVec 32))

(declare-fun c!12018 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4037 (= call!4040 (byteRangesEq!0 (select (arr!7400 (buf!6881 w1!584)) (_3!943 lt!404762)) (select (arr!7400 (buf!6881 w2!580)) (_3!943 lt!404762)) lt!404764 (ite c!12018 lt!404763 #b00000000000000000000000000001000)))))

(declare-fun b!263285 () Bool)

(assert (=> b!263285 (= e!183527 e!183528)))

(declare-fun res!220254 () Bool)

(assert (=> b!263285 (= res!220254 call!4040)))

(assert (=> b!263285 (=> (not res!220254) (not e!183528))))

(declare-fun b!263286 () Bool)

(declare-fun e!183531 () Bool)

(assert (=> b!263286 (= e!183529 e!183531)))

(declare-fun res!220252 () Bool)

(assert (=> b!263286 (=> (not res!220252) (not e!183531))))

(assert (=> b!263286 (= res!220252 e!183530)))

(declare-fun res!220255 () Bool)

(assert (=> b!263286 (=> res!220255 e!183530)))

(assert (=> b!263286 (= res!220255 (bvsge (_1!12143 lt!404762) (_2!12143 lt!404762)))))

(assert (=> b!263286 (= lt!404763 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263286 (= lt!404764 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!326)

(assert (=> b!263286 (= lt!404762 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584))))))

(declare-fun b!263287 () Bool)

(assert (=> b!263287 (= e!183531 e!183527)))

(assert (=> b!263287 (= c!12018 (= (_3!943 lt!404762) (_4!163 lt!404762)))))

(declare-fun b!263288 () Bool)

(assert (=> b!263288 (= e!183526 (byteRangesEq!0 (select (arr!7400 (buf!6881 w1!584)) (_4!163 lt!404762)) (select (arr!7400 (buf!6881 w2!580)) (_4!163 lt!404762)) #b00000000000000000000000000000000 lt!404763))))

(assert (= (and d!88804 (not res!220251)) b!263286))

(assert (= (and b!263286 (not res!220255)) b!263284))

(assert (= (and b!263286 res!220252) b!263287))

(assert (= (and b!263287 c!12018) b!263282))

(assert (= (and b!263287 (not c!12018)) b!263285))

(assert (= (and b!263285 res!220254) b!263283))

(assert (= (and b!263283 (not res!220253)) b!263288))

(assert (= (or b!263282 b!263285) bm!4037))

(declare-fun m!393561 () Bool)

(assert (=> b!263284 m!393561))

(declare-fun m!393563 () Bool)

(assert (=> bm!4037 m!393563))

(declare-fun m!393565 () Bool)

(assert (=> bm!4037 m!393565))

(assert (=> bm!4037 m!393563))

(assert (=> bm!4037 m!393565))

(declare-fun m!393567 () Bool)

(assert (=> bm!4037 m!393567))

(assert (=> b!263286 m!393465))

(declare-fun m!393569 () Bool)

(assert (=> b!263286 m!393569))

(declare-fun m!393571 () Bool)

(assert (=> b!263288 m!393571))

(declare-fun m!393573 () Bool)

(assert (=> b!263288 m!393573))

(assert (=> b!263288 m!393571))

(assert (=> b!263288 m!393573))

(declare-fun m!393575 () Bool)

(assert (=> b!263288 m!393575))

(assert (=> b!263197 d!88804))

(declare-fun d!88826 () Bool)

(declare-fun e!183555 () Bool)

(assert (=> d!88826 e!183555))

(declare-fun res!220281 () Bool)

(assert (=> d!88826 (=> (not res!220281) (not e!183555))))

(declare-fun lt!404811 () (_ BitVec 64))

(declare-fun lt!404812 () (_ BitVec 64))

(declare-fun lt!404810 () (_ BitVec 64))

(assert (=> d!88826 (= res!220281 (= lt!404811 (bvsub lt!404812 lt!404810)))))

(assert (=> d!88826 (or (= (bvand lt!404812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404810 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404812 lt!404810) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88826 (= lt!404810 (remainingBits!0 ((_ sign_extend 32) (size!6413 (buf!6881 w1!584))) ((_ sign_extend 32) (currentByte!12733 w1!584)) ((_ sign_extend 32) (currentBit!12728 w1!584))))))

(declare-fun lt!404807 () (_ BitVec 64))

(declare-fun lt!404808 () (_ BitVec 64))

(assert (=> d!88826 (= lt!404812 (bvmul lt!404807 lt!404808))))

(assert (=> d!88826 (or (= lt!404807 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404808 (bvsdiv (bvmul lt!404807 lt!404808) lt!404807)))))

(assert (=> d!88826 (= lt!404808 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88826 (= lt!404807 ((_ sign_extend 32) (size!6413 (buf!6881 w1!584))))))

(assert (=> d!88826 (= lt!404811 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12733 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12728 w1!584))))))

(assert (=> d!88826 (invariant!0 (currentBit!12728 w1!584) (currentByte!12733 w1!584) (size!6413 (buf!6881 w1!584)))))

(assert (=> d!88826 (= (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584)) lt!404811)))

(declare-fun b!263320 () Bool)

(declare-fun res!220282 () Bool)

(assert (=> b!263320 (=> (not res!220282) (not e!183555))))

(assert (=> b!263320 (= res!220282 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404811))))

(declare-fun b!263321 () Bool)

(declare-fun lt!404809 () (_ BitVec 64))

(assert (=> b!263321 (= e!183555 (bvsle lt!404811 (bvmul lt!404809 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263321 (or (= lt!404809 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404809 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404809)))))

(assert (=> b!263321 (= lt!404809 ((_ sign_extend 32) (size!6413 (buf!6881 w1!584))))))

(assert (= (and d!88826 res!220281) b!263320))

(assert (= (and b!263320 res!220282) b!263321))

(declare-fun m!393597 () Bool)

(assert (=> d!88826 m!393597))

(assert (=> d!88826 m!393489))

(assert (=> b!263197 d!88826))

(declare-fun d!88834 () Bool)

(declare-fun res!220300 () Bool)

(declare-fun e!183567 () Bool)

(assert (=> d!88834 (=> (not res!220300) (not e!183567))))

(assert (=> d!88834 (= res!220300 (= (size!6413 (buf!6881 w1!584)) (size!6413 (buf!6881 w2!580))))))

(assert (=> d!88834 (= (isPrefixOf!0 w1!584 w2!580) e!183567)))

(declare-fun b!263337 () Bool)

(declare-fun res!220298 () Bool)

(assert (=> b!263337 (=> (not res!220298) (not e!183567))))

(assert (=> b!263337 (= res!220298 (bvsle (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584)) (bitIndex!0 (size!6413 (buf!6881 w2!580)) (currentByte!12733 w2!580) (currentBit!12728 w2!580))))))

(declare-fun b!263338 () Bool)

(declare-fun e!183566 () Bool)

(assert (=> b!263338 (= e!183567 e!183566)))

(declare-fun res!220299 () Bool)

(assert (=> b!263338 (=> res!220299 e!183566)))

(assert (=> b!263338 (= res!220299 (= (size!6413 (buf!6881 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263339 () Bool)

(assert (=> b!263339 (= e!183566 (arrayBitRangesEq!0 (buf!6881 w1!584) (buf!6881 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584))))))

(assert (= (and d!88834 res!220300) b!263337))

(assert (= (and b!263337 res!220298) b!263338))

(assert (= (and b!263338 (not res!220299)) b!263339))

(assert (=> b!263337 m!393465))

(declare-fun m!393607 () Bool)

(assert (=> b!263337 m!393607))

(assert (=> b!263339 m!393465))

(assert (=> b!263339 m!393465))

(assert (=> b!263339 m!393467))

(assert (=> start!57416 d!88834))

(declare-fun d!88842 () Bool)

(assert (=> d!88842 (= (inv!12 w1!584) (invariant!0 (currentBit!12728 w1!584) (currentByte!12733 w1!584) (size!6413 (buf!6881 w1!584))))))

(declare-fun bs!22543 () Bool)

(assert (= bs!22543 d!88842))

(assert (=> bs!22543 m!393489))

(assert (=> start!57416 d!88842))

(declare-fun d!88846 () Bool)

(assert (=> d!88846 (= (inv!12 w2!580) (invariant!0 (currentBit!12728 w2!580) (currentByte!12733 w2!580) (size!6413 (buf!6881 w2!580))))))

(declare-fun bs!22544 () Bool)

(assert (= bs!22544 d!88846))

(declare-fun m!393615 () Bool)

(assert (=> bs!22544 m!393615))

(assert (=> start!57416 d!88846))

(declare-fun d!88850 () Bool)

(assert (=> d!88850 (= (array_inv!6137 (buf!6881 w1!584)) (bvsge (size!6413 (buf!6881 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!263202 d!88850))

(declare-fun d!88852 () Bool)

(assert (=> d!88852 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404817 () Unit!18770)

(declare-fun choose!11 (BitStream!11640) Unit!18770)

(assert (=> d!88852 (= lt!404817 (choose!11 w2!580))))

(assert (=> d!88852 (= (lemmaIsPrefixRefl!0 w2!580) lt!404817)))

(declare-fun bs!22546 () Bool)

(assert (= bs!22546 d!88852))

(assert (=> bs!22546 m!393479))

(declare-fun m!393617 () Bool)

(assert (=> bs!22546 m!393617))

(assert (=> b!263204 d!88852))

(declare-fun d!88858 () Bool)

(assert (=> d!88858 (isPrefixOf!0 lt!404714 lt!404714)))

(declare-fun lt!404818 () Unit!18770)

(assert (=> d!88858 (= lt!404818 (choose!11 lt!404714))))

(assert (=> d!88858 (= (lemmaIsPrefixRefl!0 lt!404714) lt!404818)))

(declare-fun bs!22547 () Bool)

(assert (= bs!22547 d!88858))

(assert (=> bs!22547 m!393483))

(declare-fun m!393619 () Bool)

(assert (=> bs!22547 m!393619))

(assert (=> b!263204 d!88858))

(declare-fun d!88862 () Bool)

(assert (=> d!88862 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404819 () Unit!18770)

(assert (=> d!88862 (= lt!404819 (choose!11 w1!584))))

(assert (=> d!88862 (= (lemmaIsPrefixRefl!0 w1!584) lt!404819)))

(declare-fun bs!22548 () Bool)

(assert (= bs!22548 d!88862))

(assert (=> bs!22548 m!393477))

(declare-fun m!393621 () Bool)

(assert (=> bs!22548 m!393621))

(assert (=> b!263204 d!88862))

(declare-fun d!88864 () Bool)

(declare-fun res!220312 () Bool)

(declare-fun e!183575 () Bool)

(assert (=> d!88864 (=> (not res!220312) (not e!183575))))

(assert (=> d!88864 (= res!220312 (= (size!6413 (buf!6881 lt!404714)) (size!6413 (buf!6881 lt!404714))))))

(assert (=> d!88864 (= (isPrefixOf!0 lt!404714 lt!404714) e!183575)))

(declare-fun b!263349 () Bool)

(declare-fun res!220310 () Bool)

(assert (=> b!263349 (=> (not res!220310) (not e!183575))))

(assert (=> b!263349 (= res!220310 (bvsle (bitIndex!0 (size!6413 (buf!6881 lt!404714)) (currentByte!12733 lt!404714) (currentBit!12728 lt!404714)) (bitIndex!0 (size!6413 (buf!6881 lt!404714)) (currentByte!12733 lt!404714) (currentBit!12728 lt!404714))))))

(declare-fun b!263350 () Bool)

(declare-fun e!183574 () Bool)

(assert (=> b!263350 (= e!183575 e!183574)))

(declare-fun res!220311 () Bool)

(assert (=> b!263350 (=> res!220311 e!183574)))

(assert (=> b!263350 (= res!220311 (= (size!6413 (buf!6881 lt!404714)) #b00000000000000000000000000000000))))

(declare-fun b!263351 () Bool)

(assert (=> b!263351 (= e!183574 (arrayBitRangesEq!0 (buf!6881 lt!404714) (buf!6881 lt!404714) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6413 (buf!6881 lt!404714)) (currentByte!12733 lt!404714) (currentBit!12728 lt!404714))))))

(assert (= (and d!88864 res!220312) b!263349))

(assert (= (and b!263349 res!220310) b!263350))

(assert (= (and b!263350 (not res!220311)) b!263351))

(declare-fun m!393623 () Bool)

(assert (=> b!263349 m!393623))

(assert (=> b!263349 m!393623))

(assert (=> b!263351 m!393623))

(assert (=> b!263351 m!393623))

(declare-fun m!393625 () Bool)

(assert (=> b!263351 m!393625))

(assert (=> b!263204 d!88864))

(declare-fun d!88866 () Bool)

(declare-fun res!220315 () Bool)

(declare-fun e!183577 () Bool)

(assert (=> d!88866 (=> (not res!220315) (not e!183577))))

(assert (=> d!88866 (= res!220315 (= (size!6413 (buf!6881 w1!584)) (size!6413 (buf!6881 w1!584))))))

(assert (=> d!88866 (= (isPrefixOf!0 w1!584 w1!584) e!183577)))

(declare-fun b!263352 () Bool)

(declare-fun res!220313 () Bool)

(assert (=> b!263352 (=> (not res!220313) (not e!183577))))

(assert (=> b!263352 (= res!220313 (bvsle (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584)) (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584))))))

(declare-fun b!263353 () Bool)

(declare-fun e!183576 () Bool)

(assert (=> b!263353 (= e!183577 e!183576)))

(declare-fun res!220314 () Bool)

(assert (=> b!263353 (=> res!220314 e!183576)))

(assert (=> b!263353 (= res!220314 (= (size!6413 (buf!6881 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263354 () Bool)

(assert (=> b!263354 (= e!183576 (arrayBitRangesEq!0 (buf!6881 w1!584) (buf!6881 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6413 (buf!6881 w1!584)) (currentByte!12733 w1!584) (currentBit!12728 w1!584))))))

(assert (= (and d!88866 res!220315) b!263352))

(assert (= (and b!263352 res!220313) b!263353))

(assert (= (and b!263353 (not res!220314)) b!263354))

(assert (=> b!263352 m!393465))

(assert (=> b!263352 m!393465))

(assert (=> b!263354 m!393465))

(assert (=> b!263354 m!393465))

(declare-fun m!393629 () Bool)

(assert (=> b!263354 m!393629))

(assert (=> b!263204 d!88866))

(declare-fun d!88874 () Bool)

(declare-fun res!220320 () Bool)

(declare-fun e!183581 () Bool)

(assert (=> d!88874 (=> (not res!220320) (not e!183581))))

(assert (=> d!88874 (= res!220320 (= (size!6413 (buf!6881 w2!580)) (size!6413 (buf!6881 w2!580))))))

(assert (=> d!88874 (= (isPrefixOf!0 w2!580 w2!580) e!183581)))

(declare-fun b!263355 () Bool)

(declare-fun res!220318 () Bool)

(assert (=> b!263355 (=> (not res!220318) (not e!183581))))

(assert (=> b!263355 (= res!220318 (bvsle (bitIndex!0 (size!6413 (buf!6881 w2!580)) (currentByte!12733 w2!580) (currentBit!12728 w2!580)) (bitIndex!0 (size!6413 (buf!6881 w2!580)) (currentByte!12733 w2!580) (currentBit!12728 w2!580))))))

(declare-fun b!263356 () Bool)

(declare-fun e!183580 () Bool)

(assert (=> b!263356 (= e!183581 e!183580)))

(declare-fun res!220319 () Bool)

(assert (=> b!263356 (=> res!220319 e!183580)))

(assert (=> b!263356 (= res!220319 (= (size!6413 (buf!6881 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!263357 () Bool)

(assert (=> b!263357 (= e!183580 (arrayBitRangesEq!0 (buf!6881 w2!580) (buf!6881 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6413 (buf!6881 w2!580)) (currentByte!12733 w2!580) (currentBit!12728 w2!580))))))

(assert (= (and d!88874 res!220320) b!263355))

(assert (= (and b!263355 res!220318) b!263356))

(assert (= (and b!263356 (not res!220319)) b!263357))

(assert (=> b!263355 m!393607))

(assert (=> b!263355 m!393607))

(assert (=> b!263357 m!393607))

(assert (=> b!263357 m!393607))

(declare-fun m!393631 () Bool)

(assert (=> b!263357 m!393631))

(assert (=> b!263204 d!88874))

(declare-fun d!88876 () Bool)

(assert (=> d!88876 (= (invariant!0 (currentBit!12728 w1!584) (currentByte!12733 w1!584) (size!6413 (buf!6881 w1!584))) (and (bvsge (currentBit!12728 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12728 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12733 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12733 w1!584) (size!6413 (buf!6881 w1!584))) (and (= (currentBit!12728 w1!584) #b00000000000000000000000000000000) (= (currentByte!12733 w1!584) (size!6413 (buf!6881 w1!584)))))))))

(assert (=> b!263203 d!88876))

(assert (=> b!263198 d!88826))

(declare-fun d!88878 () Bool)

(assert (=> d!88878 (arrayBitRangesEq!0 (buf!6881 w2!580) (buf!6881 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404718)))

(declare-fun lt!404846 () Unit!18770)

(declare-fun choose!8 (array!14692 array!14692 (_ BitVec 64) (_ BitVec 64)) Unit!18770)

(assert (=> d!88878 (= lt!404846 (choose!8 (buf!6881 w1!584) (buf!6881 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404718))))

(assert (=> d!88878 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404718))))

(assert (=> d!88878 (= (arrayBitRangesEqSymmetric!0 (buf!6881 w1!584) (buf!6881 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404718) lt!404846)))

(declare-fun bs!22552 () Bool)

(assert (= bs!22552 d!88878))

(assert (=> bs!22552 m!393493))

(declare-fun m!393653 () Bool)

(assert (=> bs!22552 m!393653))

(assert (=> b!263198 d!88878))

(declare-fun d!88886 () Bool)

(declare-fun res!220330 () Bool)

(declare-fun e!183592 () Bool)

(assert (=> d!88886 (=> res!220330 e!183592)))

(assert (=> d!88886 (= res!220330 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!404718))))

(assert (=> d!88886 (= (arrayBitRangesEq!0 (buf!6881 w2!580) (buf!6881 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404718) e!183592)))

(declare-fun b!263371 () Bool)

(declare-fun e!183590 () Bool)

(declare-fun call!4045 () Bool)

(assert (=> b!263371 (= e!183590 call!4045)))

(declare-fun b!263372 () Bool)

(declare-fun res!220332 () Bool)

(declare-fun lt!404848 () (_ BitVec 32))

(assert (=> b!263372 (= res!220332 (= lt!404848 #b00000000000000000000000000000000))))

(declare-fun e!183589 () Bool)

(assert (=> b!263372 (=> res!220332 e!183589)))

(declare-fun e!183591 () Bool)

(assert (=> b!263372 (= e!183591 e!183589)))

(declare-fun e!183593 () Bool)

(declare-fun lt!404847 () tuple4!326)

(declare-fun b!263373 () Bool)

(assert (=> b!263373 (= e!183593 (arrayRangesEq!998 (buf!6881 w2!580) (buf!6881 w1!584) (_1!12143 lt!404847) (_2!12143 lt!404847)))))

(declare-fun lt!404849 () (_ BitVec 32))

(declare-fun bm!4042 () Bool)

(declare-fun c!12023 () Bool)

(assert (=> bm!4042 (= call!4045 (byteRangesEq!0 (select (arr!7400 (buf!6881 w2!580)) (_3!943 lt!404847)) (select (arr!7400 (buf!6881 w1!584)) (_3!943 lt!404847)) lt!404849 (ite c!12023 lt!404848 #b00000000000000000000000000001000)))))

(declare-fun b!263374 () Bool)

(assert (=> b!263374 (= e!183590 e!183591)))

(declare-fun res!220333 () Bool)

(assert (=> b!263374 (= res!220333 call!4045)))

(assert (=> b!263374 (=> (not res!220333) (not e!183591))))

(declare-fun b!263375 () Bool)

(declare-fun e!183594 () Bool)

(assert (=> b!263375 (= e!183592 e!183594)))

(declare-fun res!220331 () Bool)

(assert (=> b!263375 (=> (not res!220331) (not e!183594))))

(assert (=> b!263375 (= res!220331 e!183593)))

(declare-fun res!220334 () Bool)

(assert (=> b!263375 (=> res!220334 e!183593)))

(assert (=> b!263375 (= res!220334 (bvsge (_1!12143 lt!404847) (_2!12143 lt!404847)))))

(assert (=> b!263375 (= lt!404848 ((_ extract 31 0) (bvsrem lt!404718 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263375 (= lt!404849 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263375 (= lt!404847 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!404718))))

(declare-fun b!263376 () Bool)

(assert (=> b!263376 (= e!183594 e!183590)))

(assert (=> b!263376 (= c!12023 (= (_3!943 lt!404847) (_4!163 lt!404847)))))

(declare-fun b!263377 () Bool)

(assert (=> b!263377 (= e!183589 (byteRangesEq!0 (select (arr!7400 (buf!6881 w2!580)) (_4!163 lt!404847)) (select (arr!7400 (buf!6881 w1!584)) (_4!163 lt!404847)) #b00000000000000000000000000000000 lt!404848))))

(assert (= (and d!88886 (not res!220330)) b!263375))

(assert (= (and b!263375 (not res!220334)) b!263373))

(assert (= (and b!263375 res!220331) b!263376))

(assert (= (and b!263376 c!12023) b!263371))

(assert (= (and b!263376 (not c!12023)) b!263374))

(assert (= (and b!263374 res!220333) b!263372))

(assert (= (and b!263372 (not res!220332)) b!263377))

(assert (= (or b!263371 b!263374) bm!4042))

(declare-fun m!393655 () Bool)

(assert (=> b!263373 m!393655))

(declare-fun m!393657 () Bool)

(assert (=> bm!4042 m!393657))

(declare-fun m!393659 () Bool)

(assert (=> bm!4042 m!393659))

(assert (=> bm!4042 m!393657))

(assert (=> bm!4042 m!393659))

(declare-fun m!393663 () Bool)

(assert (=> bm!4042 m!393663))

(declare-fun m!393665 () Bool)

(assert (=> b!263375 m!393665))

(declare-fun m!393667 () Bool)

(assert (=> b!263377 m!393667))

(declare-fun m!393669 () Bool)

(assert (=> b!263377 m!393669))

(assert (=> b!263377 m!393667))

(assert (=> b!263377 m!393669))

(declare-fun m!393671 () Bool)

(assert (=> b!263377 m!393671))

(assert (=> b!263198 d!88886))

(declare-fun d!88890 () Bool)

(assert (=> d!88890 (= (array_inv!6137 (buf!6881 w2!580)) (bvsge (size!6413 (buf!6881 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!263199 d!88890))

(check-sat (not b!263337) (not d!88842) (not b!263288) (not b!263286) (not b!263355) (not b!263357) (not b!263351) (not d!88878) (not b!263339) (not bm!4042) (not d!88826) (not b!263373) (not d!88852) (not b!263377) (not b!263349) (not bm!4037) (not b!263352) (not d!88862) (not b!263375) (not d!88846) (not d!88858) (not b!263284) (not b!263354))
