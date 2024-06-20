; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66378 () Bool)

(assert start!66378)

(declare-fun lt!433733 () (_ BitVec 64))

(declare-fun e!212993 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun b!297503 () Bool)

(declare-fun lt!433737 () (_ BitVec 64))

(assert (=> b!297503 (= e!212993 (not (or (not (= lt!433737 (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!433737 (bvand (bvadd lt!433733 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!297503 (= lt!433737 (bvand lt!433733 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!17815 0))(
  ( (array!17816 (arr!8801 (Array (_ BitVec 32) (_ BitVec 8))) (size!7721 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13446 0))(
  ( (BitStream!13447 (buf!7784 array!17815) (currentByte!14326 (_ BitVec 32)) (currentBit!14321 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13446)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297503 (= lt!433733 (bitIndex!0 (size!7721 (buf!7784 thiss!1728)) (currentByte!14326 thiss!1728) (currentBit!14321 thiss!1728)))))

(declare-fun arr!273 () array!17815)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17815 array!17815 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297503 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20763 0))(
  ( (Unit!20764) )
))
(declare-fun lt!433735 () Unit!20763)

(declare-fun lt!433734 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17815 array!17815 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20763)

(assert (=> b!297503 (= lt!433735 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433734 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297503 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433734)))

(assert (=> b!297503 (= lt!433734 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7721 arr!273))))))

(declare-fun lt!433736 () Unit!20763)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17815) Unit!20763)

(assert (=> b!297503 (= lt!433736 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297502 () Bool)

(declare-fun res!245538 () Bool)

(assert (=> b!297502 (=> (not res!245538) (not e!212993))))

(assert (=> b!297502 (= res!245538 (bvsge from!505 to!474))))

(declare-fun res!245539 () Bool)

(assert (=> start!66378 (=> (not res!245539) (not e!212993))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!66378 (= res!245539 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7721 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66378 e!212993))

(declare-fun e!212992 () Bool)

(declare-fun inv!12 (BitStream!13446) Bool)

(assert (=> start!66378 (and (inv!12 thiss!1728) e!212992)))

(assert (=> start!66378 true))

(declare-fun array_inv!7333 (array!17815) Bool)

(assert (=> start!66378 (array_inv!7333 arr!273)))

(declare-fun b!297504 () Bool)

(assert (=> b!297504 (= e!212992 (array_inv!7333 (buf!7784 thiss!1728)))))

(declare-fun b!297501 () Bool)

(declare-fun res!245540 () Bool)

(assert (=> b!297501 (=> (not res!245540) (not e!212993))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297501 (= res!245540 (validate_offset_bits!1 ((_ sign_extend 32) (size!7721 (buf!7784 thiss!1728))) ((_ sign_extend 32) (currentByte!14326 thiss!1728)) ((_ sign_extend 32) (currentBit!14321 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!66378 res!245539) b!297501))

(assert (= (and b!297501 res!245540) b!297502))

(assert (= (and b!297502 res!245538) b!297503))

(assert (= start!66378 b!297504))

(declare-fun m!436327 () Bool)

(assert (=> b!297503 m!436327))

(declare-fun m!436329 () Bool)

(assert (=> b!297503 m!436329))

(declare-fun m!436331 () Bool)

(assert (=> b!297503 m!436331))

(declare-fun m!436333 () Bool)

(assert (=> b!297503 m!436333))

(declare-fun m!436335 () Bool)

(assert (=> b!297503 m!436335))

(declare-fun m!436337 () Bool)

(assert (=> start!66378 m!436337))

(declare-fun m!436339 () Bool)

(assert (=> start!66378 m!436339))

(declare-fun m!436341 () Bool)

(assert (=> b!297504 m!436341))

(declare-fun m!436343 () Bool)

(assert (=> b!297501 m!436343))

(check-sat (not b!297503) (not b!297501) (not b!297504) (not start!66378))
(check-sat)
(get-model)

(declare-fun d!100180 () Bool)

(declare-fun e!213009 () Bool)

(assert (=> d!100180 e!213009))

(declare-fun res!245552 () Bool)

(assert (=> d!100180 (=> (not res!245552) (not e!213009))))

(declare-fun lt!433758 () (_ BitVec 64))

(assert (=> d!100180 (= res!245552 (or (= lt!433758 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433758 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433758))))))

(assert (=> d!100180 (= lt!433758 ((_ sign_extend 32) (size!7721 arr!273)))))

(declare-fun lt!433757 () Unit!20763)

(declare-fun choose!59 (array!17815) Unit!20763)

(assert (=> d!100180 (= lt!433757 (choose!59 arr!273))))

(assert (=> d!100180 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!433757)))

(declare-fun b!297519 () Bool)

(assert (=> b!297519 (= e!213009 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7721 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100180 res!245552) b!297519))

(declare-fun m!436363 () Bool)

(assert (=> d!100180 m!436363))

(declare-fun m!436365 () Bool)

(assert (=> b!297519 m!436365))

(assert (=> b!297503 d!100180))

(declare-fun b!297558 () Bool)

(declare-fun e!213046 () Bool)

(declare-fun e!213043 () Bool)

(assert (=> b!297558 (= e!213046 e!213043)))

(declare-fun res!245585 () Bool)

(assert (=> b!297558 (=> (not res!245585) (not e!213043))))

(declare-fun e!213048 () Bool)

(assert (=> b!297558 (= res!245585 e!213048)))

(declare-fun res!245582 () Bool)

(assert (=> b!297558 (=> res!245582 e!213048)))

(declare-datatypes ((tuple4!920 0))(
  ( (tuple4!921 (_1!13109 (_ BitVec 32)) (_2!13109 (_ BitVec 32)) (_3!1417 (_ BitVec 32)) (_4!460 (_ BitVec 32))) )
))
(declare-fun lt!433780 () tuple4!920)

(assert (=> b!297558 (= res!245582 (bvsge (_1!13109 lt!433780) (_2!13109 lt!433780)))))

(declare-fun lt!433782 () (_ BitVec 32))

(assert (=> b!297558 (= lt!433782 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433781 () (_ BitVec 32))

(assert (=> b!297558 (= lt!433781 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!920)

(assert (=> b!297558 (= lt!433780 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!100184 () Bool)

(declare-fun res!245583 () Bool)

(assert (=> d!100184 (=> res!245583 e!213046)))

(assert (=> d!100184 (= res!245583 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100184 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213046)))

(declare-fun b!297559 () Bool)

(declare-fun arrayRangesEq!1518 (array!17815 array!17815 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297559 (= e!213048 (arrayRangesEq!1518 arr!273 arr!273 (_1!13109 lt!433780) (_2!13109 lt!433780)))))

(declare-fun b!297560 () Bool)

(declare-fun res!245581 () Bool)

(assert (=> b!297560 (= res!245581 (= lt!433782 #b00000000000000000000000000000000))))

(declare-fun e!213047 () Bool)

(assert (=> b!297560 (=> res!245581 e!213047)))

(declare-fun e!213044 () Bool)

(assert (=> b!297560 (= e!213044 e!213047)))

(declare-fun c!13611 () Bool)

(declare-fun call!5249 () Bool)

(declare-fun bm!5246 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5246 (= call!5249 (byteRangesEq!0 (select (arr!8801 arr!273) (_3!1417 lt!433780)) (select (arr!8801 arr!273) (_3!1417 lt!433780)) lt!433781 (ite c!13611 lt!433782 #b00000000000000000000000000001000)))))

(declare-fun b!297561 () Bool)

(declare-fun e!213045 () Bool)

(assert (=> b!297561 (= e!213043 e!213045)))

(assert (=> b!297561 (= c!13611 (= (_3!1417 lt!433780) (_4!460 lt!433780)))))

(declare-fun b!297562 () Bool)

(assert (=> b!297562 (= e!213045 e!213044)))

(declare-fun res!245584 () Bool)

(assert (=> b!297562 (= res!245584 call!5249)))

(assert (=> b!297562 (=> (not res!245584) (not e!213044))))

(declare-fun b!297563 () Bool)

(assert (=> b!297563 (= e!213045 call!5249)))

(declare-fun b!297564 () Bool)

(assert (=> b!297564 (= e!213047 (byteRangesEq!0 (select (arr!8801 arr!273) (_4!460 lt!433780)) (select (arr!8801 arr!273) (_4!460 lt!433780)) #b00000000000000000000000000000000 lt!433782))))

(assert (= (and d!100184 (not res!245583)) b!297558))

(assert (= (and b!297558 (not res!245582)) b!297559))

(assert (= (and b!297558 res!245585) b!297561))

(assert (= (and b!297561 c!13611) b!297563))

(assert (= (and b!297561 (not c!13611)) b!297562))

(assert (= (and b!297562 res!245584) b!297560))

(assert (= (and b!297560 (not res!245581)) b!297564))

(assert (= (or b!297563 b!297562) bm!5246))

(declare-fun m!436383 () Bool)

(assert (=> b!297558 m!436383))

(declare-fun m!436385 () Bool)

(assert (=> b!297559 m!436385))

(declare-fun m!436387 () Bool)

(assert (=> bm!5246 m!436387))

(assert (=> bm!5246 m!436387))

(assert (=> bm!5246 m!436387))

(assert (=> bm!5246 m!436387))

(declare-fun m!436389 () Bool)

(assert (=> bm!5246 m!436389))

(declare-fun m!436391 () Bool)

(assert (=> b!297564 m!436391))

(assert (=> b!297564 m!436391))

(assert (=> b!297564 m!436391))

(assert (=> b!297564 m!436391))

(declare-fun m!436393 () Bool)

(assert (=> b!297564 m!436393))

(assert (=> b!297503 d!100184))

(declare-fun d!100192 () Bool)

(assert (=> d!100192 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433812 () Unit!20763)

(declare-fun choose!4 (array!17815 array!17815 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20763)

(assert (=> d!100192 (= lt!433812 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433734 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100192 (bvsle (size!7721 arr!273) (size!7721 arr!273))))

(assert (=> d!100192 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433734 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!433812)))

(declare-fun bs!25635 () Bool)

(assert (= bs!25635 d!100192))

(assert (=> bs!25635 m!436335))

(declare-fun m!436411 () Bool)

(assert (=> bs!25635 m!436411))

(assert (=> b!297503 d!100192))

(declare-fun d!100198 () Bool)

(declare-fun e!213081 () Bool)

(assert (=> d!100198 e!213081))

(declare-fun res!245619 () Bool)

(assert (=> d!100198 (=> (not res!245619) (not e!213081))))

(declare-fun lt!433844 () (_ BitVec 64))

(declare-fun lt!433843 () (_ BitVec 64))

(declare-fun lt!433845 () (_ BitVec 64))

(assert (=> d!100198 (= res!245619 (= lt!433843 (bvsub lt!433844 lt!433845)))))

(assert (=> d!100198 (or (= (bvand lt!433844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433845 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433844 lt!433845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100198 (= lt!433845 (remainingBits!0 ((_ sign_extend 32) (size!7721 (buf!7784 thiss!1728))) ((_ sign_extend 32) (currentByte!14326 thiss!1728)) ((_ sign_extend 32) (currentBit!14321 thiss!1728))))))

(declare-fun lt!433842 () (_ BitVec 64))

(declare-fun lt!433840 () (_ BitVec 64))

(assert (=> d!100198 (= lt!433844 (bvmul lt!433842 lt!433840))))

(assert (=> d!100198 (or (= lt!433842 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433840 (bvsdiv (bvmul lt!433842 lt!433840) lt!433842)))))

(assert (=> d!100198 (= lt!433840 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100198 (= lt!433842 ((_ sign_extend 32) (size!7721 (buf!7784 thiss!1728))))))

(assert (=> d!100198 (= lt!433843 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14326 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14321 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100198 (invariant!0 (currentBit!14321 thiss!1728) (currentByte!14326 thiss!1728) (size!7721 (buf!7784 thiss!1728)))))

(assert (=> d!100198 (= (bitIndex!0 (size!7721 (buf!7784 thiss!1728)) (currentByte!14326 thiss!1728) (currentBit!14321 thiss!1728)) lt!433843)))

(declare-fun b!297606 () Bool)

(declare-fun res!245620 () Bool)

(assert (=> b!297606 (=> (not res!245620) (not e!213081))))

(assert (=> b!297606 (= res!245620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433843))))

(declare-fun b!297607 () Bool)

(declare-fun lt!433841 () (_ BitVec 64))

(assert (=> b!297607 (= e!213081 (bvsle lt!433843 (bvmul lt!433841 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297607 (or (= lt!433841 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433841 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433841)))))

(assert (=> b!297607 (= lt!433841 ((_ sign_extend 32) (size!7721 (buf!7784 thiss!1728))))))

(assert (= (and d!100198 res!245619) b!297606))

(assert (= (and b!297606 res!245620) b!297607))

(declare-fun m!436433 () Bool)

(assert (=> d!100198 m!436433))

(declare-fun m!436435 () Bool)

(assert (=> d!100198 m!436435))

(assert (=> b!297503 d!100198))

(declare-fun b!297608 () Bool)

(declare-fun e!213085 () Bool)

(declare-fun e!213082 () Bool)

(assert (=> b!297608 (= e!213085 e!213082)))

(declare-fun res!245625 () Bool)

(assert (=> b!297608 (=> (not res!245625) (not e!213082))))

(declare-fun e!213087 () Bool)

(assert (=> b!297608 (= res!245625 e!213087)))

(declare-fun res!245622 () Bool)

(assert (=> b!297608 (=> res!245622 e!213087)))

(declare-fun lt!433846 () tuple4!920)

(assert (=> b!297608 (= res!245622 (bvsge (_1!13109 lt!433846) (_2!13109 lt!433846)))))

(declare-fun lt!433848 () (_ BitVec 32))

(assert (=> b!297608 (= lt!433848 ((_ extract 31 0) (bvsrem lt!433734 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433847 () (_ BitVec 32))

(assert (=> b!297608 (= lt!433847 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297608 (= lt!433846 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433734))))

(declare-fun d!100214 () Bool)

(declare-fun res!245623 () Bool)

(assert (=> d!100214 (=> res!245623 e!213085)))

(assert (=> d!100214 (= res!245623 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!433734))))

(assert (=> d!100214 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433734) e!213085)))

(declare-fun b!297609 () Bool)

(assert (=> b!297609 (= e!213087 (arrayRangesEq!1518 arr!273 arr!273 (_1!13109 lt!433846) (_2!13109 lt!433846)))))

(declare-fun b!297610 () Bool)

(declare-fun res!245621 () Bool)

(assert (=> b!297610 (= res!245621 (= lt!433848 #b00000000000000000000000000000000))))

(declare-fun e!213086 () Bool)

(assert (=> b!297610 (=> res!245621 e!213086)))

(declare-fun e!213083 () Bool)

(assert (=> b!297610 (= e!213083 e!213086)))

(declare-fun bm!5251 () Bool)

(declare-fun c!13616 () Bool)

(declare-fun call!5254 () Bool)

(assert (=> bm!5251 (= call!5254 (byteRangesEq!0 (select (arr!8801 arr!273) (_3!1417 lt!433846)) (select (arr!8801 arr!273) (_3!1417 lt!433846)) lt!433847 (ite c!13616 lt!433848 #b00000000000000000000000000001000)))))

(declare-fun b!297611 () Bool)

(declare-fun e!213084 () Bool)

(assert (=> b!297611 (= e!213082 e!213084)))

(assert (=> b!297611 (= c!13616 (= (_3!1417 lt!433846) (_4!460 lt!433846)))))

(declare-fun b!297612 () Bool)

(assert (=> b!297612 (= e!213084 e!213083)))

(declare-fun res!245624 () Bool)

(assert (=> b!297612 (= res!245624 call!5254)))

(assert (=> b!297612 (=> (not res!245624) (not e!213083))))

(declare-fun b!297613 () Bool)

(assert (=> b!297613 (= e!213084 call!5254)))

(declare-fun b!297614 () Bool)

(assert (=> b!297614 (= e!213086 (byteRangesEq!0 (select (arr!8801 arr!273) (_4!460 lt!433846)) (select (arr!8801 arr!273) (_4!460 lt!433846)) #b00000000000000000000000000000000 lt!433848))))

(assert (= (and d!100214 (not res!245623)) b!297608))

(assert (= (and b!297608 (not res!245622)) b!297609))

(assert (= (and b!297608 res!245625) b!297611))

(assert (= (and b!297611 c!13616) b!297613))

(assert (= (and b!297611 (not c!13616)) b!297612))

(assert (= (and b!297612 res!245624) b!297610))

(assert (= (and b!297610 (not res!245621)) b!297614))

(assert (= (or b!297613 b!297612) bm!5251))

(declare-fun m!436437 () Bool)

(assert (=> b!297608 m!436437))

(declare-fun m!436439 () Bool)

(assert (=> b!297609 m!436439))

(declare-fun m!436441 () Bool)

(assert (=> bm!5251 m!436441))

(assert (=> bm!5251 m!436441))

(assert (=> bm!5251 m!436441))

(assert (=> bm!5251 m!436441))

(declare-fun m!436443 () Bool)

(assert (=> bm!5251 m!436443))

(declare-fun m!436445 () Bool)

(assert (=> b!297614 m!436445))

(assert (=> b!297614 m!436445))

(assert (=> b!297614 m!436445))

(assert (=> b!297614 m!436445))

(declare-fun m!436447 () Bool)

(assert (=> b!297614 m!436447))

(assert (=> b!297503 d!100214))

(declare-fun d!100216 () Bool)

(assert (=> d!100216 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7721 (buf!7784 thiss!1728))) ((_ sign_extend 32) (currentByte!14326 thiss!1728)) ((_ sign_extend 32) (currentBit!14321 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7721 (buf!7784 thiss!1728))) ((_ sign_extend 32) (currentByte!14326 thiss!1728)) ((_ sign_extend 32) (currentBit!14321 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25640 () Bool)

(assert (= bs!25640 d!100216))

(assert (=> bs!25640 m!436433))

(assert (=> b!297501 d!100216))

(declare-fun d!100218 () Bool)

(assert (=> d!100218 (= (array_inv!7333 (buf!7784 thiss!1728)) (bvsge (size!7721 (buf!7784 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!297504 d!100218))

(declare-fun d!100220 () Bool)

(assert (=> d!100220 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14321 thiss!1728) (currentByte!14326 thiss!1728) (size!7721 (buf!7784 thiss!1728))))))

(declare-fun bs!25641 () Bool)

(assert (= bs!25641 d!100220))

(assert (=> bs!25641 m!436435))

(assert (=> start!66378 d!100220))

(declare-fun d!100222 () Bool)

(assert (=> d!100222 (= (array_inv!7333 arr!273) (bvsge (size!7721 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66378 d!100222))

(check-sat (not b!297608) (not b!297564) (not b!297519) (not d!100198) (not d!100220) (not b!297614) (not d!100180) (not d!100216) (not b!297558) (not b!297609) (not bm!5251) (not bm!5246) (not d!100192) (not b!297559))
