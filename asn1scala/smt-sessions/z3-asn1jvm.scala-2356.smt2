; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60136 () Bool)

(assert start!60136)

(declare-fun res!227757 () Bool)

(declare-fun e!193522 () Bool)

(assert (=> start!60136 (=> (not res!227757) (not e!193522))))

(declare-datatypes ((array!15366 0))(
  ( (array!15367 (arr!7661 (Array (_ BitVec 32) (_ BitVec 8))) (size!6674 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12162 0))(
  ( (BitStream!12163 (buf!7142 array!15366) (currentByte!13181 (_ BitVec 32)) (currentBit!13176 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12162)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12162 (_ BitVec 64)) Bool)

(assert (=> start!60136 (= res!227757 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60136 e!193522))

(declare-fun e!193524 () Bool)

(declare-fun inv!12 (BitStream!12162) Bool)

(assert (=> start!60136 (and (inv!12 thiss!882) e!193524)))

(assert (=> start!60136 true))

(declare-fun b!273648 () Bool)

(declare-fun e!193525 () Bool)

(assert (=> b!273648 (= e!193522 e!193525)))

(declare-fun res!227758 () Bool)

(assert (=> b!273648 (=> (not res!227758) (not e!193525))))

(declare-fun lt!411677 () (_ BitVec 32))

(assert (=> b!273648 (= res!227758 (and (bvsge lt!411677 #b00000000000000000000000000000000) (bvsge lt!411677 #b00000000000000000000000000001000)))))

(assert (=> b!273648 (= lt!411677 (bvadd (currentBit!13176 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273649 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273649 (= e!193525 (not (invariant!0 (bvsub lt!411677 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13181 thiss!882)) (size!6674 (buf!7142 thiss!882)))))))

(declare-fun b!273650 () Bool)

(declare-fun array_inv!6398 (array!15366) Bool)

(assert (=> b!273650 (= e!193524 (array_inv!6398 (buf!7142 thiss!882)))))

(assert (= (and start!60136 res!227757) b!273648))

(assert (= (and b!273648 res!227758) b!273649))

(assert (= start!60136 b!273650))

(declare-fun m!406441 () Bool)

(assert (=> start!60136 m!406441))

(declare-fun m!406443 () Bool)

(assert (=> start!60136 m!406443))

(declare-fun m!406445 () Bool)

(assert (=> b!273649 m!406445))

(declare-fun m!406447 () Bool)

(assert (=> b!273650 m!406447))

(check-sat (not b!273649) (not b!273650) (not start!60136))
(check-sat)
(get-model)

(declare-fun d!93702 () Bool)

(assert (=> d!93702 (= (invariant!0 (bvsub lt!411677 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13181 thiss!882)) (size!6674 (buf!7142 thiss!882))) (and (bvsge (bvsub lt!411677 #b00000000000000000000000000001000) #b00000000000000000000000000000000) (bvslt (bvsub lt!411677 #b00000000000000000000000000001000) #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13181 thiss!882)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13181 thiss!882)) (size!6674 (buf!7142 thiss!882))) (and (= (bvsub lt!411677 #b00000000000000000000000000001000) #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13181 thiss!882)) (size!6674 (buf!7142 thiss!882)))))))))

(assert (=> b!273649 d!93702))

(declare-fun d!93704 () Bool)

(assert (=> d!93704 (= (array_inv!6398 (buf!7142 thiss!882)) (bvsge (size!6674 (buf!7142 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273650 d!93704))

(declare-fun d!93706 () Bool)

(declare-fun res!227770 () Bool)

(declare-fun e!193543 () Bool)

(assert (=> d!93706 (=> (not res!227770) (not e!193543))))

(assert (=> d!93706 (= res!227770 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6674 (buf!7142 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6674 (buf!7142 thiss!882)))))))))

(assert (=> d!93706 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193543)))

(declare-fun b!273667 () Bool)

(declare-fun lt!411686 () (_ BitVec 64))

(assert (=> b!273667 (= e!193543 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411686) (bvsle lt!411686 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6674 (buf!7142 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273667 (= lt!411686 (bvadd (bitIndex!0 (size!6674 (buf!7142 thiss!882)) (currentByte!13181 thiss!882) (currentBit!13176 thiss!882)) diffInBits!15))))

(assert (= (and d!93706 res!227770) b!273667))

(declare-fun m!406461 () Bool)

(assert (=> b!273667 m!406461))

(assert (=> start!60136 d!93706))

(declare-fun d!93714 () Bool)

(assert (=> d!93714 (= (inv!12 thiss!882) (invariant!0 (currentBit!13176 thiss!882) (currentByte!13181 thiss!882) (size!6674 (buf!7142 thiss!882))))))

(declare-fun bs!23612 () Bool)

(assert (= bs!23612 d!93714))

(declare-fun m!406463 () Bool)

(assert (=> bs!23612 m!406463))

(assert (=> start!60136 d!93714))

(check-sat (not b!273667) (not d!93714))
(check-sat)
(get-model)

(declare-fun d!93728 () Bool)

(declare-fun e!193552 () Bool)

(assert (=> d!93728 e!193552))

(declare-fun res!227785 () Bool)

(assert (=> d!93728 (=> (not res!227785) (not e!193552))))

(declare-fun lt!411720 () (_ BitVec 64))

(declare-fun lt!411723 () (_ BitVec 64))

(declare-fun lt!411721 () (_ BitVec 64))

(assert (=> d!93728 (= res!227785 (= lt!411720 (bvsub lt!411721 lt!411723)))))

(assert (=> d!93728 (or (= (bvand lt!411721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411721 lt!411723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93728 (= lt!411723 (remainingBits!0 ((_ sign_extend 32) (size!6674 (buf!7142 thiss!882))) ((_ sign_extend 32) (currentByte!13181 thiss!882)) ((_ sign_extend 32) (currentBit!13176 thiss!882))))))

(declare-fun lt!411724 () (_ BitVec 64))

(declare-fun lt!411725 () (_ BitVec 64))

(assert (=> d!93728 (= lt!411721 (bvmul lt!411724 lt!411725))))

(assert (=> d!93728 (or (= lt!411724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411725 (bvsdiv (bvmul lt!411724 lt!411725) lt!411724)))))

(assert (=> d!93728 (= lt!411725 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93728 (= lt!411724 ((_ sign_extend 32) (size!6674 (buf!7142 thiss!882))))))

(assert (=> d!93728 (= lt!411720 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13181 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13176 thiss!882))))))

(assert (=> d!93728 (invariant!0 (currentBit!13176 thiss!882) (currentByte!13181 thiss!882) (size!6674 (buf!7142 thiss!882)))))

(assert (=> d!93728 (= (bitIndex!0 (size!6674 (buf!7142 thiss!882)) (currentByte!13181 thiss!882) (currentBit!13176 thiss!882)) lt!411720)))

(declare-fun b!273682 () Bool)

(declare-fun res!227784 () Bool)

(assert (=> b!273682 (=> (not res!227784) (not e!193552))))

(assert (=> b!273682 (= res!227784 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411720))))

(declare-fun b!273683 () Bool)

(declare-fun lt!411722 () (_ BitVec 64))

(assert (=> b!273683 (= e!193552 (bvsle lt!411720 (bvmul lt!411722 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273683 (or (= lt!411722 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411722 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411722)))))

(assert (=> b!273683 (= lt!411722 ((_ sign_extend 32) (size!6674 (buf!7142 thiss!882))))))

(assert (= (and d!93728 res!227785) b!273682))

(assert (= (and b!273682 res!227784) b!273683))

(declare-fun m!406471 () Bool)

(assert (=> d!93728 m!406471))

(assert (=> d!93728 m!406463))

(assert (=> b!273667 d!93728))

(declare-fun d!93732 () Bool)

(assert (=> d!93732 (= (invariant!0 (currentBit!13176 thiss!882) (currentByte!13181 thiss!882) (size!6674 (buf!7142 thiss!882))) (and (bvsge (currentBit!13176 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13176 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13181 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13181 thiss!882) (size!6674 (buf!7142 thiss!882))) (and (= (currentBit!13176 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13181 thiss!882) (size!6674 (buf!7142 thiss!882)))))))))

(assert (=> d!93714 d!93732))

(check-sat (not d!93728))
(check-sat)
