; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61530 () Bool)

(assert start!61530)

(declare-fun b!276482 () Bool)

(declare-fun e!196426 () Bool)

(declare-fun lt!414633 () (_ BitVec 64))

(declare-datatypes ((array!15822 0))(
  ( (array!15823 (arr!7844 (Array (_ BitVec 32) (_ BitVec 8))) (size!6851 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12516 0))(
  ( (BitStream!12517 (buf!7319 array!15822) (currentByte!13539 (_ BitVec 32)) (currentBit!13534 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12516)

(assert (=> b!276482 (= e!196426 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414633) (bvsle lt!414633 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6851 (buf!7319 bs1!11))))))))))

(declare-datatypes ((tuple2!22544 0))(
  ( (tuple2!22545 (_1!12316 BitStream!12516) (_2!12316 Bool)) )
))
(declare-fun lt!414631 () tuple2!22544)

(declare-fun bs2!19 () BitStream!12516)

(declare-fun readBitPure!0 (BitStream!12516) tuple2!22544)

(assert (=> b!276482 (= lt!414631 (readBitPure!0 (BitStream!12517 (buf!7319 bs2!19) (currentByte!13539 bs1!11) (currentBit!13534 bs1!11))))))

(declare-fun lt!414632 () tuple2!22544)

(assert (=> b!276482 (= lt!414632 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276482 (invariant!0 (currentBit!13534 bs1!11) (currentByte!13539 bs1!11) (size!6851 (buf!7319 bs2!19)))))

(declare-fun b!276483 () Bool)

(declare-fun e!196423 () Bool)

(declare-fun array_inv!6575 (array!15822) Bool)

(assert (=> b!276483 (= e!196423 (array_inv!6575 (buf!7319 bs1!11)))))

(declare-fun b!276484 () Bool)

(declare-fun e!196425 () Bool)

(assert (=> b!276484 (= e!196425 e!196426)))

(declare-fun res!229717 () Bool)

(assert (=> b!276484 (=> (not res!229717) (not e!196426))))

(declare-fun arrayBitRangesEq!0 (array!15822 array!15822 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276484 (= res!229717 (arrayBitRangesEq!0 (buf!7319 bs1!11) (buf!7319 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414633))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276484 (= lt!414633 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6851 (buf!7319 bs1!11)) (currentByte!13539 bs1!11) (currentBit!13534 bs1!11))))))

(declare-fun res!229716 () Bool)

(assert (=> start!61530 (=> (not res!229716) (not e!196425))))

(assert (=> start!61530 (= res!229716 (= (size!6851 (buf!7319 bs1!11)) (size!6851 (buf!7319 bs2!19))))))

(assert (=> start!61530 e!196425))

(declare-fun inv!12 (BitStream!12516) Bool)

(assert (=> start!61530 (and (inv!12 bs1!11) e!196423)))

(declare-fun e!196422 () Bool)

(assert (=> start!61530 (and (inv!12 bs2!19) e!196422)))

(declare-fun b!276485 () Bool)

(assert (=> b!276485 (= e!196422 (array_inv!6575 (buf!7319 bs2!19)))))

(declare-fun b!276486 () Bool)

(declare-fun res!229715 () Bool)

(assert (=> b!276486 (=> (not res!229715) (not e!196425))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276486 (= res!229715 (validate_offset_bit!0 ((_ sign_extend 32) (size!6851 (buf!7319 bs1!11))) ((_ sign_extend 32) (currentByte!13539 bs1!11)) ((_ sign_extend 32) (currentBit!13534 bs1!11))))))

(assert (= (and start!61530 res!229716) b!276486))

(assert (= (and b!276486 res!229715) b!276484))

(assert (= (and b!276484 res!229717) b!276482))

(assert (= start!61530 b!276483))

(assert (= start!61530 b!276485))

(declare-fun m!409507 () Bool)

(assert (=> start!61530 m!409507))

(declare-fun m!409509 () Bool)

(assert (=> start!61530 m!409509))

(declare-fun m!409511 () Bool)

(assert (=> b!276482 m!409511))

(declare-fun m!409513 () Bool)

(assert (=> b!276482 m!409513))

(declare-fun m!409515 () Bool)

(assert (=> b!276482 m!409515))

(declare-fun m!409517 () Bool)

