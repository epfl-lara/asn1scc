; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30000 () Bool)

(assert start!30000)

(declare-fun res!128940 () Bool)

(declare-fun e!103413 () Bool)

(assert (=> start!30000 (=> (not res!128940) (not e!103413))))

(declare-datatypes ((array!6946 0))(
  ( (array!6947 (arr!3954 (Array (_ BitVec 32) (_ BitVec 8))) (size!3131 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5520 0))(
  ( (BitStream!5521 (buf!3634 array!6946) (currentByte!6647 (_ BitVec 32)) (currentBit!6642 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5520)

(declare-fun bs2!18 () BitStream!5520)

(assert (=> start!30000 (= res!128940 (= (size!3131 (buf!3634 bs1!10)) (size!3131 (buf!3634 bs2!18))))))

(assert (=> start!30000 e!103413))

(declare-fun e!103410 () Bool)

(declare-fun inv!12 (BitStream!5520) Bool)

(assert (=> start!30000 (and (inv!12 bs1!10) e!103410)))

(declare-fun e!103411 () Bool)

(assert (=> start!30000 (and (inv!12 bs2!18) e!103411)))

(declare-fun lt!240387 () (_ BitVec 64))

(declare-fun b!153999 () Bool)

(declare-fun lt!240388 () (_ BitVec 64))

(assert (=> b!153999 (= e!103413 (and (bvsle lt!240387 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3131 (buf!3634 bs1!10))))) (let ((bdg!8949 (bvand lt!240388 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!8949 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= bdg!8949 (bvand lt!240387 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!153999 (= lt!240387 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240388))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153999 (= lt!240388 (bitIndex!0 (size!3131 (buf!3634 bs1!10)) (currentByte!6647 bs1!10) (currentBit!6642 bs1!10)))))

(declare-fun b!154000 () Bool)

(declare-fun array_inv!2920 (array!6946) Bool)

(assert (=> b!154000 (= e!103410 (array_inv!2920 (buf!3634 bs1!10)))))

(declare-fun b!154001 () Bool)

(assert (=> b!154001 (= e!103411 (array_inv!2920 (buf!3634 bs2!18)))))

(assert (= (and start!30000 res!128940) b!153999))

(assert (= start!30000 b!154000))

(assert (= start!30000 b!154001))

(declare-fun m!239993 () Bool)

(assert (=> start!30000 m!239993))

(declare-fun m!239995 () Bool)

(assert (=> start!30000 m!239995))

(declare-fun m!239997 () Bool)

(assert (=> b!153999 m!239997))

(declare-fun m!239999 () Bool)

(assert (=> b!154000 m!239999))

(declare-fun m!240001 () Bool)

(assert (=> b!154001 m!240001))

(check-sat (not b!153999) (not b!154001) (not b!154000) (not start!30000))
(check-sat)
(get-model)

(declare-fun d!50774 () Bool)

(declare-fun e!103434 () Bool)

(assert (=> d!50774 e!103434))

(declare-fun res!128955 () Bool)

(assert (=> d!50774 (=> (not res!128955) (not e!103434))))

(declare-fun lt!240430 () (_ BitVec 64))

(declare-fun lt!240425 () (_ BitVec 64))

(declare-fun lt!240429 () (_ BitVec 64))

(assert (=> d!50774 (= res!128955 (= lt!240430 (bvsub lt!240429 lt!240425)))))

(assert (=> d!50774 (or (= (bvand lt!240429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240425 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240429 lt!240425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50774 (= lt!240425 (remainingBits!0 ((_ sign_extend 32) (size!3131 (buf!3634 bs1!10))) ((_ sign_extend 32) (currentByte!6647 bs1!10)) ((_ sign_extend 32) (currentBit!6642 bs1!10))))))

(declare-fun lt!240426 () (_ BitVec 64))

(declare-fun lt!240427 () (_ BitVec 64))

(assert (=> d!50774 (= lt!240429 (bvmul lt!240426 lt!240427))))

(assert (=> d!50774 (or (= lt!240426 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240427 (bvsdiv (bvmul lt!240426 lt!240427) lt!240426)))))

(assert (=> d!50774 (= lt!240427 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50774 (= lt!240426 ((_ sign_extend 32) (size!3131 (buf!3634 bs1!10))))))

(assert (=> d!50774 (= lt!240430 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6647 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6642 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50774 (invariant!0 (currentBit!6642 bs1!10) (currentByte!6647 bs1!10) (size!3131 (buf!3634 bs1!10)))))

(assert (=> d!50774 (= (bitIndex!0 (size!3131 (buf!3634 bs1!10)) (currentByte!6647 bs1!10) (currentBit!6642 bs1!10)) lt!240430)))

(declare-fun b!154021 () Bool)

(declare-fun res!128954 () Bool)

(assert (=> b!154021 (=> (not res!128954) (not e!103434))))

(assert (=> b!154021 (= res!128954 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240430))))

(declare-fun b!154022 () Bool)

(declare-fun lt!240428 () (_ BitVec 64))

(assert (=> b!154022 (= e!103434 (bvsle lt!240430 (bvmul lt!240428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154022 (or (= lt!240428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240428)))))

(assert (=> b!154022 (= lt!240428 ((_ sign_extend 32) (size!3131 (buf!3634 bs1!10))))))

(assert (= (and d!50774 res!128955) b!154021))

(assert (= (and b!154021 res!128954) b!154022))

(declare-fun m!240023 () Bool)

(assert (=> d!50774 m!240023))

(declare-fun m!240025 () Bool)

(assert (=> d!50774 m!240025))

(assert (=> b!153999 d!50774))

(declare-fun d!50786 () Bool)

(assert (=> d!50786 (= (array_inv!2920 (buf!3634 bs2!18)) (bvsge (size!3131 (buf!3634 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154001 d!50786))

(declare-fun d!50788 () Bool)

(assert (=> d!50788 (= (array_inv!2920 (buf!3634 bs1!10)) (bvsge (size!3131 (buf!3634 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154000 d!50788))

(declare-fun d!50790 () Bool)

(assert (=> d!50790 (= (inv!12 bs1!10) (invariant!0 (currentBit!6642 bs1!10) (currentByte!6647 bs1!10) (size!3131 (buf!3634 bs1!10))))))

(declare-fun bs!12417 () Bool)

(assert (= bs!12417 d!50790))

(assert (=> bs!12417 m!240025))

(assert (=> start!30000 d!50790))

(declare-fun d!50792 () Bool)

(assert (=> d!50792 (= (inv!12 bs2!18) (invariant!0 (currentBit!6642 bs2!18) (currentByte!6647 bs2!18) (size!3131 (buf!3634 bs2!18))))))

(declare-fun bs!12418 () Bool)

(assert (= bs!12418 d!50792))

(declare-fun m!240027 () Bool)

(assert (=> bs!12418 m!240027))

(assert (=> start!30000 d!50792))

(check-sat (not d!50774) (not d!50792) (not d!50790))
