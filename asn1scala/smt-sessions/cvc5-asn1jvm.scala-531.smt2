; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15528 () Bool)

(assert start!15528)

(declare-fun b!78690 () Bool)

(declare-fun e!51631 () Bool)

(declare-fun e!51636 () Bool)

(assert (=> b!78690 (= e!51631 e!51636)))

(declare-fun res!65082 () Bool)

(assert (=> b!78690 (=> (not res!65082) (not e!51636))))

(declare-datatypes ((array!3352 0))(
  ( (array!3353 (arr!2151 (Array (_ BitVec 32) (_ BitVec 8))) (size!1550 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2662 0))(
  ( (BitStream!2663 (buf!1940 array!3352) (currentByte!3796 (_ BitVec 32)) (currentBit!3791 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5185 0))(
  ( (Unit!5186) )
))
(declare-datatypes ((tuple2!7010 0))(
  ( (tuple2!7011 (_1!3642 Unit!5185) (_2!3642 BitStream!2662)) )
))
(declare-fun lt!125613 () tuple2!7010)

(declare-fun lt!125612 () Bool)

(declare-datatypes ((tuple2!7012 0))(
  ( (tuple2!7013 (_1!3643 BitStream!2662) (_2!3643 Bool)) )
))
(declare-fun lt!125608 () tuple2!7012)

(assert (=> b!78690 (= res!65082 (and (= (_2!3643 lt!125608) lt!125612) (= (_1!3643 lt!125608) (_2!3642 lt!125613))))))

(declare-fun thiss!1107 () BitStream!2662)

(declare-fun readBitPure!0 (BitStream!2662) tuple2!7012)

(declare-fun readerFrom!0 (BitStream!2662 (_ BitVec 32) (_ BitVec 32)) BitStream!2662)

(assert (=> b!78690 (= lt!125608 (readBitPure!0 (readerFrom!0 (_2!3642 lt!125613) (currentBit!3791 thiss!1107) (currentByte!3796 thiss!1107))))))

(declare-fun b!78691 () Bool)

(declare-fun res!65079 () Bool)

(declare-fun e!51632 () Bool)

(assert (=> b!78691 (=> res!65079 e!51632)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78691 (= res!65079 (not (= (bitIndex!0 (size!1550 (buf!1940 (_2!3642 lt!125613))) (currentByte!3796 (_2!3642 lt!125613)) (currentBit!3791 (_2!3642 lt!125613))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1550 (buf!1940 thiss!1107)) (currentByte!3796 thiss!1107) (currentBit!3791 thiss!1107))))))))

(declare-fun b!78692 () Bool)

(declare-fun e!51634 () Bool)

(declare-fun array_inv!1396 (array!3352) Bool)

(assert (=> b!78692 (= e!51634 (array_inv!1396 (buf!1940 thiss!1107)))))

(declare-fun res!65086 () Bool)

(declare-fun e!51633 () Bool)

(assert (=> start!15528 (=> (not res!65086) (not e!51633))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15528 (= res!65086 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15528 e!51633))

(assert (=> start!15528 true))

(declare-fun inv!12 (BitStream!2662) Bool)

(assert (=> start!15528 (and (inv!12 thiss!1107) e!51634)))

(declare-fun b!78693 () Bool)

(declare-fun e!51630 () Bool)

(assert (=> b!78693 (= e!51630 e!51631)))

(declare-fun res!65084 () Bool)

(assert (=> b!78693 (=> (not res!65084) (not e!51631))))

(declare-fun lt!125609 () (_ BitVec 64))

(declare-fun lt!125610 () (_ BitVec 64))

(assert (=> b!78693 (= res!65084 (= lt!125609 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125610)))))

(assert (=> b!78693 (= lt!125609 (bitIndex!0 (size!1550 (buf!1940 (_2!3642 lt!125613))) (currentByte!3796 (_2!3642 lt!125613)) (currentBit!3791 (_2!3642 lt!125613))))))

(assert (=> b!78693 (= lt!125610 (bitIndex!0 (size!1550 (buf!1940 thiss!1107)) (currentByte!3796 thiss!1107) (currentBit!3791 thiss!1107)))))

(declare-fun b!78694 () Bool)

(assert (=> b!78694 (= e!51636 (= (bitIndex!0 (size!1550 (buf!1940 (_1!3643 lt!125608))) (currentByte!3796 (_1!3643 lt!125608)) (currentBit!3791 (_1!3643 lt!125608))) lt!125609))))

(declare-fun b!78695 () Bool)

(assert (=> b!78695 (= e!51633 (not e!51632))))

(declare-fun res!65080 () Bool)

(assert (=> b!78695 (=> res!65080 e!51632)))

(assert (=> b!78695 (= res!65080 (not (= (size!1550 (buf!1940 (_2!3642 lt!125613))) (size!1550 (buf!1940 thiss!1107)))))))

(assert (=> b!78695 e!51630))

(declare-fun res!65085 () Bool)

(assert (=> b!78695 (=> (not res!65085) (not e!51630))))

(assert (=> b!78695 (= res!65085 (= (size!1550 (buf!1940 thiss!1107)) (size!1550 (buf!1940 (_2!3642 lt!125613)))))))

(declare-fun appendBit!0 (BitStream!2662 Bool) tuple2!7010)

(assert (=> b!78695 (= lt!125613 (appendBit!0 thiss!1107 lt!125612))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!78695 (= lt!125612 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78696 () Bool)

(declare-fun res!65078 () Bool)

(assert (=> b!78696 (=> (not res!65078) (not e!51631))))

(declare-fun isPrefixOf!0 (BitStream!2662 BitStream!2662) Bool)

(assert (=> b!78696 (= res!65078 (isPrefixOf!0 thiss!1107 (_2!3642 lt!125613)))))

(declare-fun b!78697 () Bool)

(declare-fun res!65083 () Bool)

(assert (=> b!78697 (=> res!65083 e!51632)))

(assert (=> b!78697 (= res!65083 (not (isPrefixOf!0 thiss!1107 (_2!3642 lt!125613))))))

(declare-fun b!78698 () Bool)

(declare-fun res!65081 () Bool)

(assert (=> b!78698 (=> (not res!65081) (not e!51633))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78698 (= res!65081 (validate_offset_bit!0 ((_ sign_extend 32) (size!1550 (buf!1940 thiss!1107))) ((_ sign_extend 32) (currentByte!3796 thiss!1107)) ((_ sign_extend 32) (currentBit!3791 thiss!1107))))))

(declare-fun b!78699 () Bool)

(declare-fun lt!125611 () BitStream!2662)

(assert (=> b!78699 (= e!51632 (validate_offset_bit!0 ((_ sign_extend 32) (size!1550 (buf!1940 lt!125611))) ((_ sign_extend 32) (currentByte!3796 lt!125611)) ((_ sign_extend 32) (currentBit!3791 lt!125611))))))

(assert (=> b!78699 (= lt!125611 (readerFrom!0 (_2!3642 lt!125613) (currentBit!3791 thiss!1107) (currentByte!3796 thiss!1107)))))

(assert (= (and start!15528 res!65086) b!78698))

(assert (= (and b!78698 res!65081) b!78695))

(assert (= (and b!78695 res!65085) b!78693))

(assert (= (and b!78693 res!65084) b!78696))

(assert (= (and b!78696 res!65078) b!78690))

(assert (= (and b!78690 res!65082) b!78694))

(assert (= (and b!78695 (not res!65080)) b!78691))

(assert (= (and b!78691 (not res!65079)) b!78697))

(assert (= (and b!78697 (not res!65083)) b!78699))

(assert (= start!15528 b!78692))

(declare-fun m!124179 () Bool)

(assert (=> b!78691 m!124179))

(declare-fun m!124181 () Bool)

(assert (=> b!78691 m!124181))

(assert (=> b!78693 m!124179))

(assert (=> b!78693 m!124181))

(declare-fun m!124183 () Bool)

(assert (=> b!78698 m!124183))

(declare-fun m!124185 () Bool)

(assert (=> b!78696 m!124185))

(declare-fun m!124187 () Bool)

(assert (=> b!78699 m!124187))

(declare-fun m!124189 () Bool)

(assert (=> b!78699 m!124189))

(declare-fun m!124191 () Bool)

(assert (=> b!78695 m!124191))

(declare-fun m!124193 () Bool)

(assert (=> b!78695 m!124193))

(assert (=> b!78697 m!124185))

(declare-fun m!124195 () Bool)

(assert (=> b!78692 m!124195))

(declare-fun m!124197 () Bool)

(assert (=> b!78694 m!124197))

(assert (=> b!78690 m!124189))

(assert (=> b!78690 m!124189))

(declare-fun m!124199 () Bool)

(assert (=> b!78690 m!124199))

(declare-fun m!124201 () Bool)

(assert (=> start!15528 m!124201))

(push 1)

(assert (not b!78698))

(assert (not b!78693))

(assert (not b!78690))

(assert (not b!78696))

(assert (not b!78699))

(assert (not b!78697))

(assert (not b!78692))

(assert (not start!15528))

(assert (not b!78694))

(assert (not b!78691))

(assert (not b!78695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24878 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24878 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1550 (buf!1940 lt!125611))) ((_ sign_extend 32) (currentByte!3796 lt!125611)) ((_ sign_extend 32) (currentBit!3791 lt!125611))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1550 (buf!1940 lt!125611))) ((_ sign_extend 32) (currentByte!3796 lt!125611)) ((_ sign_extend 32) (currentBit!3791 lt!125611))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6027 () Bool)

(assert (= bs!6027 d!24878))

(declare-fun m!124269 () Bool)

(assert (=> bs!6027 m!124269))

(assert (=> b!78699 d!24878))

(declare-fun d!24880 () Bool)

(declare-fun e!51695 () Bool)

(assert (=> d!24880 e!51695))

(declare-fun res!65167 () Bool)

(assert (=> d!24880 (=> (not res!65167) (not e!51695))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24880 (= res!65167 (invariant!0 (currentBit!3791 (_2!3642 lt!125613)) (currentByte!3796 (_2!3642 lt!125613)) (size!1550 (buf!1940 (_2!3642 lt!125613)))))))

(assert (=> d!24880 (= (readerFrom!0 (_2!3642 lt!125613) (currentBit!3791 thiss!1107) (currentByte!3796 thiss!1107)) (BitStream!2663 (buf!1940 (_2!3642 lt!125613)) (currentByte!3796 thiss!1107) (currentBit!3791 thiss!1107)))))

(declare-fun b!78784 () Bool)

(assert (=> b!78784 (= e!51695 (invariant!0 (currentBit!3791 thiss!1107) (currentByte!3796 thiss!1107) (size!1550 (buf!1940 (_2!3642 lt!125613)))))))

(assert (= (and d!24880 res!65167) b!78784))

(declare-fun m!124271 () Bool)

(assert (=> d!24880 m!124271))

(declare-fun m!124273 () Bool)

(assert (=> b!78784 m!124273))

(assert (=> b!78699 d!24880))

(declare-fun d!24882 () Bool)

(assert (=> d!24882 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3791 thiss!1107) (currentByte!3796 thiss!1107) (size!1550 (buf!1940 thiss!1107))))))

