; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58050 () Bool)

(assert start!58050)

(declare-fun b!266648 () Bool)

(declare-fun e!186595 () Bool)

(declare-datatypes ((array!14864 0))(
  ( (array!14865 (arr!7468 (Array (_ BitVec 32) (_ BitVec 8))) (size!6481 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11776 0))(
  ( (BitStream!11777 (buf!6949 array!14864) (currentByte!12843 (_ BitVec 32)) (currentBit!12838 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11776)

(declare-fun w2!580 () BitStream!11776)

(declare-fun arrayBitRangesEq!0 (array!14864 array!14864 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266648 (= e!186595 (not (arrayBitRangesEq!0 (buf!6949 w1!584) (buf!6949 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584)))))))

(declare-fun b!266649 () Bool)

(declare-fun e!186593 () Bool)

(assert (=> b!266649 (= e!186593 (not (arrayBitRangesEq!0 (buf!6949 w2!580) (buf!6949 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584)))))))

(declare-fun b!266650 () Bool)

(declare-fun e!186600 () Bool)

(declare-fun e!186591 () Bool)

(assert (=> b!266650 (= e!186600 e!186591)))

(declare-fun res!222689 () Bool)

(assert (=> b!266650 (=> res!222689 e!186591)))

(assert (=> b!266650 (= res!222689 e!186593)))

(declare-fun res!222687 () Bool)

(assert (=> b!266650 (=> (not res!222687) (not e!186593))))

(assert (=> b!266650 (= res!222687 (not (= (size!6481 (buf!6949 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18941 0))(
  ( (Unit!18942) )
))
(declare-fun lt!407345 () Unit!18941)

(declare-fun e!186594 () Unit!18941)

(assert (=> b!266650 (= lt!407345 e!186594)))

(declare-fun c!12282 () Bool)

(assert (=> b!266650 (= c!12282 (not (= (size!6481 (buf!6949 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266651 () Bool)

(declare-fun lt!407347 () Unit!18941)

(assert (=> b!266651 (= e!186594 lt!407347)))

(declare-fun lt!407346 () (_ BitVec 64))

(assert (=> b!266651 (= lt!407346 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14864 array!14864 (_ BitVec 64) (_ BitVec 64)) Unit!18941)

(assert (=> b!266651 (= lt!407347 (arrayBitRangesEqSymmetric!0 (buf!6949 w1!584) (buf!6949 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407346))))

(assert (=> b!266651 (arrayBitRangesEq!0 (buf!6949 w2!580) (buf!6949 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407346)))

(declare-fun b!266652 () Bool)

(declare-fun Unit!18943 () Unit!18941)

(assert (=> b!266652 (= e!186594 Unit!18943)))

(declare-fun res!222688 () Bool)

(declare-fun e!186598 () Bool)

(assert (=> start!58050 (=> (not res!222688) (not e!186598))))

(declare-fun isPrefixOf!0 (BitStream!11776 BitStream!11776) Bool)

(assert (=> start!58050 (= res!222688 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58050 e!186598))

(declare-fun e!186596 () Bool)

(declare-fun inv!12 (BitStream!11776) Bool)

(assert (=> start!58050 (and (inv!12 w1!584) e!186596)))

(declare-fun e!186599 () Bool)

(assert (=> start!58050 (and (inv!12 w2!580) e!186599)))

(declare-fun lt!407351 () (_ BitVec 64))

(declare-fun lt!407353 () (_ BitVec 64))

(declare-fun b!266653 () Bool)

(declare-fun lt!407350 () (_ BitVec 64))

(assert (=> b!266653 (= e!186591 (or (= lt!407350 (bvand lt!407353 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!407350 (bvand (bvsub lt!407351 lt!407353) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!266653 (= lt!407350 (bvand lt!407351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!266653 (= lt!407353 (bitIndex!0 (size!6481 (buf!6949 w2!580)) (currentByte!12843 w2!580) (currentBit!12838 w2!580)))))

(assert (=> b!266653 (= lt!407351 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584)))))

(declare-fun lt!407348 () Unit!18941)

(declare-fun lt!407344 () BitStream!11776)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11776 BitStream!11776 BitStream!11776) Unit!18941)

(assert (=> b!266653 (= lt!407348 (lemmaIsPrefixTransitive!0 lt!407344 w2!580 w2!580))))

(assert (=> b!266653 (isPrefixOf!0 lt!407344 w2!580)))

(declare-fun lt!407352 () Unit!18941)

(assert (=> b!266653 (= lt!407352 (lemmaIsPrefixTransitive!0 lt!407344 w1!584 w2!580))))

(declare-fun b!266654 () Bool)

(declare-fun array_inv!6205 (array!14864) Bool)

(assert (=> b!266654 (= e!186599 (array_inv!6205 (buf!6949 w2!580)))))

(declare-fun b!266655 () Bool)

(assert (=> b!266655 (= e!186596 (array_inv!6205 (buf!6949 w1!584)))))

(declare-fun b!266656 () Bool)

(assert (=> b!266656 (= e!186598 (not e!186600))))

(declare-fun res!222690 () Bool)

(assert (=> b!266656 (=> res!222690 e!186600)))

(assert (=> b!266656 (= res!222690 e!186595)))

(declare-fun res!222691 () Bool)

(assert (=> b!266656 (=> (not res!222691) (not e!186595))))

(assert (=> b!266656 (= res!222691 (not (= (size!6481 (buf!6949 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266656 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407354 () Unit!18941)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11776) Unit!18941)

(assert (=> b!266656 (= lt!407354 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!266656 (isPrefixOf!0 lt!407344 lt!407344)))

(declare-fun lt!407349 () Unit!18941)

(assert (=> b!266656 (= lt!407349 (lemmaIsPrefixRefl!0 lt!407344))))

(assert (=> b!266656 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407343 () Unit!18941)

(assert (=> b!266656 (= lt!407343 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266656 (= lt!407344 (BitStream!11777 (buf!6949 w2!580) (currentByte!12843 w1!584) (currentBit!12838 w1!584)))))

(declare-fun b!266657 () Bool)

(declare-fun res!222686 () Bool)

(assert (=> b!266657 (=> res!222686 e!186591)))

(assert (=> b!266657 (= res!222686 (not (isPrefixOf!0 lt!407344 w1!584)))))

(assert (= (and start!58050 res!222688) b!266656))

(assert (= (and b!266656 res!222691) b!266648))

(assert (= (and b!266656 (not res!222690)) b!266650))

(assert (= (and b!266650 c!12282) b!266651))

(assert (= (and b!266650 (not c!12282)) b!266652))

(assert (= (and b!266650 res!222687) b!266649))

(assert (= (and b!266650 (not res!222689)) b!266657))

(assert (= (and b!266657 (not res!222686)) b!266653))

(assert (= start!58050 b!266655))

(assert (= start!58050 b!266654))

(declare-fun m!397511 () Bool)

(assert (=> b!266648 m!397511))

(assert (=> b!266648 m!397511))

(declare-fun m!397513 () Bool)

(assert (=> b!266648 m!397513))

(declare-fun m!397515 () Bool)

(assert (=> b!266655 m!397515))

(declare-fun m!397517 () Bool)

(assert (=> start!58050 m!397517))

(declare-fun m!397519 () Bool)

(assert (=> start!58050 m!397519))

(declare-fun m!397521 () Bool)

(assert (=> start!58050 m!397521))

(declare-fun m!397523 () Bool)

(assert (=> b!266656 m!397523))

(declare-fun m!397525 () Bool)

(assert (=> b!266656 m!397525))

(declare-fun m!397527 () Bool)

(assert (=> b!266656 m!397527))

(declare-fun m!397529 () Bool)

(assert (=> b!266656 m!397529))

(declare-fun m!397531 () Bool)

(assert (=> b!266656 m!397531))

(declare-fun m!397533 () Bool)

(assert (=> b!266656 m!397533))

(assert (=> b!266649 m!397511))

(assert (=> b!266649 m!397511))

(declare-fun m!397535 () Bool)

(assert (=> b!266649 m!397535))

(assert (=> b!266653 m!397511))

(declare-fun m!397537 () Bool)

(assert (=> b!266653 m!397537))

(declare-fun m!397539 () Bool)

(assert (=> b!266653 m!397539))

(declare-fun m!397541 () Bool)

(assert (=> b!266653 m!397541))

(declare-fun m!397543 () Bool)

(assert (=> b!266653 m!397543))

(declare-fun m!397545 () Bool)

(assert (=> b!266654 m!397545))

(assert (=> b!266651 m!397511))

(declare-fun m!397547 () Bool)

(assert (=> b!266651 m!397547))

(declare-fun m!397549 () Bool)

(assert (=> b!266651 m!397549))

(declare-fun m!397551 () Bool)

(assert (=> b!266657 m!397551))

(push 1)

(assert (not b!266649))

(assert (not b!266648))

(assert (not b!266653))

(assert (not b!266657))

(assert (not start!58050))

(assert (not b!266654))

(assert (not b!266651))

(assert (not b!266655))

(assert (not b!266656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89954 () Bool)

(assert (=> d!89954 (= (array_inv!6205 (buf!6949 w2!580)) (bvsge (size!6481 (buf!6949 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!266654 d!89954))

(declare-fun e!186675 () Bool)

(declare-datatypes ((tuple4!390 0))(
  ( (tuple4!391 (_1!12175 (_ BitVec 32)) (_2!12175 (_ BitVec 32)) (_3!975 (_ BitVec 32)) (_4!195 (_ BitVec 32))) )
))
(declare-fun lt!407446 () tuple4!390)

(declare-fun b!266736 () Bool)

(declare-fun arrayRangesEq!1031 (array!14864 array!14864 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266736 (= e!186675 (arrayRangesEq!1031 (buf!6949 w2!580) (buf!6949 w1!584) (_1!12175 lt!407446) (_2!12175 lt!407446)))))

(declare-fun d!89956 () Bool)

(declare-fun res!222743 () Bool)

(declare-fun e!186678 () Bool)

(assert (=> d!89956 (=> res!222743 e!186678)))

(assert (=> d!89956 (= res!222743 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))))))

(assert (=> d!89956 (= (arrayBitRangesEq!0 (buf!6949 w2!580) (buf!6949 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))) e!186678)))

(declare-fun b!266737 () Bool)

(declare-fun res!222745 () Bool)

(declare-fun lt!407447 () (_ BitVec 32))

(assert (=> b!266737 (= res!222745 (= lt!407447 #b00000000000000000000000000000000))))

(declare-fun e!186677 () Bool)

(assert (=> b!266737 (=> res!222745 e!186677)))

(declare-fun e!186680 () Bool)

(assert (=> b!266737 (= e!186680 e!186677)))

(declare-fun bm!4166 () Bool)

(declare-fun call!4169 () Bool)

(declare-fun lt!407445 () (_ BitVec 32))

(declare-fun c!12291 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4166 (= call!4169 (byteRangesEq!0 (select (arr!7468 (buf!6949 w2!580)) (_3!975 lt!407446)) (select (arr!7468 (buf!6949 w1!584)) (_3!975 lt!407446)) lt!407445 (ite c!12291 lt!407447 #b00000000000000000000000000001000)))))

(declare-fun b!266738 () Bool)

(declare-fun e!186676 () Bool)

(assert (=> b!266738 (= e!186678 e!186676)))

(declare-fun res!222744 () Bool)

(assert (=> b!266738 (=> (not res!222744) (not e!186676))))

(assert (=> b!266738 (= res!222744 e!186675)))

(declare-fun res!222746 () Bool)

(assert (=> b!266738 (=> res!222746 e!186675)))

(assert (=> b!266738 (= res!222746 (bvsge (_1!12175 lt!407446) (_2!12175 lt!407446)))))

(assert (=> b!266738 (= lt!407447 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266738 (= lt!407445 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!390)

(assert (=> b!266738 (= lt!407446 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))))))

(declare-fun b!266739 () Bool)

(declare-fun e!186679 () Bool)

(assert (=> b!266739 (= e!186679 e!186680)))

(declare-fun res!222742 () Bool)

(assert (=> b!266739 (= res!222742 call!4169)))

(assert (=> b!266739 (=> (not res!222742) (not e!186680))))

(declare-fun b!266740 () Bool)

(assert (=> b!266740 (= e!186677 (byteRangesEq!0 (select (arr!7468 (buf!6949 w2!580)) (_4!195 lt!407446)) (select (arr!7468 (buf!6949 w1!584)) (_4!195 lt!407446)) #b00000000000000000000000000000000 lt!407447))))

(declare-fun b!266741 () Bool)

(assert (=> b!266741 (= e!186679 call!4169)))

(declare-fun b!266742 () Bool)

(assert (=> b!266742 (= e!186676 e!186679)))

(assert (=> b!266742 (= c!12291 (= (_3!975 lt!407446) (_4!195 lt!407446)))))

(assert (= (and d!89956 (not res!222743)) b!266738))

(assert (= (and b!266738 (not res!222746)) b!266736))

(assert (= (and b!266738 res!222744) b!266742))

(assert (= (and b!266742 c!12291) b!266741))

(assert (= (and b!266742 (not c!12291)) b!266739))

(assert (= (and b!266739 res!222742) b!266737))

(assert (= (and b!266737 (not res!222745)) b!266740))

(assert (= (or b!266741 b!266739) bm!4166))

(declare-fun m!397637 () Bool)

(assert (=> b!266736 m!397637))

(declare-fun m!397639 () Bool)

(assert (=> bm!4166 m!397639))

(declare-fun m!397641 () Bool)

(assert (=> bm!4166 m!397641))

(assert (=> bm!4166 m!397639))

(assert (=> bm!4166 m!397641))

(declare-fun m!397643 () Bool)

(assert (=> bm!4166 m!397643))

(assert (=> b!266738 m!397511))

(declare-fun m!397645 () Bool)

(assert (=> b!266738 m!397645))

(declare-fun m!397647 () Bool)

(assert (=> b!266740 m!397647))

(declare-fun m!397649 () Bool)

(assert (=> b!266740 m!397649))

(assert (=> b!266740 m!397647))

(assert (=> b!266740 m!397649))

(declare-fun m!397651 () Bool)

(assert (=> b!266740 m!397651))

(assert (=> b!266649 d!89956))

(declare-fun d!89960 () Bool)

(declare-fun e!186702 () Bool)

(assert (=> d!89960 e!186702))

(declare-fun res!222768 () Bool)

(assert (=> d!89960 (=> (not res!222768) (not e!186702))))

(declare-fun lt!407482 () (_ BitVec 64))

(declare-fun lt!407483 () (_ BitVec 64))

(declare-fun lt!407481 () (_ BitVec 64))

(assert (=> d!89960 (= res!222768 (= lt!407482 (bvsub lt!407481 lt!407483)))))

(assert (=> d!89960 (or (= (bvand lt!407481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407481 lt!407483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89960 (= lt!407483 (remainingBits!0 ((_ sign_extend 32) (size!6481 (buf!6949 w1!584))) ((_ sign_extend 32) (currentByte!12843 w1!584)) ((_ sign_extend 32) (currentBit!12838 w1!584))))))

(declare-fun lt!407478 () (_ BitVec 64))

(declare-fun lt!407480 () (_ BitVec 64))

(assert (=> d!89960 (= lt!407481 (bvmul lt!407478 lt!407480))))

(assert (=> d!89960 (or (= lt!407478 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407480 (bvsdiv (bvmul lt!407478 lt!407480) lt!407478)))))

(assert (=> d!89960 (= lt!407480 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89960 (= lt!407478 ((_ sign_extend 32) (size!6481 (buf!6949 w1!584))))))

(assert (=> d!89960 (= lt!407482 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12843 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12838 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89960 (invariant!0 (currentBit!12838 w1!584) (currentByte!12843 w1!584) (size!6481 (buf!6949 w1!584)))))

(assert (=> d!89960 (= (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584)) lt!407482)))

(declare-fun b!266770 () Bool)

(declare-fun res!222769 () Bool)

(assert (=> b!266770 (=> (not res!222769) (not e!186702))))

(assert (=> b!266770 (= res!222769 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407482))))

(declare-fun b!266771 () Bool)

(declare-fun lt!407479 () (_ BitVec 64))

(assert (=> b!266771 (= e!186702 (bvsle lt!407482 (bvmul lt!407479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266771 (or (= lt!407479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407479)))))

(assert (=> b!266771 (= lt!407479 ((_ sign_extend 32) (size!6481 (buf!6949 w1!584))))))

(assert (= (and d!89960 res!222768) b!266770))

(assert (= (and b!266770 res!222769) b!266771))

(declare-fun m!397675 () Bool)

(assert (=> d!89960 m!397675))

(declare-fun m!397677 () Bool)

(assert (=> d!89960 m!397677))

(assert (=> b!266649 d!89960))

(declare-fun d!89968 () Bool)

(assert (=> d!89968 (= (array_inv!6205 (buf!6949 w1!584)) (bvsge (size!6481 (buf!6949 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!266655 d!89968))

(declare-fun d!89970 () Bool)

(declare-fun e!186703 () Bool)

(assert (=> d!89970 e!186703))

(declare-fun res!222770 () Bool)

(assert (=> d!89970 (=> (not res!222770) (not e!186703))))

(declare-fun lt!407487 () (_ BitVec 64))

(declare-fun lt!407489 () (_ BitVec 64))

(declare-fun lt!407488 () (_ BitVec 64))

(assert (=> d!89970 (= res!222770 (= lt!407488 (bvsub lt!407487 lt!407489)))))

(assert (=> d!89970 (or (= (bvand lt!407487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407487 lt!407489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!89970 (= lt!407489 (remainingBits!0 ((_ sign_extend 32) (size!6481 (buf!6949 w2!580))) ((_ sign_extend 32) (currentByte!12843 w2!580)) ((_ sign_extend 32) (currentBit!12838 w2!580))))))

(declare-fun lt!407484 () (_ BitVec 64))

(declare-fun lt!407486 () (_ BitVec 64))

(assert (=> d!89970 (= lt!407487 (bvmul lt!407484 lt!407486))))

(assert (=> d!89970 (or (= lt!407484 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407486 (bvsdiv (bvmul lt!407484 lt!407486) lt!407484)))))

(assert (=> d!89970 (= lt!407486 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89970 (= lt!407484 ((_ sign_extend 32) (size!6481 (buf!6949 w2!580))))))

(assert (=> d!89970 (= lt!407488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12843 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12838 w2!580))))))

(assert (=> d!89970 (invariant!0 (currentBit!12838 w2!580) (currentByte!12843 w2!580) (size!6481 (buf!6949 w2!580)))))

(assert (=> d!89970 (= (bitIndex!0 (size!6481 (buf!6949 w2!580)) (currentByte!12843 w2!580) (currentBit!12838 w2!580)) lt!407488)))

(declare-fun b!266772 () Bool)

(declare-fun res!222771 () Bool)

(assert (=> b!266772 (=> (not res!222771) (not e!186703))))

(assert (=> b!266772 (= res!222771 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407488))))

(declare-fun b!266773 () Bool)

(declare-fun lt!407485 () (_ BitVec 64))

(assert (=> b!266773 (= e!186703 (bvsle lt!407488 (bvmul lt!407485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266773 (or (= lt!407485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407485)))))

(assert (=> b!266773 (= lt!407485 ((_ sign_extend 32) (size!6481 (buf!6949 w2!580))))))

(assert (= (and d!89970 res!222770) b!266772))

(assert (= (and b!266772 res!222771) b!266773))

(declare-fun m!397679 () Bool)

(assert (=> d!89970 m!397679))

(declare-fun m!397681 () Bool)

(assert (=> d!89970 m!397681))

(assert (=> b!266653 d!89970))

(declare-fun d!89972 () Bool)

(assert (=> d!89972 (isPrefixOf!0 lt!407344 w2!580)))

(declare-fun lt!407492 () Unit!18941)

(declare-fun choose!30 (BitStream!11776 BitStream!11776 BitStream!11776) Unit!18941)

(assert (=> d!89972 (= lt!407492 (choose!30 lt!407344 w1!584 w2!580))))

(assert (=> d!89972 (isPrefixOf!0 lt!407344 w1!584)))

(assert (=> d!89972 (= (lemmaIsPrefixTransitive!0 lt!407344 w1!584 w2!580) lt!407492)))

(declare-fun bs!22849 () Bool)

(assert (= bs!22849 d!89972))

(assert (=> bs!22849 m!397539))

(declare-fun m!397683 () Bool)

(assert (=> bs!22849 m!397683))

(assert (=> bs!22849 m!397551))

(assert (=> b!266653 d!89972))

(declare-fun d!89974 () Bool)

(declare-fun res!222791 () Bool)

(declare-fun e!186722 () Bool)

(assert (=> d!89974 (=> (not res!222791) (not e!186722))))

(assert (=> d!89974 (= res!222791 (= (size!6481 (buf!6949 lt!407344)) (size!6481 (buf!6949 w2!580))))))

(assert (=> d!89974 (= (isPrefixOf!0 lt!407344 w2!580) e!186722)))

(declare-fun b!266794 () Bool)

(declare-fun res!222792 () Bool)

(assert (=> b!266794 (=> (not res!222792) (not e!186722))))

(assert (=> b!266794 (= res!222792 (bvsle (bitIndex!0 (size!6481 (buf!6949 lt!407344)) (currentByte!12843 lt!407344) (currentBit!12838 lt!407344)) (bitIndex!0 (size!6481 (buf!6949 w2!580)) (currentByte!12843 w2!580) (currentBit!12838 w2!580))))))

(declare-fun b!266795 () Bool)

(declare-fun e!186723 () Bool)

(assert (=> b!266795 (= e!186722 e!186723)))

(declare-fun res!222790 () Bool)

(assert (=> b!266795 (=> res!222790 e!186723)))

(assert (=> b!266795 (= res!222790 (= (size!6481 (buf!6949 lt!407344)) #b00000000000000000000000000000000))))

(declare-fun b!266796 () Bool)

(assert (=> b!266796 (= e!186723 (arrayBitRangesEq!0 (buf!6949 lt!407344) (buf!6949 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 lt!407344)) (currentByte!12843 lt!407344) (currentBit!12838 lt!407344))))))

(assert (= (and d!89974 res!222791) b!266794))

(assert (= (and b!266794 res!222792) b!266795))

(assert (= (and b!266795 (not res!222790)) b!266796))

(declare-fun m!397685 () Bool)

(assert (=> b!266794 m!397685))

(assert (=> b!266794 m!397537))

(assert (=> b!266796 m!397685))

(assert (=> b!266796 m!397685))

(declare-fun m!397687 () Bool)

(assert (=> b!266796 m!397687))

(assert (=> b!266653 d!89974))

(assert (=> b!266653 d!89960))

(declare-fun d!89976 () Bool)

(assert (=> d!89976 (isPrefixOf!0 lt!407344 w2!580)))

(declare-fun lt!407511 () Unit!18941)

(assert (=> d!89976 (= lt!407511 (choose!30 lt!407344 w2!580 w2!580))))

(assert (=> d!89976 (isPrefixOf!0 lt!407344 w2!580)))

(assert (=> d!89976 (= (lemmaIsPrefixTransitive!0 lt!407344 w2!580 w2!580) lt!407511)))

(declare-fun bs!22850 () Bool)

(assert (= bs!22850 d!89976))

(assert (=> bs!22850 m!397539))

(declare-fun m!397689 () Bool)

(assert (=> bs!22850 m!397689))

(assert (=> bs!22850 m!397539))

(assert (=> b!266653 d!89976))

(declare-fun lt!407513 () tuple4!390)

(declare-fun b!266801 () Bool)

(declare-fun e!186724 () Bool)

(assert (=> b!266801 (= e!186724 (arrayRangesEq!1031 (buf!6949 w1!584) (buf!6949 w2!580) (_1!12175 lt!407513) (_2!12175 lt!407513)))))

(declare-fun d!89978 () Bool)

(declare-fun res!222796 () Bool)

(declare-fun e!186727 () Bool)

(assert (=> d!89978 (=> res!222796 e!186727)))

(assert (=> d!89978 (= res!222796 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))))))

(assert (=> d!89978 (= (arrayBitRangesEq!0 (buf!6949 w1!584) (buf!6949 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))) e!186727)))

(declare-fun b!266802 () Bool)

(declare-fun res!222798 () Bool)

(declare-fun lt!407514 () (_ BitVec 32))

(assert (=> b!266802 (= res!222798 (= lt!407514 #b00000000000000000000000000000000))))

(declare-fun e!186726 () Bool)

(assert (=> b!266802 (=> res!222798 e!186726)))

(declare-fun e!186729 () Bool)

(assert (=> b!266802 (= e!186729 e!186726)))

(declare-fun c!12297 () Bool)

(declare-fun lt!407512 () (_ BitVec 32))

(declare-fun call!4175 () Bool)

(declare-fun bm!4172 () Bool)

(assert (=> bm!4172 (= call!4175 (byteRangesEq!0 (select (arr!7468 (buf!6949 w1!584)) (_3!975 lt!407513)) (select (arr!7468 (buf!6949 w2!580)) (_3!975 lt!407513)) lt!407512 (ite c!12297 lt!407514 #b00000000000000000000000000001000)))))

(declare-fun b!266803 () Bool)

(declare-fun e!186725 () Bool)

(assert (=> b!266803 (= e!186727 e!186725)))

(declare-fun res!222797 () Bool)

(assert (=> b!266803 (=> (not res!222797) (not e!186725))))

(assert (=> b!266803 (= res!222797 e!186724)))

(declare-fun res!222799 () Bool)

(assert (=> b!266803 (=> res!222799 e!186724)))

(assert (=> b!266803 (= res!222799 (bvsge (_1!12175 lt!407513) (_2!12175 lt!407513)))))

(assert (=> b!266803 (= lt!407514 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266803 (= lt!407512 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266803 (= lt!407513 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))))))

(declare-fun b!266804 () Bool)

(declare-fun e!186728 () Bool)

(assert (=> b!266804 (= e!186728 e!186729)))

(declare-fun res!222795 () Bool)

(assert (=> b!266804 (= res!222795 call!4175)))

(assert (=> b!266804 (=> (not res!222795) (not e!186729))))

(declare-fun b!266805 () Bool)

(assert (=> b!266805 (= e!186726 (byteRangesEq!0 (select (arr!7468 (buf!6949 w1!584)) (_4!195 lt!407513)) (select (arr!7468 (buf!6949 w2!580)) (_4!195 lt!407513)) #b00000000000000000000000000000000 lt!407514))))

(declare-fun b!266806 () Bool)

(assert (=> b!266806 (= e!186728 call!4175)))

(declare-fun b!266807 () Bool)

(assert (=> b!266807 (= e!186725 e!186728)))

(assert (=> b!266807 (= c!12297 (= (_3!975 lt!407513) (_4!195 lt!407513)))))

(assert (= (and d!89978 (not res!222796)) b!266803))

(assert (= (and b!266803 (not res!222799)) b!266801))

(assert (= (and b!266803 res!222797) b!266807))

(assert (= (and b!266807 c!12297) b!266806))

(assert (= (and b!266807 (not c!12297)) b!266804))

(assert (= (and b!266804 res!222795) b!266802))

(assert (= (and b!266802 (not res!222798)) b!266805))

(assert (= (or b!266806 b!266804) bm!4172))

(declare-fun m!397691 () Bool)

(assert (=> b!266801 m!397691))

(declare-fun m!397693 () Bool)

(assert (=> bm!4172 m!397693))

(declare-fun m!397695 () Bool)

(assert (=> bm!4172 m!397695))

(assert (=> bm!4172 m!397693))

(assert (=> bm!4172 m!397695))

(declare-fun m!397697 () Bool)

(assert (=> bm!4172 m!397697))

(assert (=> b!266803 m!397511))

(assert (=> b!266803 m!397645))

(declare-fun m!397699 () Bool)

(assert (=> b!266805 m!397699))

(declare-fun m!397701 () Bool)

(assert (=> b!266805 m!397701))

(assert (=> b!266805 m!397699))

(assert (=> b!266805 m!397701))

(declare-fun m!397703 () Bool)

(assert (=> b!266805 m!397703))

(assert (=> b!266648 d!89978))

(assert (=> b!266648 d!89960))

(declare-fun d!89980 () Bool)

(declare-fun res!222803 () Bool)

(declare-fun e!186731 () Bool)

(assert (=> d!89980 (=> (not res!222803) (not e!186731))))

(assert (=> d!89980 (= res!222803 (= (size!6481 (buf!6949 lt!407344)) (size!6481 (buf!6949 w1!584))))))

(assert (=> d!89980 (= (isPrefixOf!0 lt!407344 w1!584) e!186731)))

(declare-fun b!266810 () Bool)

(declare-fun res!222804 () Bool)

(assert (=> b!266810 (=> (not res!222804) (not e!186731))))

(assert (=> b!266810 (= res!222804 (bvsle (bitIndex!0 (size!6481 (buf!6949 lt!407344)) (currentByte!12843 lt!407344) (currentBit!12838 lt!407344)) (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))))))

(declare-fun b!266811 () Bool)

(declare-fun e!186732 () Bool)

(assert (=> b!266811 (= e!186731 e!186732)))

(declare-fun res!222802 () Bool)

(assert (=> b!266811 (=> res!222802 e!186732)))

(assert (=> b!266811 (= res!222802 (= (size!6481 (buf!6949 lt!407344)) #b00000000000000000000000000000000))))

(declare-fun b!266812 () Bool)

(assert (=> b!266812 (= e!186732 (arrayBitRangesEq!0 (buf!6949 lt!407344) (buf!6949 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 lt!407344)) (currentByte!12843 lt!407344) (currentBit!12838 lt!407344))))))

(assert (= (and d!89980 res!222803) b!266810))

(assert (= (and b!266810 res!222804) b!266811))

(assert (= (and b!266811 (not res!222802)) b!266812))

(assert (=> b!266810 m!397685))

(assert (=> b!266810 m!397511))

(assert (=> b!266812 m!397685))

(assert (=> b!266812 m!397685))

(declare-fun m!397709 () Bool)

(assert (=> b!266812 m!397709))

(assert (=> b!266657 d!89980))

(declare-fun d!89984 () Bool)

(declare-fun res!222806 () Bool)

(declare-fun e!186733 () Bool)

(assert (=> d!89984 (=> (not res!222806) (not e!186733))))

(assert (=> d!89984 (= res!222806 (= (size!6481 (buf!6949 w1!584)) (size!6481 (buf!6949 w2!580))))))

(assert (=> d!89984 (= (isPrefixOf!0 w1!584 w2!580) e!186733)))

(declare-fun b!266813 () Bool)

(declare-fun res!222807 () Bool)

(assert (=> b!266813 (=> (not res!222807) (not e!186733))))

(assert (=> b!266813 (= res!222807 (bvsle (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584)) (bitIndex!0 (size!6481 (buf!6949 w2!580)) (currentByte!12843 w2!580) (currentBit!12838 w2!580))))))

(declare-fun b!266814 () Bool)

(declare-fun e!186734 () Bool)

(assert (=> b!266814 (= e!186733 e!186734)))

(declare-fun res!222805 () Bool)

(assert (=> b!266814 (=> res!222805 e!186734)))

(assert (=> b!266814 (= res!222805 (= (size!6481 (buf!6949 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266815 () Bool)

(assert (=> b!266815 (= e!186734 (arrayBitRangesEq!0 (buf!6949 w1!584) (buf!6949 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))))))

(assert (= (and d!89984 res!222806) b!266813))

(assert (= (and b!266813 res!222807) b!266814))

(assert (= (and b!266814 (not res!222805)) b!266815))

(assert (=> b!266813 m!397511))

(assert (=> b!266813 m!397537))

(assert (=> b!266815 m!397511))

(assert (=> b!266815 m!397511))

(assert (=> b!266815 m!397513))

(assert (=> start!58050 d!89984))

(declare-fun d!89986 () Bool)

(assert (=> d!89986 (= (inv!12 w1!584) (invariant!0 (currentBit!12838 w1!584) (currentByte!12843 w1!584) (size!6481 (buf!6949 w1!584))))))

(declare-fun bs!22852 () Bool)

(assert (= bs!22852 d!89986))

(assert (=> bs!22852 m!397677))

(assert (=> start!58050 d!89986))

(declare-fun d!89988 () Bool)

(assert (=> d!89988 (= (inv!12 w2!580) (invariant!0 (currentBit!12838 w2!580) (currentByte!12843 w2!580) (size!6481 (buf!6949 w2!580))))))

(declare-fun bs!22853 () Bool)

(assert (= bs!22853 d!89988))

(assert (=> bs!22853 m!397681))

(assert (=> start!58050 d!89988))

(declare-fun d!89990 () Bool)

(assert (=> d!89990 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407533 () Unit!18941)

(declare-fun choose!11 (BitStream!11776) Unit!18941)

(assert (=> d!89990 (= lt!407533 (choose!11 w2!580))))

(assert (=> d!89990 (= (lemmaIsPrefixRefl!0 w2!580) lt!407533)))

(declare-fun bs!22857 () Bool)

(assert (= bs!22857 d!89990))

(assert (=> bs!22857 m!397529))

(declare-fun m!397747 () Bool)

(assert (=> bs!22857 m!397747))

(assert (=> b!266656 d!89990))

(declare-fun d!90000 () Bool)

(declare-fun res!222819 () Bool)

(declare-fun e!186747 () Bool)

(assert (=> d!90000 (=> (not res!222819) (not e!186747))))

(assert (=> d!90000 (= res!222819 (= (size!6481 (buf!6949 lt!407344)) (size!6481 (buf!6949 lt!407344))))))

(assert (=> d!90000 (= (isPrefixOf!0 lt!407344 lt!407344) e!186747)))

(declare-fun b!266830 () Bool)

(declare-fun res!222820 () Bool)

(assert (=> b!266830 (=> (not res!222820) (not e!186747))))

(assert (=> b!266830 (= res!222820 (bvsle (bitIndex!0 (size!6481 (buf!6949 lt!407344)) (currentByte!12843 lt!407344) (currentBit!12838 lt!407344)) (bitIndex!0 (size!6481 (buf!6949 lt!407344)) (currentByte!12843 lt!407344) (currentBit!12838 lt!407344))))))

(declare-fun b!266831 () Bool)

(declare-fun e!186748 () Bool)

(assert (=> b!266831 (= e!186747 e!186748)))

(declare-fun res!222818 () Bool)

(assert (=> b!266831 (=> res!222818 e!186748)))

(assert (=> b!266831 (= res!222818 (= (size!6481 (buf!6949 lt!407344)) #b00000000000000000000000000000000))))

(declare-fun b!266832 () Bool)

(assert (=> b!266832 (= e!186748 (arrayBitRangesEq!0 (buf!6949 lt!407344) (buf!6949 lt!407344) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 lt!407344)) (currentByte!12843 lt!407344) (currentBit!12838 lt!407344))))))

(assert (= (and d!90000 res!222819) b!266830))

(assert (= (and b!266830 res!222820) b!266831))

(assert (= (and b!266831 (not res!222818)) b!266832))

(assert (=> b!266830 m!397685))

(assert (=> b!266830 m!397685))

(assert (=> b!266832 m!397685))

(assert (=> b!266832 m!397685))

(declare-fun m!397749 () Bool)

(assert (=> b!266832 m!397749))

(assert (=> b!266656 d!90000))

(declare-fun d!90002 () Bool)

(assert (=> d!90002 (isPrefixOf!0 lt!407344 lt!407344)))

(declare-fun lt!407534 () Unit!18941)

(assert (=> d!90002 (= lt!407534 (choose!11 lt!407344))))

(assert (=> d!90002 (= (lemmaIsPrefixRefl!0 lt!407344) lt!407534)))

(declare-fun bs!22858 () Bool)

(assert (= bs!22858 d!90002))

(assert (=> bs!22858 m!397531))

(declare-fun m!397751 () Bool)

(assert (=> bs!22858 m!397751))

(assert (=> b!266656 d!90002))

(declare-fun d!90004 () Bool)

(assert (=> d!90004 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407535 () Unit!18941)

(assert (=> d!90004 (= lt!407535 (choose!11 w1!584))))

(assert (=> d!90004 (= (lemmaIsPrefixRefl!0 w1!584) lt!407535)))

(declare-fun bs!22859 () Bool)

(assert (= bs!22859 d!90004))

(assert (=> bs!22859 m!397527))

(declare-fun m!397753 () Bool)

(assert (=> bs!22859 m!397753))

(assert (=> b!266656 d!90004))

(declare-fun d!90006 () Bool)

(declare-fun res!222828 () Bool)

(declare-fun e!186753 () Bool)

(assert (=> d!90006 (=> (not res!222828) (not e!186753))))

(assert (=> d!90006 (= res!222828 (= (size!6481 (buf!6949 w1!584)) (size!6481 (buf!6949 w1!584))))))

(assert (=> d!90006 (= (isPrefixOf!0 w1!584 w1!584) e!186753)))

(declare-fun b!266837 () Bool)

(declare-fun res!222829 () Bool)

(assert (=> b!266837 (=> (not res!222829) (not e!186753))))

(assert (=> b!266837 (= res!222829 (bvsle (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584)) (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))))))

(declare-fun b!266838 () Bool)

(declare-fun e!186754 () Bool)

(assert (=> b!266838 (= e!186753 e!186754)))

(declare-fun res!222827 () Bool)

(assert (=> b!266838 (=> res!222827 e!186754)))

(assert (=> b!266838 (= res!222827 (= (size!6481 (buf!6949 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266839 () Bool)

(assert (=> b!266839 (= e!186754 (arrayBitRangesEq!0 (buf!6949 w1!584) (buf!6949 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w1!584)) (currentByte!12843 w1!584) (currentBit!12838 w1!584))))))

(assert (= (and d!90006 res!222828) b!266837))

(assert (= (and b!266837 res!222829) b!266838))

(assert (= (and b!266838 (not res!222827)) b!266839))

(assert (=> b!266837 m!397511))

(assert (=> b!266837 m!397511))

(assert (=> b!266839 m!397511))

(assert (=> b!266839 m!397511))

(declare-fun m!397755 () Bool)

(assert (=> b!266839 m!397755))

(assert (=> b!266656 d!90006))

(declare-fun d!90008 () Bool)

(declare-fun res!222831 () Bool)

(declare-fun e!186755 () Bool)

(assert (=> d!90008 (=> (not res!222831) (not e!186755))))

(assert (=> d!90008 (= res!222831 (= (size!6481 (buf!6949 w2!580)) (size!6481 (buf!6949 w2!580))))))

(assert (=> d!90008 (= (isPrefixOf!0 w2!580 w2!580) e!186755)))

(declare-fun b!266842 () Bool)

(declare-fun res!222832 () Bool)

(assert (=> b!266842 (=> (not res!222832) (not e!186755))))

(assert (=> b!266842 (= res!222832 (bvsle (bitIndex!0 (size!6481 (buf!6949 w2!580)) (currentByte!12843 w2!580) (currentBit!12838 w2!580)) (bitIndex!0 (size!6481 (buf!6949 w2!580)) (currentByte!12843 w2!580) (currentBit!12838 w2!580))))))

(declare-fun b!266843 () Bool)

(declare-fun e!186756 () Bool)

(assert (=> b!266843 (= e!186755 e!186756)))

(declare-fun res!222830 () Bool)

(assert (=> b!266843 (=> res!222830 e!186756)))

(assert (=> b!266843 (= res!222830 (= (size!6481 (buf!6949 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!266844 () Bool)

(assert (=> b!266844 (= e!186756 (arrayBitRangesEq!0 (buf!6949 w2!580) (buf!6949 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6481 (buf!6949 w2!580)) (currentByte!12843 w2!580) (currentBit!12838 w2!580))))))

(assert (= (and d!90008 res!222831) b!266842))

(assert (= (and b!266842 res!222832) b!266843))

(assert (= (and b!266843 (not res!222830)) b!266844))

(assert (=> b!266842 m!397537))

(assert (=> b!266842 m!397537))

(assert (=> b!266844 m!397537))

(assert (=> b!266844 m!397537))

(declare-fun m!397757 () Bool)

(assert (=> b!266844 m!397757))

(assert (=> b!266656 d!90008))

(assert (=> b!266651 d!89960))

(declare-fun d!90010 () Bool)

(assert (=> d!90010 (arrayBitRangesEq!0 (buf!6949 w2!580) (buf!6949 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407346)))

(declare-fun lt!407543 () Unit!18941)

(declare-fun choose!8 (array!14864 array!14864 (_ BitVec 64) (_ BitVec 64)) Unit!18941)

(assert (=> d!90010 (= lt!407543 (choose!8 (buf!6949 w1!584) (buf!6949 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407346))))

(assert (=> d!90010 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407346))))

(assert (=> d!90010 (= (arrayBitRangesEqSymmetric!0 (buf!6949 w1!584) (buf!6949 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407346) lt!407543)))

(declare-fun bs!22864 () Bool)

(assert (= bs!22864 d!90010))

(assert (=> bs!22864 m!397549))

(declare-fun m!397773 () Bool)

(assert (=> bs!22864 m!397773))

(assert (=> b!266651 d!90010))

(declare-fun b!266857 () Bool)

(declare-fun lt!407545 () tuple4!390)

(declare-fun e!186765 () Bool)

(assert (=> b!266857 (= e!186765 (arrayRangesEq!1031 (buf!6949 w2!580) (buf!6949 w1!584) (_1!12175 lt!407545) (_2!12175 lt!407545)))))

(declare-fun d!90026 () Bool)

(declare-fun res!222846 () Bool)

(declare-fun e!186768 () Bool)

(assert (=> d!90026 (=> res!222846 e!186768)))

(assert (=> d!90026 (= res!222846 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!407346))))

(assert (=> d!90026 (= (arrayBitRangesEq!0 (buf!6949 w2!580) (buf!6949 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407346) e!186768)))

(declare-fun b!266858 () Bool)

(declare-fun res!222848 () Bool)

(declare-fun lt!407546 () (_ BitVec 32))

(assert (=> b!266858 (= res!222848 (= lt!407546 #b00000000000000000000000000000000))))

(declare-fun e!186767 () Bool)

(assert (=> b!266858 (=> res!222848 e!186767)))

(declare-fun e!186770 () Bool)

(assert (=> b!266858 (= e!186770 e!186767)))

(declare-fun c!12300 () Bool)

(declare-fun call!4178 () Bool)

(declare-fun bm!4175 () Bool)

(declare-fun lt!407544 () (_ BitVec 32))

(assert (=> bm!4175 (= call!4178 (byteRangesEq!0 (select (arr!7468 (buf!6949 w2!580)) (_3!975 lt!407545)) (select (arr!7468 (buf!6949 w1!584)) (_3!975 lt!407545)) lt!407544 (ite c!12300 lt!407546 #b00000000000000000000000000001000)))))

(declare-fun b!266859 () Bool)

(declare-fun e!186766 () Bool)

(assert (=> b!266859 (= e!186768 e!186766)))

(declare-fun res!222847 () Bool)

(assert (=> b!266859 (=> (not res!222847) (not e!186766))))

(assert (=> b!266859 (= res!222847 e!186765)))

(declare-fun res!222849 () Bool)

(assert (=> b!266859 (=> res!222849 e!186765)))

(assert (=> b!266859 (= res!222849 (bvsge (_1!12175 lt!407545) (_2!12175 lt!407545)))))

(assert (=> b!266859 (= lt!407546 ((_ extract 31 0) (bvsrem lt!407346 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266859 (= lt!407544 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266859 (= lt!407545 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!407346))))

(declare-fun b!266860 () Bool)

(declare-fun e!186769 () Bool)

(assert (=> b!266860 (= e!186769 e!186770)))

(declare-fun res!222845 () Bool)

(assert (=> b!266860 (= res!222845 call!4178)))

(assert (=> b!266860 (=> (not res!222845) (not e!186770))))

(declare-fun b!266861 () Bool)

(assert (=> b!266861 (= e!186767 (byteRangesEq!0 (select (arr!7468 (buf!6949 w2!580)) (_4!195 lt!407545)) (select (arr!7468 (buf!6949 w1!584)) (_4!195 lt!407545)) #b00000000000000000000000000000000 lt!407546))))

(declare-fun b!266862 () Bool)

(assert (=> b!266862 (= e!186769 call!4178)))

(declare-fun b!266863 () Bool)

(assert (=> b!266863 (= e!186766 e!186769)))

(assert (=> b!266863 (= c!12300 (= (_3!975 lt!407545) (_4!195 lt!407545)))))

(assert (= (and d!90026 (not res!222846)) b!266859))

(assert (= (and b!266859 (not res!222849)) b!266857))

(assert (= (and b!266859 res!222847) b!266863))

(assert (= (and b!266863 c!12300) b!266862))

(assert (= (and b!266863 (not c!12300)) b!266860))

(assert (= (and b!266860 res!222845) b!266858))

(assert (= (and b!266858 (not res!222848)) b!266861))

(assert (= (or b!266862 b!266860) bm!4175))

(declare-fun m!397775 () Bool)

(assert (=> b!266857 m!397775))

(declare-fun m!397777 () Bool)

(assert (=> bm!4175 m!397777))

(declare-fun m!397779 () Bool)

(assert (=> bm!4175 m!397779))

(assert (=> bm!4175 m!397777))

(assert (=> bm!4175 m!397779))

(declare-fun m!397781 () Bool)

(assert (=> bm!4175 m!397781))

(declare-fun m!397783 () Bool)

(assert (=> b!266859 m!397783))

(declare-fun m!397785 () Bool)

(assert (=> b!266861 m!397785))

(declare-fun m!397787 () Bool)

(assert (=> b!266861 m!397787))

(assert (=> b!266861 m!397785))

(assert (=> b!266861 m!397787))

(declare-fun m!397789 () Bool)

(assert (=> b!266861 m!397789))

(assert (=> b!266651 d!90026))

(push 1)

(assert (not d!89960))

(assert (not b!266857))

(assert (not b!266805))

(assert (not b!266794))

(assert (not b!266861))

(assert (not bm!4175))

(assert (not b!266736))

(assert (not b!266815))

(assert (not bm!4166))

(assert (not b!266803))

(assert (not d!89990))

(assert (not bm!4172))

(assert (not b!266830))

(assert (not b!266837))

(assert (not d!89986))

(assert (not b!266812))

(assert (not b!266839))

(assert (not b!266738))

(assert (not d!90010))

(assert (not d!89972))

(assert (not b!266740))

(assert (not b!266842))

(assert (not b!266859))

(assert (not d!90004))

(assert (not b!266844))

(assert (not d!89988))

(assert (not d!89976))

(assert (not d!89970))

(assert (not b!266801))

(assert (not b!266796))

(assert (not d!90002))

(assert (not b!266832))

(assert (not b!266810))

(assert (not b!266813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

