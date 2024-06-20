; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60664 () Bool)

(assert start!60664)

(declare-fun res!228340 () Bool)

(declare-fun e!194361 () Bool)

(assert (=> start!60664 (=> (not res!228340) (not e!194361))))

(declare-datatypes ((array!15538 0))(
  ( (array!15539 (arr!7725 (Array (_ BitVec 32) (_ BitVec 8))) (size!6738 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12290 0))(
  ( (BitStream!12291 (buf!7206 array!15538) (currentByte!13315 (_ BitVec 32)) (currentBit!13310 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12290)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12290 (_ BitVec 64)) Bool)

(assert (=> start!60664 (= res!228340 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60664 e!194361))

(declare-fun e!194360 () Bool)

(declare-fun inv!12 (BitStream!12290) Bool)

(assert (=> start!60664 (and (inv!12 thiss!882) e!194360)))

(assert (=> start!60664 true))

(declare-fun b!274465 () Bool)

(declare-fun e!194359 () Bool)

(assert (=> b!274465 (= e!194361 e!194359)))

(declare-fun res!228339 () Bool)

(assert (=> b!274465 (=> (not res!228339) (not e!194359))))

(declare-fun lt!412628 () (_ BitVec 32))

(assert (=> b!274465 (= res!228339 (and (bvsge lt!412628 #b00000000000000000000000000000000) (bvsge lt!412628 #b00000000000000000000000000001000)))))

(assert (=> b!274465 (= lt!412628 (bvadd (currentBit!13310 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274466 () Bool)

(assert (=> b!274466 (= e!194359 (not (inv!12 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000)))))))

(declare-fun b!274467 () Bool)

(declare-fun array_inv!6462 (array!15538) Bool)

(assert (=> b!274467 (= e!194360 (array_inv!6462 (buf!7206 thiss!882)))))

(assert (= (and start!60664 res!228340) b!274465))

(assert (= (and b!274465 res!228339) b!274466))

(assert (= start!60664 b!274467))

(declare-fun m!407139 () Bool)

(assert (=> start!60664 m!407139))

(declare-fun m!407141 () Bool)

(assert (=> start!60664 m!407141))

(declare-fun m!407143 () Bool)

(assert (=> b!274466 m!407143))

(declare-fun m!407145 () Bool)

(assert (=> b!274467 m!407145))

(push 1)

(assert (not b!274466))

(assert (not b!274467))

(assert (not start!60664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94218 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94218 (= (inv!12 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) (invariant!0 (currentBit!13310 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) (currentByte!13315 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) (size!6738 (buf!7206 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))))))))

(declare-fun bs!23730 () Bool)

(assert (= bs!23730 d!94218))

(declare-fun m!407159 () Bool)

(assert (=> bs!23730 m!407159))

(assert (=> b!274466 d!94218))

(declare-fun d!94220 () Bool)

(assert (=> d!94220 (= (array_inv!6462 (buf!7206 thiss!882)) (bvsge (size!6738 (buf!7206 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274467 d!94220))

(declare-fun d!94222 () Bool)

(declare-fun res!228349 () Bool)

(declare-fun e!194371 () Bool)

(assert (=> d!94222 (=> (not res!228349) (not e!194371))))

(assert (=> d!94222 (= res!228349 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6738 (buf!7206 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6738 (buf!7206 thiss!882)))))))))

(assert (=> d!94222 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194371)))

(declare-fun b!274479 () Bool)

(declare-fun lt!412637 () (_ BitVec 64))

(assert (=> b!274479 (= e!194371 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412637) (bvsle lt!412637 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6738 (buf!7206 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274479 (= lt!412637 (bvadd (bitIndex!0 (size!6738 (buf!7206 thiss!882)) (currentByte!13315 thiss!882) (currentBit!13310 thiss!882)) diffInBits!15))))

(assert (= (and d!94222 res!228349) b!274479))

(declare-fun m!407161 () Bool)

(assert (=> b!274479 m!407161))

(assert (=> start!60664 d!94222))

(declare-fun d!94224 () Bool)

(assert (=> d!94224 (= (inv!12 thiss!882) (invariant!0 (currentBit!13310 thiss!882) (currentByte!13315 thiss!882) (size!6738 (buf!7206 thiss!882))))))

(declare-fun bs!23731 () Bool)

(assert (= bs!23731 d!94224))

(declare-fun m!407163 () Bool)

(assert (=> bs!23731 m!407163))

(assert (=> start!60664 d!94224))

(push 1)

(assert (not d!94218))

(assert (not d!94224))

(assert (not b!274479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94238 () Bool)

(assert (=> d!94238 (= (invariant!0 (currentBit!13310 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) (currentByte!13315 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) (size!6738 (buf!7206 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))))) (and (bvsge (currentBit!13310 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (bvslt (currentBit!13310 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) #b00000000000000000000000000001000) (bvsge (currentByte!13315 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13315 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) (size!6738 (buf!7206 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))))) (and (= (currentBit!13310 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (= (currentByte!13315 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000))) (size!6738 (buf!7206 (BitStream!12291 (buf!7206 thiss!882) (bvadd (currentByte!13315 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412628 #b00000000000000000000000000001000)))))))))))

(assert (=> d!94218 d!94238))

(declare-fun d!94240 () Bool)

(assert (=> d!94240 (= (invariant!0 (currentBit!13310 thiss!882) (currentByte!13315 thiss!882) (size!6738 (buf!7206 thiss!882))) (and (bvsge (currentBit!13310 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13310 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13315 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13315 thiss!882) (size!6738 (buf!7206 thiss!882))) (and (= (currentBit!13310 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13315 thiss!882) (size!6738 (buf!7206 thiss!882)))))))))

(assert (=> d!94224 d!94240))

(declare-fun d!94242 () Bool)

(declare-fun e!194380 () Bool)

(assert (=> d!94242 e!194380))

(declare-fun res!228367 () Bool)

(assert (=> d!94242 (=> (not res!228367) (not e!194380))))

(declare-fun lt!412691 () (_ BitVec 64))

(declare-fun lt!412689 () (_ BitVec 64))

(declare-fun lt!412687 () (_ BitVec 64))

(assert (=> d!94242 (= res!228367 (= lt!412689 (bvsub lt!412687 lt!412691)))))

(assert (=> d!94242 (or (= (bvand lt!412687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412691 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412687 lt!412691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94242 (= lt!412691 (remainingBits!0 ((_ sign_extend 32) (size!6738 (buf!7206 thiss!882))) ((_ sign_extend 32) (currentByte!13315 thiss!882)) ((_ sign_extend 32) (currentBit!13310 thiss!882))))))

(declare-fun lt!412688 () (_ BitVec 64))

(declare-fun lt!412686 () (_ BitVec 64))

(assert (=> d!94242 (= lt!412687 (bvmul lt!412688 lt!412686))))

(assert (=> d!94242 (or (= lt!412688 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412686 (bvsdiv (bvmul lt!412688 lt!412686) lt!412688)))))

(assert (=> d!94242 (= lt!412686 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94242 (= lt!412688 ((_ sign_extend 32) (size!6738 (buf!7206 thiss!882))))))

(assert (=> d!94242 (= lt!412689 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13315 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13310 thiss!882))))))

(assert (=> d!94242 (invariant!0 (currentBit!13310 thiss!882) (currentByte!13315 thiss!882) (size!6738 (buf!7206 thiss!882)))))

(assert (=> d!94242 (= (bitIndex!0 (size!6738 (buf!7206 thiss!882)) (currentByte!13315 thiss!882) (currentBit!13310 thiss!882)) lt!412689)))

(declare-fun b!274496 () Bool)

(declare-fun res!228366 () Bool)

(assert (=> b!274496 (=> (not res!228366) (not e!194380))))

(assert (=> b!274496 (= res!228366 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412689))))

(declare-fun b!274497 () Bool)

(declare-fun lt!412690 () (_ BitVec 64))

(assert (=> b!274497 (= e!194380 (bvsle lt!412689 (bvmul lt!412690 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274497 (or (= lt!412690 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412690 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412690)))))

(assert (=> b!274497 (= lt!412690 ((_ sign_extend 32) (size!6738 (buf!7206 thiss!882))))))

(assert (= (and d!94242 res!228367) b!274496))

(assert (= (and b!274496 res!228366) b!274497))

(declare-fun m!407169 () Bool)

(assert (=> d!94242 m!407169))

(assert (=> d!94242 m!407163))

(assert (=> b!274479 d!94242))

(push 1)

(assert (not d!94242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