(declare-fun bs!6028 () Bool)

(assert (= bs!6028 d!24882))

(declare-fun m!124275 () Bool)

(assert (=> bs!6028 m!124275))

(assert (=> start!15528 d!24882))

(declare-fun d!24884 () Bool)

(declare-fun e!51706 () Bool)

(assert (=> d!24884 e!51706))

(declare-fun res!65187 () Bool)

(assert (=> d!24884 (=> (not res!65187) (not e!51706))))

(declare-fun lt!125707 () (_ BitVec 64))

(declare-fun lt!125704 () (_ BitVec 64))

(declare-fun lt!125706 () (_ BitVec 64))

(assert (=> d!24884 (= res!65187 (= lt!125707 (bvsub lt!125704 lt!125706)))))

(assert (=> d!24884 (or (= (bvand lt!125704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125706 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125704 lt!125706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24884 (= lt!125706 (remainingBits!0 ((_ sign_extend 32) (size!1550 (buf!1940 (_1!3643 lt!125608)))) ((_ sign_extend 32) (currentByte!3796 (_1!3643 lt!125608))) ((_ sign_extend 32) (currentBit!3791 (_1!3643 lt!125608)))))))

(declare-fun lt!125708 () (_ BitVec 64))

(declare-fun lt!125705 () (_ BitVec 64))

(assert (=> d!24884 (= lt!125704 (bvmul lt!125708 lt!125705))))

(assert (=> d!24884 (or (= lt!125708 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125705 (bvsdiv (bvmul lt!125708 lt!125705) lt!125708)))))

(assert (=> d!24884 (= lt!125705 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24884 (= lt!125708 ((_ sign_extend 32) (size!1550 (buf!1940 (_1!3643 lt!125608)))))))

(assert (=> d!24884 (= lt!125707 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3796 (_1!3643 lt!125608))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3791 (_1!3643 lt!125608)))))))