(assert (=> b!276484 m!409517))

(declare-fun m!409519 () Bool)

(assert (=> b!276484 m!409519))

(declare-fun m!409521 () Bool)

(assert (=> b!276483 m!409521))

(declare-fun m!409523 () Bool)

(assert (=> b!276485 m!409523))

(declare-fun m!409525 () Bool)

(assert (=> b!276486 m!409525))

(check-sat (not start!61530) (not b!276484) (not b!276486) (not b!276482) (not b!276485) (not b!276483))
(check-sat)
(get-model)

(declare-fun d!95234 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95234 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6851 (buf!7319 bs1!11))) ((_ sign_extend 32) (currentByte!13539 bs1!11)) ((_ sign_extend 32) (currentBit!13534 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6851 (buf!7319 bs1!11))) ((_ sign_extend 32) (currentByte!13539 bs1!11)) ((_ sign_extend 32) (currentBit!13534 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24018 () Bool)

(assert (= bs!24018 d!95234))

(declare-fun m!409559 () Bool)

(assert (=> bs!24018 m!409559))

(assert (=> b!276486 d!95234))

(declare-fun d!95236 () Bool)

(assert (=> d!95236 (= (array_inv!6575 (buf!7319 bs2!19)) (bvsge (size!6851 (buf!7319 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276485 d!95236))

(declare-fun b!276570 () Bool)

(declare-fun res!229782 () Bool)

(declare-fun lt!414709 () (_ BitVec 32))

(assert (=> b!276570 (= res!229782 (= lt!414709 #b00000000000000000000000000000000))))

(declare-fun e!196505 () Bool)

(assert (=> b!276570 (=> res!229782 e!196505)))

(declare-fun e!196504 () Bool)

(assert (=> b!276570 (= e!196504 e!196505)))

(declare-fun bm!4451 () Bool)

(declare-fun lt!414708 () (_ BitVec 32))

(declare-fun call!4454 () Bool)

(declare-fun c!12639 () Bool)

(declare-datatypes ((tuple4!532 0))(
  ( (tuple4!533 (_1!12321 (_ BitVec 32)) (_2!12321 (_ BitVec 32)) (_3!1046 (_ BitVec 32)) (_4!266 (_ BitVec 32))) )
))
(declare-fun lt!414706 () tuple4!532)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4451 (= call!4454 (byteRangesEq!0 (select (arr!7844 (buf!7319 bs1!11)) (_3!1046 lt!414706)) (select (arr!7844 (buf!7319 bs2!19)) (_3!1046 lt!414706)) lt!414708 (ite c!12639 lt!414709 #b00000000000000000000000000001000)))))

(declare-fun b!276571 () Bool)

(declare-fun e!196503 () Bool)

(declare-fun e!196500 () Bool)

(assert (=> b!276571 (= e!196503 e!196500)))

(assert (=> b!276571 (= c!12639 (= (_3!1046 lt!414706) (_4!266 lt!414706)))))

(declare-fun b!276572 () Bool)

(assert (=> b!276572 (= e!196500 e!196504)))

(declare-fun res!229781 () Bool)

(assert (=> b!276572 (= res!229781 call!4454)))

(assert (=> b!276572 (=> (not res!229781) (not e!196504))))

(declare-fun d!95238 () Bool)

(declare-fun res!229783 () Bool)

(declare-fun e!196501 () Bool)

(assert (=> d!95238 (=> res!229783 e!196501)))

(assert (=> d!95238 (= res!229783 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414633))))

(assert (=> d!95238 (= (arrayBitRangesEq!0 (buf!7319 bs1!11) (buf!7319 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414633) e!196501)))

(declare-fun b!276573 () Bool)

(assert (=> b!276573 (= e!196501 e!196503)))

(declare-fun res!229779 () Bool)

(assert (=> b!276573 (=> (not res!229779) (not e!196503))))

(declare-fun e!196502 () Bool)

(assert (=> b!276573 (= res!229779 e!196502)))

(declare-fun res!229780 () Bool)

(assert (=> b!276573 (=> res!229780 e!196502)))

(assert (=> b!276573 (= res!229780 (bvsge (_1!12321 lt!414706) (_2!12321 lt!414706)))))

(assert (=> b!276573 (= lt!414709 ((_ extract 31 0) (bvsrem lt!414633 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276573 (= lt!414708 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!532)

(assert (=> b!276573 (= lt!414706 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414633))))

(declare-fun b!276574 () Bool)

(assert (=> b!276574 (= e!196500 call!4454)))

(declare-fun b!276575 () Bool)

(assert (=> b!276575 (= e!196505 (byteRangesEq!0 (select (arr!7844 (buf!7319 bs1!11)) (_4!266 lt!414706)) (select (arr!7844 (buf!7319 bs2!19)) (_4!266 lt!414706)) #b00000000000000000000000000000000 lt!414709))))

(declare-fun b!276576 () Bool)

(declare-fun arrayRangesEq!1159 (array!15822 array!15822 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276576 (= e!196502 (arrayRangesEq!1159 (buf!7319 bs1!11) (buf!7319 bs2!19) (_1!12321 lt!414706) (_2!12321 lt!414706)))))

(assert (= (and d!95238 (not res!229783)) b!276573))

(assert (= (and b!276573 (not res!229780)) b!276576))

(assert (= (and b!276573 res!229779) b!276571))

(assert (= (and b!276571 c!12639) b!276574))

(assert (= (and b!276571 (not c!12639)) b!276572))

(assert (= (and b!276572 res!229781) b!276570))

(assert (= (and b!276570 (not res!229782)) b!276575))

(assert (= (or b!276574 b!276572) bm!4451))

(declare-fun m!409595 () Bool)

(assert (=> bm!4451 m!409595))

(declare-fun m!409597 () Bool)

(assert (=> bm!4451 m!409597))

(assert (=> bm!4451 m!409595))

(assert (=> bm!4451 m!409597))

(declare-fun m!409599 () Bool)

(assert (=> bm!4451 m!409599))

(declare-fun m!409601 () Bool)

(assert (=> b!276573 m!409601))

(declare-fun m!409603 () Bool)

(assert (=> b!276575 m!409603))

(declare-fun m!409605 () Bool)

(assert (=> b!276575 m!409605))

(assert (=> b!276575 m!409603))

(assert (=> b!276575 m!409605))

(declare-fun m!409607 () Bool)

(assert (=> b!276575 m!409607))

(declare-fun m!409609 () Bool)

(assert (=> b!276576 m!409609))

(assert (=> b!276484 d!95238))

(declare-fun d!95246 () Bool)

(declare-fun e!196508 () Bool)

(assert (=> d!95246 e!196508))

(declare-fun res!229789 () Bool)

(assert (=> d!95246 (=> (not res!229789) (not e!196508))))

(declare-fun lt!414728 () (_ BitVec 64))

(declare-fun lt!414731 () (_ BitVec 64))

(declare-fun lt!414729 () (_ BitVec 64))

(assert (=> d!95246 (= res!229789 (= lt!414731 (bvsub lt!414728 lt!414729)))))

(assert (=> d!95246 (or (= (bvand lt!414728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414728 lt!414729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95246 (= lt!414729 (remainingBits!0 ((_ sign_extend 32) (size!6851 (buf!7319 bs1!11))) ((_ sign_extend 32) (currentByte!13539 bs1!11)) ((_ sign_extend 32) (currentBit!13534 bs1!11))))))

(declare-fun lt!414730 () (_ BitVec 64))

(declare-fun lt!414727 () (_ BitVec 64))

(assert (=> d!95246 (= lt!414728 (bvmul lt!414730 lt!414727))))

(assert (=> d!95246 (or (= lt!414730 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414727 (bvsdiv (bvmul lt!414730 lt!414727) lt!414730)))))

(assert (=> d!95246 (= lt!414727 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95246 (= lt!414730 ((_ sign_extend 32) (size!6851 (buf!7319 bs1!11))))))

(assert (=> d!95246 (= lt!414731 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13539 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13534 bs1!11))))))

(assert (=> d!95246 (invariant!0 (currentBit!13534 bs1!11) (currentByte!13539 bs1!11) (size!6851 (buf!7319 bs1!11)))))

(assert (=> d!95246 (= (bitIndex!0 (size!6851 (buf!7319 bs1!11)) (currentByte!13539 bs1!11) (currentBit!13534 bs1!11)) lt!414731)))

(declare-fun b!276581 () Bool)

(declare-fun res!229788 () Bool)

(assert (=> b!276581 (=> (not res!229788) (not e!196508))))

(assert (=> b!276581 (= res!229788 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414731))))

(declare-fun b!276582 () Bool)

(declare-fun lt!414726 () (_ BitVec 64))

(assert (=> b!276582 (= e!196508 (bvsle lt!414731 (bvmul lt!414726 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276582 (or (= lt!414726 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414726 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414726)))))

(assert (=> b!276582 (= lt!414726 ((_ sign_extend 32) (size!6851 (buf!7319 bs1!11))))))

(assert (= (and d!95246 res!229789) b!276581))

(assert (= (and b!276581 res!229788) b!276582))

(assert (=> d!95246 m!409559))

(declare-fun m!409617 () Bool)

(assert (=> d!95246 m!409617))

(assert (=> b!276484 d!95246))

(declare-fun d!95258 () Bool)

(assert (=> d!95258 (= (array_inv!6575 (buf!7319 bs1!11)) (bvsge (size!6851 (buf!7319 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276483 d!95258))

(declare-fun d!95260 () Bool)

(assert (=> d!95260 (= (inv!12 bs1!11) (invariant!0 (currentBit!13534 bs1!11) (currentByte!13539 bs1!11) (size!6851 (buf!7319 bs1!11))))))

(declare-fun bs!24023 () Bool)

(assert (= bs!24023 d!95260))

(assert (=> bs!24023 m!409617))

(assert (=> start!61530 d!95260))

(declare-fun d!95262 () Bool)

(assert (=> d!95262 (= (inv!12 bs2!19) (invariant!0 (currentBit!13534 bs2!19) (currentByte!13539 bs2!19) (size!6851 (buf!7319 bs2!19))))))

(declare-fun bs!24024 () Bool)

(assert (= bs!24024 d!95262))

(declare-fun m!409619 () Bool)

(assert (=> bs!24024 m!409619))

(assert (=> start!61530 d!95262))

(declare-fun d!95264 () Bool)

(declare-datatypes ((tuple2!22552 0))(
  ( (tuple2!22553 (_1!12323 Bool) (_2!12323 BitStream!12516)) )
))
(declare-fun lt!414734 () tuple2!22552)

(declare-fun readBit!0 (BitStream!12516) tuple2!22552)

(assert (=> d!95264 (= lt!414734 (readBit!0 (BitStream!12517 (buf!7319 bs2!19) (currentByte!13539 bs1!11) (currentBit!13534 bs1!11))))))

(assert (=> d!95264 (= (readBitPure!0 (BitStream!12517 (buf!7319 bs2!19) (currentByte!13539 bs1!11) (currentBit!13534 bs1!11))) (tuple2!22545 (_2!12323 lt!414734) (_1!12323 lt!414734)))))

(declare-fun bs!24025 () Bool)

(assert (= bs!24025 d!95264))

(declare-fun m!409621 () Bool)

(assert (=> bs!24025 m!409621))

(assert (=> b!276482 d!95264))

(declare-fun d!95266 () Bool)

(declare-fun lt!414735 () tuple2!22552)

(assert (=> d!95266 (= lt!414735 (readBit!0 bs1!11))))

(assert (=> d!95266 (= (readBitPure!0 bs1!11) (tuple2!22545 (_2!12323 lt!414735) (_1!12323 lt!414735)))))

(declare-fun bs!24026 () Bool)

(assert (= bs!24026 d!95266))

(declare-fun m!409623 () Bool)

(assert (=> bs!24026 m!409623))

(assert (=> b!276482 d!95266))

(declare-fun d!95268 () Bool)

(assert (=> d!95268 (= (invariant!0 (currentBit!13534 bs1!11) (currentByte!13539 bs1!11) (size!6851 (buf!7319 bs2!19))) (and (bvsge (currentBit!13534 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13534 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13539 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13539 bs1!11) (size!6851 (buf!7319 bs2!19))) (and (= (currentBit!13534 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13539 bs1!11) (size!6851 (buf!7319 bs2!19)))))))))

(assert (=> b!276482 d!95268))

(check-sat (not d!95264) (not b!276573) (not bm!4451) (not d!95260) (not b!276575) (not d!95246) (not d!95262) (not d!95266) (not b!276576) (not d!95234))
(check-sat)
