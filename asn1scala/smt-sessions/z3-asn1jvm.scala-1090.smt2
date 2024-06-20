; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31308 () Bool)

(assert start!31308)

(declare-fun b!157462 () Bool)

(declare-fun res!131571 () Bool)

(declare-fun e!106708 () Bool)

(assert (=> b!157462 (=> (not res!131571) (not e!106708))))

(declare-datatypes ((array!7280 0))(
  ( (array!7281 (arr!4185 (Array (_ BitVec 32) (_ BitVec 8))) (size!3296 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5784 0))(
  ( (BitStream!5785 (buf!3766 array!7280) (currentByte!6911 (_ BitVec 32)) (currentBit!6906 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5784)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157462 (= res!131571 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3296 (buf!3766 bs!65))) ((_ sign_extend 32) (currentByte!6911 bs!65)) ((_ sign_extend 32) (currentBit!6906 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!131572 () Bool)

(assert (=> start!31308 (=> (not res!131572) (not e!106708))))

(declare-fun arr!153 () array!7280)

(assert (=> start!31308 (= res!131572 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3296 arr!153))))))

(assert (=> start!31308 e!106708))

(assert (=> start!31308 true))

(declare-fun array_inv!3055 (array!7280) Bool)

(assert (=> start!31308 (array_inv!3055 arr!153)))

(declare-fun e!106710 () Bool)

(declare-fun inv!12 (BitStream!5784) Bool)

(assert (=> start!31308 (and (inv!12 bs!65) e!106710)))

(declare-fun b!157465 () Bool)

(assert (=> b!157465 (= e!106710 (array_inv!3055 (buf!3766 bs!65)))))

(declare-fun b!157463 () Bool)

(declare-fun e!106711 () Bool)

(assert (=> b!157463 (= e!106708 e!106711)))

(declare-fun res!131573 () Bool)

(assert (=> b!157463 (=> (not res!131573) (not e!106711))))

(assert (=> b!157463 (= res!131573 (= from!240 (bvsub to!236 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14228 0))(
  ( (tuple2!14229 (_1!7564 BitStream!5784) (_2!7564 array!7280)) )
))
(declare-fun lt!247336 () tuple2!14228)

(declare-fun readByteArrayLoopPure!0 (BitStream!5784 array!7280 (_ BitVec 32) (_ BitVec 32)) tuple2!14228)

(declare-fun withMovedByteIndex!0 (BitStream!5784 (_ BitVec 32)) BitStream!5784)

(declare-datatypes ((tuple2!14230 0))(
  ( (tuple2!14231 (_1!7565 BitStream!5784) (_2!7565 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5784) tuple2!14230)

(assert (=> b!157463 (= lt!247336 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247335 () tuple2!14228)

(assert (=> b!157463 (= lt!247335 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157464 () Bool)

(declare-fun arrayRangesEq!438 (array!7280 array!7280 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!157464 (= e!106711 (not (arrayRangesEq!438 (_2!7564 lt!247335) (_2!7564 lt!247336) #b00000000000000000000000000000000 to!236)))))

(assert (= (and start!31308 res!131572) b!157462))

(assert (= (and b!157462 res!131571) b!157463))

(assert (= (and b!157463 res!131573) b!157464))

(assert (= start!31308 b!157465))

(declare-fun m!246389 () Bool)

(assert (=> start!31308 m!246389))

(declare-fun m!246391 () Bool)

(assert (=> start!31308 m!246391))

(declare-fun m!246393 () Bool)

(assert (=> b!157465 m!246393))

(declare-fun m!246395 () Bool)

(assert (=> b!157464 m!246395))

(declare-fun m!246397 () Bool)

(assert (=> b!157463 m!246397))

(declare-fun m!246399 () Bool)

(assert (=> b!157463 m!246399))

(assert (=> b!157463 m!246399))

(declare-fun m!246401 () Bool)

(assert (=> b!157463 m!246401))

(declare-fun m!246403 () Bool)

(assert (=> b!157463 m!246403))

(declare-fun m!246405 () Bool)

(assert (=> b!157463 m!246405))

(declare-fun m!246407 () Bool)

(assert (=> b!157462 m!246407))

(check-sat (not b!157465) (not b!157463) (not b!157462) (not start!31308) (not b!157464))
(check-sat)
(get-model)

(declare-fun d!52580 () Bool)

(assert (=> d!52580 (= (array_inv!3055 (buf!3766 bs!65)) (bvsge (size!3296 (buf!3766 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157465 d!52580))

(declare-fun d!52582 () Bool)

(assert (=> d!52582 (= (array_inv!3055 arr!153) (bvsge (size!3296 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31308 d!52582))

(declare-fun d!52584 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52584 (= (inv!12 bs!65) (invariant!0 (currentBit!6906 bs!65) (currentByte!6911 bs!65) (size!3296 (buf!3766 bs!65))))))

(declare-fun bs!12936 () Bool)

(assert (= bs!12936 d!52584))

(declare-fun m!246465 () Bool)

(assert (=> bs!12936 m!246465))

(assert (=> start!31308 d!52584))

(declare-fun d!52586 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52586 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3296 (buf!3766 bs!65))) ((_ sign_extend 32) (currentByte!6911 bs!65)) ((_ sign_extend 32) (currentBit!6906 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3296 (buf!3766 bs!65))) ((_ sign_extend 32) (currentByte!6911 bs!65)) ((_ sign_extend 32) (currentBit!6906 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12937 () Bool)

(assert (= bs!12937 d!52586))

(declare-fun m!246467 () Bool)

(assert (=> bs!12937 m!246467))

(assert (=> b!157462 d!52586))

(declare-datatypes ((Unit!10364 0))(
  ( (Unit!10365) )
))
(declare-datatypes ((tuple3!670 0))(
  ( (tuple3!671 (_1!7574 Unit!10364) (_2!7574 BitStream!5784) (_3!452 array!7280)) )
))
(declare-fun lt!247359 () tuple3!670)

(declare-fun d!52588 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5784 array!7280 (_ BitVec 32) (_ BitVec 32)) tuple3!670)

(assert (=> d!52588 (= lt!247359 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52588 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14229 (_2!7574 lt!247359) (_3!452 lt!247359)))))

(declare-fun bs!12938 () Bool)

(assert (= bs!12938 d!52588))

(assert (=> bs!12938 m!246399))

(declare-fun m!246469 () Bool)

(assert (=> bs!12938 m!246469))

(assert (=> b!157463 d!52588))

(declare-fun d!52590 () Bool)

(declare-datatypes ((tuple2!14244 0))(
  ( (tuple2!14245 (_1!7575 Unit!10364) (_2!7575 BitStream!5784)) )
))
(declare-fun moveByteIndex!0 (BitStream!5784 (_ BitVec 32)) tuple2!14244)

(assert (=> d!52590 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7575 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12939 () Bool)

(assert (= bs!12939 d!52590))

(declare-fun m!246471 () Bool)

(assert (=> bs!12939 m!246471))

(assert (=> b!157463 d!52590))

(declare-fun d!52592 () Bool)

(declare-datatypes ((tuple2!14246 0))(
  ( (tuple2!14247 (_1!7576 (_ BitVec 8)) (_2!7576 BitStream!5784)) )
))
(declare-fun lt!247362 () tuple2!14246)

(declare-fun readByte!0 (BitStream!5784) tuple2!14246)

(assert (=> d!52592 (= lt!247362 (readByte!0 bs!65))))

(assert (=> d!52592 (= (readBytePure!0 bs!65) (tuple2!14231 (_2!7576 lt!247362) (_1!7576 lt!247362)))))

(declare-fun bs!12940 () Bool)

(assert (= bs!12940 d!52592))

(declare-fun m!246473 () Bool)

(assert (=> bs!12940 m!246473))

(assert (=> b!157463 d!52592))

(declare-fun d!52594 () Bool)

(declare-fun lt!247363 () tuple3!670)

(assert (=> d!52594 (= lt!247363 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52594 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14229 (_2!7574 lt!247363) (_3!452 lt!247363)))))

(declare-fun bs!12941 () Bool)

(assert (= bs!12941 d!52594))

(declare-fun m!246475 () Bool)

(assert (=> bs!12941 m!246475))

(assert (=> b!157463 d!52594))

(declare-fun d!52596 () Bool)

(declare-fun res!131599 () Bool)

(declare-fun e!106744 () Bool)

(assert (=> d!52596 (=> res!131599 e!106744)))

(assert (=> d!52596 (= res!131599 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52596 (= (arrayRangesEq!438 (_2!7564 lt!247335) (_2!7564 lt!247336) #b00000000000000000000000000000000 to!236) e!106744)))

(declare-fun b!157494 () Bool)

(declare-fun e!106745 () Bool)

(assert (=> b!157494 (= e!106744 e!106745)))

(declare-fun res!131600 () Bool)

(assert (=> b!157494 (=> (not res!131600) (not e!106745))))

(assert (=> b!157494 (= res!131600 (= (select (arr!4185 (_2!7564 lt!247335)) #b00000000000000000000000000000000) (select (arr!4185 (_2!7564 lt!247336)) #b00000000000000000000000000000000)))))

(declare-fun b!157495 () Bool)

(assert (=> b!157495 (= e!106745 (arrayRangesEq!438 (_2!7564 lt!247335) (_2!7564 lt!247336) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52596 (not res!131599)) b!157494))

(assert (= (and b!157494 res!131600) b!157495))

(declare-fun m!246477 () Bool)

(assert (=> b!157494 m!246477))

(declare-fun m!246479 () Bool)

(assert (=> b!157494 m!246479))

(declare-fun m!246481 () Bool)

(assert (=> b!157495 m!246481))

(assert (=> b!157464 d!52596))

(check-sat (not d!52592) (not b!157495) (not d!52584) (not d!52594) (not d!52590) (not d!52588) (not d!52586))
(check-sat)
(get-model)

(declare-fun call!2579 () Bool)

(declare-fun lt!247782 () (_ BitVec 32))

(declare-fun lt!247774 () array!7280)

(declare-fun lt!247799 () (_ BitVec 32))

(declare-fun c!8381 () Bool)

(declare-fun lt!247775 () (_ BitVec 32))

(declare-fun bm!2574 () Bool)

(declare-fun lt!247771 () array!7280)

(declare-fun lt!247772 () tuple3!670)

(assert (=> bm!2574 (= call!2579 (arrayRangesEq!438 (ite c!8381 arr!153 lt!247774) (ite c!8381 (_3!452 lt!247772) lt!247771) (ite c!8381 lt!247799 lt!247775) (ite c!8381 from!240 lt!247782)))))

(declare-fun lt!247778 () tuple3!670)

(declare-fun b!157568 () Bool)

(declare-fun e!106800 () Bool)

(assert (=> b!157568 (= e!106800 (= (select (arr!4185 (_3!452 lt!247778)) from!240) (_2!7565 (readBytePure!0 bs!65))))))

(assert (=> b!157568 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3296 (_3!452 lt!247778))))))

(declare-fun b!157569 () Bool)

(declare-fun e!106798 () tuple3!670)

(declare-fun lt!247788 () Unit!10364)

(assert (=> b!157569 (= e!106798 (tuple3!671 lt!247788 bs!65 arr!153))))

(declare-fun call!2578 () (_ BitVec 64))

(assert (=> b!157569 (= call!2578 call!2578)))

(declare-fun lt!247776 () Unit!10364)

(declare-fun Unit!10397 () Unit!10364)

(assert (=> b!157569 (= lt!247776 Unit!10397)))

(declare-fun lt!247787 () Unit!10364)

(declare-fun arrayRangesEqReflexiveLemma!47 (array!7280) Unit!10364)

(assert (=> b!157569 (= lt!247787 (arrayRangesEqReflexiveLemma!47 arr!153))))

(declare-fun call!2577 () Bool)

(assert (=> b!157569 call!2577))

(declare-fun lt!247793 () Unit!10364)

(assert (=> b!157569 (= lt!247793 lt!247787)))

(assert (=> b!157569 (= lt!247774 arr!153)))

(assert (=> b!157569 (= lt!247771 arr!153)))

(declare-fun lt!247801 () (_ BitVec 32))

(assert (=> b!157569 (= lt!247801 #b00000000000000000000000000000000)))

(declare-fun lt!247797 () (_ BitVec 32))

(assert (=> b!157569 (= lt!247797 (size!3296 arr!153))))

(assert (=> b!157569 (= lt!247775 #b00000000000000000000000000000000)))

(assert (=> b!157569 (= lt!247782 from!240)))

(declare-fun arrayRangesEqSlicedLemma!47 (array!7280 array!7280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10364)

(assert (=> b!157569 (= lt!247788 (arrayRangesEqSlicedLemma!47 lt!247774 lt!247771 lt!247801 lt!247797 lt!247775 lt!247782))))

(assert (=> b!157569 call!2579))

(declare-fun lt!247796 () tuple2!14246)

(declare-fun bm!2575 () Bool)

(assert (=> bm!2575 (= call!2577 (arrayRangesEq!438 arr!153 (ite c!8381 (array!7281 (store (arr!4185 arr!153) from!240 (_1!7576 lt!247796)) (size!3296 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8381 from!240 (size!3296 arr!153))))))

(declare-fun b!157570 () Bool)

(declare-fun lt!247770 () Unit!10364)

(assert (=> b!157570 (= e!106798 (tuple3!671 lt!247770 (_2!7574 lt!247772) (_3!452 lt!247772)))))

(assert (=> b!157570 (= lt!247796 (readByte!0 bs!65))))

(declare-fun lt!247794 () array!7280)

(assert (=> b!157570 (= lt!247794 (array!7281 (store (arr!4185 arr!153) from!240 (_1!7576 lt!247796)) (size!3296 arr!153)))))

(declare-fun lt!247768 () (_ BitVec 64))

(assert (=> b!157570 (= lt!247768 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!247786 () (_ BitVec 32))

(assert (=> b!157570 (= lt!247786 (bvsub to!236 from!240))))

(declare-fun lt!247789 () Unit!10364)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5784 BitStream!5784 (_ BitVec 64) (_ BitVec 32)) Unit!10364)

(assert (=> b!157570 (= lt!247789 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7576 lt!247796) lt!247768 lt!247786))))

(assert (=> b!157570 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3296 (buf!3766 (_2!7576 lt!247796)))) ((_ sign_extend 32) (currentByte!6911 (_2!7576 lt!247796))) ((_ sign_extend 32) (currentBit!6906 (_2!7576 lt!247796))) (bvsub lt!247786 ((_ extract 31 0) (bvsdiv (bvadd lt!247768 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!247798 () Unit!10364)

(assert (=> b!157570 (= lt!247798 lt!247789)))

(assert (=> b!157570 (= lt!247772 (readByteArrayLoop!0 (_2!7576 lt!247796) lt!247794 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157570 (= call!2578 (bvadd (bitIndex!0 (size!3296 (buf!3766 bs!65)) (currentByte!6911 bs!65) (currentBit!6906 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!247767 () Unit!10364)

(declare-fun Unit!10399 () Unit!10364)

(assert (=> b!157570 (= lt!247767 Unit!10399)))

(assert (=> b!157570 (= (bvadd call!2578 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3296 (buf!3766 (_2!7574 lt!247772))) (currentByte!6911 (_2!7574 lt!247772)) (currentBit!6906 (_2!7574 lt!247772))))))

(declare-fun lt!247784 () Unit!10364)

(declare-fun Unit!10400 () Unit!10364)

(assert (=> b!157570 (= lt!247784 Unit!10400)))

(assert (=> b!157570 (= (bvadd (bitIndex!0 (size!3296 (buf!3766 bs!65)) (currentByte!6911 bs!65) (currentBit!6906 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3296 (buf!3766 (_2!7574 lt!247772))) (currentByte!6911 (_2!7574 lt!247772)) (currentBit!6906 (_2!7574 lt!247772))))))

(declare-fun lt!247791 () Unit!10364)

(declare-fun Unit!10401 () Unit!10364)

(assert (=> b!157570 (= lt!247791 Unit!10401)))

(assert (=> b!157570 (and (= (buf!3766 bs!65) (buf!3766 (_2!7574 lt!247772))) (= (size!3296 arr!153) (size!3296 (_3!452 lt!247772))))))

(declare-fun lt!247773 () Unit!10364)

(declare-fun Unit!10402 () Unit!10364)

(assert (=> b!157570 (= lt!247773 Unit!10402)))

(declare-fun lt!247792 () Unit!10364)

(declare-fun arrayUpdatedAtPrefixLemma!47 (array!7280 (_ BitVec 32) (_ BitVec 8)) Unit!10364)

(assert (=> b!157570 (= lt!247792 (arrayUpdatedAtPrefixLemma!47 arr!153 from!240 (_1!7576 lt!247796)))))

(assert (=> b!157570 call!2577))

(declare-fun lt!247777 () Unit!10364)

(assert (=> b!157570 (= lt!247777 lt!247792)))

(assert (=> b!157570 (= lt!247799 #b00000000000000000000000000000000)))

(declare-fun lt!247779 () Unit!10364)

(declare-fun arrayRangesEqTransitive!112 (array!7280 array!7280 array!7280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10364)

(assert (=> b!157570 (= lt!247779 (arrayRangesEqTransitive!112 arr!153 lt!247794 (_3!452 lt!247772) lt!247799 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157570 call!2579))

(declare-fun lt!247783 () Unit!10364)

(assert (=> b!157570 (= lt!247783 lt!247779)))

(assert (=> b!157570 (arrayRangesEq!438 arr!153 (_3!452 lt!247772) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!247785 () Unit!10364)

(declare-fun Unit!10403 () Unit!10364)

(assert (=> b!157570 (= lt!247785 Unit!10403)))

(declare-fun lt!247800 () Unit!10364)

(declare-fun arrayRangesEqImpliesEq!56 (array!7280 array!7280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10364)

(assert (=> b!157570 (= lt!247800 (arrayRangesEqImpliesEq!56 lt!247794 (_3!452 lt!247772) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157570 (= (select (store (arr!4185 arr!153) from!240 (_1!7576 lt!247796)) from!240) (select (arr!4185 (_3!452 lt!247772)) from!240))))

(declare-fun lt!247790 () Unit!10364)

(assert (=> b!157570 (= lt!247790 lt!247800)))

(declare-fun lt!247781 () Bool)

(assert (=> b!157570 (= lt!247781 (= (select (arr!4185 (_3!452 lt!247772)) from!240) (_1!7576 lt!247796)))))

(declare-fun Unit!10404 () Unit!10364)

(assert (=> b!157570 (= lt!247770 Unit!10404)))

(assert (=> b!157570 lt!247781))

(declare-fun b!157571 () Bool)

(declare-fun res!131655 () Bool)

(declare-fun e!106799 () Bool)

(assert (=> b!157571 (=> (not res!131655) (not e!106799))))

(assert (=> b!157571 (= res!131655 (and (= (buf!3766 bs!65) (buf!3766 (_2!7574 lt!247778))) (= (size!3296 arr!153) (size!3296 (_3!452 lt!247778)))))))

(declare-fun b!157572 () Bool)

(assert (=> b!157572 (= e!106799 (arrayRangesEq!438 arr!153 (_3!452 lt!247778) #b00000000000000000000000000000000 from!240))))

(declare-fun d!52610 () Bool)

(assert (=> d!52610 e!106800))

(declare-fun res!131657 () Bool)

(assert (=> d!52610 (=> res!131657 e!106800)))

(assert (=> d!52610 (= res!131657 (bvsge from!240 to!236))))

(declare-fun lt!247780 () Bool)

(assert (=> d!52610 (= lt!247780 e!106799)))

(declare-fun res!131656 () Bool)

(assert (=> d!52610 (=> (not res!131656) (not e!106799))))

(declare-fun lt!247766 () (_ BitVec 64))

(declare-fun lt!247769 () (_ BitVec 64))

(assert (=> d!52610 (= res!131656 (= (bvadd lt!247769 lt!247766) (bitIndex!0 (size!3296 (buf!3766 (_2!7574 lt!247778))) (currentByte!6911 (_2!7574 lt!247778)) (currentBit!6906 (_2!7574 lt!247778)))))))

(assert (=> d!52610 (or (not (= (bvand lt!247769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247766 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247769 lt!247766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!247795 () (_ BitVec 64))

(assert (=> d!52610 (= lt!247766 (bvmul lt!247795 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52610 (or (= lt!247795 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!247795 #b0000000000000000000000000000000000000000000000000000000000001000) lt!247795)))))

(assert (=> d!52610 (= lt!247795 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52610 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52610 (= lt!247769 (bitIndex!0 (size!3296 (buf!3766 bs!65)) (currentByte!6911 bs!65) (currentBit!6906 bs!65)))))

(assert (=> d!52610 (= lt!247778 e!106798)))

(assert (=> d!52610 (= c!8381 (bvslt from!240 to!236))))

(assert (=> d!52610 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3296 arr!153)))))

(assert (=> d!52610 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!247778)))

(declare-fun bm!2576 () Bool)

(assert (=> bm!2576 (= call!2578 (bitIndex!0 (ite c!8381 (size!3296 (buf!3766 (_2!7576 lt!247796))) (size!3296 (buf!3766 bs!65))) (ite c!8381 (currentByte!6911 (_2!7576 lt!247796)) (currentByte!6911 bs!65)) (ite c!8381 (currentBit!6906 (_2!7576 lt!247796)) (currentBit!6906 bs!65))))))

(assert (= (and d!52610 c!8381) b!157570))

(assert (= (and d!52610 (not c!8381)) b!157569))

(assert (= (or b!157570 b!157569) bm!2575))

(assert (= (or b!157570 b!157569) bm!2574))

(assert (= (or b!157570 b!157569) bm!2576))

(assert (= (and d!52610 res!131656) b!157571))

(assert (= (and b!157571 res!131655) b!157572))

(assert (= (and d!52610 (not res!131657)) b!157568))

(declare-fun m!246683 () Bool)

(assert (=> bm!2576 m!246683))

(declare-fun m!246685 () Bool)

(assert (=> bm!2574 m!246685))

(declare-fun m!246687 () Bool)

(assert (=> b!157572 m!246687))

(declare-fun m!246689 () Bool)

(assert (=> b!157568 m!246689))

(assert (=> b!157568 m!246397))

(declare-fun m!246691 () Bool)

(assert (=> b!157569 m!246691))

(declare-fun m!246693 () Bool)

(assert (=> b!157569 m!246693))

(declare-fun m!246695 () Bool)

(assert (=> b!157570 m!246695))

(declare-fun m!246697 () Bool)

(assert (=> b!157570 m!246697))

(declare-fun m!246699 () Bool)

(assert (=> b!157570 m!246699))

(declare-fun m!246701 () Bool)

(assert (=> b!157570 m!246701))

(declare-fun m!246703 () Bool)

(assert (=> b!157570 m!246703))

(declare-fun m!246705 () Bool)

(assert (=> b!157570 m!246705))

(declare-fun m!246707 () Bool)

(assert (=> b!157570 m!246707))

(declare-fun m!246709 () Bool)

(assert (=> b!157570 m!246709))

(assert (=> b!157570 m!246473))

(declare-fun m!246711 () Bool)

(assert (=> b!157570 m!246711))

(declare-fun m!246713 () Bool)

(assert (=> b!157570 m!246713))

(declare-fun m!246715 () Bool)

(assert (=> b!157570 m!246715))

(declare-fun m!246717 () Bool)

(assert (=> b!157570 m!246717))

(declare-fun m!246719 () Bool)

(assert (=> d!52610 m!246719))

(assert (=> d!52610 m!246695))

(assert (=> bm!2575 m!246703))

(declare-fun m!246721 () Bool)

(assert (=> bm!2575 m!246721))

(assert (=> d!52594 d!52610))

(declare-fun d!52628 () Bool)

(declare-fun lt!247822 () (_ BitVec 8))

(declare-fun lt!247816 () (_ BitVec 8))

(assert (=> d!52628 (= lt!247822 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4185 (buf!3766 bs!65)) (currentByte!6911 bs!65))) ((_ sign_extend 24) lt!247816))))))

(assert (=> d!52628 (= lt!247816 ((_ extract 7 0) (currentBit!6906 bs!65)))))

(declare-fun e!106805 () Bool)

(assert (=> d!52628 e!106805))

(declare-fun res!131664 () Bool)

(assert (=> d!52628 (=> (not res!131664) (not e!106805))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52628 (= res!131664 (validate_offset_bits!1 ((_ sign_extend 32) (size!3296 (buf!3766 bs!65))) ((_ sign_extend 32) (currentByte!6911 bs!65)) ((_ sign_extend 32) (currentBit!6906 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14252 0))(
  ( (tuple2!14253 (_1!7579 Unit!10364) (_2!7579 (_ BitVec 8))) )
))
(declare-fun Unit!10405 () Unit!10364)

(declare-fun Unit!10407 () Unit!10364)

(assert (=> d!52628 (= (readByte!0 bs!65) (tuple2!14247 (_2!7579 (ite (bvsgt ((_ sign_extend 24) lt!247816) #b00000000000000000000000000000000) (tuple2!14253 Unit!10405 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247822) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4185 (buf!3766 bs!65)) (bvadd (currentByte!6911 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247816)))))))) (tuple2!14253 Unit!10407 lt!247822))) (BitStream!5785 (buf!3766 bs!65) (bvadd (currentByte!6911 bs!65) #b00000000000000000000000000000001) (currentBit!6906 bs!65))))))

(declare-fun b!157577 () Bool)

(declare-fun e!106806 () Bool)

(assert (=> b!157577 (= e!106805 e!106806)))

(declare-fun res!131663 () Bool)

(assert (=> b!157577 (=> (not res!131663) (not e!106806))))

(declare-fun lt!247819 () tuple2!14246)

(assert (=> b!157577 (= res!131663 (= (buf!3766 (_2!7576 lt!247819)) (buf!3766 bs!65)))))

(declare-fun lt!247821 () (_ BitVec 8))

(declare-fun lt!247818 () (_ BitVec 8))

(declare-fun Unit!10409 () Unit!10364)

(declare-fun Unit!10410 () Unit!10364)

(assert (=> b!157577 (= lt!247819 (tuple2!14247 (_2!7579 (ite (bvsgt ((_ sign_extend 24) lt!247818) #b00000000000000000000000000000000) (tuple2!14253 Unit!10409 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!247821) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4185 (buf!3766 bs!65)) (bvadd (currentByte!6911 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!247818)))))))) (tuple2!14253 Unit!10410 lt!247821))) (BitStream!5785 (buf!3766 bs!65) (bvadd (currentByte!6911 bs!65) #b00000000000000000000000000000001) (currentBit!6906 bs!65))))))

(assert (=> b!157577 (= lt!247821 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4185 (buf!3766 bs!65)) (currentByte!6911 bs!65))) ((_ sign_extend 24) lt!247818))))))

(assert (=> b!157577 (= lt!247818 ((_ extract 7 0) (currentBit!6906 bs!65)))))

(declare-fun lt!247820 () (_ BitVec 64))

(declare-fun b!157578 () Bool)

(declare-fun lt!247817 () (_ BitVec 64))

(assert (=> b!157578 (= e!106806 (= (bitIndex!0 (size!3296 (buf!3766 (_2!7576 lt!247819))) (currentByte!6911 (_2!7576 lt!247819)) (currentBit!6906 (_2!7576 lt!247819))) (bvadd lt!247817 lt!247820)))))

(assert (=> b!157578 (or (not (= (bvand lt!247817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247820 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247817 lt!247820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157578 (= lt!247820 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157578 (= lt!247817 (bitIndex!0 (size!3296 (buf!3766 bs!65)) (currentByte!6911 bs!65) (currentBit!6906 bs!65)))))

(assert (= (and d!52628 res!131664) b!157577))

(assert (= (and b!157577 res!131663) b!157578))

(declare-fun m!246723 () Bool)

(assert (=> d!52628 m!246723))

(declare-fun m!246725 () Bool)

(assert (=> d!52628 m!246725))

(declare-fun m!246727 () Bool)

(assert (=> d!52628 m!246727))

(assert (=> b!157577 m!246727))

(assert (=> b!157577 m!246723))

(declare-fun m!246729 () Bool)

(assert (=> b!157578 m!246729))

(assert (=> b!157578 m!246695))

(assert (=> d!52592 d!52628))

(declare-fun d!52630 () Bool)

(assert (=> d!52630 (= (invariant!0 (currentBit!6906 bs!65) (currentByte!6911 bs!65) (size!3296 (buf!3766 bs!65))) (and (bvsge (currentBit!6906 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6906 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6911 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6911 bs!65) (size!3296 (buf!3766 bs!65))) (and (= (currentBit!6906 bs!65) #b00000000000000000000000000000000) (= (currentByte!6911 bs!65) (size!3296 (buf!3766 bs!65)))))))))

(assert (=> d!52584 d!52630))

(declare-fun d!52632 () Bool)

(declare-fun e!106809 () Bool)

(assert (=> d!52632 e!106809))

(declare-fun res!131667 () Bool)

(assert (=> d!52632 (=> (not res!131667) (not e!106809))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5784 (_ BitVec 32)) Bool)

(assert (=> d!52632 (= res!131667 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10413 () Unit!10364)

(assert (=> d!52632 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14245 Unit!10413 (BitStream!5785 (buf!3766 bs!65) (bvadd (currentByte!6911 bs!65) #b00000000000000000000000000000001) (currentBit!6906 bs!65))))))

(declare-fun b!157581 () Bool)

(assert (=> b!157581 (= e!106809 (and (or (not (= (bvand (currentByte!6911 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6911 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6911 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6911 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6911 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52632 res!131667) b!157581))

(declare-fun m!246731 () Bool)

(assert (=> d!52632 m!246731))

(assert (=> d!52590 d!52632))

(declare-fun d!52634 () Bool)

(declare-fun res!131668 () Bool)

(declare-fun e!106810 () Bool)

(assert (=> d!52634 (=> res!131668 e!106810)))

(assert (=> d!52634 (= res!131668 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52634 (= (arrayRangesEq!438 (_2!7564 lt!247335) (_2!7564 lt!247336) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!106810)))

(declare-fun b!157582 () Bool)

(declare-fun e!106811 () Bool)

(assert (=> b!157582 (= e!106810 e!106811)))

(declare-fun res!131669 () Bool)

(assert (=> b!157582 (=> (not res!131669) (not e!106811))))

(assert (=> b!157582 (= res!131669 (= (select (arr!4185 (_2!7564 lt!247335)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4185 (_2!7564 lt!247336)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!157583 () Bool)

(assert (=> b!157583 (= e!106811 (arrayRangesEq!438 (_2!7564 lt!247335) (_2!7564 lt!247336) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52634 (not res!131668)) b!157582))

(assert (= (and b!157582 res!131669) b!157583))

(declare-fun m!246733 () Bool)

(assert (=> b!157582 m!246733))

(declare-fun m!246735 () Bool)

(assert (=> b!157582 m!246735))

(declare-fun m!246737 () Bool)

(assert (=> b!157583 m!246737))

(assert (=> b!157495 d!52634))

(declare-fun c!8382 () Bool)

(declare-fun call!2582 () Bool)

(declare-fun lt!247829 () tuple3!670)

(declare-fun lt!247856 () (_ BitVec 32))

(declare-fun lt!247832 () (_ BitVec 32))

(declare-fun lt!247839 () (_ BitVec 32))

(declare-fun lt!247831 () array!7280)

(declare-fun lt!247828 () array!7280)

(declare-fun bm!2577 () Bool)

(assert (=> bm!2577 (= call!2582 (arrayRangesEq!438 (ite c!8382 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) lt!247831) (ite c!8382 (_3!452 lt!247829) lt!247828) (ite c!8382 lt!247856 lt!247832) (ite c!8382 (bvadd #b00000000000000000000000000000001 from!240) lt!247839)))))

(declare-fun b!157584 () Bool)

(declare-fun e!106814 () Bool)

(declare-fun lt!247835 () tuple3!670)

(assert (=> b!157584 (= e!106814 (= (select (arr!4185 (_3!452 lt!247835)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7565 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!157584 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3296 (_3!452 lt!247835))))))

(declare-fun b!157585 () Bool)

(declare-fun lt!247845 () Unit!10364)

(declare-fun e!106812 () tuple3!670)

(assert (=> b!157585 (= e!106812 (tuple3!671 lt!247845 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))))))

(declare-fun call!2581 () (_ BitVec 64))

(assert (=> b!157585 (= call!2581 call!2581)))

(declare-fun lt!247833 () Unit!10364)

(declare-fun Unit!10416 () Unit!10364)

(assert (=> b!157585 (= lt!247833 Unit!10416)))

(declare-fun lt!247844 () Unit!10364)

(assert (=> b!157585 (= lt!247844 (arrayRangesEqReflexiveLemma!47 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))))))

(declare-fun call!2580 () Bool)

(assert (=> b!157585 call!2580))

(declare-fun lt!247850 () Unit!10364)

(assert (=> b!157585 (= lt!247850 lt!247844)))

(assert (=> b!157585 (= lt!247831 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)))))

(assert (=> b!157585 (= lt!247828 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)))))

(declare-fun lt!247858 () (_ BitVec 32))

(assert (=> b!157585 (= lt!247858 #b00000000000000000000000000000000)))

(declare-fun lt!247854 () (_ BitVec 32))

(assert (=> b!157585 (= lt!247854 (size!3296 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))))))

(assert (=> b!157585 (= lt!247832 #b00000000000000000000000000000000)))

(assert (=> b!157585 (= lt!247839 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!157585 (= lt!247845 (arrayRangesEqSlicedLemma!47 lt!247831 lt!247828 lt!247858 lt!247854 lt!247832 lt!247839))))

(assert (=> b!157585 call!2582))

(declare-fun lt!247853 () tuple2!14246)

(declare-fun bm!2578 () Bool)

(assert (=> bm!2578 (= call!2580 (arrayRangesEq!438 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) (ite c!8382 (array!7281 (store (arr!4185 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7576 lt!247853)) (size!3296 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)))) (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))) #b00000000000000000000000000000000 (ite c!8382 (bvadd #b00000000000000000000000000000001 from!240) (size!3296 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))))))))

(declare-fun b!157586 () Bool)

(declare-fun lt!247827 () Unit!10364)

(assert (=> b!157586 (= e!106812 (tuple3!671 lt!247827 (_2!7574 lt!247829) (_3!452 lt!247829)))))

(assert (=> b!157586 (= lt!247853 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!247851 () array!7280)

(assert (=> b!157586 (= lt!247851 (array!7281 (store (arr!4185 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7576 lt!247853)) (size!3296 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)))))))

(declare-fun lt!247825 () (_ BitVec 64))

(assert (=> b!157586 (= lt!247825 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!247843 () (_ BitVec 32))

(assert (=> b!157586 (= lt!247843 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!247846 () Unit!10364)

(assert (=> b!157586 (= lt!247846 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7576 lt!247853) lt!247825 lt!247843))))

(assert (=> b!157586 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3296 (buf!3766 (_2!7576 lt!247853)))) ((_ sign_extend 32) (currentByte!6911 (_2!7576 lt!247853))) ((_ sign_extend 32) (currentBit!6906 (_2!7576 lt!247853))) (bvsub lt!247843 ((_ extract 31 0) (bvsdiv (bvadd lt!247825 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!247855 () Unit!10364)

(assert (=> b!157586 (= lt!247855 lt!247846)))

(assert (=> b!157586 (= lt!247829 (readByteArrayLoop!0 (_2!7576 lt!247853) lt!247851 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157586 (= call!2581 (bvadd (bitIndex!0 (size!3296 (buf!3766 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6911 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6906 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!247824 () Unit!10364)

(declare-fun Unit!10417 () Unit!10364)

(assert (=> b!157586 (= lt!247824 Unit!10417)))

(assert (=> b!157586 (= (bvadd call!2581 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3296 (buf!3766 (_2!7574 lt!247829))) (currentByte!6911 (_2!7574 lt!247829)) (currentBit!6906 (_2!7574 lt!247829))))))

(declare-fun lt!247841 () Unit!10364)

(declare-fun Unit!10418 () Unit!10364)

(assert (=> b!157586 (= lt!247841 Unit!10418)))

(assert (=> b!157586 (= (bvadd (bitIndex!0 (size!3296 (buf!3766 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6911 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6906 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3296 (buf!3766 (_2!7574 lt!247829))) (currentByte!6911 (_2!7574 lt!247829)) (currentBit!6906 (_2!7574 lt!247829))))))

(declare-fun lt!247848 () Unit!10364)

(declare-fun Unit!10419 () Unit!10364)

(assert (=> b!157586 (= lt!247848 Unit!10419)))

(assert (=> b!157586 (and (= (buf!3766 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3766 (_2!7574 lt!247829))) (= (size!3296 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))) (size!3296 (_3!452 lt!247829))))))

(declare-fun lt!247830 () Unit!10364)

(declare-fun Unit!10420 () Unit!10364)

(assert (=> b!157586 (= lt!247830 Unit!10420)))

(declare-fun lt!247849 () Unit!10364)

(assert (=> b!157586 (= lt!247849 (arrayUpdatedAtPrefixLemma!47 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7576 lt!247853)))))

(assert (=> b!157586 call!2580))

(declare-fun lt!247834 () Unit!10364)

(assert (=> b!157586 (= lt!247834 lt!247849)))

(assert (=> b!157586 (= lt!247856 #b00000000000000000000000000000000)))

(declare-fun lt!247836 () Unit!10364)

(assert (=> b!157586 (= lt!247836 (arrayRangesEqTransitive!112 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) lt!247851 (_3!452 lt!247829) lt!247856 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157586 call!2582))

(declare-fun lt!247840 () Unit!10364)

(assert (=> b!157586 (= lt!247840 lt!247836)))

(assert (=> b!157586 (arrayRangesEq!438 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) (_3!452 lt!247829) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!247842 () Unit!10364)

(declare-fun Unit!10421 () Unit!10364)

(assert (=> b!157586 (= lt!247842 Unit!10421)))

(declare-fun lt!247857 () Unit!10364)

(assert (=> b!157586 (= lt!247857 (arrayRangesEqImpliesEq!56 lt!247851 (_3!452 lt!247829) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157586 (= (select (store (arr!4185 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7576 lt!247853)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4185 (_3!452 lt!247829)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!247847 () Unit!10364)

(assert (=> b!157586 (= lt!247847 lt!247857)))

(declare-fun lt!247838 () Bool)

(assert (=> b!157586 (= lt!247838 (= (select (arr!4185 (_3!452 lt!247829)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7576 lt!247853)))))

(declare-fun Unit!10422 () Unit!10364)

(assert (=> b!157586 (= lt!247827 Unit!10422)))

(assert (=> b!157586 lt!247838))

(declare-fun b!157587 () Bool)

(declare-fun res!131670 () Bool)

(declare-fun e!106813 () Bool)

(assert (=> b!157587 (=> (not res!131670) (not e!106813))))

(assert (=> b!157587 (= res!131670 (and (= (buf!3766 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3766 (_2!7574 lt!247835))) (= (size!3296 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153))) (size!3296 (_3!452 lt!247835)))))))

(declare-fun b!157588 () Bool)

(assert (=> b!157588 (= e!106813 (arrayRangesEq!438 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) (_3!452 lt!247835) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun d!52636 () Bool)

(assert (=> d!52636 e!106814))

(declare-fun res!131672 () Bool)

(assert (=> d!52636 (=> res!131672 e!106814)))

(assert (=> d!52636 (= res!131672 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247837 () Bool)

(assert (=> d!52636 (= lt!247837 e!106813)))

(declare-fun res!131671 () Bool)

(assert (=> d!52636 (=> (not res!131671) (not e!106813))))

(declare-fun lt!247826 () (_ BitVec 64))

(declare-fun lt!247823 () (_ BitVec 64))

(assert (=> d!52636 (= res!131671 (= (bvadd lt!247826 lt!247823) (bitIndex!0 (size!3296 (buf!3766 (_2!7574 lt!247835))) (currentByte!6911 (_2!7574 lt!247835)) (currentBit!6906 (_2!7574 lt!247835)))))))

(assert (=> d!52636 (or (not (= (bvand lt!247826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!247823 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247826 lt!247823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!247852 () (_ BitVec 64))

(assert (=> d!52636 (= lt!247823 (bvmul lt!247852 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52636 (or (= lt!247852 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!247852 #b0000000000000000000000000000000000000000000000000000000000001000) lt!247852)))))

(assert (=> d!52636 (= lt!247852 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52636 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52636 (= lt!247826 (bitIndex!0 (size!3296 (buf!3766 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6911 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6906 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(assert (=> d!52636 (= lt!247835 e!106812)))

(assert (=> d!52636 (= c!8382 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52636 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3296 (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)))))))

(assert (=> d!52636 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7281 (store (arr!4185 arr!153) from!240 (_2!7565 (readBytePure!0 bs!65))) (size!3296 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!247835)))

(declare-fun bm!2579 () Bool)

(assert (=> bm!2579 (= call!2581 (bitIndex!0 (ite c!8382 (size!3296 (buf!3766 (_2!7576 lt!247853))) (size!3296 (buf!3766 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))) (ite c!8382 (currentByte!6911 (_2!7576 lt!247853)) (currentByte!6911 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (ite c!8382 (currentBit!6906 (_2!7576 lt!247853)) (currentBit!6906 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (= (and d!52636 c!8382) b!157586))

(assert (= (and d!52636 (not c!8382)) b!157585))

(assert (= (or b!157586 b!157585) bm!2578))

(assert (= (or b!157586 b!157585) bm!2577))

(assert (= (or b!157586 b!157585) bm!2579))

(assert (= (and d!52636 res!131671) b!157587))

(assert (= (and b!157587 res!131670) b!157588))

(assert (= (and d!52636 (not res!131672)) b!157584))

(declare-fun m!246739 () Bool)

(assert (=> bm!2579 m!246739))

(declare-fun m!246741 () Bool)

(assert (=> bm!2577 m!246741))

(declare-fun m!246743 () Bool)

(assert (=> b!157588 m!246743))

(declare-fun m!246745 () Bool)

(assert (=> b!157584 m!246745))

(assert (=> b!157584 m!246399))

(declare-fun m!246747 () Bool)

(assert (=> b!157584 m!246747))

(declare-fun m!246749 () Bool)

(assert (=> b!157585 m!246749))

(declare-fun m!246751 () Bool)

(assert (=> b!157585 m!246751))

(declare-fun m!246753 () Bool)

(assert (=> b!157586 m!246753))

(declare-fun m!246755 () Bool)

(assert (=> b!157586 m!246755))

(declare-fun m!246757 () Bool)

(assert (=> b!157586 m!246757))

(declare-fun m!246759 () Bool)

(assert (=> b!157586 m!246759))

(declare-fun m!246761 () Bool)

(assert (=> b!157586 m!246761))

(declare-fun m!246763 () Bool)

(assert (=> b!157586 m!246763))

(declare-fun m!246765 () Bool)

(assert (=> b!157586 m!246765))

(declare-fun m!246767 () Bool)

(assert (=> b!157586 m!246767))

(assert (=> b!157586 m!246399))

(declare-fun m!246769 () Bool)

(assert (=> b!157586 m!246769))

(declare-fun m!246771 () Bool)

(assert (=> b!157586 m!246771))

(declare-fun m!246773 () Bool)

(assert (=> b!157586 m!246773))

(assert (=> b!157586 m!246399))

(declare-fun m!246775 () Bool)

(assert (=> b!157586 m!246775))

(declare-fun m!246777 () Bool)

(assert (=> b!157586 m!246777))

(declare-fun m!246779 () Bool)

(assert (=> d!52636 m!246779))

(assert (=> d!52636 m!246753))

(assert (=> bm!2578 m!246761))

(declare-fun m!246781 () Bool)

(assert (=> bm!2578 m!246781))

(assert (=> d!52588 d!52636))

(declare-fun d!52638 () Bool)

(assert (=> d!52638 (= (remainingBits!0 ((_ sign_extend 32) (size!3296 (buf!3766 bs!65))) ((_ sign_extend 32) (currentByte!6911 bs!65)) ((_ sign_extend 32) (currentBit!6906 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3296 (buf!3766 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6911 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6906 bs!65)))))))

(assert (=> d!52586 d!52638))

(check-sat (not b!157570) (not b!157588) (not bm!2575) (not d!52632) (not b!157585) (not bm!2576) (not bm!2579) (not b!157568) (not b!157583) (not bm!2577) (not b!157584) (not b!157572) (not b!157569) (not b!157586) (not d!52636) (not d!52610) (not b!157578) (not bm!2578) (not bm!2574) (not d!52628))
(check-sat)