(assert (=> d!24884 (invariant!0 (currentBit!3791 (_1!3643 lt!125608)) (currentByte!3796 (_1!3643 lt!125608)) (size!1550 (buf!1940 (_1!3643 lt!125608))))))

(assert (=> d!24884 (= (bitIndex!0 (size!1550 (buf!1940 (_1!3643 lt!125608))) (currentByte!3796 (_1!3643 lt!125608)) (currentBit!3791 (_1!3643 lt!125608))) lt!125707)))

(declare-fun b!78804 () Bool)

(declare-fun res!65188 () Bool)

(assert (=> b!78804 (=> (not res!65188) (not e!51706))))

(assert (=> b!78804 (= res!65188 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125707))))

(declare-fun b!78805 () Bool)

(declare-fun lt!125709 () (_ BitVec 64))

(assert (=> b!78805 (= e!51706 (bvsle lt!125707 (bvmul lt!125709 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78805 (or (= lt!125709 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125709 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125709)))))

(assert (=> b!78805 (= lt!125709 ((_ sign_extend 32) (size!1550 (buf!1940 (_1!3643 lt!125608)))))))

(assert (= (and d!24884 res!65187) b!78804))

(assert (= (and b!78804 res!65188) b!78805))

(declare-fun m!124291 () Bool)

(assert (=> d!24884 m!124291))

(declare-fun m!124293 () Bool)

(assert (=> d!24884 m!124293))

(assert (=> b!78694 d!24884))

(declare-fun d!24892 () Bool)

(declare-fun e!51708 () Bool)

(assert (=> d!24892 e!51708))

(declare-fun res!65190 () Bool)

(assert (=> d!24892 (=> (not res!65190) (not e!51708))))

(declare-fun lt!125714 () (_ BitVec 64))

(declare-fun lt!125712 () (_ BitVec 64))

(declare-fun lt!125715 () (_ BitVec 64))

(assert (=> d!24892 (= res!65190 (= lt!125715 (bvsub lt!125712 lt!125714)))))

(assert (=> d!24892 (or (= (bvand lt!125712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125714 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125712 lt!125714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24892 (= lt!125714 (remainingBits!0 ((_ sign_extend 32) (size!1550 (buf!1940 (_2!3642 lt!125613)))) ((_ sign_extend 32) (currentByte!3796 (_2!3642 lt!125613))) ((_ sign_extend 32) (currentBit!3791 (_2!3642 lt!125613)))))))

(declare-fun lt!125716 () (_ BitVec 64))

(declare-fun lt!125713 () (_ BitVec 64))

(assert (=> d!24892 (= lt!125712 (bvmul lt!125716 lt!125713))))

(assert (=> d!24892 (or (= lt!125716 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125713 (bvsdiv (bvmul lt!125716 lt!125713) lt!125716)))))

(assert (=> d!24892 (= lt!125713 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24892 (= lt!125716 ((_ sign_extend 32) (size!1550 (buf!1940 (_2!3642 lt!125613)))))))

(assert (=> d!24892 (= lt!125715 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3796 (_2!3642 lt!125613))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3791 (_2!3642 lt!125613)))))))

(assert (=> d!24892 (invariant!0 (currentBit!3791 (_2!3642 lt!125613)) (currentByte!3796 (_2!3642 lt!125613)) (size!1550 (buf!1940 (_2!3642 lt!125613))))))

(assert (=> d!24892 (= (bitIndex!0 (size!1550 (buf!1940 (_2!3642 lt!125613))) (currentByte!3796 (_2!3642 lt!125613)) (currentBit!3791 (_2!3642 lt!125613))) lt!125715)))

(declare-fun b!78807 () Bool)

(declare-fun res!65191 () Bool)

(assert (=> b!78807 (=> (not res!65191) (not e!51708))))

(assert (=> b!78807 (= res!65191 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125715))))

(declare-fun b!78808 () Bool)

(declare-fun lt!125717 () (_ BitVec 64))

(assert (=> b!78808 (= e!51708 (bvsle lt!125715 (bvmul lt!125717 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78808 (or (= lt!125717 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125717 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125717)))))

(assert (=> b!78808 (= lt!125717 ((_ sign_extend 32) (size!1550 (buf!1940 (_2!3642 lt!125613)))))))

(assert (= (and d!24892 res!65190) b!78807))

(assert (= (and b!78807 res!65191) b!78808))

(declare-fun m!124301 () Bool)

(assert (=> d!24892 m!124301))

(assert (=> d!24892 m!124271))

(assert (=> b!78693 d!24892))

(declare-fun d!24896 () Bool)

(declare-fun e!51709 () Bool)

(assert (=> d!24896 e!51709))

(declare-fun res!65192 () Bool)

(assert (=> d!24896 (=> (not res!65192) (not e!51709))))

(declare-fun lt!125721 () (_ BitVec 64))

(declare-fun lt!125722 () (_ BitVec 64))

(declare-fun lt!125719 () (_ BitVec 64))

(assert (=> d!24896 (= res!65192 (= lt!125722 (bvsub lt!125719 lt!125721)))))

(assert (=> d!24896 (or (= (bvand lt!125719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125721 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125719 lt!125721) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24896 (= lt!125721 (remainingBits!0 ((_ sign_extend 32) (size!1550 (buf!1940 thiss!1107))) ((_ sign_extend 32) (currentByte!3796 thiss!1107)) ((_ sign_extend 32) (currentBit!3791 thiss!1107))))))

(declare-fun lt!125723 () (_ BitVec 64))

(declare-fun lt!125720 () (_ BitVec 64))

(assert (=> d!24896 (= lt!125719 (bvmul lt!125723 lt!125720))))

(assert (=> d!24896 (or (= lt!125723 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125720 (bvsdiv (bvmul lt!125723 lt!125720) lt!125723)))))

(assert (=> d!24896 (= lt!125720 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24896 (= lt!125723 ((_ sign_extend 32) (size!1550 (buf!1940 thiss!1107))))))

(assert (=> d!24896 (= lt!125722 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3796 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3791 thiss!1107))))))

(assert (=> d!24896 (invariant!0 (currentBit!3791 thiss!1107) (currentByte!3796 thiss!1107) (size!1550 (buf!1940 thiss!1107)))))

(assert (=> d!24896 (= (bitIndex!0 (size!1550 (buf!1940 thiss!1107)) (currentByte!3796 thiss!1107) (currentBit!3791 thiss!1107)) lt!125722)))

(declare-fun b!78809 () Bool)

(declare-fun res!65193 () Bool)

(assert (=> b!78809 (=> (not res!65193) (not e!51709))))

(assert (=> b!78809 (= res!65193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125722))))

(declare-fun b!78810 () Bool)

(declare-fun lt!125724 () (_ BitVec 64))

(assert (=> b!78810 (= e!51709 (bvsle lt!125722 (bvmul lt!125724 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78810 (or (= lt!125724 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125724 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125724)))))

(assert (=> b!78810 (= lt!125724 ((_ sign_extend 32) (size!1550 (buf!1940 thiss!1107))))))

(assert (= (and d!24896 res!65192) b!78809))

(assert (= (and b!78809 res!65193) b!78810))

(declare-fun m!124303 () Bool)

(assert (=> d!24896 m!124303))

(assert (=> d!24896 m!124275))

(assert (=> b!78693 d!24896))

(declare-fun d!24898 () Bool)

(assert (=> d!24898 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1550 (buf!1940 thiss!1107))) ((_ sign_extend 32) (currentByte!3796 thiss!1107)) ((_ sign_extend 32) (currentBit!3791 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1550 (buf!1940 thiss!1107))) ((_ sign_extend 32) (currentByte!3796 thiss!1107)) ((_ sign_extend 32) (currentBit!3791 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6031 () Bool)

(assert (= bs!6031 d!24898))

(assert (=> bs!6031 m!124303))

(assert (=> b!78698 d!24898))

(declare-fun d!24900 () Bool)

(declare-fun res!65211 () Bool)

(declare-fun e!51720 () Bool)

(assert (=> d!24900 (=> (not res!65211) (not e!51720))))

(assert (=> d!24900 (= res!65211 (= (size!1550 (buf!1940 thiss!1107)) (size!1550 (buf!1940 (_2!3642 lt!125613)))))))

(assert (=> d!24900 (= (isPrefixOf!0 thiss!1107 (_2!3642 lt!125613)) e!51720)))

(declare-fun b!78826 () Bool)

(declare-fun res!65210 () Bool)

(assert (=> b!78826 (=> (not res!65210) (not e!51720))))

(assert (=> b!78826 (= res!65210 (bvsle (bitIndex!0 (size!1550 (buf!1940 thiss!1107)) (currentByte!3796 thiss!1107) (currentBit!3791 thiss!1107)) (bitIndex!0 (size!1550 (buf!1940 (_2!3642 lt!125613))) (currentByte!3796 (_2!3642 lt!125613)) (currentBit!3791 (_2!3642 lt!125613)))))))

(declare-fun b!78827 () Bool)

(declare-fun e!51721 () Bool)

(assert (=> b!78827 (= e!51720 e!51721)))

(declare-fun res!65209 () Bool)

(assert (=> b!78827 (=> res!65209 e!51721)))

(assert (=> b!78827 (= res!65209 (= (size!1550 (buf!1940 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78828 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3352 array!3352 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78828 (= e!51721 (arrayBitRangesEq!0 (buf!1940 thiss!1107) (buf!1940 (_2!3642 lt!125613)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1550 (buf!1940 thiss!1107)) (currentByte!3796 thiss!1107) (currentBit!3791 thiss!1107))))))

(assert (= (and d!24900 res!65211) b!78826))

(assert (= (and b!78826 res!65210) b!78827))

(assert (= (and b!78827 (not res!65209)) b!78828))

(assert (=> b!78826 m!124181))

(assert (=> b!78826 m!124179))

(assert (=> b!78828 m!124181))

(assert (=> b!78828 m!124181))

(declare-fun m!124307 () Bool)

(assert (=> b!78828 m!124307))

(assert (=> b!78697 d!24900))

(declare-fun d!24904 () Bool)

(assert (=> d!24904 (= (array_inv!1396 (buf!1940 thiss!1107)) (bvsge (size!1550 (buf!1940 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78692 d!24904))

(assert (=> b!78691 d!24892))

(assert (=> b!78691 d!24896))

(assert (=> b!78696 d!24900))

(declare-fun b!78846 () Bool)

(declare-fun res!65231 () Bool)

(declare-fun e!51731 () Bool)

(assert (=> b!78846 (=> (not res!65231) (not e!51731))))

(declare-fun lt!125757 () tuple2!7010)

(declare-fun lt!125758 () (_ BitVec 64))

(declare-fun lt!125760 () (_ BitVec 64))

(assert (=> b!78846 (= res!65231 (= (bitIndex!0 (size!1550 (buf!1940 (_2!3642 lt!125757))) (currentByte!3796 (_2!3642 lt!125757)) (currentBit!3791 (_2!3642 lt!125757))) (bvadd lt!125760 lt!125758)))))

(assert (=> b!78846 (or (not (= (bvand lt!125760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125760 lt!125758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78846 (= lt!125758 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78846 (= lt!125760 (bitIndex!0 (size!1550 (buf!1940 thiss!1107)) (currentByte!3796 thiss!1107) (currentBit!3791 thiss!1107)))))

(declare-fun d!24906 () Bool)

(assert (=> d!24906 e!51731))

(declare-fun res!65228 () Bool)

(assert (=> d!24906 (=> (not res!65228) (not e!51731))))

(assert (=> d!24906 (= res!65228 (= (size!1550 (buf!1940 thiss!1107)) (size!1550 (buf!1940 (_2!3642 lt!125757)))))))

(declare-fun choose!16 (BitStream!2662 Bool) tuple2!7010)

(assert (=> d!24906 (= lt!125757 (choose!16 thiss!1107 lt!125612))))

(assert (=> d!24906 (validate_offset_bit!0 ((_ sign_extend 32) (size!1550 (buf!1940 thiss!1107))) ((_ sign_extend 32) (currentByte!3796 thiss!1107)) ((_ sign_extend 32) (currentBit!3791 thiss!1107)))))

(assert (=> d!24906 (= (appendBit!0 thiss!1107 lt!125612) lt!125757)))

(declare-fun b!78848 () Bool)

(declare-fun e!51730 () Bool)

(assert (=> b!78848 (= e!51731 e!51730)))

(declare-fun res!65230 () Bool)

(assert (=> b!78848 (=> (not res!65230) (not e!51730))))

(declare-fun lt!125759 () tuple2!7012)

(assert (=> b!78848 (= res!65230 (and (= (_2!3643 lt!125759) lt!125612) (= (_1!3643 lt!125759) (_2!3642 lt!125757))))))

(assert (=> b!78848 (= lt!125759 (readBitPure!0 (readerFrom!0 (_2!3642 lt!125757) (currentBit!3791 thiss!1107) (currentByte!3796 thiss!1107))))))

(declare-fun b!78847 () Bool)

(declare-fun res!65229 () Bool)

(assert (=> b!78847 (=> (not res!65229) (not e!51731))))

(assert (=> b!78847 (= res!65229 (isPrefixOf!0 thiss!1107 (_2!3642 lt!125757)))))

(declare-fun b!78849 () Bool)

(assert (=> b!78849 (= e!51730 (= (bitIndex!0 (size!1550 (buf!1940 (_1!3643 lt!125759))) (currentByte!3796 (_1!3643 lt!125759)) (currentBit!3791 (_1!3643 lt!125759))) (bitIndex!0 (size!1550 (buf!1940 (_2!3642 lt!125757))) (currentByte!3796 (_2!3642 lt!125757)) (currentBit!3791 (_2!3642 lt!125757)))))))

(assert (= (and d!24906 res!65228) b!78846))

(assert (= (and b!78846 res!65231) b!78847))

(assert (= (and b!78847 res!65229) b!78848))

(assert (= (and b!78848 res!65230) b!78849))

(declare-fun m!124315 () Bool)

(assert (=> d!24906 m!124315))

(assert (=> d!24906 m!124183))

(declare-fun m!124317 () Bool)

(assert (=> b!78849 m!124317))

(declare-fun m!124319 () Bool)

(assert (=> b!78849 m!124319))

(declare-fun m!124321 () Bool)

(assert (=> b!78848 m!124321))

(assert (=> b!78848 m!124321))

(declare-fun m!124323 () Bool)

(assert (=> b!78848 m!124323))

(assert (=> b!78846 m!124319))

(assert (=> b!78846 m!124181))

(declare-fun m!124325 () Bool)

(assert (=> b!78847 m!124325))

(assert (=> b!78695 d!24906))

(declare-fun d!24912 () Bool)

(declare-datatypes ((tuple2!7024 0))(
  ( (tuple2!7025 (_1!3649 Bool) (_2!3649 BitStream!2662)) )
))
(declare-fun lt!125763 () tuple2!7024)

(declare-fun readBit!0 (BitStream!2662) tuple2!7024)

(assert (=> d!24912 (= lt!125763 (readBit!0 (readerFrom!0 (_2!3642 lt!125613) (currentBit!3791 thiss!1107) (currentByte!3796 thiss!1107))))))

(assert (=> d!24912 (= (readBitPure!0 (readerFrom!0 (_2!3642 lt!125613) (currentBit!3791 thiss!1107) (currentByte!3796 thiss!1107))) (tuple2!7013 (_2!3649 lt!125763) (_1!3649 lt!125763)))))

(declare-fun bs!6032 () Bool)

(assert (= bs!6032 d!24912))

(assert (=> bs!6032 m!124189))

(declare-fun m!124327 () Bool)

(assert (=> bs!6032 m!124327))

(assert (=> b!78690 d!24912))

(assert (=> b!78690 d!24880))

(push 1)

(assert (not b!78784))

(assert (not d!24892))

(assert (not d!24882))

(assert (not b!78826))

(assert (not d!24880))

(assert (not b!78847))

(assert (not b!78848))

(assert (not b!78846))

(assert (not d!24898))

(assert (not d!24896))

(assert (not d!24884))

(assert (not d!24906))

(assert (not b!78828))

(assert (not d!24912))

(assert (not d!24878))

(assert (not b!78849))

(check-sat)

(pop 1)

(push 1)

(check-sat)

