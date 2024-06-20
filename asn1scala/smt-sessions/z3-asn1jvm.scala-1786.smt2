; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48752 () Bool)

(assert start!48752)

(declare-fun b!230810 () Bool)

(declare-fun res!193430 () Bool)

(declare-fun e!158573 () Bool)

(assert (=> b!230810 (=> (not res!193430) (not e!158573))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11787 0))(
  ( (array!11788 (arr!6152 (Array (_ BitVec 32) (_ BitVec 8))) (size!5165 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9426 0))(
  ( (BitStream!9427 (buf!5706 array!11787) (currentByte!10698 (_ BitVec 32)) (currentBit!10693 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9426)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230810 (= res!193430 (bvsle bits!86 (bitIndex!0 (size!5165 (buf!5706 b2!99)) (currentByte!10698 b2!99) (currentBit!10693 b2!99))))))

(declare-fun b!230812 () Bool)

(declare-fun e!158574 () Bool)

(declare-fun b1!101 () BitStream!9426)

(declare-fun array_inv!4906 (array!11787) Bool)

(assert (=> b!230812 (= e!158574 (array_inv!4906 (buf!5706 b1!101)))))

(declare-fun b!230813 () Bool)

(declare-fun e!158575 () Bool)

(assert (=> b!230813 (= e!158575 (array_inv!4906 (buf!5706 b2!99)))))

(declare-fun res!193431 () Bool)

(assert (=> start!48752 (=> (not res!193431) (not e!158573))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48752 (= res!193431 (and (= (size!5165 (buf!5706 b1!101)) (size!5165 (buf!5706 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48752 e!158573))

(declare-fun inv!12 (BitStream!9426) Bool)

(assert (=> start!48752 (and (inv!12 b1!101) e!158574)))

(assert (=> start!48752 (and (inv!12 b2!99) e!158575)))

(assert (=> start!48752 true))

(declare-fun b!230811 () Bool)

(assert (=> b!230811 (= e!158573 (and (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!48752 res!193431) b!230810))

(assert (= (and b!230810 res!193430) b!230811))

(assert (= start!48752 b!230812))

(assert (= start!48752 b!230813))

(declare-fun m!354039 () Bool)

(assert (=> b!230810 m!354039))

(declare-fun m!354041 () Bool)

(assert (=> b!230812 m!354041))

(declare-fun m!354043 () Bool)

(assert (=> b!230813 m!354043))

(declare-fun m!354045 () Bool)

(assert (=> start!48752 m!354045))

(declare-fun m!354047 () Bool)

(assert (=> start!48752 m!354047))

(check-sat (not b!230813) (not b!230812) (not start!48752) (not b!230810))
(check-sat)
(get-model)

(declare-fun d!78310 () Bool)

(assert (=> d!78310 (= (array_inv!4906 (buf!5706 b2!99)) (bvsge (size!5165 (buf!5706 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230813 d!78310))

(declare-fun d!78312 () Bool)

(assert (=> d!78312 (= (array_inv!4906 (buf!5706 b1!101)) (bvsge (size!5165 (buf!5706 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230812 d!78312))

(declare-fun d!78314 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78314 (= (inv!12 b1!101) (invariant!0 (currentBit!10693 b1!101) (currentByte!10698 b1!101) (size!5165 (buf!5706 b1!101))))))

(declare-fun bs!19198 () Bool)

(assert (= bs!19198 d!78314))

(declare-fun m!354059 () Bool)

(assert (=> bs!19198 m!354059))

(assert (=> start!48752 d!78314))

(declare-fun d!78316 () Bool)

(assert (=> d!78316 (= (inv!12 b2!99) (invariant!0 (currentBit!10693 b2!99) (currentByte!10698 b2!99) (size!5165 (buf!5706 b2!99))))))

(declare-fun bs!19199 () Bool)

(assert (= bs!19199 d!78316))

(declare-fun m!354061 () Bool)

(assert (=> bs!19199 m!354061))

(assert (=> start!48752 d!78316))

(declare-fun d!78318 () Bool)

(declare-fun e!158597 () Bool)

(assert (=> d!78318 e!158597))

(declare-fun res!193448 () Bool)

(assert (=> d!78318 (=> (not res!193448) (not e!158597))))

(declare-fun lt!368354 () (_ BitVec 64))

(declare-fun lt!368350 () (_ BitVec 64))

(declare-fun lt!368352 () (_ BitVec 64))

(assert (=> d!78318 (= res!193448 (= lt!368352 (bvsub lt!368354 lt!368350)))))

(assert (=> d!78318 (or (= (bvand lt!368354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368354 lt!368350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78318 (= lt!368350 (remainingBits!0 ((_ sign_extend 32) (size!5165 (buf!5706 b2!99))) ((_ sign_extend 32) (currentByte!10698 b2!99)) ((_ sign_extend 32) (currentBit!10693 b2!99))))))

(declare-fun lt!368351 () (_ BitVec 64))

(declare-fun lt!368355 () (_ BitVec 64))

(assert (=> d!78318 (= lt!368354 (bvmul lt!368351 lt!368355))))

(assert (=> d!78318 (or (= lt!368351 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368355 (bvsdiv (bvmul lt!368351 lt!368355) lt!368351)))))

(assert (=> d!78318 (= lt!368355 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78318 (= lt!368351 ((_ sign_extend 32) (size!5165 (buf!5706 b2!99))))))

(assert (=> d!78318 (= lt!368352 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10698 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10693 b2!99))))))

(assert (=> d!78318 (invariant!0 (currentBit!10693 b2!99) (currentByte!10698 b2!99) (size!5165 (buf!5706 b2!99)))))

(assert (=> d!78318 (= (bitIndex!0 (size!5165 (buf!5706 b2!99)) (currentByte!10698 b2!99) (currentBit!10693 b2!99)) lt!368352)))

(declare-fun b!230836 () Bool)

(declare-fun res!193449 () Bool)

(assert (=> b!230836 (=> (not res!193449) (not e!158597))))

(assert (=> b!230836 (= res!193449 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368352))))

(declare-fun b!230837 () Bool)

(declare-fun lt!368353 () (_ BitVec 64))

(assert (=> b!230837 (= e!158597 (bvsle lt!368352 (bvmul lt!368353 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230837 (or (= lt!368353 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368353 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368353)))))

(assert (=> b!230837 (= lt!368353 ((_ sign_extend 32) (size!5165 (buf!5706 b2!99))))))

(assert (= (and d!78318 res!193448) b!230836))

(assert (= (and b!230836 res!193449) b!230837))

(declare-fun m!354069 () Bool)

(assert (=> d!78318 m!354069))

(assert (=> d!78318 m!354061))

(assert (=> b!230810 d!78318))

(check-sat (not d!78314) (not d!78318) (not d!78316))
