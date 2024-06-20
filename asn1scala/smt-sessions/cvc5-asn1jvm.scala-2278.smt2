; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57708 () Bool)

(assert start!57708)

(declare-fun b!264773 () Bool)

(declare-fun e!184858 () Bool)

(declare-datatypes ((array!14759 0))(
  ( (array!14760 (arr!7426 (Array (_ BitVec 32) (_ BitVec 8))) (size!6439 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11692 0))(
  ( (BitStream!11693 (buf!6907 array!14759) (currentByte!12783 (_ BitVec 32)) (currentBit!12778 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11692)

(declare-fun w2!580 () BitStream!11692)

(declare-fun arrayBitRangesEq!0 (array!14759 array!14759 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264773 (= e!184858 (not (arrayBitRangesEq!0 (buf!6907 w1!584) (buf!6907 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)))))))

(declare-fun b!264774 () Bool)

(declare-datatypes ((Unit!18848 0))(
  ( (Unit!18849) )
))
(declare-fun e!184854 () Unit!18848)

(declare-fun Unit!18850 () Unit!18848)

(assert (=> b!264774 (= e!184854 Unit!18850)))

(declare-fun b!264775 () Bool)

(declare-fun lt!405980 () Unit!18848)

(assert (=> b!264775 (= e!184854 lt!405980)))

(declare-fun lt!405975 () (_ BitVec 64))

(assert (=> b!264775 (= lt!405975 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14759 array!14759 (_ BitVec 64) (_ BitVec 64)) Unit!18848)

(assert (=> b!264775 (= lt!405980 (arrayBitRangesEqSymmetric!0 (buf!6907 w1!584) (buf!6907 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405975))))

(assert (=> b!264775 (arrayBitRangesEq!0 (buf!6907 w2!580) (buf!6907 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405975)))

(declare-fun b!264776 () Bool)

(declare-fun res!221328 () Bool)

(declare-fun e!184853 () Bool)

(assert (=> b!264776 (=> res!221328 e!184853)))

(declare-fun lt!405978 () BitStream!11692)

(declare-fun isPrefixOf!0 (BitStream!11692 BitStream!11692) Bool)

(assert (=> b!264776 (= res!221328 (not (isPrefixOf!0 lt!405978 w1!584)))))

(declare-fun b!264778 () Bool)

(declare-fun e!184859 () Bool)

(assert (=> b!264778 (= e!184859 e!184853)))

(declare-fun res!221326 () Bool)

(assert (=> b!264778 (=> res!221326 e!184853)))

(declare-fun e!184851 () Bool)

(assert (=> b!264778 (= res!221326 e!184851)))

(declare-fun res!221324 () Bool)

(assert (=> b!264778 (=> (not res!221324) (not e!184851))))

(assert (=> b!264778 (= res!221324 (not (= (size!6439 (buf!6907 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405977 () Unit!18848)

(assert (=> b!264778 (= lt!405977 e!184854)))

(declare-fun c!12153 () Bool)

(assert (=> b!264778 (= c!12153 (not (= (size!6439 (buf!6907 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264779 () Bool)

(declare-fun e!184852 () Bool)

(assert (=> b!264779 (= e!184852 (not e!184859))))

(declare-fun res!221329 () Bool)

(assert (=> b!264779 (=> res!221329 e!184859)))

(assert (=> b!264779 (= res!221329 e!184858)))

(declare-fun res!221325 () Bool)

(assert (=> b!264779 (=> (not res!221325) (not e!184858))))

(assert (=> b!264779 (= res!221325 (not (= (size!6439 (buf!6907 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264779 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405979 () Unit!18848)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11692) Unit!18848)

(assert (=> b!264779 (= lt!405979 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264779 (isPrefixOf!0 lt!405978 lt!405978)))

(declare-fun lt!405976 () Unit!18848)

(assert (=> b!264779 (= lt!405976 (lemmaIsPrefixRefl!0 lt!405978))))

(assert (=> b!264779 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405983 () Unit!18848)

(assert (=> b!264779 (= lt!405983 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264779 (= lt!405978 (BitStream!11693 (buf!6907 w2!580) (currentByte!12783 w1!584) (currentBit!12778 w1!584)))))

(declare-fun b!264777 () Bool)

(declare-fun e!184857 () Bool)

(declare-fun array_inv!6163 (array!14759) Bool)

(assert (=> b!264777 (= e!184857 (array_inv!6163 (buf!6907 w2!580)))))

(declare-fun res!221327 () Bool)

(assert (=> start!57708 (=> (not res!221327) (not e!184852))))

(assert (=> start!57708 (= res!221327 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57708 e!184852))

(declare-fun e!184860 () Bool)

(declare-fun inv!12 (BitStream!11692) Bool)

(assert (=> start!57708 (and (inv!12 w1!584) e!184860)))

(assert (=> start!57708 (and (inv!12 w2!580) e!184857)))

(declare-fun b!264780 () Bool)

(assert (=> b!264780 (= e!184860 (array_inv!6163 (buf!6907 w1!584)))))

(declare-fun b!264781 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!11692 (_ BitVec 64)) Bool)

(assert (=> b!264781 (= e!184853 (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580)))))))

(declare-fun lt!405982 () Unit!18848)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11692 BitStream!11692 BitStream!11692) Unit!18848)

(assert (=> b!264781 (= lt!405982 (lemmaIsPrefixTransitive!0 lt!405978 w2!580 w2!580))))

(assert (=> b!264781 (isPrefixOf!0 lt!405978 w2!580)))

(declare-fun lt!405981 () Unit!18848)

(assert (=> b!264781 (= lt!405981 (lemmaIsPrefixTransitive!0 lt!405978 w1!584 w2!580))))

(declare-fun b!264782 () Bool)

(assert (=> b!264782 (= e!184851 (not (arrayBitRangesEq!0 (buf!6907 w2!580) (buf!6907 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)))))))

(assert (= (and start!57708 res!221327) b!264779))

(assert (= (and b!264779 res!221325) b!264773))

(assert (= (and b!264779 (not res!221329)) b!264778))

(assert (= (and b!264778 c!12153) b!264775))

(assert (= (and b!264778 (not c!12153)) b!264774))

(assert (= (and b!264778 res!221324) b!264782))

(assert (= (and b!264778 (not res!221326)) b!264776))

(assert (= (and b!264776 (not res!221328)) b!264781))

(assert (= start!57708 b!264780))

(assert (= start!57708 b!264777))

(declare-fun m!395345 () Bool)

(assert (=> b!264775 m!395345))

(declare-fun m!395347 () Bool)

(assert (=> b!264775 m!395347))

(declare-fun m!395349 () Bool)

(assert (=> b!264775 m!395349))

(declare-fun m!395351 () Bool)

(assert (=> b!264779 m!395351))

(declare-fun m!395353 () Bool)

(assert (=> b!264779 m!395353))

(declare-fun m!395355 () Bool)

(assert (=> b!264779 m!395355))

(declare-fun m!395357 () Bool)

(assert (=> b!264779 m!395357))

(declare-fun m!395359 () Bool)

(assert (=> b!264779 m!395359))

(declare-fun m!395361 () Bool)

(assert (=> b!264779 m!395361))

(declare-fun m!395363 () Bool)

(assert (=> b!264776 m!395363))

(assert (=> b!264781 m!395345))

(declare-fun m!395365 () Bool)

(assert (=> b!264781 m!395365))

(declare-fun m!395367 () Bool)

(assert (=> b!264781 m!395367))

(declare-fun m!395369 () Bool)

(assert (=> b!264781 m!395369))

(declare-fun m!395371 () Bool)

(assert (=> b!264781 m!395371))

(declare-fun m!395373 () Bool)

(assert (=> b!264781 m!395373))

(declare-fun m!395375 () Bool)

(assert (=> start!57708 m!395375))

(declare-fun m!395377 () Bool)

(assert (=> start!57708 m!395377))

(declare-fun m!395379 () Bool)

(assert (=> start!57708 m!395379))

(assert (=> b!264773 m!395345))

(assert (=> b!264773 m!395345))

(declare-fun m!395381 () Bool)

(assert (=> b!264773 m!395381))

(assert (=> b!264782 m!395345))

(assert (=> b!264782 m!395345))

(declare-fun m!395383 () Bool)

(assert (=> b!264782 m!395383))

(declare-fun m!395385 () Bool)

(assert (=> b!264777 m!395385))

(declare-fun m!395387 () Bool)

(assert (=> b!264780 m!395387))

(push 1)

(assert (not b!264779))

(assert (not b!264781))

(assert (not b!264777))

(assert (not b!264782))

(assert (not b!264773))

(assert (not start!57708))

(assert (not b!264776))

(assert (not b!264775))

(assert (not b!264780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89350 () Bool)

(declare-fun res!221422 () Bool)

(declare-fun e!184972 () Bool)

(assert (=> d!89350 (=> res!221422 e!184972)))

(assert (=> d!89350 (= res!221422 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))))))

(assert (=> d!89350 (= (arrayBitRangesEq!0 (buf!6907 w1!584) (buf!6907 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))) e!184972)))

(declare-fun b!264904 () Bool)

(declare-fun e!184970 () Bool)

(declare-fun call!4105 () Bool)

(assert (=> b!264904 (= e!184970 call!4105)))

(declare-fun c!12164 () Bool)

(declare-fun bm!4102 () Bool)

(declare-fun lt!406060 () (_ BitVec 32))

(declare-datatypes ((tuple4!354 0))(
  ( (tuple4!355 (_1!12157 (_ BitVec 32)) (_2!12157 (_ BitVec 32)) (_3!957 (_ BitVec 32)) (_4!177 (_ BitVec 32))) )
))
(declare-fun lt!406061 () tuple4!354)

(declare-fun lt!406062 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4102 (= call!4105 (byteRangesEq!0 (select (arr!7426 (buf!6907 w1!584)) (_3!957 lt!406061)) (select (arr!7426 (buf!6907 w2!580)) (_3!957 lt!406061)) lt!406060 (ite c!12164 lt!406062 #b00000000000000000000000000001000)))))

(declare-fun b!264905 () Bool)

(declare-fun e!184971 () Bool)

(assert (=> b!264905 (= e!184971 (byteRangesEq!0 (select (arr!7426 (buf!6907 w1!584)) (_4!177 lt!406061)) (select (arr!7426 (buf!6907 w2!580)) (_4!177 lt!406061)) #b00000000000000000000000000000000 lt!406062))))

(declare-fun b!264906 () Bool)

(declare-fun res!221421 () Bool)

(assert (=> b!264906 (= res!221421 (= lt!406062 #b00000000000000000000000000000000))))

(assert (=> b!264906 (=> res!221421 e!184971)))

(declare-fun e!184967 () Bool)

(assert (=> b!264906 (= e!184967 e!184971)))

(declare-fun b!264907 () Bool)

(assert (=> b!264907 (= e!184970 e!184967)))

(declare-fun res!221419 () Bool)

(assert (=> b!264907 (= res!221419 call!4105)))

(assert (=> b!264907 (=> (not res!221419) (not e!184967))))

(declare-fun b!264908 () Bool)

(declare-fun e!184968 () Bool)

(assert (=> b!264908 (= e!184968 e!184970)))

(assert (=> b!264908 (= c!12164 (= (_3!957 lt!406061) (_4!177 lt!406061)))))

(declare-fun b!264909 () Bool)

(assert (=> b!264909 (= e!184972 e!184968)))

(declare-fun res!221420 () Bool)

(assert (=> b!264909 (=> (not res!221420) (not e!184968))))

(declare-fun e!184969 () Bool)

(assert (=> b!264909 (= res!221420 e!184969)))

(declare-fun res!221423 () Bool)

(assert (=> b!264909 (=> res!221423 e!184969)))

(assert (=> b!264909 (= res!221423 (bvsge (_1!12157 lt!406061) (_2!12157 lt!406061)))))

(assert (=> b!264909 (= lt!406062 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264909 (= lt!406060 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!354)

(assert (=> b!264909 (= lt!406061 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))))))

(declare-fun b!264910 () Bool)

(declare-fun arrayRangesEq!1013 (array!14759 array!14759 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264910 (= e!184969 (arrayRangesEq!1013 (buf!6907 w1!584) (buf!6907 w2!580) (_1!12157 lt!406061) (_2!12157 lt!406061)))))

(assert (= (and d!89350 (not res!221422)) b!264909))

(assert (= (and b!264909 (not res!221423)) b!264910))

(assert (= (and b!264909 res!221420) b!264908))

(assert (= (and b!264908 c!12164) b!264904))

(assert (= (and b!264908 (not c!12164)) b!264907))

(assert (= (and b!264907 res!221419) b!264906))

(assert (= (and b!264906 (not res!221421)) b!264905))

(assert (= (or b!264904 b!264907) bm!4102))

(declare-fun m!395509 () Bool)

(assert (=> bm!4102 m!395509))

(declare-fun m!395511 () Bool)

(assert (=> bm!4102 m!395511))

(assert (=> bm!4102 m!395509))

(assert (=> bm!4102 m!395511))

(declare-fun m!395513 () Bool)

(assert (=> bm!4102 m!395513))

(declare-fun m!395515 () Bool)

(assert (=> b!264905 m!395515))

(declare-fun m!395517 () Bool)

(assert (=> b!264905 m!395517))

(assert (=> b!264905 m!395515))

(assert (=> b!264905 m!395517))

(declare-fun m!395519 () Bool)

(assert (=> b!264905 m!395519))

(assert (=> b!264909 m!395345))

(declare-fun m!395521 () Bool)

(assert (=> b!264909 m!395521))

(declare-fun m!395523 () Bool)

(assert (=> b!264910 m!395523))

(assert (=> b!264773 d!89350))

(declare-fun d!89382 () Bool)

(declare-fun e!184981 () Bool)

(assert (=> d!89382 e!184981))

(declare-fun res!221434 () Bool)

(assert (=> d!89382 (=> (not res!221434) (not e!184981))))

(declare-fun lt!406082 () (_ BitVec 64))

(declare-fun lt!406080 () (_ BitVec 64))

(declare-fun lt!406078 () (_ BitVec 64))

(assert (=> d!89382 (= res!221434 (= lt!406080 (bvsub lt!406078 lt!406082)))))

(assert (=> d!89382 (or (= (bvand lt!406078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406082 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406078 lt!406082) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89382 (= lt!406082 (remainingBits!0 ((_ sign_extend 32) (size!6439 (buf!6907 w1!584))) ((_ sign_extend 32) (currentByte!12783 w1!584)) ((_ sign_extend 32) (currentBit!12778 w1!584))))))

(declare-fun lt!406083 () (_ BitVec 64))

(declare-fun lt!406081 () (_ BitVec 64))

(assert (=> d!89382 (= lt!406078 (bvmul lt!406083 lt!406081))))

(assert (=> d!89382 (or (= lt!406083 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406081 (bvsdiv (bvmul lt!406083 lt!406081) lt!406083)))))

(assert (=> d!89382 (= lt!406081 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89382 (= lt!406083 ((_ sign_extend 32) (size!6439 (buf!6907 w1!584))))))

(assert (=> d!89382 (= lt!406080 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12783 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12778 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89382 (invariant!0 (currentBit!12778 w1!584) (currentByte!12783 w1!584) (size!6439 (buf!6907 w1!584)))))

(assert (=> d!89382 (= (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) lt!406080)))

(declare-fun b!264922 () Bool)

(declare-fun res!221433 () Bool)

(assert (=> b!264922 (=> (not res!221433) (not e!184981))))

(assert (=> b!264922 (= res!221433 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406080))))

(declare-fun b!264923 () Bool)

(declare-fun lt!406079 () (_ BitVec 64))

(assert (=> b!264923 (= e!184981 (bvsle lt!406080 (bvmul lt!406079 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264923 (or (= lt!406079 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406079 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406079)))))

(assert (=> b!264923 (= lt!406079 ((_ sign_extend 32) (size!6439 (buf!6907 w1!584))))))

(assert (= (and d!89382 res!221434) b!264922))

(assert (= (and b!264922 res!221433) b!264923))

(declare-fun m!395541 () Bool)

(assert (=> d!89382 m!395541))

(declare-fun m!395543 () Bool)

(assert (=> d!89382 m!395543))

(assert (=> b!264773 d!89382))

(declare-fun d!89386 () Bool)

(assert (=> d!89386 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406104 () Unit!18848)

(declare-fun choose!11 (BitStream!11692) Unit!18848)

(assert (=> d!89386 (= lt!406104 (choose!11 w2!580))))

(assert (=> d!89386 (= (lemmaIsPrefixRefl!0 w2!580) lt!406104)))

(declare-fun bs!22688 () Bool)

(assert (= bs!22688 d!89386))

(assert (=> bs!22688 m!395359))

(declare-fun m!395549 () Bool)

(assert (=> bs!22688 m!395549))

(assert (=> b!264779 d!89386))

(declare-fun d!89390 () Bool)

(declare-fun res!221462 () Bool)

(declare-fun e!185004 () Bool)

(assert (=> d!89390 (=> (not res!221462) (not e!185004))))

(assert (=> d!89390 (= res!221462 (= (size!6439 (buf!6907 lt!405978)) (size!6439 (buf!6907 lt!405978))))))

(assert (=> d!89390 (= (isPrefixOf!0 lt!405978 lt!405978) e!185004)))

(declare-fun b!264954 () Bool)

(declare-fun res!221461 () Bool)

(assert (=> b!264954 (=> (not res!221461) (not e!185004))))

(assert (=> b!264954 (= res!221461 (bvsle (bitIndex!0 (size!6439 (buf!6907 lt!405978)) (currentByte!12783 lt!405978) (currentBit!12778 lt!405978)) (bitIndex!0 (size!6439 (buf!6907 lt!405978)) (currentByte!12783 lt!405978) (currentBit!12778 lt!405978))))))

(declare-fun b!264955 () Bool)

(declare-fun e!185005 () Bool)

(assert (=> b!264955 (= e!185004 e!185005)))

(declare-fun res!221460 () Bool)

(assert (=> b!264955 (=> res!221460 e!185005)))

(assert (=> b!264955 (= res!221460 (= (size!6439 (buf!6907 lt!405978)) #b00000000000000000000000000000000))))

(declare-fun b!264956 () Bool)

(assert (=> b!264956 (= e!185005 (arrayBitRangesEq!0 (buf!6907 lt!405978) (buf!6907 lt!405978) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 lt!405978)) (currentByte!12783 lt!405978) (currentBit!12778 lt!405978))))))

(assert (= (and d!89390 res!221462) b!264954))

(assert (= (and b!264954 res!221461) b!264955))

(assert (= (and b!264955 (not res!221460)) b!264956))

(declare-fun m!395551 () Bool)

(assert (=> b!264954 m!395551))

(assert (=> b!264954 m!395551))

(assert (=> b!264956 m!395551))

(assert (=> b!264956 m!395551))

(declare-fun m!395553 () Bool)

(assert (=> b!264956 m!395553))

(assert (=> b!264779 d!89390))

(declare-fun d!89394 () Bool)

(assert (=> d!89394 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406114 () Unit!18848)

(assert (=> d!89394 (= lt!406114 (choose!11 w1!584))))

(assert (=> d!89394 (= (lemmaIsPrefixRefl!0 w1!584) lt!406114)))

(declare-fun bs!22689 () Bool)

(assert (= bs!22689 d!89394))

(assert (=> bs!22689 m!395357))

(declare-fun m!395557 () Bool)

(assert (=> bs!22689 m!395557))

(assert (=> b!264779 d!89394))

(declare-fun d!89398 () Bool)

(assert (=> d!89398 (isPrefixOf!0 lt!405978 lt!405978)))

(declare-fun lt!406115 () Unit!18848)

(assert (=> d!89398 (= lt!406115 (choose!11 lt!405978))))

(assert (=> d!89398 (= (lemmaIsPrefixRefl!0 lt!405978) lt!406115)))

(declare-fun bs!22690 () Bool)

(assert (= bs!22690 d!89398))

(assert (=> bs!22690 m!395355))

(declare-fun m!395559 () Bool)

(assert (=> bs!22690 m!395559))

(assert (=> b!264779 d!89398))

(declare-fun d!89400 () Bool)

(declare-fun res!221468 () Bool)

(declare-fun e!185008 () Bool)

(assert (=> d!89400 (=> (not res!221468) (not e!185008))))

(assert (=> d!89400 (= res!221468 (= (size!6439 (buf!6907 w1!584)) (size!6439 (buf!6907 w1!584))))))

(assert (=> d!89400 (= (isPrefixOf!0 w1!584 w1!584) e!185008)))

(declare-fun b!264960 () Bool)

(declare-fun res!221467 () Bool)

(assert (=> b!264960 (=> (not res!221467) (not e!185008))))

(assert (=> b!264960 (= res!221467 (bvsle (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))))))

(declare-fun b!264961 () Bool)

(declare-fun e!185009 () Bool)

(assert (=> b!264961 (= e!185008 e!185009)))

(declare-fun res!221466 () Bool)

(assert (=> b!264961 (=> res!221466 e!185009)))

(assert (=> b!264961 (= res!221466 (= (size!6439 (buf!6907 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264962 () Bool)

(assert (=> b!264962 (= e!185009 (arrayBitRangesEq!0 (buf!6907 w1!584) (buf!6907 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))))))

(assert (= (and d!89400 res!221468) b!264960))

(assert (= (and b!264960 res!221467) b!264961))

(assert (= (and b!264961 (not res!221466)) b!264962))

(assert (=> b!264960 m!395345))

(assert (=> b!264960 m!395345))

(assert (=> b!264962 m!395345))

(assert (=> b!264962 m!395345))

(declare-fun m!395561 () Bool)

(assert (=> b!264962 m!395561))

(assert (=> b!264779 d!89400))

(declare-fun d!89402 () Bool)

(declare-fun res!221476 () Bool)

(declare-fun e!185016 () Bool)

(assert (=> d!89402 (=> (not res!221476) (not e!185016))))

(assert (=> d!89402 (= res!221476 (= (size!6439 (buf!6907 w2!580)) (size!6439 (buf!6907 w2!580))))))

(assert (=> d!89402 (= (isPrefixOf!0 w2!580 w2!580) e!185016)))

(declare-fun b!264970 () Bool)

(declare-fun res!221475 () Bool)

(assert (=> b!264970 (=> (not res!221475) (not e!185016))))

(assert (=> b!264970 (= res!221475 (bvsle (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580)) (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580))))))

(declare-fun b!264971 () Bool)

(declare-fun e!185017 () Bool)

(assert (=> b!264971 (= e!185016 e!185017)))

(declare-fun res!221474 () Bool)

(assert (=> b!264971 (=> res!221474 e!185017)))

(assert (=> b!264971 (= res!221474 (= (size!6439 (buf!6907 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!264972 () Bool)

(assert (=> b!264972 (= e!185017 (arrayBitRangesEq!0 (buf!6907 w2!580) (buf!6907 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580))))))

(assert (= (and d!89402 res!221476) b!264970))

(assert (= (and b!264970 res!221475) b!264971))

(assert (= (and b!264971 (not res!221474)) b!264972))

(assert (=> b!264970 m!395367))

(assert (=> b!264970 m!395367))

(assert (=> b!264972 m!395367))

(assert (=> b!264972 m!395367))

(declare-fun m!395563 () Bool)

(assert (=> b!264972 m!395563))

(assert (=> b!264779 d!89402))

(declare-fun d!89404 () Bool)

(assert (=> d!89404 (= (array_inv!6163 (buf!6907 w1!584)) (bvsge (size!6439 (buf!6907 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!264780 d!89404))

(assert (=> b!264775 d!89382))

(declare-fun d!89406 () Bool)

(assert (=> d!89406 (arrayBitRangesEq!0 (buf!6907 w2!580) (buf!6907 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405975)))

(declare-fun lt!406134 () Unit!18848)

(declare-fun choose!8 (array!14759 array!14759 (_ BitVec 64) (_ BitVec 64)) Unit!18848)

(assert (=> d!89406 (= lt!406134 (choose!8 (buf!6907 w1!584) (buf!6907 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405975))))

(assert (=> d!89406 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405975))))

(assert (=> d!89406 (= (arrayBitRangesEqSymmetric!0 (buf!6907 w1!584) (buf!6907 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405975) lt!406134)))

(declare-fun bs!22693 () Bool)

(assert (= bs!22693 d!89406))

(assert (=> bs!22693 m!395349))

(declare-fun m!395589 () Bool)

(assert (=> bs!22693 m!395589))

(assert (=> b!264775 d!89406))

(declare-fun d!89418 () Bool)

(declare-fun res!221487 () Bool)

(declare-fun e!185030 () Bool)

(assert (=> d!89418 (=> res!221487 e!185030)))

(assert (=> d!89418 (= res!221487 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!405975))))

(assert (=> d!89418 (= (arrayBitRangesEq!0 (buf!6907 w2!580) (buf!6907 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405975) e!185030)))

(declare-fun b!264982 () Bool)

(declare-fun e!185028 () Bool)

(declare-fun call!4111 () Bool)

(assert (=> b!264982 (= e!185028 call!4111)))

(declare-fun lt!406136 () tuple4!354)

(declare-fun bm!4108 () Bool)

(declare-fun c!12170 () Bool)

(declare-fun lt!406135 () (_ BitVec 32))

(declare-fun lt!406137 () (_ BitVec 32))

(assert (=> bm!4108 (= call!4111 (byteRangesEq!0 (select (arr!7426 (buf!6907 w2!580)) (_3!957 lt!406136)) (select (arr!7426 (buf!6907 w1!584)) (_3!957 lt!406136)) lt!406135 (ite c!12170 lt!406137 #b00000000000000000000000000001000)))))

(declare-fun e!185029 () Bool)

(declare-fun b!264983 () Bool)

(assert (=> b!264983 (= e!185029 (byteRangesEq!0 (select (arr!7426 (buf!6907 w2!580)) (_4!177 lt!406136)) (select (arr!7426 (buf!6907 w1!584)) (_4!177 lt!406136)) #b00000000000000000000000000000000 lt!406137))))

(declare-fun b!264984 () Bool)

(declare-fun res!221486 () Bool)

(assert (=> b!264984 (= res!221486 (= lt!406137 #b00000000000000000000000000000000))))

(assert (=> b!264984 (=> res!221486 e!185029)))

(declare-fun e!185025 () Bool)

(assert (=> b!264984 (= e!185025 e!185029)))

(declare-fun b!264985 () Bool)

(assert (=> b!264985 (= e!185028 e!185025)))

(declare-fun res!221484 () Bool)

(assert (=> b!264985 (= res!221484 call!4111)))

(assert (=> b!264985 (=> (not res!221484) (not e!185025))))

(declare-fun b!264986 () Bool)

(declare-fun e!185026 () Bool)

(assert (=> b!264986 (= e!185026 e!185028)))

(assert (=> b!264986 (= c!12170 (= (_3!957 lt!406136) (_4!177 lt!406136)))))

(declare-fun b!264987 () Bool)

(assert (=> b!264987 (= e!185030 e!185026)))

(declare-fun res!221485 () Bool)

(assert (=> b!264987 (=> (not res!221485) (not e!185026))))

(declare-fun e!185027 () Bool)

(assert (=> b!264987 (= res!221485 e!185027)))

(declare-fun res!221488 () Bool)

(assert (=> b!264987 (=> res!221488 e!185027)))

(assert (=> b!264987 (= res!221488 (bvsge (_1!12157 lt!406136) (_2!12157 lt!406136)))))

(assert (=> b!264987 (= lt!406137 ((_ extract 31 0) (bvsrem lt!405975 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264987 (= lt!406135 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264987 (= lt!406136 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!405975))))

(declare-fun b!264988 () Bool)

(assert (=> b!264988 (= e!185027 (arrayRangesEq!1013 (buf!6907 w2!580) (buf!6907 w1!584) (_1!12157 lt!406136) (_2!12157 lt!406136)))))

(assert (= (and d!89418 (not res!221487)) b!264987))

(assert (= (and b!264987 (not res!221488)) b!264988))

(assert (= (and b!264987 res!221485) b!264986))

(assert (= (and b!264986 c!12170) b!264982))

(assert (= (and b!264986 (not c!12170)) b!264985))

(assert (= (and b!264985 res!221484) b!264984))

(assert (= (and b!264984 (not res!221486)) b!264983))

(assert (= (or b!264982 b!264985) bm!4108))

(declare-fun m!395605 () Bool)

(assert (=> bm!4108 m!395605))

(declare-fun m!395607 () Bool)

(assert (=> bm!4108 m!395607))

(assert (=> bm!4108 m!395605))

(assert (=> bm!4108 m!395607))

(declare-fun m!395609 () Bool)

(assert (=> bm!4108 m!395609))

(declare-fun m!395611 () Bool)

(assert (=> b!264983 m!395611))

(declare-fun m!395613 () Bool)

(assert (=> b!264983 m!395613))

(assert (=> b!264983 m!395611))

(assert (=> b!264983 m!395613))

(declare-fun m!395615 () Bool)

(assert (=> b!264983 m!395615))

(declare-fun m!395617 () Bool)

(assert (=> b!264987 m!395617))

(declare-fun m!395619 () Bool)

(assert (=> b!264988 m!395619))

(assert (=> b!264775 d!89418))

(declare-fun d!89422 () Bool)

(declare-fun res!221491 () Bool)

(declare-fun e!185031 () Bool)

(assert (=> d!89422 (=> (not res!221491) (not e!185031))))

(assert (=> d!89422 (= res!221491 (= (size!6439 (buf!6907 w1!584)) (size!6439 (buf!6907 w2!580))))))

(assert (=> d!89422 (= (isPrefixOf!0 w1!584 w2!580) e!185031)))

(declare-fun b!264989 () Bool)

(declare-fun res!221490 () Bool)

(assert (=> b!264989 (=> (not res!221490) (not e!185031))))

(assert (=> b!264989 (= res!221490 (bvsle (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580))))))

(declare-fun b!264990 () Bool)

(declare-fun e!185032 () Bool)

(assert (=> b!264990 (= e!185031 e!185032)))

(declare-fun res!221489 () Bool)

(assert (=> b!264990 (=> res!221489 e!185032)))

(assert (=> b!264990 (= res!221489 (= (size!6439 (buf!6907 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264991 () Bool)

(assert (=> b!264991 (= e!185032 (arrayBitRangesEq!0 (buf!6907 w1!584) (buf!6907 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))))))

(assert (= (and d!89422 res!221491) b!264989))

(assert (= (and b!264989 res!221490) b!264990))

(assert (= (and b!264990 (not res!221489)) b!264991))

(assert (=> b!264989 m!395345))

(assert (=> b!264989 m!395367))

(assert (=> b!264991 m!395345))

(assert (=> b!264991 m!395345))

(assert (=> b!264991 m!395381))

(assert (=> start!57708 d!89422))

(declare-fun d!89424 () Bool)

(assert (=> d!89424 (= (inv!12 w1!584) (invariant!0 (currentBit!12778 w1!584) (currentByte!12783 w1!584) (size!6439 (buf!6907 w1!584))))))

(declare-fun bs!22694 () Bool)

(assert (= bs!22694 d!89424))

(assert (=> bs!22694 m!395543))

(assert (=> start!57708 d!89424))

(declare-fun d!89426 () Bool)

(assert (=> d!89426 (= (inv!12 w2!580) (invariant!0 (currentBit!12778 w2!580) (currentByte!12783 w2!580) (size!6439 (buf!6907 w2!580))))))

(declare-fun bs!22695 () Bool)

(assert (= bs!22695 d!89426))

(declare-fun m!395621 () Bool)

(assert (=> bs!22695 m!395621))

(assert (=> start!57708 d!89426))

(declare-fun d!89428 () Bool)

(declare-fun res!221505 () Bool)

(declare-fun e!185045 () Bool)

(assert (=> d!89428 (=> (not res!221505) (not e!185045))))

(assert (=> d!89428 (= res!221505 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6439 (buf!6907 w2!580)))) (bvsub (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580)))) (bvsle (bvsub (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6439 (buf!6907 w2!580)))))))))

(assert (=> d!89428 (= (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580)))) e!185045)))

(declare-fun b!265008 () Bool)

(declare-fun lt!406146 () (_ BitVec 64))

(assert (=> b!265008 (= e!185045 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406146) (bvsle lt!406146 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6439 (buf!6907 w2!580)))))))))

(assert (=> b!265008 (= lt!406146 (bvadd (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580)) (bvsub (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580)))))))

(assert (= (and d!89428 res!221505) b!265008))

(assert (=> b!265008 m!395367))

(assert (=> b!264781 d!89428))

(declare-fun d!89442 () Bool)

(assert (=> d!89442 (isPrefixOf!0 lt!405978 w2!580)))

(declare-fun lt!406151 () Unit!18848)

(declare-fun choose!30 (BitStream!11692 BitStream!11692 BitStream!11692) Unit!18848)

(assert (=> d!89442 (= lt!406151 (choose!30 lt!405978 w1!584 w2!580))))

(assert (=> d!89442 (isPrefixOf!0 lt!405978 w1!584)))

(assert (=> d!89442 (= (lemmaIsPrefixTransitive!0 lt!405978 w1!584 w2!580) lt!406151)))

(declare-fun bs!22699 () Bool)

(assert (= bs!22699 d!89442))

(assert (=> bs!22699 m!395365))

(declare-fun m!395643 () Bool)

(assert (=> bs!22699 m!395643))

(assert (=> bs!22699 m!395363))

(assert (=> b!264781 d!89442))

(declare-fun d!89444 () Bool)

(assert (=> d!89444 (isPrefixOf!0 lt!405978 w2!580)))

(declare-fun lt!406158 () Unit!18848)

(assert (=> d!89444 (= lt!406158 (choose!30 lt!405978 w2!580 w2!580))))

(assert (=> d!89444 (isPrefixOf!0 lt!405978 w2!580)))

(assert (=> d!89444 (= (lemmaIsPrefixTransitive!0 lt!405978 w2!580 w2!580) lt!406158)))

(declare-fun bs!22700 () Bool)

(assert (= bs!22700 d!89444))

(assert (=> bs!22700 m!395365))

(declare-fun m!395645 () Bool)

(assert (=> bs!22700 m!395645))

(assert (=> bs!22700 m!395365))

(assert (=> b!264781 d!89444))

(declare-fun d!89446 () Bool)

(declare-fun e!185048 () Bool)

(assert (=> d!89446 e!185048))

(declare-fun res!221509 () Bool)

(assert (=> d!89446 (=> (not res!221509) (not e!185048))))

(declare-fun lt!406165 () (_ BitVec 64))

(declare-fun lt!406161 () (_ BitVec 64))

(declare-fun lt!406163 () (_ BitVec 64))

(assert (=> d!89446 (= res!221509 (= lt!406163 (bvsub lt!406161 lt!406165)))))

(assert (=> d!89446 (or (= (bvand lt!406161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406165 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406161 lt!406165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!89446 (= lt!406165 (remainingBits!0 ((_ sign_extend 32) (size!6439 (buf!6907 w2!580))) ((_ sign_extend 32) (currentByte!12783 w2!580)) ((_ sign_extend 32) (currentBit!12778 w2!580))))))

(declare-fun lt!406166 () (_ BitVec 64))

(declare-fun lt!406164 () (_ BitVec 64))

(assert (=> d!89446 (= lt!406161 (bvmul lt!406166 lt!406164))))

(assert (=> d!89446 (or (= lt!406166 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406164 (bvsdiv (bvmul lt!406166 lt!406164) lt!406166)))))

(assert (=> d!89446 (= lt!406164 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89446 (= lt!406166 ((_ sign_extend 32) (size!6439 (buf!6907 w2!580))))))

(assert (=> d!89446 (= lt!406163 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12783 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12778 w2!580))))))

(assert (=> d!89446 (invariant!0 (currentBit!12778 w2!580) (currentByte!12783 w2!580) (size!6439 (buf!6907 w2!580)))))

(assert (=> d!89446 (= (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580)) lt!406163)))

(declare-fun b!265009 () Bool)

(declare-fun res!221508 () Bool)

(assert (=> b!265009 (=> (not res!221508) (not e!185048))))

(assert (=> b!265009 (= res!221508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406163))))

(declare-fun b!265010 () Bool)

(declare-fun lt!406162 () (_ BitVec 64))

(assert (=> b!265010 (= e!185048 (bvsle lt!406163 (bvmul lt!406162 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265010 (or (= lt!406162 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406162 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406162)))))

(assert (=> b!265010 (= lt!406162 ((_ sign_extend 32) (size!6439 (buf!6907 w2!580))))))

(assert (= (and d!89446 res!221509) b!265009))

(assert (= (and b!265009 res!221508) b!265010))

(declare-fun m!395647 () Bool)

(assert (=> d!89446 m!395647))

(assert (=> d!89446 m!395621))

(assert (=> b!264781 d!89446))

(declare-fun d!89448 () Bool)

(declare-fun res!221514 () Bool)

(declare-fun e!185049 () Bool)

(assert (=> d!89448 (=> (not res!221514) (not e!185049))))

(assert (=> d!89448 (= res!221514 (= (size!6439 (buf!6907 lt!405978)) (size!6439 (buf!6907 w2!580))))))

(assert (=> d!89448 (= (isPrefixOf!0 lt!405978 w2!580) e!185049)))

(declare-fun b!265015 () Bool)

(declare-fun res!221513 () Bool)

(assert (=> b!265015 (=> (not res!221513) (not e!185049))))

(assert (=> b!265015 (= res!221513 (bvsle (bitIndex!0 (size!6439 (buf!6907 lt!405978)) (currentByte!12783 lt!405978) (currentBit!12778 lt!405978)) (bitIndex!0 (size!6439 (buf!6907 w2!580)) (currentByte!12783 w2!580) (currentBit!12778 w2!580))))))

(declare-fun b!265016 () Bool)

(declare-fun e!185050 () Bool)

(assert (=> b!265016 (= e!185049 e!185050)))

(declare-fun res!221512 () Bool)

(assert (=> b!265016 (=> res!221512 e!185050)))

(assert (=> b!265016 (= res!221512 (= (size!6439 (buf!6907 lt!405978)) #b00000000000000000000000000000000))))

(declare-fun b!265017 () Bool)

(assert (=> b!265017 (= e!185050 (arrayBitRangesEq!0 (buf!6907 lt!405978) (buf!6907 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 lt!405978)) (currentByte!12783 lt!405978) (currentBit!12778 lt!405978))))))

(assert (= (and d!89448 res!221514) b!265015))

(assert (= (and b!265015 res!221513) b!265016))

(assert (= (and b!265016 (not res!221512)) b!265017))

(assert (=> b!265015 m!395551))

(assert (=> b!265015 m!395367))

(assert (=> b!265017 m!395551))

(assert (=> b!265017 m!395551))

(declare-fun m!395649 () Bool)

(assert (=> b!265017 m!395649))

(assert (=> b!264781 d!89448))

(assert (=> b!264781 d!89382))

(declare-fun d!89450 () Bool)

(declare-fun res!221517 () Bool)

(declare-fun e!185051 () Bool)

(assert (=> d!89450 (=> (not res!221517) (not e!185051))))

(assert (=> d!89450 (= res!221517 (= (size!6439 (buf!6907 lt!405978)) (size!6439 (buf!6907 w1!584))))))

(assert (=> d!89450 (= (isPrefixOf!0 lt!405978 w1!584) e!185051)))

(declare-fun b!265018 () Bool)

(declare-fun res!221516 () Bool)

(assert (=> b!265018 (=> (not res!221516) (not e!185051))))

(assert (=> b!265018 (= res!221516 (bvsle (bitIndex!0 (size!6439 (buf!6907 lt!405978)) (currentByte!12783 lt!405978) (currentBit!12778 lt!405978)) (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))))))

(declare-fun b!265019 () Bool)

(declare-fun e!185052 () Bool)

(assert (=> b!265019 (= e!185051 e!185052)))

(declare-fun res!221515 () Bool)

(assert (=> b!265019 (=> res!221515 e!185052)))

(assert (=> b!265019 (= res!221515 (= (size!6439 (buf!6907 lt!405978)) #b00000000000000000000000000000000))))

(declare-fun b!265020 () Bool)

(assert (=> b!265020 (= e!185052 (arrayBitRangesEq!0 (buf!6907 lt!405978) (buf!6907 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 lt!405978)) (currentByte!12783 lt!405978) (currentBit!12778 lt!405978))))))

(assert (= (and d!89450 res!221517) b!265018))

(assert (= (and b!265018 res!221516) b!265019))

(assert (= (and b!265019 (not res!221515)) b!265020))

(assert (=> b!265018 m!395551))

(assert (=> b!265018 m!395345))

(assert (=> b!265020 m!395551))

(assert (=> b!265020 m!395551))

(declare-fun m!395651 () Bool)

(assert (=> b!265020 m!395651))

(assert (=> b!264776 d!89450))

(declare-fun d!89452 () Bool)

(declare-fun res!221521 () Bool)

(declare-fun e!185058 () Bool)

(assert (=> d!89452 (=> res!221521 e!185058)))

(assert (=> d!89452 (= res!221521 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))))))

(assert (=> d!89452 (= (arrayBitRangesEq!0 (buf!6907 w2!580) (buf!6907 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))) e!185058)))

(declare-fun b!265021 () Bool)

(declare-fun e!185056 () Bool)

(declare-fun call!4113 () Bool)

(assert (=> b!265021 (= e!185056 call!4113)))

(declare-fun lt!406171 () (_ BitVec 32))

(declare-fun c!12172 () Bool)

(declare-fun bm!4110 () Bool)

(declare-fun lt!406169 () (_ BitVec 32))

(declare-fun lt!406170 () tuple4!354)

(assert (=> bm!4110 (= call!4113 (byteRangesEq!0 (select (arr!7426 (buf!6907 w2!580)) (_3!957 lt!406170)) (select (arr!7426 (buf!6907 w1!584)) (_3!957 lt!406170)) lt!406169 (ite c!12172 lt!406171 #b00000000000000000000000000001000)))))

(declare-fun e!185057 () Bool)

(declare-fun b!265022 () Bool)

(assert (=> b!265022 (= e!185057 (byteRangesEq!0 (select (arr!7426 (buf!6907 w2!580)) (_4!177 lt!406170)) (select (arr!7426 (buf!6907 w1!584)) (_4!177 lt!406170)) #b00000000000000000000000000000000 lt!406171))))

(declare-fun b!265023 () Bool)

(declare-fun res!221520 () Bool)

(assert (=> b!265023 (= res!221520 (= lt!406171 #b00000000000000000000000000000000))))

(assert (=> b!265023 (=> res!221520 e!185057)))

(declare-fun e!185053 () Bool)

(assert (=> b!265023 (= e!185053 e!185057)))

(declare-fun b!265024 () Bool)

(assert (=> b!265024 (= e!185056 e!185053)))

(declare-fun res!221518 () Bool)

(assert (=> b!265024 (= res!221518 call!4113)))

(assert (=> b!265024 (=> (not res!221518) (not e!185053))))

(declare-fun b!265025 () Bool)

(declare-fun e!185054 () Bool)

(assert (=> b!265025 (= e!185054 e!185056)))

(assert (=> b!265025 (= c!12172 (= (_3!957 lt!406170) (_4!177 lt!406170)))))

(declare-fun b!265026 () Bool)

(assert (=> b!265026 (= e!185058 e!185054)))

(declare-fun res!221519 () Bool)

(assert (=> b!265026 (=> (not res!221519) (not e!185054))))

(declare-fun e!185055 () Bool)

(assert (=> b!265026 (= res!221519 e!185055)))

(declare-fun res!221522 () Bool)

(assert (=> b!265026 (=> res!221522 e!185055)))

(assert (=> b!265026 (= res!221522 (bvsge (_1!12157 lt!406170) (_2!12157 lt!406170)))))

(assert (=> b!265026 (= lt!406171 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265026 (= lt!406169 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265026 (= lt!406170 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6439 (buf!6907 w1!584)) (currentByte!12783 w1!584) (currentBit!12778 w1!584))))))

(declare-fun b!265027 () Bool)

(assert (=> b!265027 (= e!185055 (arrayRangesEq!1013 (buf!6907 w2!580) (buf!6907 w1!584) (_1!12157 lt!406170) (_2!12157 lt!406170)))))

(assert (= (and d!89452 (not res!221521)) b!265026))

(assert (= (and b!265026 (not res!221522)) b!265027))

(assert (= (and b!265026 res!221519) b!265025))

(assert (= (and b!265025 c!12172) b!265021))

(assert (= (and b!265025 (not c!12172)) b!265024))

(assert (= (and b!265024 res!221518) b!265023))

(assert (= (and b!265023 (not res!221520)) b!265022))

(assert (= (or b!265021 b!265024) bm!4110))

(declare-fun m!395653 () Bool)

(assert (=> bm!4110 m!395653))

(declare-fun m!395655 () Bool)

(assert (=> bm!4110 m!395655))

(assert (=> bm!4110 m!395653))

(assert (=> bm!4110 m!395655))

(declare-fun m!395657 () Bool)

(assert (=> bm!4110 m!395657))

(declare-fun m!395659 () Bool)

(assert (=> b!265022 m!395659))

(declare-fun m!395661 () Bool)

(assert (=> b!265022 m!395661))

(assert (=> b!265022 m!395659))

(assert (=> b!265022 m!395661))

(declare-fun m!395663 () Bool)

(assert (=> b!265022 m!395663))

(assert (=> b!265026 m!395345))

(assert (=> b!265026 m!395521))

(declare-fun m!395665 () Bool)

(assert (=> b!265027 m!395665))

(assert (=> b!264782 d!89452))

(assert (=> b!264782 d!89382))

(declare-fun d!89454 () Bool)

(assert (=> d!89454 (= (array_inv!6163 (buf!6907 w2!580)) (bvsge (size!6439 (buf!6907 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!264777 d!89454))

(push 1)

(assert (not b!264983))

(assert (not b!264954))

(assert (not b!264960))

(assert (not b!264972))

(assert (not bm!4102))

(assert (not d!89446))

(assert (not b!264905))

(assert (not b!265020))

(assert (not d!89406))

(assert (not b!264910))

(assert (not bm!4108))

(assert (not b!264989))

(assert (not d!89382))

(assert (not b!265018))

(assert (not d!89398))

(assert (not b!265026))

(assert (not d!89424))

(assert (not b!264988))

(assert (not b!265015))

(assert (not b!264909))

(assert (not d!89394))

(assert (not b!264970))

(assert (not d!89426))

(assert (not b!264991))

(assert (not b!264987))

(assert (not b!265008))

(assert (not b!265022))

(assert (not d!89444))

(assert (not b!264962))

(assert (not b!265027))

(assert (not d!89442))

(assert (not d!89386))

(assert (not b!265017))

(assert (not b!264956))

(assert (not bm!4110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

