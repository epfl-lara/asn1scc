; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60738 () Bool)

(assert start!60738)

(declare-fun res!228418 () Bool)

(declare-fun e!194464 () Bool)

(assert (=> start!60738 (=> (not res!228418) (not e!194464))))

(declare-datatypes ((array!15558 0))(
  ( (array!15559 (arr!7732 (Array (_ BitVec 32) (_ BitVec 8))) (size!6745 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12304 0))(
  ( (BitStream!12305 (buf!7213 array!15558) (currentByte!13334 (_ BitVec 32)) (currentBit!13329 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12304)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12304 (_ BitVec 64)) Bool)

(assert (=> start!60738 (= res!228418 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60738 e!194464))

(declare-fun e!194461 () Bool)

(declare-fun inv!12 (BitStream!12304) Bool)

(assert (=> start!60738 (and (inv!12 thiss!882) e!194461)))

(assert (=> start!60738 true))

(declare-fun b!274570 () Bool)

(declare-fun e!194462 () Bool)

(assert (=> b!274570 (= e!194464 e!194462)))

(declare-fun res!228417 () Bool)

(assert (=> b!274570 (=> (not res!228417) (not e!194462))))

(declare-fun lt!412784 () (_ BitVec 32))

(assert (=> b!274570 (= res!228417 (and (bvsge lt!412784 #b00000000000000000000000000000000) (bvsge lt!412784 #b00000000000000000000000000001000)))))

(assert (=> b!274570 (= lt!412784 (bvadd (currentBit!13329 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274571 () Bool)

(assert (=> b!274571 (= e!194462 (not (inv!12 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000)))))))

(declare-fun b!274572 () Bool)

(declare-fun array_inv!6469 (array!15558) Bool)

(assert (=> b!274572 (= e!194461 (array_inv!6469 (buf!7213 thiss!882)))))

(assert (= (and start!60738 res!228418) b!274570))

(assert (= (and b!274570 res!228417) b!274571))

(assert (= start!60738 b!274572))

(declare-fun m!407225 () Bool)

(assert (=> start!60738 m!407225))

(declare-fun m!407227 () Bool)

(assert (=> start!60738 m!407227))

(declare-fun m!407229 () Bool)

(assert (=> b!274571 m!407229))

(declare-fun m!407231 () Bool)

(assert (=> b!274572 m!407231))

(push 1)

(assert (not b!274571))

(assert (not b!274572))

(assert (not start!60738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94288 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94288 (= (inv!12 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) (invariant!0 (currentBit!13329 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) (currentByte!13334 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) (size!6745 (buf!7213 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))))))))

(declare-fun bs!23746 () Bool)

(assert (= bs!23746 d!94288))

(declare-fun m!407255 () Bool)

(assert (=> bs!23746 m!407255))

(assert (=> b!274571 d!94288))

(declare-fun d!94290 () Bool)

(assert (=> d!94290 (= (array_inv!6469 (buf!7213 thiss!882)) (bvsge (size!6745 (buf!7213 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274572 d!94290))

(declare-fun d!94292 () Bool)

(declare-fun res!228436 () Bool)

(declare-fun e!194494 () Bool)

(assert (=> d!94292 (=> (not res!228436) (not e!194494))))

(assert (=> d!94292 (= res!228436 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6745 (buf!7213 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6745 (buf!7213 thiss!882)))))))))

(assert (=> d!94292 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194494)))

(declare-fun b!274598 () Bool)

(declare-fun lt!412796 () (_ BitVec 64))

(assert (=> b!274598 (= e!194494 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412796) (bvsle lt!412796 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6745 (buf!7213 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274598 (= lt!412796 (bvadd (bitIndex!0 (size!6745 (buf!7213 thiss!882)) (currentByte!13334 thiss!882) (currentBit!13329 thiss!882)) diffInBits!15))))

(assert (= (and d!94292 res!228436) b!274598))

(declare-fun m!407257 () Bool)

(assert (=> b!274598 m!407257))

(assert (=> start!60738 d!94292))

(declare-fun d!94294 () Bool)

(assert (=> d!94294 (= (inv!12 thiss!882) (invariant!0 (currentBit!13329 thiss!882) (currentByte!13334 thiss!882) (size!6745 (buf!7213 thiss!882))))))

(declare-fun bs!23747 () Bool)

(assert (= bs!23747 d!94294))

(declare-fun m!407259 () Bool)

(assert (=> bs!23747 m!407259))

(assert (=> start!60738 d!94294))

(push 1)

(assert (not d!94294))

(assert (not b!274598))

(assert (not d!94288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94310 () Bool)

(assert (=> d!94310 (= (invariant!0 (currentBit!13329 thiss!882) (currentByte!13334 thiss!882) (size!6745 (buf!7213 thiss!882))) (and (bvsge (currentBit!13329 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13329 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13334 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13334 thiss!882) (size!6745 (buf!7213 thiss!882))) (and (= (currentBit!13329 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13334 thiss!882) (size!6745 (buf!7213 thiss!882)))))))))

(assert (=> d!94294 d!94310))

(declare-fun d!94312 () Bool)

(declare-fun e!194503 () Bool)

(assert (=> d!94312 e!194503))

(declare-fun res!228450 () Bool)

(assert (=> d!94312 (=> (not res!228450) (not e!194503))))

(declare-fun lt!412831 () (_ BitVec 64))

(declare-fun lt!412835 () (_ BitVec 64))

(declare-fun lt!412832 () (_ BitVec 64))

(assert (=> d!94312 (= res!228450 (= lt!412831 (bvsub lt!412832 lt!412835)))))

(assert (=> d!94312 (or (= (bvand lt!412832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412832 lt!412835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94312 (= lt!412835 (remainingBits!0 ((_ sign_extend 32) (size!6745 (buf!7213 thiss!882))) ((_ sign_extend 32) (currentByte!13334 thiss!882)) ((_ sign_extend 32) (currentBit!13329 thiss!882))))))

(declare-fun lt!412833 () (_ BitVec 64))

(declare-fun lt!412830 () (_ BitVec 64))

(assert (=> d!94312 (= lt!412832 (bvmul lt!412833 lt!412830))))

(assert (=> d!94312 (or (= lt!412833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412830 (bvsdiv (bvmul lt!412833 lt!412830) lt!412833)))))

(assert (=> d!94312 (= lt!412830 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94312 (= lt!412833 ((_ sign_extend 32) (size!6745 (buf!7213 thiss!882))))))

(assert (=> d!94312 (= lt!412831 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13334 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13329 thiss!882))))))

(assert (=> d!94312 (invariant!0 (currentBit!13329 thiss!882) (currentByte!13334 thiss!882) (size!6745 (buf!7213 thiss!882)))))

(assert (=> d!94312 (= (bitIndex!0 (size!6745 (buf!7213 thiss!882)) (currentByte!13334 thiss!882) (currentBit!13329 thiss!882)) lt!412831)))

(declare-fun b!274613 () Bool)

(declare-fun res!228451 () Bool)

(assert (=> b!274613 (=> (not res!228451) (not e!194503))))

(assert (=> b!274613 (= res!228451 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412831))))

(declare-fun b!274614 () Bool)

(declare-fun lt!412834 () (_ BitVec 64))

(assert (=> b!274614 (= e!194503 (bvsle lt!412831 (bvmul lt!412834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274614 (or (= lt!412834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412834)))))

(assert (=> b!274614 (= lt!412834 ((_ sign_extend 32) (size!6745 (buf!7213 thiss!882))))))

(assert (= (and d!94312 res!228450) b!274613))

(assert (= (and b!274613 res!228451) b!274614))

(declare-fun m!407269 () Bool)

(assert (=> d!94312 m!407269))

(assert (=> d!94312 m!407259))

(assert (=> b!274598 d!94312))

(declare-fun d!94316 () Bool)

(assert (=> d!94316 (= (invariant!0 (currentBit!13329 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) (currentByte!13334 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) (size!6745 (buf!7213 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))))) (and (bvsge (currentBit!13329 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (bvslt (currentBit!13329 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) #b00000000000000000000000000001000) (bvsge (currentByte!13334 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13334 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) (size!6745 (buf!7213 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))))) (and (= (currentBit!13329 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (= (currentByte!13334 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000))) (size!6745 (buf!7213 (BitStream!12305 (buf!7213 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13334 thiss!882)) (bvsub lt!412784 #b00000000000000000000000000001000)))))))))))

(assert (=> d!94288 d!94316))

(push 1)

(assert (not d!94312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

