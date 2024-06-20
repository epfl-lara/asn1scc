; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58736 () Bool)

(assert start!58736)

(declare-fun b!269630 () Bool)

(declare-fun e!189542 () Bool)

(declare-datatypes ((array!15028 0))(
  ( (array!15029 (arr!7535 (Array (_ BitVec 32) (_ BitVec 8))) (size!6548 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11910 0))(
  ( (BitStream!11911 (buf!7016 array!15028) (currentByte!12966 (_ BitVec 32)) (currentBit!12961 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11910)

(declare-fun array_inv!6272 (array!15028) Bool)

(assert (=> b!269630 (= e!189542 (array_inv!6272 (buf!7016 w1!591)))))

(declare-fun b!269631 () Bool)

(declare-fun res!224754 () Bool)

(declare-fun e!189546 () Bool)

(assert (=> b!269631 (=> (not res!224754) (not e!189546))))

(declare-fun w2!587 () BitStream!11910)

(declare-fun w3!25 () BitStream!11910)

(declare-fun isPrefixOf!0 (BitStream!11910 BitStream!11910) Bool)

(assert (=> b!269631 (= res!224754 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!269632 () Bool)

(declare-fun e!189544 () Bool)

(assert (=> b!269632 (= e!189544 (array_inv!6272 (buf!7016 w3!25)))))

(declare-fun res!224752 () Bool)

(assert (=> start!58736 (=> (not res!224752) (not e!189546))))

(assert (=> start!58736 (= res!224752 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58736 e!189546))

(declare-fun inv!12 (BitStream!11910) Bool)

(assert (=> start!58736 (and (inv!12 w1!591) e!189542)))

(declare-fun e!189545 () Bool)

(assert (=> start!58736 (and (inv!12 w2!587) e!189545)))

(assert (=> start!58736 (and (inv!12 w3!25) e!189544)))

(declare-fun b!269633 () Bool)

(declare-fun arrayRangesEq!1080 (array!15028 array!15028 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269633 (= e!189546 (not (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) #b00000000000000000000000000000000 (currentByte!12966 w2!587))))))

(declare-fun b!269634 () Bool)

(declare-fun res!224753 () Bool)

(assert (=> b!269634 (=> (not res!224753) (not e!189546))))

(assert (=> b!269634 (= res!224753 (and (bvsle #b00000000000000000000000000000000 (currentByte!12966 w1!591)) (bvsle (currentByte!12966 w1!591) (currentByte!12966 w2!587)) (bvsle (size!6548 (buf!7016 w1!591)) (size!6548 (buf!7016 w2!587))) (bvsle (size!6548 (buf!7016 w2!587)) (size!6548 (buf!7016 w3!25))) (bvsle (currentByte!12966 w1!591) (size!6548 (buf!7016 w1!591))) (bvsle (currentByte!12966 w2!587) (size!6548 (buf!7016 w2!587)))))))

(declare-fun b!269635 () Bool)

(declare-fun res!224755 () Bool)

(assert (=> b!269635 (=> (not res!224755) (not e!189546))))

(assert (=> b!269635 (= res!224755 (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) #b00000000000000000000000000000000 (currentByte!12966 w1!591)))))

(declare-fun b!269636 () Bool)

(assert (=> b!269636 (= e!189545 (array_inv!6272 (buf!7016 w2!587)))))

(assert (= (and start!58736 res!224752) b!269631))

(assert (= (and b!269631 res!224754) b!269634))

(assert (= (and b!269634 res!224753) b!269635))

(assert (= (and b!269635 res!224755) b!269633))

(assert (= start!58736 b!269630))

(assert (= start!58736 b!269636))

(assert (= start!58736 b!269632))

(declare-fun m!401273 () Bool)

(assert (=> b!269635 m!401273))

(declare-fun m!401275 () Bool)

(assert (=> b!269633 m!401275))

(declare-fun m!401277 () Bool)

(assert (=> start!58736 m!401277))

(declare-fun m!401279 () Bool)

(assert (=> start!58736 m!401279))

(declare-fun m!401281 () Bool)

(assert (=> start!58736 m!401281))

(declare-fun m!401283 () Bool)

(assert (=> start!58736 m!401283))

(declare-fun m!401285 () Bool)

(assert (=> b!269636 m!401285))

(declare-fun m!401287 () Bool)

(assert (=> b!269631 m!401287))

(declare-fun m!401289 () Bool)

(assert (=> b!269632 m!401289))

(declare-fun m!401291 () Bool)

(assert (=> b!269630 m!401291))

(check-sat (not b!269630) (not start!58736) (not b!269633) (not b!269631) (not b!269632) (not b!269635) (not b!269636))
(check-sat)
(get-model)

(declare-fun d!91346 () Bool)

(declare-fun res!224772 () Bool)

(declare-fun e!189572 () Bool)

(assert (=> d!91346 (=> res!224772 e!189572)))

(assert (=> d!91346 (= res!224772 (= #b00000000000000000000000000000000 (currentByte!12966 w1!591)))))

(assert (=> d!91346 (= (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) #b00000000000000000000000000000000 (currentByte!12966 w1!591)) e!189572)))

(declare-fun b!269662 () Bool)

(declare-fun e!189573 () Bool)

(assert (=> b!269662 (= e!189572 e!189573)))

(declare-fun res!224773 () Bool)

(assert (=> b!269662 (=> (not res!224773) (not e!189573))))

(assert (=> b!269662 (= res!224773 (= (select (arr!7535 (buf!7016 w1!591)) #b00000000000000000000000000000000) (select (arr!7535 (buf!7016 w2!587)) #b00000000000000000000000000000000)))))

(declare-fun b!269663 () Bool)

(assert (=> b!269663 (= e!189573 (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12966 w1!591)))))

(assert (= (and d!91346 (not res!224772)) b!269662))

(assert (= (and b!269662 res!224773) b!269663))

(declare-fun m!401313 () Bool)

(assert (=> b!269662 m!401313))

(declare-fun m!401315 () Bool)

(assert (=> b!269662 m!401315))

(declare-fun m!401317 () Bool)

(assert (=> b!269663 m!401317))

(assert (=> b!269635 d!91346))

(declare-fun d!91348 () Bool)

(assert (=> d!91348 (= (array_inv!6272 (buf!7016 w1!591)) (bvsge (size!6548 (buf!7016 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269630 d!91348))

(declare-fun d!91350 () Bool)

(declare-fun res!224787 () Bool)

(declare-fun e!189583 () Bool)

(assert (=> d!91350 (=> (not res!224787) (not e!189583))))

(assert (=> d!91350 (= res!224787 (= (size!6548 (buf!7016 w1!591)) (size!6548 (buf!7016 w2!587))))))

(assert (=> d!91350 (= (isPrefixOf!0 w1!591 w2!587) e!189583)))

(declare-fun b!269676 () Bool)

(declare-fun res!224786 () Bool)

(assert (=> b!269676 (=> (not res!224786) (not e!189583))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269676 (= res!224786 (bvsle (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591)) (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587))))))

(declare-fun b!269677 () Bool)

(declare-fun e!189582 () Bool)

(assert (=> b!269677 (= e!189583 e!189582)))

(declare-fun res!224788 () Bool)

(assert (=> b!269677 (=> res!224788 e!189582)))

(assert (=> b!269677 (= res!224788 (= (size!6548 (buf!7016 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269678 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15028 array!15028 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269678 (= e!189582 (arrayBitRangesEq!0 (buf!7016 w1!591) (buf!7016 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591))))))

(assert (= (and d!91350 res!224787) b!269676))

(assert (= (and b!269676 res!224786) b!269677))

(assert (= (and b!269677 (not res!224788)) b!269678))

(declare-fun m!401319 () Bool)

(assert (=> b!269676 m!401319))

(declare-fun m!401321 () Bool)

(assert (=> b!269676 m!401321))

(assert (=> b!269678 m!401319))

(assert (=> b!269678 m!401319))

(declare-fun m!401323 () Bool)

(assert (=> b!269678 m!401323))

(assert (=> start!58736 d!91350))

(declare-fun d!91358 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91358 (= (inv!12 w1!591) (invariant!0 (currentBit!12961 w1!591) (currentByte!12966 w1!591) (size!6548 (buf!7016 w1!591))))))

(declare-fun bs!23126 () Bool)

(assert (= bs!23126 d!91358))

(declare-fun m!401325 () Bool)

(assert (=> bs!23126 m!401325))

(assert (=> start!58736 d!91358))

(declare-fun d!91360 () Bool)

(assert (=> d!91360 (= (inv!12 w2!587) (invariant!0 (currentBit!12961 w2!587) (currentByte!12966 w2!587) (size!6548 (buf!7016 w2!587))))))

(declare-fun bs!23127 () Bool)

(assert (= bs!23127 d!91360))

(declare-fun m!401331 () Bool)

(assert (=> bs!23127 m!401331))

(assert (=> start!58736 d!91360))

(declare-fun d!91362 () Bool)

(assert (=> d!91362 (= (inv!12 w3!25) (invariant!0 (currentBit!12961 w3!25) (currentByte!12966 w3!25) (size!6548 (buf!7016 w3!25))))))

(declare-fun bs!23128 () Bool)

(assert (= bs!23128 d!91362))

(declare-fun m!401335 () Bool)

(assert (=> bs!23128 m!401335))

(assert (=> start!58736 d!91362))

(declare-fun d!91366 () Bool)

(assert (=> d!91366 (= (array_inv!6272 (buf!7016 w2!587)) (bvsge (size!6548 (buf!7016 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269636 d!91366))

(declare-fun d!91368 () Bool)

(declare-fun res!224802 () Bool)

(declare-fun e!189593 () Bool)

(assert (=> d!91368 (=> (not res!224802) (not e!189593))))

(assert (=> d!91368 (= res!224802 (= (size!6548 (buf!7016 w2!587)) (size!6548 (buf!7016 w3!25))))))

(assert (=> d!91368 (= (isPrefixOf!0 w2!587 w3!25) e!189593)))

(declare-fun b!269691 () Bool)

(declare-fun res!224801 () Bool)

(assert (=> b!269691 (=> (not res!224801) (not e!189593))))

(assert (=> b!269691 (= res!224801 (bvsle (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587)) (bitIndex!0 (size!6548 (buf!7016 w3!25)) (currentByte!12966 w3!25) (currentBit!12961 w3!25))))))

(declare-fun b!269692 () Bool)

(declare-fun e!189592 () Bool)

(assert (=> b!269692 (= e!189593 e!189592)))

(declare-fun res!224803 () Bool)

(assert (=> b!269692 (=> res!224803 e!189592)))

(assert (=> b!269692 (= res!224803 (= (size!6548 (buf!7016 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269693 () Bool)

(assert (=> b!269693 (= e!189592 (arrayBitRangesEq!0 (buf!7016 w2!587) (buf!7016 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587))))))

(assert (= (and d!91368 res!224802) b!269691))

(assert (= (and b!269691 res!224801) b!269692))

(assert (= (and b!269692 (not res!224803)) b!269693))

(assert (=> b!269691 m!401321))

(declare-fun m!401341 () Bool)

(assert (=> b!269691 m!401341))

(assert (=> b!269693 m!401321))

(assert (=> b!269693 m!401321))

(declare-fun m!401345 () Bool)

(assert (=> b!269693 m!401345))

(assert (=> b!269631 d!91368))

(declare-fun d!91372 () Bool)

(assert (=> d!91372 (= (array_inv!6272 (buf!7016 w3!25)) (bvsge (size!6548 (buf!7016 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269632 d!91372))

(declare-fun d!91374 () Bool)

(declare-fun res!224804 () Bool)

(declare-fun e!189594 () Bool)

(assert (=> d!91374 (=> res!224804 e!189594)))

(assert (=> d!91374 (= res!224804 (= #b00000000000000000000000000000000 (currentByte!12966 w2!587)))))

(assert (=> d!91374 (= (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) #b00000000000000000000000000000000 (currentByte!12966 w2!587)) e!189594)))

(declare-fun b!269694 () Bool)

(declare-fun e!189595 () Bool)

(assert (=> b!269694 (= e!189594 e!189595)))

(declare-fun res!224805 () Bool)

(assert (=> b!269694 (=> (not res!224805) (not e!189595))))

(assert (=> b!269694 (= res!224805 (= (select (arr!7535 (buf!7016 w2!587)) #b00000000000000000000000000000000) (select (arr!7535 (buf!7016 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!269695 () Bool)

(assert (=> b!269695 (= e!189595 (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12966 w2!587)))))

(assert (= (and d!91374 (not res!224804)) b!269694))

(assert (= (and b!269694 res!224805) b!269695))

(assert (=> b!269694 m!401315))

(declare-fun m!401353 () Bool)

(assert (=> b!269694 m!401353))

(declare-fun m!401355 () Bool)

(assert (=> b!269695 m!401355))

(assert (=> b!269633 d!91374))

(check-sat (not b!269695) (not d!91362) (not b!269693) (not b!269678) (not b!269676) (not b!269663) (not d!91358) (not b!269691) (not d!91360))
(check-sat)
(get-model)

(declare-fun d!91408 () Bool)

(declare-fun e!189622 () Bool)

(assert (=> d!91408 e!189622))

(declare-fun res!224836 () Bool)

(assert (=> d!91408 (=> (not res!224836) (not e!189622))))

(declare-fun lt!409126 () (_ BitVec 64))

(declare-fun lt!409129 () (_ BitVec 64))

(declare-fun lt!409132 () (_ BitVec 64))

(assert (=> d!91408 (= res!224836 (= lt!409132 (bvsub lt!409129 lt!409126)))))

(assert (=> d!91408 (or (= (bvand lt!409129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409129 lt!409126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91408 (= lt!409126 (remainingBits!0 ((_ sign_extend 32) (size!6548 (buf!7016 w1!591))) ((_ sign_extend 32) (currentByte!12966 w1!591)) ((_ sign_extend 32) (currentBit!12961 w1!591))))))

(declare-fun lt!409130 () (_ BitVec 64))

(declare-fun lt!409133 () (_ BitVec 64))

(assert (=> d!91408 (= lt!409129 (bvmul lt!409130 lt!409133))))

(assert (=> d!91408 (or (= lt!409130 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409133 (bvsdiv (bvmul lt!409130 lt!409133) lt!409130)))))

(assert (=> d!91408 (= lt!409133 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91408 (= lt!409130 ((_ sign_extend 32) (size!6548 (buf!7016 w1!591))))))

(assert (=> d!91408 (= lt!409132 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12966 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12961 w1!591))))))

(assert (=> d!91408 (invariant!0 (currentBit!12961 w1!591) (currentByte!12966 w1!591) (size!6548 (buf!7016 w1!591)))))

(assert (=> d!91408 (= (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591)) lt!409132)))

(declare-fun b!269724 () Bool)

(declare-fun res!224837 () Bool)

(assert (=> b!269724 (=> (not res!224837) (not e!189622))))

(assert (=> b!269724 (= res!224837 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409132))))

(declare-fun b!269725 () Bool)

(declare-fun lt!409131 () (_ BitVec 64))

(assert (=> b!269725 (= e!189622 (bvsle lt!409132 (bvmul lt!409131 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269725 (or (= lt!409131 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409131 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409131)))))

(assert (=> b!269725 (= lt!409131 ((_ sign_extend 32) (size!6548 (buf!7016 w1!591))))))

(assert (= (and d!91408 res!224836) b!269724))

(assert (= (and b!269724 res!224837) b!269725))

(declare-fun m!401397 () Bool)

(assert (=> d!91408 m!401397))

(assert (=> d!91408 m!401325))

(assert (=> b!269676 d!91408))

(declare-fun d!91416 () Bool)

(declare-fun e!189623 () Bool)

(assert (=> d!91416 e!189623))

(declare-fun res!224840 () Bool)

(assert (=> d!91416 (=> (not res!224840) (not e!189623))))

(declare-fun lt!409144 () (_ BitVec 64))

(declare-fun lt!409141 () (_ BitVec 64))

(declare-fun lt!409140 () (_ BitVec 64))

(assert (=> d!91416 (= res!224840 (= lt!409144 (bvsub lt!409141 lt!409140)))))

(assert (=> d!91416 (or (= (bvand lt!409141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409141 lt!409140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91416 (= lt!409140 (remainingBits!0 ((_ sign_extend 32) (size!6548 (buf!7016 w2!587))) ((_ sign_extend 32) (currentByte!12966 w2!587)) ((_ sign_extend 32) (currentBit!12961 w2!587))))))

(declare-fun lt!409142 () (_ BitVec 64))

(declare-fun lt!409145 () (_ BitVec 64))

(assert (=> d!91416 (= lt!409141 (bvmul lt!409142 lt!409145))))

(assert (=> d!91416 (or (= lt!409142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409145 (bvsdiv (bvmul lt!409142 lt!409145) lt!409142)))))

(assert (=> d!91416 (= lt!409145 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91416 (= lt!409142 ((_ sign_extend 32) (size!6548 (buf!7016 w2!587))))))

(assert (=> d!91416 (= lt!409144 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12966 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12961 w2!587))))))

(assert (=> d!91416 (invariant!0 (currentBit!12961 w2!587) (currentByte!12966 w2!587) (size!6548 (buf!7016 w2!587)))))

(assert (=> d!91416 (= (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587)) lt!409144)))

(declare-fun b!269730 () Bool)

(declare-fun res!224841 () Bool)

(assert (=> b!269730 (=> (not res!224841) (not e!189623))))

(assert (=> b!269730 (= res!224841 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409144))))

(declare-fun b!269731 () Bool)

(declare-fun lt!409143 () (_ BitVec 64))

(assert (=> b!269731 (= e!189623 (bvsle lt!409144 (bvmul lt!409143 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269731 (or (= lt!409143 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409143 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409143)))))

(assert (=> b!269731 (= lt!409143 ((_ sign_extend 32) (size!6548 (buf!7016 w2!587))))))

(assert (= (and d!91416 res!224840) b!269730))

(assert (= (and b!269730 res!224841) b!269731))

(declare-fun m!401399 () Bool)

(assert (=> d!91416 m!401399))

(assert (=> d!91416 m!401331))

(assert (=> b!269676 d!91416))

(declare-fun d!91418 () Bool)

(declare-fun res!224842 () Bool)

(declare-fun e!189624 () Bool)

(assert (=> d!91418 (=> res!224842 e!189624)))

(assert (=> d!91418 (= res!224842 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12966 w2!587)))))

(assert (=> d!91418 (= (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12966 w2!587)) e!189624)))

(declare-fun b!269732 () Bool)

(declare-fun e!189625 () Bool)

(assert (=> b!269732 (= e!189624 e!189625)))

(declare-fun res!224843 () Bool)

(assert (=> b!269732 (=> (not res!224843) (not e!189625))))

(assert (=> b!269732 (= res!224843 (= (select (arr!7535 (buf!7016 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7535 (buf!7016 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!269733 () Bool)

(assert (=> b!269733 (= e!189625 (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12966 w2!587)))))

(assert (= (and d!91418 (not res!224842)) b!269732))

(assert (= (and b!269732 res!224843) b!269733))

(declare-fun m!401401 () Bool)

(assert (=> b!269732 m!401401))

(declare-fun m!401403 () Bool)

(assert (=> b!269732 m!401403))

(declare-fun m!401405 () Bool)

(assert (=> b!269733 m!401405))

(assert (=> b!269695 d!91418))

(assert (=> b!269691 d!91416))

(declare-fun d!91422 () Bool)

(declare-fun e!189626 () Bool)

(assert (=> d!91422 e!189626))

(declare-fun res!224844 () Bool)

(assert (=> d!91422 (=> (not res!224844) (not e!189626))))

(declare-fun lt!409150 () (_ BitVec 64))

(declare-fun lt!409146 () (_ BitVec 64))

(declare-fun lt!409147 () (_ BitVec 64))

(assert (=> d!91422 (= res!224844 (= lt!409150 (bvsub lt!409147 lt!409146)))))

(assert (=> d!91422 (or (= (bvand lt!409147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409146 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409147 lt!409146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91422 (= lt!409146 (remainingBits!0 ((_ sign_extend 32) (size!6548 (buf!7016 w3!25))) ((_ sign_extend 32) (currentByte!12966 w3!25)) ((_ sign_extend 32) (currentBit!12961 w3!25))))))

(declare-fun lt!409148 () (_ BitVec 64))

(declare-fun lt!409151 () (_ BitVec 64))

(assert (=> d!91422 (= lt!409147 (bvmul lt!409148 lt!409151))))

(assert (=> d!91422 (or (= lt!409148 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409151 (bvsdiv (bvmul lt!409148 lt!409151) lt!409148)))))

(assert (=> d!91422 (= lt!409151 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91422 (= lt!409148 ((_ sign_extend 32) (size!6548 (buf!7016 w3!25))))))

(assert (=> d!91422 (= lt!409150 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12966 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12961 w3!25))))))

(assert (=> d!91422 (invariant!0 (currentBit!12961 w3!25) (currentByte!12966 w3!25) (size!6548 (buf!7016 w3!25)))))

(assert (=> d!91422 (= (bitIndex!0 (size!6548 (buf!7016 w3!25)) (currentByte!12966 w3!25) (currentBit!12961 w3!25)) lt!409150)))

(declare-fun b!269734 () Bool)

(declare-fun res!224845 () Bool)

(assert (=> b!269734 (=> (not res!224845) (not e!189626))))

(assert (=> b!269734 (= res!224845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409150))))

(declare-fun b!269735 () Bool)

(declare-fun lt!409149 () (_ BitVec 64))

(assert (=> b!269735 (= e!189626 (bvsle lt!409150 (bvmul lt!409149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269735 (or (= lt!409149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409149)))))

(assert (=> b!269735 (= lt!409149 ((_ sign_extend 32) (size!6548 (buf!7016 w3!25))))))

(assert (= (and d!91422 res!224844) b!269734))

(assert (= (and b!269734 res!224845) b!269735))

(declare-fun m!401407 () Bool)

(assert (=> d!91422 m!401407))

(assert (=> d!91422 m!401335))

(assert (=> b!269691 d!91422))

(declare-fun d!91424 () Bool)

(declare-fun res!224848 () Bool)

(declare-fun e!189628 () Bool)

(assert (=> d!91424 (=> res!224848 e!189628)))

(assert (=> d!91424 (= res!224848 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12966 w1!591)))))

(assert (=> d!91424 (= (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12966 w1!591)) e!189628)))

(declare-fun b!269738 () Bool)

(declare-fun e!189629 () Bool)

(assert (=> b!269738 (= e!189628 e!189629)))

(declare-fun res!224849 () Bool)

(assert (=> b!269738 (=> (not res!224849) (not e!189629))))

(assert (=> b!269738 (= res!224849 (= (select (arr!7535 (buf!7016 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7535 (buf!7016 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!269739 () Bool)

(assert (=> b!269739 (= e!189629 (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12966 w1!591)))))

(assert (= (and d!91424 (not res!224848)) b!269738))

(assert (= (and b!269738 res!224849) b!269739))

(declare-fun m!401411 () Bool)

(assert (=> b!269738 m!401411))

(assert (=> b!269738 m!401401))

(declare-fun m!401413 () Bool)

(assert (=> b!269739 m!401413))

(assert (=> b!269663 d!91424))

(declare-fun d!91428 () Bool)

(assert (=> d!91428 (= (invariant!0 (currentBit!12961 w3!25) (currentByte!12966 w3!25) (size!6548 (buf!7016 w3!25))) (and (bvsge (currentBit!12961 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12961 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12966 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12966 w3!25) (size!6548 (buf!7016 w3!25))) (and (= (currentBit!12961 w3!25) #b00000000000000000000000000000000) (= (currentByte!12966 w3!25) (size!6548 (buf!7016 w3!25)))))))))

(assert (=> d!91362 d!91428))

(declare-fun lt!409195 () (_ BitVec 32))

(declare-fun call!4304 () Bool)

(declare-datatypes ((tuple4!446 0))(
  ( (tuple4!447 (_1!12206 (_ BitVec 32)) (_2!12206 (_ BitVec 32)) (_3!1003 (_ BitVec 32)) (_4!223 (_ BitVec 32))) )
))
(declare-fun lt!409194 () tuple4!446)

(declare-fun lt!409196 () (_ BitVec 32))

(declare-fun c!12453 () Bool)

(declare-fun bm!4301 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4301 (= call!4304 (byteRangesEq!0 (ite c!12453 (select (arr!7535 (buf!7016 w1!591)) (_3!1003 lt!409194)) (select (arr!7535 (buf!7016 w1!591)) (_4!223 lt!409194))) (ite c!12453 (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409194)) (select (arr!7535 (buf!7016 w2!587)) (_4!223 lt!409194))) (ite c!12453 lt!409196 #b00000000000000000000000000000000) lt!409195))))

(declare-fun b!269800 () Bool)

(declare-fun e!189681 () Bool)

(declare-fun e!189685 () Bool)

(assert (=> b!269800 (= e!189681 e!189685)))

(declare-fun res!224894 () Bool)

(assert (=> b!269800 (= res!224894 (byteRangesEq!0 (select (arr!7535 (buf!7016 w1!591)) (_3!1003 lt!409194)) (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409194)) lt!409196 #b00000000000000000000000000001000))))

(assert (=> b!269800 (=> (not res!224894) (not e!189685))))

(declare-fun b!269801 () Bool)

(declare-fun e!189682 () Bool)

(assert (=> b!269801 (= e!189682 (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) (_1!12206 lt!409194) (_2!12206 lt!409194)))))

(declare-fun b!269802 () Bool)

(declare-fun e!189684 () Bool)

(assert (=> b!269802 (= e!189684 e!189681)))

(assert (=> b!269802 (= c!12453 (= (_3!1003 lt!409194) (_4!223 lt!409194)))))

(declare-fun b!269804 () Bool)

(declare-fun res!224896 () Bool)

(assert (=> b!269804 (= res!224896 (= lt!409195 #b00000000000000000000000000000000))))

(declare-fun e!189680 () Bool)

(assert (=> b!269804 (=> res!224896 e!189680)))

(assert (=> b!269804 (= e!189685 e!189680)))

(declare-fun b!269805 () Bool)

(assert (=> b!269805 (= e!189681 call!4304)))

(declare-fun b!269806 () Bool)

(assert (=> b!269806 (= e!189680 call!4304)))

(declare-fun b!269803 () Bool)

(declare-fun e!189683 () Bool)

(assert (=> b!269803 (= e!189683 e!189684)))

(declare-fun res!224895 () Bool)

(assert (=> b!269803 (=> (not res!224895) (not e!189684))))

(assert (=> b!269803 (= res!224895 e!189682)))

(declare-fun res!224898 () Bool)

(assert (=> b!269803 (=> res!224898 e!189682)))

(assert (=> b!269803 (= res!224898 (bvsge (_1!12206 lt!409194) (_2!12206 lt!409194)))))

(assert (=> b!269803 (= lt!409195 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269803 (= lt!409196 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!446)

(assert (=> b!269803 (= lt!409194 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591))))))

(declare-fun d!91438 () Bool)

(declare-fun res!224897 () Bool)

(assert (=> d!91438 (=> res!224897 e!189683)))

(assert (=> d!91438 (= res!224897 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591))))))

(assert (=> d!91438 (= (arrayBitRangesEq!0 (buf!7016 w1!591) (buf!7016 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591))) e!189683)))

(assert (= (and d!91438 (not res!224897)) b!269803))

(assert (= (and b!269803 (not res!224898)) b!269801))

(assert (= (and b!269803 res!224895) b!269802))

(assert (= (and b!269802 c!12453) b!269805))

(assert (= (and b!269802 (not c!12453)) b!269800))

(assert (= (and b!269800 res!224894) b!269804))

(assert (= (and b!269804 (not res!224896)) b!269806))

(assert (= (or b!269805 b!269806) bm!4301))

(declare-fun m!401435 () Bool)

(assert (=> bm!4301 m!401435))

(declare-fun m!401443 () Bool)

(assert (=> bm!4301 m!401443))

(declare-fun m!401453 () Bool)

(assert (=> bm!4301 m!401453))

(declare-fun m!401455 () Bool)

(assert (=> bm!4301 m!401455))

(declare-fun m!401457 () Bool)

(assert (=> bm!4301 m!401457))

(assert (=> b!269800 m!401455))

(assert (=> b!269800 m!401457))

(assert (=> b!269800 m!401455))

(assert (=> b!269800 m!401457))

(declare-fun m!401461 () Bool)

(assert (=> b!269800 m!401461))

(declare-fun m!401463 () Bool)

(assert (=> b!269801 m!401463))

(assert (=> b!269803 m!401319))

(declare-fun m!401465 () Bool)

(assert (=> b!269803 m!401465))

(assert (=> b!269678 d!91438))

(assert (=> b!269678 d!91408))

(declare-fun lt!409198 () (_ BitVec 32))

(declare-fun call!4305 () Bool)

(declare-fun lt!409199 () (_ BitVec 32))

(declare-fun c!12454 () Bool)

(declare-fun lt!409197 () tuple4!446)

(declare-fun bm!4302 () Bool)

(assert (=> bm!4302 (= call!4305 (byteRangesEq!0 (ite c!12454 (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409197)) (select (arr!7535 (buf!7016 w2!587)) (_4!223 lt!409197))) (ite c!12454 (select (arr!7535 (buf!7016 w3!25)) (_3!1003 lt!409197)) (select (arr!7535 (buf!7016 w3!25)) (_4!223 lt!409197))) (ite c!12454 lt!409199 #b00000000000000000000000000000000) lt!409198))))

(declare-fun b!269809 () Bool)

(declare-fun e!189689 () Bool)

(declare-fun e!189693 () Bool)

(assert (=> b!269809 (= e!189689 e!189693)))

(declare-fun res!224901 () Bool)

(assert (=> b!269809 (= res!224901 (byteRangesEq!0 (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409197)) (select (arr!7535 (buf!7016 w3!25)) (_3!1003 lt!409197)) lt!409199 #b00000000000000000000000000001000))))

(assert (=> b!269809 (=> (not res!224901) (not e!189693))))

(declare-fun b!269810 () Bool)

(declare-fun e!189690 () Bool)

(assert (=> b!269810 (= e!189690 (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) (_1!12206 lt!409197) (_2!12206 lt!409197)))))

(declare-fun b!269811 () Bool)

(declare-fun e!189692 () Bool)

(assert (=> b!269811 (= e!189692 e!189689)))

(assert (=> b!269811 (= c!12454 (= (_3!1003 lt!409197) (_4!223 lt!409197)))))

(declare-fun b!269813 () Bool)

(declare-fun res!224903 () Bool)

(assert (=> b!269813 (= res!224903 (= lt!409198 #b00000000000000000000000000000000))))

(declare-fun e!189688 () Bool)

(assert (=> b!269813 (=> res!224903 e!189688)))

(assert (=> b!269813 (= e!189693 e!189688)))

(declare-fun b!269814 () Bool)

(assert (=> b!269814 (= e!189689 call!4305)))

(declare-fun b!269815 () Bool)

(assert (=> b!269815 (= e!189688 call!4305)))

(declare-fun b!269812 () Bool)

(declare-fun e!189691 () Bool)

(assert (=> b!269812 (= e!189691 e!189692)))

(declare-fun res!224902 () Bool)

(assert (=> b!269812 (=> (not res!224902) (not e!189692))))

(assert (=> b!269812 (= res!224902 e!189690)))

(declare-fun res!224905 () Bool)

(assert (=> b!269812 (=> res!224905 e!189690)))

(assert (=> b!269812 (= res!224905 (bvsge (_1!12206 lt!409197) (_2!12206 lt!409197)))))

(assert (=> b!269812 (= lt!409198 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269812 (= lt!409199 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269812 (= lt!409197 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587))))))

(declare-fun d!91444 () Bool)

(declare-fun res!224904 () Bool)

(assert (=> d!91444 (=> res!224904 e!189691)))

(assert (=> d!91444 (= res!224904 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587))))))

(assert (=> d!91444 (= (arrayBitRangesEq!0 (buf!7016 w2!587) (buf!7016 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587))) e!189691)))

(assert (= (and d!91444 (not res!224904)) b!269812))

(assert (= (and b!269812 (not res!224905)) b!269810))

(assert (= (and b!269812 res!224902) b!269811))

(assert (= (and b!269811 c!12454) b!269814))

(assert (= (and b!269811 (not c!12454)) b!269809))

(assert (= (and b!269809 res!224901) b!269813))

(assert (= (and b!269813 (not res!224903)) b!269815))

(assert (= (or b!269814 b!269815) bm!4302))

(declare-fun m!401471 () Bool)

(assert (=> bm!4302 m!401471))

(declare-fun m!401473 () Bool)

(assert (=> bm!4302 m!401473))

(declare-fun m!401475 () Bool)

(assert (=> bm!4302 m!401475))

(declare-fun m!401477 () Bool)

(assert (=> bm!4302 m!401477))

(declare-fun m!401479 () Bool)

(assert (=> bm!4302 m!401479))

(assert (=> b!269809 m!401477))

(assert (=> b!269809 m!401479))

(assert (=> b!269809 m!401477))

(assert (=> b!269809 m!401479))

(declare-fun m!401485 () Bool)

(assert (=> b!269809 m!401485))

(declare-fun m!401487 () Bool)

(assert (=> b!269810 m!401487))

(assert (=> b!269812 m!401321))

(declare-fun m!401491 () Bool)

(assert (=> b!269812 m!401491))

(assert (=> b!269693 d!91444))

(assert (=> b!269693 d!91416))

(declare-fun d!91448 () Bool)

(assert (=> d!91448 (= (invariant!0 (currentBit!12961 w2!587) (currentByte!12966 w2!587) (size!6548 (buf!7016 w2!587))) (and (bvsge (currentBit!12961 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12961 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12966 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12966 w2!587) (size!6548 (buf!7016 w2!587))) (and (= (currentBit!12961 w2!587) #b00000000000000000000000000000000) (= (currentByte!12966 w2!587) (size!6548 (buf!7016 w2!587)))))))))

(assert (=> d!91360 d!91448))

(declare-fun d!91450 () Bool)

(assert (=> d!91450 (= (invariant!0 (currentBit!12961 w1!591) (currentByte!12966 w1!591) (size!6548 (buf!7016 w1!591))) (and (bvsge (currentBit!12961 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12961 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12966 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12966 w1!591) (size!6548 (buf!7016 w1!591))) (and (= (currentBit!12961 w1!591) #b00000000000000000000000000000000) (= (currentByte!12966 w1!591) (size!6548 (buf!7016 w1!591)))))))))

(assert (=> d!91358 d!91450))

(check-sat (not b!269812) (not b!269803) (not b!269800) (not b!269809) (not b!269801) (not d!91408) (not bm!4302) (not b!269733) (not b!269739) (not b!269810) (not bm!4301) (not d!91422) (not d!91416))
(check-sat)
(get-model)

(declare-fun d!91466 () Bool)

(declare-fun res!224930 () Bool)

(declare-fun e!189715 () Bool)

(assert (=> d!91466 (=> res!224930 e!189715)))

(assert (=> d!91466 (= res!224930 (= (_1!12206 lt!409194) (_2!12206 lt!409194)))))

(assert (=> d!91466 (= (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) (_1!12206 lt!409194) (_2!12206 lt!409194)) e!189715)))

(declare-fun b!269844 () Bool)

(declare-fun e!189716 () Bool)

(assert (=> b!269844 (= e!189715 e!189716)))

(declare-fun res!224931 () Bool)

(assert (=> b!269844 (=> (not res!224931) (not e!189716))))

(assert (=> b!269844 (= res!224931 (= (select (arr!7535 (buf!7016 w1!591)) (_1!12206 lt!409194)) (select (arr!7535 (buf!7016 w2!587)) (_1!12206 lt!409194))))))

(declare-fun b!269845 () Bool)

(assert (=> b!269845 (= e!189716 (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) (bvadd (_1!12206 lt!409194) #b00000000000000000000000000000001) (_2!12206 lt!409194)))))

(assert (= (and d!91466 (not res!224930)) b!269844))

(assert (= (and b!269844 res!224931) b!269845))

(declare-fun m!401535 () Bool)

(assert (=> b!269844 m!401535))

(declare-fun m!401537 () Bool)

(assert (=> b!269844 m!401537))

(declare-fun m!401539 () Bool)

(assert (=> b!269845 m!401539))

(assert (=> b!269801 d!91466))

(declare-fun d!91468 () Bool)

(assert (=> d!91468 (= (byteRangesEq!0 (select (arr!7535 (buf!7016 w1!591)) (_3!1003 lt!409194)) (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409194)) lt!409196 #b00000000000000000000000000001000) (or (= lt!409196 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7535 (buf!7016 w1!591)) (_3!1003 lt!409194))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409196)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409194))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409196)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23135 () Bool)

(assert (= bs!23135 d!91468))

(declare-fun m!401541 () Bool)

(assert (=> bs!23135 m!401541))

(declare-fun m!401543 () Bool)

(assert (=> bs!23135 m!401543))

(assert (=> b!269800 d!91468))

(declare-fun d!91470 () Bool)

(declare-fun res!224932 () Bool)

(declare-fun e!189717 () Bool)

(assert (=> d!91470 (=> res!224932 e!189717)))

(assert (=> d!91470 (= res!224932 (= (_1!12206 lt!409197) (_2!12206 lt!409197)))))

(assert (=> d!91470 (= (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) (_1!12206 lt!409197) (_2!12206 lt!409197)) e!189717)))

(declare-fun b!269846 () Bool)

(declare-fun e!189718 () Bool)

(assert (=> b!269846 (= e!189717 e!189718)))

(declare-fun res!224933 () Bool)

(assert (=> b!269846 (=> (not res!224933) (not e!189718))))

(assert (=> b!269846 (= res!224933 (= (select (arr!7535 (buf!7016 w2!587)) (_1!12206 lt!409197)) (select (arr!7535 (buf!7016 w3!25)) (_1!12206 lt!409197))))))

(declare-fun b!269847 () Bool)

(assert (=> b!269847 (= e!189718 (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) (bvadd (_1!12206 lt!409197) #b00000000000000000000000000000001) (_2!12206 lt!409197)))))

(assert (= (and d!91470 (not res!224932)) b!269846))

(assert (= (and b!269846 res!224933) b!269847))

(declare-fun m!401545 () Bool)

(assert (=> b!269846 m!401545))

(declare-fun m!401547 () Bool)

(assert (=> b!269846 m!401547))

(declare-fun m!401549 () Bool)

(assert (=> b!269847 m!401549))

(assert (=> b!269810 d!91470))

(declare-fun d!91472 () Bool)

(assert (=> d!91472 (= (remainingBits!0 ((_ sign_extend 32) (size!6548 (buf!7016 w3!25))) ((_ sign_extend 32) (currentByte!12966 w3!25)) ((_ sign_extend 32) (currentBit!12961 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6548 (buf!7016 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12966 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12961 w3!25)))))))

(assert (=> d!91422 d!91472))

(assert (=> d!91422 d!91428))

(declare-fun d!91474 () Bool)

(assert (=> d!91474 (= (byteRangesEq!0 (ite c!12453 (select (arr!7535 (buf!7016 w1!591)) (_3!1003 lt!409194)) (select (arr!7535 (buf!7016 w1!591)) (_4!223 lt!409194))) (ite c!12453 (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409194)) (select (arr!7535 (buf!7016 w2!587)) (_4!223 lt!409194))) (ite c!12453 lt!409196 #b00000000000000000000000000000000) lt!409195) (or (= (ite c!12453 lt!409196 #b00000000000000000000000000000000) lt!409195) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12453 (select (arr!7535 (buf!7016 w1!591)) (_3!1003 lt!409194)) (select (arr!7535 (buf!7016 w1!591)) (_4!223 lt!409194)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409195))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12453 lt!409196 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12453 (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409194)) (select (arr!7535 (buf!7016 w2!587)) (_4!223 lt!409194)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409195))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12453 lt!409196 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23136 () Bool)

(assert (= bs!23136 d!91474))

(declare-fun m!401551 () Bool)

(assert (=> bs!23136 m!401551))

(declare-fun m!401553 () Bool)

(assert (=> bs!23136 m!401553))

(assert (=> bm!4301 d!91474))

(declare-fun d!91476 () Bool)

(declare-fun res!224934 () Bool)

(declare-fun e!189719 () Bool)

(assert (=> d!91476 (=> res!224934 e!189719)))

(assert (=> d!91476 (= res!224934 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12966 w1!591)))))

(assert (=> d!91476 (= (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12966 w1!591)) e!189719)))

(declare-fun b!269848 () Bool)

(declare-fun e!189720 () Bool)

(assert (=> b!269848 (= e!189719 e!189720)))

(declare-fun res!224935 () Bool)

(assert (=> b!269848 (=> (not res!224935) (not e!189720))))

(assert (=> b!269848 (= res!224935 (= (select (arr!7535 (buf!7016 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7535 (buf!7016 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!269849 () Bool)

(assert (=> b!269849 (= e!189720 (arrayRangesEq!1080 (buf!7016 w1!591) (buf!7016 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12966 w1!591)))))

(assert (= (and d!91476 (not res!224934)) b!269848))

(assert (= (and b!269848 res!224935) b!269849))

(declare-fun m!401555 () Bool)

(assert (=> b!269848 m!401555))

(declare-fun m!401557 () Bool)

(assert (=> b!269848 m!401557))

(declare-fun m!401559 () Bool)

(assert (=> b!269849 m!401559))

(assert (=> b!269739 d!91476))

(declare-fun d!91478 () Bool)

(assert (=> d!91478 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591))) (tuple4!447 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6548 (buf!7016 w1!591)) (currentByte!12966 w1!591) (currentBit!12961 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269803 d!91478))

(declare-fun d!91480 () Bool)

(assert (=> d!91480 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587))) (tuple4!447 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6548 (buf!7016 w2!587)) (currentByte!12966 w2!587) (currentBit!12961 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269812 d!91480))

(declare-fun d!91482 () Bool)

(assert (=> d!91482 (= (remainingBits!0 ((_ sign_extend 32) (size!6548 (buf!7016 w1!591))) ((_ sign_extend 32) (currentByte!12966 w1!591)) ((_ sign_extend 32) (currentBit!12961 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6548 (buf!7016 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12966 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12961 w1!591)))))))

(assert (=> d!91408 d!91482))

(assert (=> d!91408 d!91450))

(declare-fun d!91484 () Bool)

(assert (=> d!91484 (= (byteRangesEq!0 (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409197)) (select (arr!7535 (buf!7016 w3!25)) (_3!1003 lt!409197)) lt!409199 #b00000000000000000000000000001000) (or (= lt!409199 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409197))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409199)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7535 (buf!7016 w3!25)) (_3!1003 lt!409197))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409199)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23137 () Bool)

(assert (= bs!23137 d!91484))

(assert (=> bs!23137 m!401541))

(declare-fun m!401561 () Bool)

(assert (=> bs!23137 m!401561))

(assert (=> b!269809 d!91484))

(declare-fun d!91486 () Bool)

(declare-fun res!224936 () Bool)

(declare-fun e!189721 () Bool)

(assert (=> d!91486 (=> res!224936 e!189721)))

(assert (=> d!91486 (= res!224936 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12966 w2!587)))))

(assert (=> d!91486 (= (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12966 w2!587)) e!189721)))

(declare-fun b!269850 () Bool)

(declare-fun e!189722 () Bool)

(assert (=> b!269850 (= e!189721 e!189722)))

(declare-fun res!224937 () Bool)

(assert (=> b!269850 (=> (not res!224937) (not e!189722))))

(assert (=> b!269850 (= res!224937 (= (select (arr!7535 (buf!7016 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7535 (buf!7016 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!269851 () Bool)

(assert (=> b!269851 (= e!189722 (arrayRangesEq!1080 (buf!7016 w2!587) (buf!7016 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12966 w2!587)))))

(assert (= (and d!91486 (not res!224936)) b!269850))

(assert (= (and b!269850 res!224937) b!269851))

(assert (=> b!269850 m!401557))

(declare-fun m!401563 () Bool)

(assert (=> b!269850 m!401563))

(declare-fun m!401565 () Bool)

(assert (=> b!269851 m!401565))

(assert (=> b!269733 d!91486))

(declare-fun d!91488 () Bool)

(assert (=> d!91488 (= (remainingBits!0 ((_ sign_extend 32) (size!6548 (buf!7016 w2!587))) ((_ sign_extend 32) (currentByte!12966 w2!587)) ((_ sign_extend 32) (currentBit!12961 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6548 (buf!7016 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12966 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12961 w2!587)))))))

(assert (=> d!91416 d!91488))

(assert (=> d!91416 d!91448))

(declare-fun d!91490 () Bool)

(assert (=> d!91490 (= (byteRangesEq!0 (ite c!12454 (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409197)) (select (arr!7535 (buf!7016 w2!587)) (_4!223 lt!409197))) (ite c!12454 (select (arr!7535 (buf!7016 w3!25)) (_3!1003 lt!409197)) (select (arr!7535 (buf!7016 w3!25)) (_4!223 lt!409197))) (ite c!12454 lt!409199 #b00000000000000000000000000000000) lt!409198) (or (= (ite c!12454 lt!409199 #b00000000000000000000000000000000) lt!409198) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12454 (select (arr!7535 (buf!7016 w2!587)) (_3!1003 lt!409197)) (select (arr!7535 (buf!7016 w2!587)) (_4!223 lt!409197)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409198))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12454 lt!409199 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12454 (select (arr!7535 (buf!7016 w3!25)) (_3!1003 lt!409197)) (select (arr!7535 (buf!7016 w3!25)) (_4!223 lt!409197)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409198))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12454 lt!409199 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23138 () Bool)

(assert (= bs!23138 d!91490))

(declare-fun m!401567 () Bool)

(assert (=> bs!23138 m!401567))

(declare-fun m!401569 () Bool)

(assert (=> bs!23138 m!401569))

(assert (=> bm!4302 d!91490))

(check-sat (not b!269849) (not b!269845) (not b!269847) (not b!269851))
