; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31310 () Bool)

(assert start!31310)

(declare-fun b!157475 () Bool)

(declare-fun e!106724 () Bool)

(declare-fun e!106723 () Bool)

(assert (=> b!157475 (= e!106724 e!106723)))

(declare-fun res!131581 () Bool)

(assert (=> b!157475 (=> (not res!131581) (not e!106723))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!157475 (= res!131581 (= from!240 (bvsub to!236 #b00000000000000000000000000000001)))))

(declare-datatypes ((array!7282 0))(
  ( (array!7283 (arr!4186 (Array (_ BitVec 32) (_ BitVec 8))) (size!3297 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5786 0))(
  ( (BitStream!5787 (buf!3767 array!7282) (currentByte!6912 (_ BitVec 32)) (currentBit!6907 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5786)

(declare-datatypes ((tuple2!14232 0))(
  ( (tuple2!14233 (_1!7566 BitStream!5786) (_2!7566 array!7282)) )
))
(declare-fun lt!247341 () tuple2!14232)

(declare-fun arr!153 () array!7282)

(declare-fun readByteArrayLoopPure!0 (BitStream!5786 array!7282 (_ BitVec 32) (_ BitVec 32)) tuple2!14232)

(declare-fun withMovedByteIndex!0 (BitStream!5786 (_ BitVec 32)) BitStream!5786)

(declare-datatypes ((tuple2!14234 0))(
  ( (tuple2!14235 (_1!7567 BitStream!5786) (_2!7567 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5786) tuple2!14234)

(assert (=> b!157475 (= lt!247341 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247342 () tuple2!14232)

(assert (=> b!157475 (= lt!247342 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157476 () Bool)

(declare-fun arrayRangesEq!439 (array!7282 array!7282 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!157476 (= e!106723 (not (arrayRangesEq!439 (_2!7566 lt!247342) (_2!7566 lt!247341) #b00000000000000000000000000000000 to!236)))))

(declare-fun b!157477 () Bool)

(declare-fun e!106725 () Bool)

(declare-fun array_inv!3056 (array!7282) Bool)

(assert (=> b!157477 (= e!106725 (array_inv!3056 (buf!3767 bs!65)))))

(declare-fun b!157474 () Bool)

(declare-fun res!131582 () Bool)

(assert (=> b!157474 (=> (not res!131582) (not e!106724))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157474 (= res!131582 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3297 (buf!3767 bs!65))) ((_ sign_extend 32) (currentByte!6912 bs!65)) ((_ sign_extend 32) (currentBit!6907 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!131580 () Bool)

(assert (=> start!31310 (=> (not res!131580) (not e!106724))))

(assert (=> start!31310 (= res!131580 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3297 arr!153))))))

(assert (=> start!31310 e!106724))

(assert (=> start!31310 true))

(assert (=> start!31310 (array_inv!3056 arr!153)))

(declare-fun inv!12 (BitStream!5786) Bool)

(assert (=> start!31310 (and (inv!12 bs!65) e!106725)))

(assert (= (and start!31310 res!131580) b!157474))

(assert (= (and b!157474 res!131582) b!157475))

(assert (= (and b!157475 res!131581) b!157476))

(assert (= start!31310 b!157477))

(declare-fun m!246409 () Bool)

(assert (=> start!31310 m!246409))

(declare-fun m!246411 () Bool)

(assert (=> start!31310 m!246411))

(declare-fun m!246413 () Bool)

(assert (=> b!157477 m!246413))

(declare-fun m!246415 () Bool)

(assert (=> b!157475 m!246415))

(declare-fun m!246417 () Bool)

(assert (=> b!157475 m!246417))

(assert (=> b!157475 m!246417))

(declare-fun m!246419 () Bool)

(assert (=> b!157475 m!246419))

(declare-fun m!246421 () Bool)

(assert (=> b!157475 m!246421))

(declare-fun m!246423 () Bool)

(assert (=> b!157475 m!246423))

(declare-fun m!246425 () Bool)

(assert (=> b!157474 m!246425))

(declare-fun m!246427 () Bool)

(assert (=> b!157476 m!246427))

(push 1)

(assert (not b!157476))

(assert (not b!157475))

(assert (not b!157474))

(assert (not b!157477))

(assert (not start!31310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52548 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52548 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3297 (buf!3767 bs!65))) ((_ sign_extend 32) (currentByte!6912 bs!65)) ((_ sign_extend 32) (currentBit!6907 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3297 (buf!3767 bs!65))) ((_ sign_extend 32) (currentByte!6912 bs!65)) ((_ sign_extend 32) (currentBit!6907 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12925 () Bool)

(assert (= bs!12925 d!52548))

(declare-fun m!246431 () Bool)

(assert (=> bs!12925 m!246431))

(assert (=> b!157474 d!52548))

(declare-datatypes ((Unit!10362 0))(
  ( (Unit!10363) )
))
(declare-datatypes ((tuple3!668 0))(
  ( (tuple3!669 (_1!7570 Unit!10362) (_2!7570 BitStream!5786) (_3!451 array!7282)) )
))
(declare-fun lt!247348 () tuple3!668)

(declare-fun d!52550 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5786 array!7282 (_ BitVec 32) (_ BitVec 32)) tuple3!668)

(assert (=> d!52550 (= lt!247348 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52550 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14233 (_2!7570 lt!247348) (_3!451 lt!247348)))))

(declare-fun bs!12928 () Bool)

(assert (= bs!12928 d!52550))

(assert (=> bs!12928 m!246417))

(declare-fun m!246437 () Bool)

(assert (=> bs!12928 m!246437))

(assert (=> b!157475 d!52550))

(declare-fun d!52556 () Bool)

(declare-datatypes ((tuple2!14240 0))(
  ( (tuple2!14241 (_1!7572 Unit!10362) (_2!7572 BitStream!5786)) )
))
(declare-fun moveByteIndex!0 (BitStream!5786 (_ BitVec 32)) tuple2!14240)

(assert (=> d!52556 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7572 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12930 () Bool)

(assert (= bs!12930 d!52556))

(declare-fun m!246441 () Bool)

(assert (=> bs!12930 m!246441))

(assert (=> b!157475 d!52556))

(declare-fun d!52560 () Bool)

(declare-datatypes ((tuple2!14242 0))(
  ( (tuple2!14243 (_1!7573 (_ BitVec 8)) (_2!7573 BitStream!5786)) )
))
(declare-fun lt!247355 () tuple2!14242)

(declare-fun readByte!0 (BitStream!5786) tuple2!14242)

(assert (=> d!52560 (= lt!247355 (readByte!0 bs!65))))

(assert (=> d!52560 (= (readBytePure!0 bs!65) (tuple2!14235 (_2!7573 lt!247355) (_1!7573 lt!247355)))))

(declare-fun bs!12932 () Bool)

(assert (= bs!12932 d!52560))

(declare-fun m!246445 () Bool)

(assert (=> bs!12932 m!246445))

(assert (=> b!157475 d!52560))

(declare-fun d!52564 () Bool)

(declare-fun lt!247356 () tuple3!668)

(assert (=> d!52564 (= lt!247356 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52564 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14233 (_2!7570 lt!247356) (_3!451 lt!247356)))))

(declare-fun bs!12933 () Bool)

(assert (= bs!12933 d!52564))

(declare-fun m!246447 () Bool)

(assert (=> bs!12933 m!246447))

(assert (=> b!157475 d!52564))

(declare-fun d!52566 () Bool)

(declare-fun res!131593 () Bool)

(declare-fun e!106738 () Bool)

(assert (=> d!52566 (=> res!131593 e!106738)))

(assert (=> d!52566 (= res!131593 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52566 (= (arrayRangesEq!439 (_2!7566 lt!247342) (_2!7566 lt!247341) #b00000000000000000000000000000000 to!236) e!106738)))

(declare-fun b!157488 () Bool)

(declare-fun e!106739 () Bool)

(assert (=> b!157488 (= e!106738 e!106739)))

(declare-fun res!131594 () Bool)

(assert (=> b!157488 (=> (not res!131594) (not e!106739))))

(assert (=> b!157488 (= res!131594 (= (select (arr!4186 (_2!7566 lt!247342)) #b00000000000000000000000000000000) (select (arr!4186 (_2!7566 lt!247341)) #b00000000000000000000000000000000)))))

(declare-fun b!157489 () Bool)

(assert (=> b!157489 (= e!106739 (arrayRangesEq!439 (_2!7566 lt!247342) (_2!7566 lt!247341) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52566 (not res!131593)) b!157488))

(assert (= (and b!157488 res!131594) b!157489))

(declare-fun m!246457 () Bool)

(assert (=> b!157488 m!246457))

(declare-fun m!246459 () Bool)

(assert (=> b!157488 m!246459))

(declare-fun m!246461 () Bool)

(assert (=> b!157489 m!246461))

(assert (=> b!157476 d!52566))

(declare-fun d!52574 () Bool)

(assert (=> d!52574 (= (array_inv!3056 (buf!3767 bs!65)) (bvsge (size!3297 (buf!3767 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157477 d!52574))

(declare-fun d!52576 () Bool)

(assert (=> d!52576 (= (array_inv!3056 arr!153) (bvsge (size!3297 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31310 d!52576))

(declare-fun d!52578 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52578 (= (inv!12 bs!65) (invariant!0 (currentBit!6907 bs!65) (currentByte!6912 bs!65) (size!3297 (buf!3767 bs!65))))))

(declare-fun bs!12935 () Bool)

(assert (= bs!12935 d!52578))

(declare-fun m!246463 () Bool)

(assert (=> bs!12935 m!246463))

(assert (=> start!31310 d!52578))

(push 1)

(assert (not d!52578))

(assert (not d!52550))

(assert (not d!52548))

(assert (not b!157489))

(assert (not d!52560))

(assert (not d!52564))

(assert (not d!52556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52602 () Bool)

(declare-fun res!131606 () Bool)

(declare-fun e!106750 () Bool)

(assert (=> d!52602 (=> res!131606 e!106750)))

(assert (=> d!52602 (= res!131606 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52602 (= (arrayRangesEq!439 (_2!7566 lt!247342) (_2!7566 lt!247341) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!106750)))

(declare-fun b!157500 () Bool)

(declare-fun e!106751 () Bool)

(assert (=> b!157500 (= e!106750 e!106751)))

(declare-fun res!131607 () Bool)

(assert (=> b!157500 (=> (not res!131607) (not e!106751))))

(assert (=> b!157500 (= res!131607 (= (select (arr!4186 (_2!7566 lt!247342)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4186 (_2!7566 lt!247341)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!157501 () Bool)

(assert (=> b!157501 (= e!106751 (arrayRangesEq!439 (_2!7566 lt!247342) (_2!7566 lt!247341) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52602 (not res!131606)) b!157500))

(assert (= (and b!157500 res!131607) b!157501))

(declare-fun m!246483 () Bool)

(assert (=> b!157500 m!246483))

(declare-fun m!246485 () Bool)

(assert (=> b!157500 m!246485))

(declare-fun m!246487 () Bool)

(assert (=> b!157501 m!246487))

(assert (=> b!157489 d!52602))

(declare-fun b!157526 () Bool)

(declare-fun e!106770 () tuple3!668)

(declare-fun lt!247538 () Unit!10362)

(assert (=> b!157526 (= e!106770 (tuple3!669 lt!247538 bs!65 arr!153))))

(declare-fun call!2561 () (_ BitVec 64))

(assert (=> b!157526 (= call!2561 call!2561)))

(declare-fun lt!247543 () Unit!10362)

(declare-fun Unit!10376 () Unit!10362)

(assert (=> b!157526 (= lt!247543 Unit!10376)))

(declare-fun lt!247551 () Unit!10362)

(declare-fun arrayRangesEqReflexiveLemma!46 (array!7282) Unit!10362)

(assert (=> b!157526 (= lt!247551 (arrayRangesEqReflexiveLemma!46 arr!153))))

(declare-fun call!2559 () Bool)

(assert (=> b!157526 call!2559))

(declare-fun lt!247548 () Unit!10362)

(assert (=> b!157526 (= lt!247548 lt!247551)))

(declare-fun lt!247544 () array!7282)

(assert (=> b!157526 (= lt!247544 arr!153)))

(declare-fun lt!247552 () array!7282)

(assert (=> b!157526 (= lt!247552 arr!153)))

(declare-fun lt!247549 () (_ BitVec 32))

(assert (=> b!157526 (= lt!247549 #b00000000000000000000000000000000)))

(declare-fun lt!247536 () (_ BitVec 32))

(assert (=> b!157526 (= lt!247536 (size!3297 arr!153))))

(declare-fun lt!247561 () (_ BitVec 32))

(assert (=> b!157526 (= lt!247561 #b00000000000000000000000000000000)))

(declare-fun lt!247539 () (_ BitVec 32))

(assert (=> b!157526 (= lt!247539 from!240)))

(declare-fun arrayRangesEqSlicedLemma!46 (array!7282 array!7282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10362)

(assert (=> b!157526 (= lt!247538 (arrayRangesEqSlicedLemma!46 lt!247544 lt!247552 lt!247549 lt!247536 lt!247561 lt!247539))))

(declare-fun call!2560 () Bool)

(assert (=> b!157526 call!2560))

(declare-fun b!157527 () Bool)

(declare-fun res!131624 () Bool)

(declare-fun e!106769 () Bool)

(assert (=> b!157527 (=> (not res!131624) (not e!106769))))

(declare-fun lt!247545 () tuple3!668)

(assert (=> b!157527 (= res!131624 (and (= (buf!3767 bs!65) (buf!3767 (_2!7570 lt!247545))) (= (size!3297 arr!153) (size!3297 (_3!451 lt!247545)))))))

(declare-fun d!52604 () Bool)

(declare-fun e!106768 () Bool)

(assert (=> d!52604 e!106768))

(declare-fun res!131626 () Bool)

(assert (=> d!52604 (=> res!131626 e!106768)))

(assert (=> d!52604 (= res!131626 (bvsge from!240 to!236))))

(declare-fun lt!247557 () Bool)

(assert (=> d!52604 (= lt!247557 e!106769)))

(declare-fun res!131625 () Bool)

(assert (=> d!52604 (=> (not res!131625) (not e!106769))))

(declare-fun lt!247563 () (_ BitVec 64))

(declare-fun lt!247550 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!52604 (= res!131625 (= (bvadd lt!247563 lt!247550) (bitIndex!0 (size!3297 (buf!3767 (_2!7570 lt!247545))) (currentByte!6912 (_2!7570 lt!247545)) (currentBit!6907 (_2!7570 lt!247545)))))))

(assert (=> d!52604 (or (not (= (bvand lt!247563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247550 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247563 lt!247550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!247531 () (_ BitVec 64))

(assert (=> d!52604 (= lt!247550 (bvmul lt!247531 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52604 (or (= lt!247531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!247531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!247531)))))

(assert (=> d!52604 (= lt!247531 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52604 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52604 (= lt!247563 (bitIndex!0 (size!3297 (buf!3767 bs!65)) (currentByte!6912 bs!65) (currentBit!6907 bs!65)))))

(assert (=> d!52604 (= lt!247545 e!106770)))

(declare-fun c!8375 () Bool)

(assert (=> d!52604 (= c!8375 (bvslt from!240 to!236))))

(assert (=> d!52604 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3297 arr!153)))))

(assert (=> d!52604 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!247545)))

(declare-fun b!157528 () Bool)

(assert (=> b!157528 (= e!106769 (arrayRangesEq!439 arr!153 (_3!451 lt!247545) #b00000000000000000000000000000000 from!240))))

(declare-fun b!157529 () Bool)

(declare-fun lt!247542 () Unit!10362)

(declare-fun lt!247541 () tuple3!668)

(assert (=> b!157529 (= e!106770 (tuple3!669 lt!247542 (_2!7570 lt!247541) (_3!451 lt!247541)))))

(declare-fun lt!247530 () tuple2!14242)

(assert (=> b!157529 (= lt!247530 (readByte!0 bs!65))))

(declare-fun lt!247532 () array!7282)

(assert (=> b!157529 (= lt!247532 (array!7283 (store (arr!4186 arr!153) from!240 (_1!7573 lt!247530)) (size!3297 arr!153)))))

(declare-fun lt!247547 () (_ BitVec 64))

(assert (=> b!157529 (= lt!247547 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!247556 () (_ BitVec 32))

(assert (=> b!157529 (= lt!247556 (bvsub to!236 from!240))))

(declare-fun lt!247537 () Unit!10362)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5786 BitStream!5786 (_ BitVec 64) (_ BitVec 32)) Unit!10362)

(assert (=> b!157529 (= lt!247537 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7573 lt!247530) lt!247547 lt!247556))))

(assert (=> b!157529 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3297 (buf!3767 (_2!7573 lt!247530)))) ((_ sign_extend 32) (currentByte!6912 (_2!7573 lt!247530))) ((_ sign_extend 32) (currentBit!6907 (_2!7573 lt!247530))) (bvsub lt!247556 ((_ extract 31 0) (bvsdiv (bvadd lt!247547 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!247553 () Unit!10362)

(assert (=> b!157529 (= lt!247553 lt!247537)))

(assert (=> b!157529 (= lt!247541 (readByteArrayLoop!0 (_2!7573 lt!247530) lt!247532 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157529 (= (bitIndex!0 (size!3297 (buf!3767 (_2!7573 lt!247530))) (currentByte!6912 (_2!7573 lt!247530)) (currentBit!6907 (_2!7573 lt!247530))) (bvadd call!2561 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!247529 () Unit!10362)

(declare-fun Unit!10379 () Unit!10362)

(assert (=> b!157529 (= lt!247529 Unit!10379)))

(assert (=> b!157529 (= (bvadd (bitIndex!0 (size!3297 (buf!3767 (_2!7573 lt!247530))) (currentByte!6912 (_2!7573 lt!247530)) (currentBit!6907 (_2!7573 lt!247530))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3297 (buf!3767 (_2!7570 lt!247541))) (currentByte!6912 (_2!7570 lt!247541)) (currentBit!6907 (_2!7570 lt!247541))))))

(declare-fun lt!247535 () Unit!10362)

(declare-fun Unit!10381 () Unit!10362)

(assert (=> b!157529 (= lt!247535 Unit!10381)))

(assert (=> b!157529 (= (bvadd call!2561 (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3297 (buf!3767 (_2!7570 lt!247541))) (currentByte!6912 (_2!7570 lt!247541)) (currentBit!6907 (_2!7570 lt!247541))))))

(declare-fun lt!247554 () Unit!10362)

(declare-fun Unit!10382 () Unit!10362)

(assert (=> b!157529 (= lt!247554 Unit!10382)))

(assert (=> b!157529 (and (= (buf!3767 bs!65) (buf!3767 (_2!7570 lt!247541))) (= (size!3297 arr!153) (size!3297 (_3!451 lt!247541))))))

(declare-fun lt!247533 () Unit!10362)

(declare-fun Unit!10383 () Unit!10362)

(assert (=> b!157529 (= lt!247533 Unit!10383)))

(declare-fun lt!247560 () Unit!10362)

(declare-fun arrayUpdatedAtPrefixLemma!46 (array!7282 (_ BitVec 32) (_ BitVec 8)) Unit!10362)

(assert (=> b!157529 (= lt!247560 (arrayUpdatedAtPrefixLemma!46 arr!153 from!240 (_1!7573 lt!247530)))))

(assert (=> b!157529 call!2559))

(declare-fun lt!247534 () Unit!10362)

(assert (=> b!157529 (= lt!247534 lt!247560)))

(declare-fun lt!247564 () (_ BitVec 32))

(assert (=> b!157529 (= lt!247564 #b00000000000000000000000000000000)))

(declare-fun lt!247562 () Unit!10362)

(declare-fun arrayRangesEqTransitive!111 (array!7282 array!7282 array!7282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10362)

(assert (=> b!157529 (= lt!247562 (arrayRangesEqTransitive!111 arr!153 lt!247532 (_3!451 lt!247541) lt!247564 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157529 call!2560))

(declare-fun lt!247559 () Unit!10362)

(assert (=> b!157529 (= lt!247559 lt!247562)))

(assert (=> b!157529 (arrayRangesEq!439 arr!153 (_3!451 lt!247541) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!247546 () Unit!10362)

(declare-fun Unit!10384 () Unit!10362)

(assert (=> b!157529 (= lt!247546 Unit!10384)))

(declare-fun lt!247540 () Unit!10362)

(declare-fun arrayRangesEqImpliesEq!55 (array!7282 array!7282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10362)

(assert (=> b!157529 (= lt!247540 (arrayRangesEqImpliesEq!55 lt!247532 (_3!451 lt!247541) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157529 (= (select (store (arr!4186 arr!153) from!240 (_1!7573 lt!247530)) from!240) (select (arr!4186 (_3!451 lt!247541)) from!240))))

(declare-fun lt!247555 () Unit!10362)

(assert (=> b!157529 (= lt!247555 lt!247540)))

(declare-fun lt!247558 () Bool)

(assert (=> b!157529 (= lt!247558 (= (select (arr!4186 (_3!451 lt!247541)) from!240) (_1!7573 lt!247530)))))

(declare-fun Unit!10388 () Unit!10362)

(assert (=> b!157529 (= lt!247542 Unit!10388)))

(assert (=> b!157529 lt!247558))

(declare-fun bm!2556 () Bool)

(assert (=> bm!2556 (= call!2561 (bitIndex!0 (size!3297 (buf!3767 bs!65)) (currentByte!6912 bs!65) (currentBit!6907 bs!65)))))

(declare-fun bm!2557 () Bool)

(assert (=> bm!2557 (= call!2559 (arrayRangesEq!439 arr!153 (ite c!8375 (array!7283 (store (arr!4186 arr!153) from!240 (_1!7573 lt!247530)) (size!3297 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8375 from!240 (size!3297 arr!153))))))

(declare-fun bm!2558 () Bool)

(assert (=> bm!2558 (= call!2560 (arrayRangesEq!439 (ite c!8375 arr!153 lt!247544) (ite c!8375 (_3!451 lt!247541) lt!247552) (ite c!8375 lt!247564 lt!247561) (ite c!8375 from!240 lt!247539)))))

(declare-fun b!157530 () Bool)

(assert (=> b!157530 (= e!106768 (= (select (arr!4186 (_3!451 lt!247545)) from!240) (_2!7567 (readBytePure!0 bs!65))))))

(assert (=> b!157530 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3297 (_3!451 lt!247545))))))

(assert (= (and d!52604 c!8375) b!157529))

(assert (= (and d!52604 (not c!8375)) b!157526))

(assert (= (or b!157529 b!157526) bm!2558))

(assert (= (or b!157529 b!157526) bm!2557))

(assert (= (or b!157529 b!157526) bm!2556))

(assert (= (and d!52604 res!131625) b!157527))

(assert (= (and b!157527 res!131624) b!157528))

(assert (= (and d!52604 (not res!131626)) b!157530))

(declare-fun m!246505 () Bool)

(assert (=> bm!2558 m!246505))

(declare-fun m!246507 () Bool)

(assert (=> bm!2556 m!246507))

(declare-fun m!246509 () Bool)

(assert (=> b!157530 m!246509))

(assert (=> b!157530 m!246415))

(assert (=> b!157529 m!246445))

(declare-fun m!246511 () Bool)

(assert (=> b!157529 m!246511))

(declare-fun m!246513 () Bool)

(assert (=> b!157529 m!246513))

(declare-fun m!246515 () Bool)

(assert (=> b!157529 m!246515))

(declare-fun m!246519 () Bool)

(assert (=> b!157529 m!246519))

(declare-fun m!246521 () Bool)

(assert (=> b!157529 m!246521))

(declare-fun m!246525 () Bool)

(assert (=> b!157529 m!246525))

(declare-fun m!246527 () Bool)

(assert (=> b!157529 m!246527))

(declare-fun m!246531 () Bool)

(assert (=> b!157529 m!246531))

(declare-fun m!246535 () Bool)

(assert (=> b!157529 m!246535))

(declare-fun m!246537 () Bool)

(assert (=> b!157529 m!246537))

(declare-fun m!246539 () Bool)

(assert (=> b!157529 m!246539))

(declare-fun m!246543 () Bool)

(assert (=> b!157529 m!246543))

(declare-fun m!246548 () Bool)

(assert (=> b!157528 m!246548))

(declare-fun m!246551 () Bool)

(assert (=> b!157526 m!246551))

(declare-fun m!246555 () Bool)

(assert (=> b!157526 m!246555))

(declare-fun m!246559 () Bool)

(assert (=> d!52604 m!246559))

(assert (=> d!52604 m!246507))

(assert (=> bm!2557 m!246525))

(declare-fun m!246567 () Bool)

(assert (=> bm!2557 m!246567))

(assert (=> d!52564 d!52604))

(declare-fun d!52612 () Bool)

(assert (=> d!52612 (= (invariant!0 (currentBit!6907 bs!65) (currentByte!6912 bs!65) (size!3297 (buf!3767 bs!65))) (and (bvsge (currentBit!6907 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6907 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6912 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6912 bs!65) (size!3297 (buf!3767 bs!65))) (and (= (currentBit!6907 bs!65) #b00000000000000000000000000000000) (= (currentByte!6912 bs!65) (size!3297 (buf!3767 bs!65)))))))))

(assert (=> d!52578 d!52612))

(declare-fun d!52616 () Bool)

(declare-fun e!106778 () Bool)

(assert (=> d!52616 e!106778))

(declare-fun res!131634 () Bool)

(assert (=> d!52616 (=> (not res!131634) (not e!106778))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5786 (_ BitVec 32)) Bool)

(assert (=> d!52616 (= res!131634 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10392 () Unit!10362)

(assert (=> d!52616 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14241 Unit!10392 (BitStream!5787 (buf!3767 bs!65) (bvadd (currentByte!6912 bs!65) #b00000000000000000000000000000001) (currentBit!6907 bs!65))))))

(declare-fun b!157540 () Bool)

(assert (=> b!157540 (= e!106778 (and (or (not (= (bvand (currentByte!6912 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6912 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6912 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6912 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6912 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52616 res!131634) b!157540))

(declare-fun m!246589 () Bool)

(assert (=> d!52616 m!246589))

(assert (=> d!52556 d!52616))

(declare-fun d!52620 () Bool)

(assert (=> d!52620 (= (remainingBits!0 ((_ sign_extend 32) (size!3297 (buf!3767 bs!65))) ((_ sign_extend 32) (currentByte!6912 bs!65)) ((_ sign_extend 32) (currentBit!6907 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3297 (buf!3767 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6912 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6907 bs!65)))))))

(assert (=> d!52548 d!52620))

(declare-fun d!52624 () Bool)

(declare-fun lt!247715 () (_ BitVec 8))

(declare-fun lt!247717 () (_ BitVec 8))

(assert (=> d!52624 (= lt!247715 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4186 (buf!3767 bs!65)) (currentByte!6912 bs!65))) ((_ sign_extend 24) lt!247717))))))

(assert (=> d!52624 (= lt!247717 ((_ extract 7 0) (currentBit!6907 bs!65)))))

(declare-fun e!106789 () Bool)

(assert (=> d!52624 e!106789))

(declare-fun res!131645 () Bool)

(assert (=> d!52624 (=> (not res!131645) (not e!106789))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52624 (= res!131645 (validate_offset_bits!1 ((_ sign_extend 32) (size!3297 (buf!3767 bs!65))) ((_ sign_extend 32) (currentByte!6912 bs!65)) ((_ sign_extend 32) (currentBit!6907 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14250 0))(
  ( (tuple2!14251 (_1!7578 Unit!10362) (_2!7578 (_ BitVec 8))) )
))
(declare-fun Unit!10393 () Unit!10362)

(declare-fun Unit!10394 () Unit!10362)

(assert (=> d!52624 (= (readByte!0 bs!65) (tuple2!14243 (_2!7578 (ite (bvsgt ((_ sign_extend 24) lt!247717) #b00000000000000000000000000000000) (tuple2!14251 Unit!10393 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247715) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4186 (buf!3767 bs!65)) (bvadd (currentByte!6912 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247717)))))))) (tuple2!14251 Unit!10394 lt!247715))) (BitStream!5787 (buf!3767 bs!65) (bvadd (currentByte!6912 bs!65) #b00000000000000000000000000000001) (currentBit!6907 bs!65))))))

(declare-fun b!157555 () Bool)

(declare-fun e!106790 () Bool)

(assert (=> b!157555 (= e!106789 e!106790)))

(declare-fun res!131644 () Bool)

(assert (=> b!157555 (=> (not res!131644) (not e!106790))))

(declare-fun lt!247720 () tuple2!14242)

(assert (=> b!157555 (= res!131644 (= (buf!3767 (_2!7573 lt!247720)) (buf!3767 bs!65)))))

(declare-fun lt!247721 () (_ BitVec 8))

(declare-fun lt!247718 () (_ BitVec 8))

(declare-fun Unit!10395 () Unit!10362)

(declare-fun Unit!10396 () Unit!10362)

(assert (=> b!157555 (= lt!247720 (tuple2!14243 (_2!7578 (ite (bvsgt ((_ sign_extend 24) lt!247721) #b00000000000000000000000000000000) (tuple2!14251 Unit!10395 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247718) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4186 (buf!3767 bs!65)) (bvadd (currentByte!6912 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247721)))))))) (tuple2!14251 Unit!10396 lt!247718))) (BitStream!5787 (buf!3767 bs!65) (bvadd (currentByte!6912 bs!65) #b00000000000000000000000000000001) (currentBit!6907 bs!65))))))

(assert (=> b!157555 (= lt!247718 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4186 (buf!3767 bs!65)) (currentByte!6912 bs!65))) ((_ sign_extend 24) lt!247721))))))

(assert (=> b!157555 (= lt!247721 ((_ extract 7 0) (currentBit!6907 bs!65)))))

(declare-fun lt!247716 () (_ BitVec 64))

(declare-fun b!157556 () Bool)

(declare-fun lt!247719 () (_ BitVec 64))

(assert (=> b!157556 (= e!106790 (= (bitIndex!0 (size!3297 (buf!3767 (_2!7573 lt!247720))) (currentByte!6912 (_2!7573 lt!247720)) (currentBit!6907 (_2!7573 lt!247720))) (bvadd lt!247719 lt!247716)))))

(assert (=> b!157556 (or (not (= (bvand lt!247719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247716 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247719 lt!247716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157556 (= lt!247716 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157556 (= lt!247719 (bitIndex!0 (size!3297 (buf!3767 bs!65)) (currentByte!6912 bs!65) (currentBit!6907 bs!65)))))

(assert (= (and d!52624 res!131645) b!157555))

(assert (= (and b!157555 res!131644) b!157556))

(declare-fun m!246631 () Bool)

(assert (=> d!52624 m!246631))

(declare-fun m!246633 () Bool)

(assert (=> d!52624 m!246633))

(declare-fun m!246635 () Bool)

(assert (=> d!52624 m!246635))

(assert (=> b!157555 m!246635))

(assert (=> b!157555 m!246631))

(declare-fun m!246637 () Bool)

(assert (=> b!157556 m!246637))

(assert (=> b!157556 m!246507))

(assert (=> d!52560 d!52624))

(declare-fun e!106795 () tuple3!668)

(declare-fun lt!247735 () Unit!10362)

(declare-fun b!157557 () Bool)

(assert (=> b!157557 (= e!106795 (tuple3!669 lt!247735 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))))))

(declare-fun call!2576 () (_ BitVec 64))

(assert (=> b!157557 (= call!2576 call!2576)))

(declare-fun lt!247740 () Unit!10362)

(declare-fun Unit!10398 () Unit!10362)

(assert (=> b!157557 (= lt!247740 Unit!10398)))

(declare-fun lt!247748 () Unit!10362)

(assert (=> b!157557 (= lt!247748 (arrayRangesEqReflexiveLemma!46 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))))))

(declare-fun call!2574 () Bool)

(assert (=> b!157557 call!2574))

(declare-fun lt!247745 () Unit!10362)

(assert (=> b!157557 (= lt!247745 lt!247748)))

(declare-fun lt!247741 () array!7282)

(assert (=> b!157557 (= lt!247741 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)))))

(declare-fun lt!247749 () array!7282)

(assert (=> b!157557 (= lt!247749 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)))))

(declare-fun lt!247746 () (_ BitVec 32))

(assert (=> b!157557 (= lt!247746 #b00000000000000000000000000000000)))

(declare-fun lt!247733 () (_ BitVec 32))

(assert (=> b!157557 (= lt!247733 (size!3297 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))))))

(declare-fun lt!247758 () (_ BitVec 32))

(assert (=> b!157557 (= lt!247758 #b00000000000000000000000000000000)))

(declare-fun lt!247736 () (_ BitVec 32))

(assert (=> b!157557 (= lt!247736 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!157557 (= lt!247735 (arrayRangesEqSlicedLemma!46 lt!247741 lt!247749 lt!247746 lt!247733 lt!247758 lt!247736))))

(declare-fun call!2575 () Bool)

(assert (=> b!157557 call!2575))

(declare-fun b!157558 () Bool)

(declare-fun res!131648 () Bool)

(declare-fun e!106794 () Bool)

(assert (=> b!157558 (=> (not res!131648) (not e!106794))))

(declare-fun lt!247742 () tuple3!668)

(assert (=> b!157558 (= res!131648 (and (= (buf!3767 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3767 (_2!7570 lt!247742))) (= (size!3297 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))) (size!3297 (_3!451 lt!247742)))))))

(declare-fun d!52626 () Bool)

(declare-fun e!106793 () Bool)

(assert (=> d!52626 e!106793))

(declare-fun res!131650 () Bool)

(assert (=> d!52626 (=> res!131650 e!106793)))

(assert (=> d!52626 (= res!131650 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247754 () Bool)

(assert (=> d!52626 (= lt!247754 e!106794)))

(declare-fun res!131649 () Bool)

(assert (=> d!52626 (=> (not res!131649) (not e!106794))))

(declare-fun lt!247760 () (_ BitVec 64))

(declare-fun lt!247747 () (_ BitVec 64))

(assert (=> d!52626 (= res!131649 (= (bvadd lt!247760 lt!247747) (bitIndex!0 (size!3297 (buf!3767 (_2!7570 lt!247742))) (currentByte!6912 (_2!7570 lt!247742)) (currentBit!6907 (_2!7570 lt!247742)))))))

(assert (=> d!52626 (or (not (= (bvand lt!247760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247747 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247760 lt!247747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!247726 () (_ BitVec 64))

(assert (=> d!52626 (= lt!247747 (bvmul lt!247726 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52626 (or (= lt!247726 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!247726 #b0000000000000000000000000000000000000000000000000000000000001000) lt!247726)))))

(assert (=> d!52626 (= lt!247726 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52626 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52626 (= lt!247760 (bitIndex!0 (size!3297 (buf!3767 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6912 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6907 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(assert (=> d!52626 (= lt!247742 e!106795)))

(declare-fun c!8380 () Bool)

(assert (=> d!52626 (= c!8380 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52626 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3297 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)))))))

(assert (=> d!52626 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!247742)))

(declare-fun b!157559 () Bool)

(assert (=> b!157559 (= e!106794 (arrayRangesEq!439 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) (_3!451 lt!247742) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!157560 () Bool)

(declare-fun lt!247739 () Unit!10362)

(declare-fun lt!247738 () tuple3!668)

(assert (=> b!157560 (= e!106795 (tuple3!669 lt!247739 (_2!7570 lt!247738) (_3!451 lt!247738)))))

(declare-fun lt!247725 () tuple2!14242)

(assert (=> b!157560 (= lt!247725 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!247727 () array!7282)

(assert (=> b!157560 (= lt!247727 (array!7283 (store (arr!4186 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7573 lt!247725)) (size!3297 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)))))))

(declare-fun lt!247744 () (_ BitVec 64))

(assert (=> b!157560 (= lt!247744 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!247753 () (_ BitVec 32))

(assert (=> b!157560 (= lt!247753 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!247734 () Unit!10362)

(assert (=> b!157560 (= lt!247734 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7573 lt!247725) lt!247744 lt!247753))))

(assert (=> b!157560 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3297 (buf!3767 (_2!7573 lt!247725)))) ((_ sign_extend 32) (currentByte!6912 (_2!7573 lt!247725))) ((_ sign_extend 32) (currentBit!6907 (_2!7573 lt!247725))) (bvsub lt!247753 ((_ extract 31 0) (bvsdiv (bvadd lt!247744 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!247750 () Unit!10362)

(assert (=> b!157560 (= lt!247750 lt!247734)))

(assert (=> b!157560 (= lt!247738 (readByteArrayLoop!0 (_2!7573 lt!247725) lt!247727 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157560 (= (bitIndex!0 (size!3297 (buf!3767 (_2!7573 lt!247725))) (currentByte!6912 (_2!7573 lt!247725)) (currentBit!6907 (_2!7573 lt!247725))) (bvadd call!2576 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!247724 () Unit!10362)

(declare-fun Unit!10406 () Unit!10362)

(assert (=> b!157560 (= lt!247724 Unit!10406)))

(assert (=> b!157560 (= (bvadd (bitIndex!0 (size!3297 (buf!3767 (_2!7573 lt!247725))) (currentByte!6912 (_2!7573 lt!247725)) (currentBit!6907 (_2!7573 lt!247725))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3297 (buf!3767 (_2!7570 lt!247738))) (currentByte!6912 (_2!7570 lt!247738)) (currentBit!6907 (_2!7570 lt!247738))))))

(declare-fun lt!247732 () Unit!10362)

(declare-fun Unit!10408 () Unit!10362)

(assert (=> b!157560 (= lt!247732 Unit!10408)))

(assert (=> b!157560 (= (bvadd call!2576 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3297 (buf!3767 (_2!7570 lt!247738))) (currentByte!6912 (_2!7570 lt!247738)) (currentBit!6907 (_2!7570 lt!247738))))))

(declare-fun lt!247751 () Unit!10362)

(declare-fun Unit!10411 () Unit!10362)

(assert (=> b!157560 (= lt!247751 Unit!10411)))

(assert (=> b!157560 (and (= (buf!3767 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3767 (_2!7570 lt!247738))) (= (size!3297 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))) (size!3297 (_3!451 lt!247738))))))

(declare-fun lt!247728 () Unit!10362)

(declare-fun Unit!10412 () Unit!10362)

(assert (=> b!157560 (= lt!247728 Unit!10412)))

(declare-fun lt!247757 () Unit!10362)

(assert (=> b!157560 (= lt!247757 (arrayUpdatedAtPrefixLemma!46 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7573 lt!247725)))))

(assert (=> b!157560 call!2574))

(declare-fun lt!247731 () Unit!10362)

(assert (=> b!157560 (= lt!247731 lt!247757)))

(declare-fun lt!247761 () (_ BitVec 32))

(assert (=> b!157560 (= lt!247761 #b00000000000000000000000000000000)))

(declare-fun lt!247759 () Unit!10362)

(assert (=> b!157560 (= lt!247759 (arrayRangesEqTransitive!111 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) lt!247727 (_3!451 lt!247738) lt!247761 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157560 call!2575))

(declare-fun lt!247756 () Unit!10362)

(assert (=> b!157560 (= lt!247756 lt!247759)))

(assert (=> b!157560 (arrayRangesEq!439 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) (_3!451 lt!247738) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!247743 () Unit!10362)

(declare-fun Unit!10414 () Unit!10362)

(assert (=> b!157560 (= lt!247743 Unit!10414)))

(declare-fun lt!247737 () Unit!10362)

(assert (=> b!157560 (= lt!247737 (arrayRangesEqImpliesEq!55 lt!247727 (_3!451 lt!247738) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157560 (= (select (store (arr!4186 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7573 lt!247725)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4186 (_3!451 lt!247738)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!247752 () Unit!10362)

(assert (=> b!157560 (= lt!247752 lt!247737)))

(declare-fun lt!247755 () Bool)

(assert (=> b!157560 (= lt!247755 (= (select (arr!4186 (_3!451 lt!247738)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7573 lt!247725)))))

(declare-fun Unit!10415 () Unit!10362)

(assert (=> b!157560 (= lt!247739 Unit!10415)))

(assert (=> b!157560 lt!247755))

(declare-fun bm!2571 () Bool)

(assert (=> bm!2571 (= call!2576 (bitIndex!0 (size!3297 (buf!3767 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6912 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6907 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(declare-fun bm!2572 () Bool)

(assert (=> bm!2572 (= call!2574 (arrayRangesEq!439 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) (ite c!8380 (array!7283 (store (arr!4186 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7573 lt!247725)) (size!3297 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)))) (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))) #b00000000000000000000000000000000 (ite c!8380 (bvadd #b00000000000000000000000000000001 from!240) (size!3297 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153))))))))

(declare-fun bm!2573 () Bool)

(assert (=> bm!2573 (= call!2575 (arrayRangesEq!439 (ite c!8380 (array!7283 (store (arr!4186 arr!153) from!240 (_2!7567 (readBytePure!0 bs!65))) (size!3297 arr!153)) lt!247741) (ite c!8380 (_3!451 lt!247738) lt!247749) (ite c!8380 lt!247761 lt!247758) (ite c!8380 (bvadd #b00000000000000000000000000000001 from!240) lt!247736)))))

(declare-fun b!157561 () Bool)

(assert (=> b!157561 (= e!106793 (= (select (arr!4186 (_3!451 lt!247742)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7567 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!157561 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3297 (_3!451 lt!247742))))))

(assert (= (and d!52626 c!8380) b!157560))

(assert (= (and d!52626 (not c!8380)) b!157557))

(assert (= (or b!157560 b!157557) bm!2573))

(assert (= (or b!157560 b!157557) bm!2572))

(assert (= (or b!157560 b!157557) bm!2571))

(assert (= (and d!52626 res!131649) b!157558))

(assert (= (and b!157558 res!131648) b!157559))

(assert (= (and d!52626 (not res!131650)) b!157561))

(declare-fun m!246639 () Bool)

(assert (=> bm!2573 m!246639))

(declare-fun m!246641 () Bool)

(assert (=> bm!2571 m!246641))

(declare-fun m!246643 () Bool)

(assert (=> b!157561 m!246643))

(assert (=> b!157561 m!246417))

(declare-fun m!246645 () Bool)

(assert (=> b!157561 m!246645))

(assert (=> b!157560 m!246417))

(declare-fun m!246647 () Bool)

(assert (=> b!157560 m!246647))

(declare-fun m!246649 () Bool)

(assert (=> b!157560 m!246649))

(declare-fun m!246651 () Bool)

(assert (=> b!157560 m!246651))

(declare-fun m!246653 () Bool)

(assert (=> b!157560 m!246653))

(declare-fun m!246655 () Bool)

(assert (=> b!157560 m!246655))

(declare-fun m!246657 () Bool)

(assert (=> b!157560 m!246657))

(declare-fun m!246659 () Bool)

(assert (=> b!157560 m!246659))

(declare-fun m!246661 () Bool)

(assert (=> b!157560 m!246661))

(assert (=> b!157560 m!246417))

(declare-fun m!246663 () Bool)

(assert (=> b!157560 m!246663))

(declare-fun m!246665 () Bool)

(assert (=> b!157560 m!246665))

(declare-fun m!246667 () Bool)

(assert (=> b!157560 m!246667))

(declare-fun m!246669 () Bool)

(assert (=> b!157560 m!246669))

(declare-fun m!246671 () Bool)

(assert (=> b!157560 m!246671))

(declare-fun m!246673 () Bool)

(assert (=> b!157559 m!246673))

(declare-fun m!246675 () Bool)

(assert (=> b!157557 m!246675))

(declare-fun m!246677 () Bool)

(assert (=> b!157557 m!246677))

(declare-fun m!246679 () Bool)

(assert (=> d!52626 m!246679))

(assert (=> d!52626 m!246641))

(assert (=> bm!2572 m!246659))

(declare-fun m!246681 () Bool)

(assert (=> bm!2572 m!246681))

(assert (=> d!52550 d!52626))

(push 1)

(assert (not bm!2572))

(assert (not d!52604))

(assert (not b!157529))

(assert (not d!52616))

(assert (not b!157530))

(assert (not b!157501))

(assert (not b!157561))

(assert (not d!52626))

(assert (not bm!2571))

(assert (not b!157556))

(assert (not d!52624))

(assert (not b!157559))

(assert (not b!157557))

(assert (not b!157560))

(assert (not bm!2558))

(assert (not bm!2557))

(assert (not b!157528))

(assert (not b!157526))

(assert (not bm!2556))

(assert (not bm!2573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

