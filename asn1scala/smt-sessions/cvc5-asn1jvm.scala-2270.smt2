; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57468 () Bool)

(assert start!57468)

(declare-fun b!263401 () Bool)

(declare-fun e!183627 () Bool)

(declare-fun e!183620 () Bool)

(assert (=> b!263401 (= e!183627 e!183620)))

(declare-fun res!220350 () Bool)

(assert (=> b!263401 (=> res!220350 e!183620)))

(declare-datatypes ((array!14699 0))(
  ( (array!14700 (arr!7402 (Array (_ BitVec 32) (_ BitVec 8))) (size!6415 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11644 0))(
  ( (BitStream!11645 (buf!6883 array!14699) (currentByte!12741 (_ BitVec 32)) (currentBit!12736 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11644)

(assert (=> b!263401 (= res!220350 (= (size!6415 (buf!6883 w1!584)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18776 0))(
  ( (Unit!18777) )
))
(declare-fun lt!404877 () Unit!18776)

(declare-fun e!183621 () Unit!18776)

(assert (=> b!263401 (= lt!404877 e!183621)))

(declare-fun c!12027 () Bool)

(assert (=> b!263401 (= c!12027 (not (= (size!6415 (buf!6883 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263402 () Bool)

(declare-fun Unit!18778 () Unit!18776)

(assert (=> b!263402 (= e!183621 Unit!18778)))

(declare-fun b!263403 () Bool)

(declare-fun w2!580 () BitStream!11644)

(assert (=> b!263403 (= e!183620 (bvsle (size!6415 (buf!6883 w2!580)) (size!6415 (buf!6883 w1!584))))))

(declare-fun lt!404875 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263403 (= lt!404875 (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584)))))

(declare-fun b!263404 () Bool)

(declare-fun e!183623 () Bool)

(declare-fun array_inv!6139 (array!14699) Bool)

(assert (=> b!263404 (= e!183623 (array_inv!6139 (buf!6883 w2!580)))))

(declare-fun b!263405 () Bool)

(declare-fun e!183626 () Bool)

(assert (=> b!263405 (= e!183626 (not e!183627))))

(declare-fun res!220348 () Bool)

(assert (=> b!263405 (=> res!220348 e!183627)))

(declare-fun e!183619 () Bool)

(assert (=> b!263405 (= res!220348 e!183619)))

(declare-fun res!220349 () Bool)

(assert (=> b!263405 (=> (not res!220349) (not e!183619))))

(assert (=> b!263405 (= res!220349 (not (= (size!6415 (buf!6883 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11644 BitStream!11644) Bool)

(assert (=> b!263405 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404874 () Unit!18776)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11644) Unit!18776)

(assert (=> b!263405 (= lt!404874 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404879 () BitStream!11644)

(assert (=> b!263405 (isPrefixOf!0 lt!404879 lt!404879)))

(declare-fun lt!404878 () Unit!18776)

(assert (=> b!263405 (= lt!404878 (lemmaIsPrefixRefl!0 lt!404879))))

(assert (=> b!263405 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404872 () Unit!18776)

(assert (=> b!263405 (= lt!404872 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263405 (= lt!404879 (BitStream!11645 (buf!6883 w2!580) (currentByte!12741 w1!584) (currentBit!12736 w1!584)))))

(declare-fun res!220351 () Bool)

(assert (=> start!57468 (=> (not res!220351) (not e!183626))))

(assert (=> start!57468 (= res!220351 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57468 e!183626))

(declare-fun e!183624 () Bool)

(declare-fun inv!12 (BitStream!11644) Bool)

(assert (=> start!57468 (and (inv!12 w1!584) e!183624)))

(assert (=> start!57468 (and (inv!12 w2!580) e!183623)))

(declare-fun b!263406 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14699 array!14699 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!263406 (= e!183619 (not (arrayBitRangesEq!0 (buf!6883 w1!584) (buf!6883 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584)))))))

(declare-fun b!263407 () Bool)

(declare-fun lt!404873 () Unit!18776)

(assert (=> b!263407 (= e!183621 lt!404873)))

(declare-fun lt!404876 () (_ BitVec 64))

(assert (=> b!263407 (= lt!404876 (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14699 array!14699 (_ BitVec 64) (_ BitVec 64)) Unit!18776)

(assert (=> b!263407 (= lt!404873 (arrayBitRangesEqSymmetric!0 (buf!6883 w1!584) (buf!6883 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404876))))

(assert (=> b!263407 (arrayBitRangesEq!0 (buf!6883 w2!580) (buf!6883 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404876)))

(declare-fun b!263408 () Bool)

(assert (=> b!263408 (= e!183624 (array_inv!6139 (buf!6883 w1!584)))))

(assert (= (and start!57468 res!220351) b!263405))

(assert (= (and b!263405 res!220349) b!263406))

(assert (= (and b!263405 (not res!220348)) b!263401))

(assert (= (and b!263401 c!12027) b!263407))

(assert (= (and b!263401 (not c!12027)) b!263402))

(assert (= (and b!263401 (not res!220350)) b!263403))

(assert (= start!57468 b!263408))

(assert (= start!57468 b!263404))

(declare-fun m!393689 () Bool)

(assert (=> b!263404 m!393689))

(declare-fun m!393691 () Bool)

(assert (=> b!263405 m!393691))

(declare-fun m!393693 () Bool)

(assert (=> b!263405 m!393693))

(declare-fun m!393695 () Bool)

(assert (=> b!263405 m!393695))

(declare-fun m!393697 () Bool)

(assert (=> b!263405 m!393697))

(declare-fun m!393699 () Bool)

(assert (=> b!263405 m!393699))

(declare-fun m!393701 () Bool)

(assert (=> b!263405 m!393701))

(declare-fun m!393703 () Bool)

(assert (=> b!263403 m!393703))

(assert (=> b!263406 m!393703))

(assert (=> b!263406 m!393703))

(declare-fun m!393705 () Bool)

(assert (=> b!263406 m!393705))

(declare-fun m!393707 () Bool)

(assert (=> b!263408 m!393707))

(declare-fun m!393709 () Bool)

(assert (=> start!57468 m!393709))

(declare-fun m!393711 () Bool)

(assert (=> start!57468 m!393711))

(declare-fun m!393713 () Bool)

(assert (=> start!57468 m!393713))

(assert (=> b!263407 m!393703))

(declare-fun m!393715 () Bool)

(assert (=> b!263407 m!393715))

(declare-fun m!393717 () Bool)

(assert (=> b!263407 m!393717))

(push 1)

(assert (not b!263406))

(assert (not start!57468))

(assert (not b!263405))

(assert (not b!263403))

(assert (not b!263408))

(assert (not b!263404))

(assert (not b!263407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88894 () Bool)

(declare-fun e!183704 () Bool)

(assert (=> d!88894 e!183704))

(declare-fun res!220411 () Bool)

(assert (=> d!88894 (=> (not res!220411) (not e!183704))))

(declare-fun lt!404953 () (_ BitVec 64))

(declare-fun lt!404950 () (_ BitVec 64))

(declare-fun lt!404955 () (_ BitVec 64))

(assert (=> d!88894 (= res!220411 (= lt!404953 (bvsub lt!404950 lt!404955)))))

(assert (=> d!88894 (or (= (bvand lt!404950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404955 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404950 lt!404955) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88894 (= lt!404955 (remainingBits!0 ((_ sign_extend 32) (size!6415 (buf!6883 w1!584))) ((_ sign_extend 32) (currentByte!12741 w1!584)) ((_ sign_extend 32) (currentBit!12736 w1!584))))))

(declare-fun lt!404951 () (_ BitVec 64))

(declare-fun lt!404954 () (_ BitVec 64))

(assert (=> d!88894 (= lt!404950 (bvmul lt!404951 lt!404954))))

(assert (=> d!88894 (or (= lt!404951 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404954 (bvsdiv (bvmul lt!404951 lt!404954) lt!404951)))))

(assert (=> d!88894 (= lt!404954 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88894 (= lt!404951 ((_ sign_extend 32) (size!6415 (buf!6883 w1!584))))))

(assert (=> d!88894 (= lt!404953 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12741 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12736 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88894 (invariant!0 (currentBit!12736 w1!584) (currentByte!12741 w1!584) (size!6415 (buf!6883 w1!584)))))

(assert (=> d!88894 (= (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584)) lt!404953)))

(declare-fun b!263491 () Bool)

(declare-fun res!220410 () Bool)

(assert (=> b!263491 (=> (not res!220410) (not e!183704))))

(assert (=> b!263491 (= res!220410 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404953))))

(declare-fun b!263492 () Bool)

(declare-fun lt!404952 () (_ BitVec 64))

(assert (=> b!263492 (= e!183704 (bvsle lt!404953 (bvmul lt!404952 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263492 (or (= lt!404952 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404952 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404952)))))

(assert (=> b!263492 (= lt!404952 ((_ sign_extend 32) (size!6415 (buf!6883 w1!584))))))

(assert (= (and d!88894 res!220411) b!263491))

(assert (= (and b!263491 res!220410) b!263492))

(declare-fun m!393811 () Bool)

(assert (=> d!88894 m!393811))

(declare-fun m!393813 () Bool)

(assert (=> d!88894 m!393813))

(assert (=> b!263407 d!88894))

(declare-fun d!88930 () Bool)

(assert (=> d!88930 (arrayBitRangesEq!0 (buf!6883 w2!580) (buf!6883 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404876)))

(declare-fun lt!404958 () Unit!18776)

(declare-fun choose!8 (array!14699 array!14699 (_ BitVec 64) (_ BitVec 64)) Unit!18776)

(assert (=> d!88930 (= lt!404958 (choose!8 (buf!6883 w1!584) (buf!6883 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404876))))

(assert (=> d!88930 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404876))))

(assert (=> d!88930 (= (arrayBitRangesEqSymmetric!0 (buf!6883 w1!584) (buf!6883 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404876) lt!404958)))

(declare-fun bs!22567 () Bool)

(assert (= bs!22567 d!88930))

(assert (=> bs!22567 m!393717))

(declare-fun m!393819 () Bool)

(assert (=> bs!22567 m!393819))

(assert (=> b!263407 d!88930))

(declare-fun b!263537 () Bool)

(declare-fun e!183741 () Bool)

(declare-fun call!4052 () Bool)

(assert (=> b!263537 (= e!183741 call!4052)))

(declare-fun b!263538 () Bool)

(declare-fun e!183745 () Bool)

(assert (=> b!263538 (= e!183741 e!183745)))

(declare-fun res!220450 () Bool)

(assert (=> b!263538 (= res!220450 call!4052)))

(assert (=> b!263538 (=> (not res!220450) (not e!183745))))

(declare-fun d!88936 () Bool)

(declare-fun res!220449 () Bool)

(declare-fun e!183743 () Bool)

(assert (=> d!88936 (=> res!220449 e!183743)))

(assert (=> d!88936 (= res!220449 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!404876))))

(assert (=> d!88936 (= (arrayBitRangesEq!0 (buf!6883 w2!580) (buf!6883 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!404876) e!183743)))

(declare-fun b!263539 () Bool)

(declare-fun e!183742 () Bool)

(assert (=> b!263539 (= e!183743 e!183742)))

(declare-fun res!220448 () Bool)

(assert (=> b!263539 (=> (not res!220448) (not e!183742))))

(declare-fun e!183744 () Bool)

(assert (=> b!263539 (= res!220448 e!183744)))

(declare-fun res!220446 () Bool)

(assert (=> b!263539 (=> res!220446 e!183744)))

(declare-datatypes ((tuple4!330 0))(
  ( (tuple4!331 (_1!12145 (_ BitVec 32)) (_2!12145 (_ BitVec 32)) (_3!945 (_ BitVec 32)) (_4!165 (_ BitVec 32))) )
))
(declare-fun lt!404992 () tuple4!330)

(assert (=> b!263539 (= res!220446 (bvsge (_1!12145 lt!404992) (_2!12145 lt!404992)))))

(declare-fun lt!404993 () (_ BitVec 32))

(assert (=> b!263539 (= lt!404993 ((_ extract 31 0) (bvsrem lt!404876 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!404994 () (_ BitVec 32))

(assert (=> b!263539 (= lt!404994 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!330)

(assert (=> b!263539 (= lt!404992 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!404876))))

(declare-fun b!263540 () Bool)

(assert (=> b!263540 (= e!183742 e!183741)))

(declare-fun c!12039 () Bool)

(assert (=> b!263540 (= c!12039 (= (_3!945 lt!404992) (_4!165 lt!404992)))))

(declare-fun bm!4049 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4049 (= call!4052 (byteRangesEq!0 (select (arr!7402 (buf!6883 w2!580)) (_3!945 lt!404992)) (select (arr!7402 (buf!6883 w1!584)) (_3!945 lt!404992)) lt!404994 (ite c!12039 lt!404993 #b00000000000000000000000000001000)))))

(declare-fun b!263541 () Bool)

(declare-fun arrayRangesEq!1001 (array!14699 array!14699 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263541 (= e!183744 (arrayRangesEq!1001 (buf!6883 w2!580) (buf!6883 w1!584) (_1!12145 lt!404992) (_2!12145 lt!404992)))))

(declare-fun b!263542 () Bool)

(declare-fun res!220447 () Bool)

(assert (=> b!263542 (= res!220447 (= lt!404993 #b00000000000000000000000000000000))))

(declare-fun e!183740 () Bool)

(assert (=> b!263542 (=> res!220447 e!183740)))

(assert (=> b!263542 (= e!183745 e!183740)))

(declare-fun b!263543 () Bool)

(assert (=> b!263543 (= e!183740 (byteRangesEq!0 (select (arr!7402 (buf!6883 w2!580)) (_4!165 lt!404992)) (select (arr!7402 (buf!6883 w1!584)) (_4!165 lt!404992)) #b00000000000000000000000000000000 lt!404993))))

(assert (= (and d!88936 (not res!220449)) b!263539))

(assert (= (and b!263539 (not res!220446)) b!263541))

(assert (= (and b!263539 res!220448) b!263540))

(assert (= (and b!263540 c!12039) b!263537))

(assert (= (and b!263540 (not c!12039)) b!263538))

(assert (= (and b!263538 res!220450) b!263542))

(assert (= (and b!263542 (not res!220447)) b!263543))

(assert (= (or b!263537 b!263538) bm!4049))

(declare-fun m!393841 () Bool)

(assert (=> b!263539 m!393841))

(declare-fun m!393843 () Bool)

(assert (=> bm!4049 m!393843))

(declare-fun m!393845 () Bool)

(assert (=> bm!4049 m!393845))

(assert (=> bm!4049 m!393843))

(assert (=> bm!4049 m!393845))

(declare-fun m!393847 () Bool)

(assert (=> bm!4049 m!393847))

(declare-fun m!393849 () Bool)

(assert (=> b!263541 m!393849))

(declare-fun m!393851 () Bool)

(assert (=> b!263543 m!393851))

(declare-fun m!393853 () Bool)

(assert (=> b!263543 m!393853))

(assert (=> b!263543 m!393851))

(assert (=> b!263543 m!393853))

(declare-fun m!393855 () Bool)

(assert (=> b!263543 m!393855))

(assert (=> b!263407 d!88936))

(declare-fun d!88942 () Bool)

(assert (=> d!88942 (= (array_inv!6139 (buf!6883 w1!584)) (bvsge (size!6415 (buf!6883 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!263408 d!88942))

(assert (=> b!263403 d!88894))

(declare-fun d!88944 () Bool)

(declare-fun res!220475 () Bool)

(declare-fun e!183770 () Bool)

(assert (=> d!88944 (=> (not res!220475) (not e!183770))))

(assert (=> d!88944 (= res!220475 (= (size!6415 (buf!6883 w1!584)) (size!6415 (buf!6883 w2!580))))))

(assert (=> d!88944 (= (isPrefixOf!0 w1!584 w2!580) e!183770)))

(declare-fun b!263574 () Bool)

(declare-fun res!220476 () Bool)

(assert (=> b!263574 (=> (not res!220476) (not e!183770))))

(assert (=> b!263574 (= res!220476 (bvsle (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584)) (bitIndex!0 (size!6415 (buf!6883 w2!580)) (currentByte!12741 w2!580) (currentBit!12736 w2!580))))))

(declare-fun b!263575 () Bool)

(declare-fun e!183771 () Bool)

(assert (=> b!263575 (= e!183770 e!183771)))

(declare-fun res!220477 () Bool)

(assert (=> b!263575 (=> res!220477 e!183771)))

(assert (=> b!263575 (= res!220477 (= (size!6415 (buf!6883 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263576 () Bool)

(assert (=> b!263576 (= e!183771 (arrayBitRangesEq!0 (buf!6883 w1!584) (buf!6883 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584))))))

(assert (= (and d!88944 res!220475) b!263574))

(assert (= (and b!263574 res!220476) b!263575))

(assert (= (and b!263575 (not res!220477)) b!263576))

(assert (=> b!263574 m!393703))

(declare-fun m!393873 () Bool)

(assert (=> b!263574 m!393873))

(assert (=> b!263576 m!393703))

(assert (=> b!263576 m!393703))

(assert (=> b!263576 m!393705))

(assert (=> start!57468 d!88944))

(declare-fun d!88950 () Bool)

(assert (=> d!88950 (= (inv!12 w1!584) (invariant!0 (currentBit!12736 w1!584) (currentByte!12741 w1!584) (size!6415 (buf!6883 w1!584))))))

(declare-fun bs!22570 () Bool)

(assert (= bs!22570 d!88950))

(assert (=> bs!22570 m!393813))

(assert (=> start!57468 d!88950))

(declare-fun d!88956 () Bool)

(assert (=> d!88956 (= (inv!12 w2!580) (invariant!0 (currentBit!12736 w2!580) (currentByte!12741 w2!580) (size!6415 (buf!6883 w2!580))))))

(declare-fun bs!22571 () Bool)

(assert (= bs!22571 d!88956))

(declare-fun m!393877 () Bool)

(assert (=> bs!22571 m!393877))

(assert (=> start!57468 d!88956))

(declare-fun d!88958 () Bool)

(assert (=> d!88958 (= (array_inv!6139 (buf!6883 w2!580)) (bvsge (size!6415 (buf!6883 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!263404 d!88958))

(declare-fun d!88960 () Bool)

(assert (=> d!88960 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405024 () Unit!18776)

(declare-fun choose!11 (BitStream!11644) Unit!18776)

(assert (=> d!88960 (= lt!405024 (choose!11 w2!580))))

(assert (=> d!88960 (= (lemmaIsPrefixRefl!0 w2!580) lt!405024)))

(declare-fun bs!22574 () Bool)

(assert (= bs!22574 d!88960))

(assert (=> bs!22574 m!393699))

(declare-fun m!393881 () Bool)

(assert (=> bs!22574 m!393881))

(assert (=> b!263405 d!88960))

(declare-fun d!88964 () Bool)

(assert (=> d!88964 (isPrefixOf!0 lt!404879 lt!404879)))

(declare-fun lt!405025 () Unit!18776)

(assert (=> d!88964 (= lt!405025 (choose!11 lt!404879))))

(assert (=> d!88964 (= (lemmaIsPrefixRefl!0 lt!404879) lt!405025)))

(declare-fun bs!22575 () Bool)

(assert (= bs!22575 d!88964))

(assert (=> bs!22575 m!393695))

(declare-fun m!393883 () Bool)

(assert (=> bs!22575 m!393883))

(assert (=> b!263405 d!88964))

(declare-fun d!88966 () Bool)

(declare-fun res!220487 () Bool)

(declare-fun e!183780 () Bool)

(assert (=> d!88966 (=> (not res!220487) (not e!183780))))

(assert (=> d!88966 (= res!220487 (= (size!6415 (buf!6883 lt!404879)) (size!6415 (buf!6883 lt!404879))))))

(assert (=> d!88966 (= (isPrefixOf!0 lt!404879 lt!404879) e!183780)))

(declare-fun b!263588 () Bool)

(declare-fun res!220488 () Bool)

(assert (=> b!263588 (=> (not res!220488) (not e!183780))))

(assert (=> b!263588 (= res!220488 (bvsle (bitIndex!0 (size!6415 (buf!6883 lt!404879)) (currentByte!12741 lt!404879) (currentBit!12736 lt!404879)) (bitIndex!0 (size!6415 (buf!6883 lt!404879)) (currentByte!12741 lt!404879) (currentBit!12736 lt!404879))))))

(declare-fun b!263589 () Bool)

(declare-fun e!183781 () Bool)

(assert (=> b!263589 (= e!183780 e!183781)))

(declare-fun res!220489 () Bool)

(assert (=> b!263589 (=> res!220489 e!183781)))

(assert (=> b!263589 (= res!220489 (= (size!6415 (buf!6883 lt!404879)) #b00000000000000000000000000000000))))

(declare-fun b!263590 () Bool)

(assert (=> b!263590 (= e!183781 (arrayBitRangesEq!0 (buf!6883 lt!404879) (buf!6883 lt!404879) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6415 (buf!6883 lt!404879)) (currentByte!12741 lt!404879) (currentBit!12736 lt!404879))))))

(assert (= (and d!88966 res!220487) b!263588))

(assert (= (and b!263588 res!220488) b!263589))

(assert (= (and b!263589 (not res!220489)) b!263590))

(declare-fun m!393899 () Bool)

(assert (=> b!263588 m!393899))

(assert (=> b!263588 m!393899))

(assert (=> b!263590 m!393899))

(assert (=> b!263590 m!393899))

(declare-fun m!393905 () Bool)

(assert (=> b!263590 m!393905))

(assert (=> b!263405 d!88966))

(declare-fun d!88970 () Bool)

(assert (=> d!88970 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405032 () Unit!18776)

(assert (=> d!88970 (= lt!405032 (choose!11 w1!584))))

(assert (=> d!88970 (= (lemmaIsPrefixRefl!0 w1!584) lt!405032)))

(declare-fun bs!22576 () Bool)

(assert (= bs!22576 d!88970))

(assert (=> bs!22576 m!393697))

(declare-fun m!393907 () Bool)

(assert (=> bs!22576 m!393907))

(assert (=> b!263405 d!88970))

(declare-fun d!88972 () Bool)

(declare-fun res!220492 () Bool)

(declare-fun e!183783 () Bool)

(assert (=> d!88972 (=> (not res!220492) (not e!183783))))

(assert (=> d!88972 (= res!220492 (= (size!6415 (buf!6883 w1!584)) (size!6415 (buf!6883 w1!584))))))

(assert (=> d!88972 (= (isPrefixOf!0 w1!584 w1!584) e!183783)))

(declare-fun b!263593 () Bool)

(declare-fun res!220493 () Bool)

(assert (=> b!263593 (=> (not res!220493) (not e!183783))))

(assert (=> b!263593 (= res!220493 (bvsle (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584)) (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584))))))

(declare-fun b!263594 () Bool)

(declare-fun e!183784 () Bool)

(assert (=> b!263594 (= e!183783 e!183784)))

(declare-fun res!220494 () Bool)

(assert (=> b!263594 (=> res!220494 e!183784)))

(assert (=> b!263594 (= res!220494 (= (size!6415 (buf!6883 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263595 () Bool)

(assert (=> b!263595 (= e!183784 (arrayBitRangesEq!0 (buf!6883 w1!584) (buf!6883 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584))))))

(assert (= (and d!88972 res!220492) b!263593))

(assert (= (and b!263593 res!220493) b!263594))

(assert (= (and b!263594 (not res!220494)) b!263595))

(assert (=> b!263593 m!393703))

(assert (=> b!263593 m!393703))

(assert (=> b!263595 m!393703))

(assert (=> b!263595 m!393703))

(declare-fun m!393909 () Bool)

(assert (=> b!263595 m!393909))

(assert (=> b!263405 d!88972))

(declare-fun d!88976 () Bool)

(declare-fun res!220495 () Bool)

(declare-fun e!183785 () Bool)

(assert (=> d!88976 (=> (not res!220495) (not e!183785))))

(assert (=> d!88976 (= res!220495 (= (size!6415 (buf!6883 w2!580)) (size!6415 (buf!6883 w2!580))))))

(assert (=> d!88976 (= (isPrefixOf!0 w2!580 w2!580) e!183785)))

(declare-fun b!263596 () Bool)

(declare-fun res!220496 () Bool)

(assert (=> b!263596 (=> (not res!220496) (not e!183785))))

(assert (=> b!263596 (= res!220496 (bvsle (bitIndex!0 (size!6415 (buf!6883 w2!580)) (currentByte!12741 w2!580) (currentBit!12736 w2!580)) (bitIndex!0 (size!6415 (buf!6883 w2!580)) (currentByte!12741 w2!580) (currentBit!12736 w2!580))))))

(declare-fun b!263597 () Bool)

(declare-fun e!183786 () Bool)

(assert (=> b!263597 (= e!183785 e!183786)))

(declare-fun res!220497 () Bool)

(assert (=> b!263597 (=> res!220497 e!183786)))

(assert (=> b!263597 (= res!220497 (= (size!6415 (buf!6883 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!263598 () Bool)

(assert (=> b!263598 (= e!183786 (arrayBitRangesEq!0 (buf!6883 w2!580) (buf!6883 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6415 (buf!6883 w2!580)) (currentByte!12741 w2!580) (currentBit!12736 w2!580))))))

(assert (= (and d!88976 res!220495) b!263596))

(assert (= (and b!263596 res!220496) b!263597))

(assert (= (and b!263597 (not res!220497)) b!263598))

(assert (=> b!263596 m!393873))

(assert (=> b!263596 m!393873))

(assert (=> b!263598 m!393873))

(assert (=> b!263598 m!393873))

(declare-fun m!393911 () Bool)

(assert (=> b!263598 m!393911))

(assert (=> b!263405 d!88976))

(declare-fun b!263599 () Bool)

(declare-fun e!183788 () Bool)

(declare-fun call!4057 () Bool)

(assert (=> b!263599 (= e!183788 call!4057)))

(declare-fun b!263600 () Bool)

(declare-fun e!183792 () Bool)

(assert (=> b!263600 (= e!183788 e!183792)))

(declare-fun res!220502 () Bool)

(assert (=> b!263600 (= res!220502 call!4057)))

(assert (=> b!263600 (=> (not res!220502) (not e!183792))))

(declare-fun d!88978 () Bool)

(declare-fun res!220501 () Bool)

(declare-fun e!183790 () Bool)

(assert (=> d!88978 (=> res!220501 e!183790)))

(assert (=> d!88978 (= res!220501 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584))))))

(assert (=> d!88978 (= (arrayBitRangesEq!0 (buf!6883 w1!584) (buf!6883 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584))) e!183790)))

(declare-fun b!263601 () Bool)

(declare-fun e!183789 () Bool)

(assert (=> b!263601 (= e!183790 e!183789)))

(declare-fun res!220500 () Bool)

(assert (=> b!263601 (=> (not res!220500) (not e!183789))))

(declare-fun e!183791 () Bool)

(assert (=> b!263601 (= res!220500 e!183791)))

(declare-fun res!220498 () Bool)

(assert (=> b!263601 (=> res!220498 e!183791)))

(declare-fun lt!405033 () tuple4!330)

(assert (=> b!263601 (= res!220498 (bvsge (_1!12145 lt!405033) (_2!12145 lt!405033)))))

(declare-fun lt!405034 () (_ BitVec 32))

(assert (=> b!263601 (= lt!405034 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405035 () (_ BitVec 32))

(assert (=> b!263601 (= lt!405035 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263601 (= lt!405033 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6415 (buf!6883 w1!584)) (currentByte!12741 w1!584) (currentBit!12736 w1!584))))))

(declare-fun b!263602 () Bool)

(assert (=> b!263602 (= e!183789 e!183788)))

(declare-fun c!12044 () Bool)

(assert (=> b!263602 (= c!12044 (= (_3!945 lt!405033) (_4!165 lt!405033)))))

(declare-fun bm!4054 () Bool)

(assert (=> bm!4054 (= call!4057 (byteRangesEq!0 (select (arr!7402 (buf!6883 w1!584)) (_3!945 lt!405033)) (select (arr!7402 (buf!6883 w2!580)) (_3!945 lt!405033)) lt!405035 (ite c!12044 lt!405034 #b00000000000000000000000000001000)))))

(declare-fun b!263603 () Bool)

(assert (=> b!263603 (= e!183791 (arrayRangesEq!1001 (buf!6883 w1!584) (buf!6883 w2!580) (_1!12145 lt!405033) (_2!12145 lt!405033)))))

(declare-fun b!263604 () Bool)

(declare-fun res!220499 () Bool)

(assert (=> b!263604 (= res!220499 (= lt!405034 #b00000000000000000000000000000000))))

(declare-fun e!183787 () Bool)

(assert (=> b!263604 (=> res!220499 e!183787)))

(assert (=> b!263604 (= e!183792 e!183787)))

(declare-fun b!263605 () Bool)

(assert (=> b!263605 (= e!183787 (byteRangesEq!0 (select (arr!7402 (buf!6883 w1!584)) (_4!165 lt!405033)) (select (arr!7402 (buf!6883 w2!580)) (_4!165 lt!405033)) #b00000000000000000000000000000000 lt!405034))))

(assert (= (and d!88978 (not res!220501)) b!263601))

(assert (= (and b!263601 (not res!220498)) b!263603))

(assert (= (and b!263601 res!220500) b!263602))

(assert (= (and b!263602 c!12044) b!263599))

(assert (= (and b!263602 (not c!12044)) b!263600))

(assert (= (and b!263600 res!220502) b!263604))

(assert (= (and b!263604 (not res!220499)) b!263605))

(assert (= (or b!263599 b!263600) bm!4054))

(assert (=> b!263601 m!393703))

(declare-fun m!393913 () Bool)

(assert (=> b!263601 m!393913))

(declare-fun m!393915 () Bool)

(assert (=> bm!4054 m!393915))

(declare-fun m!393917 () Bool)

(assert (=> bm!4054 m!393917))

(assert (=> bm!4054 m!393915))

(assert (=> bm!4054 m!393917))

(declare-fun m!393919 () Bool)

(assert (=> bm!4054 m!393919))

(declare-fun m!393921 () Bool)

(assert (=> b!263603 m!393921))

(declare-fun m!393923 () Bool)

(assert (=> b!263605 m!393923))

(declare-fun m!393925 () Bool)

(assert (=> b!263605 m!393925))

(assert (=> b!263605 m!393923))

(assert (=> b!263605 m!393925))

(declare-fun m!393927 () Bool)

(assert (=> b!263605 m!393927))

(assert (=> b!263406 d!88978))

(assert (=> b!263406 d!88894))

(push 1)

(assert (not d!88964))

(assert (not b!263598))

(assert (not bm!4054))

(assert (not b!263588))

(assert (not b!263593))

(assert (not b!263596))

(assert (not b!263574))

(assert (not bm!4049))

(assert (not b!263603))

(assert (not b!263595))

(assert (not b!263601))

(assert (not d!88960))

(assert (not d!88930))

(assert (not b!263543))

(assert (not d!88956))

(assert (not b!263605))

(assert (not b!263590))

(assert (not d!88950))

(assert (not b!263539))

(assert (not d!88970))

(assert (not d!88894))

(assert (not b!263541))

(assert (not b!263576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

