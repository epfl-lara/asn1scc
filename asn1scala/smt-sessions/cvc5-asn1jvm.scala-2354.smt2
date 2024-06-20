; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60068 () Bool)

(assert start!60068)

(declare-fun res!227680 () Bool)

(declare-fun e!193413 () Bool)

(assert (=> start!60068 (=> (not res!227680) (not e!193413))))

(declare-datatypes ((array!15346 0))(
  ( (array!15347 (arr!7654 (Array (_ BitVec 32) (_ BitVec 8))) (size!6667 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12148 0))(
  ( (BitStream!12149 (buf!7135 array!15346) (currentByte!13165 (_ BitVec 32)) (currentBit!13160 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12148)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12148 (_ BitVec 64)) Bool)

(assert (=> start!60068 (= res!227680 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60068 e!193413))

(declare-fun e!193412 () Bool)

(declare-fun inv!12 (BitStream!12148) Bool)

(assert (=> start!60068 (and (inv!12 thiss!882) e!193412)))

(assert (=> start!60068 true))

(declare-fun b!273543 () Bool)

(declare-fun e!193414 () Bool)

(assert (=> b!273543 (= e!193413 e!193414)))

(declare-fun res!227679 () Bool)

(assert (=> b!273543 (=> (not res!227679) (not e!193414))))

(declare-fun lt!411584 () (_ BitVec 32))

(assert (=> b!273543 (= res!227679 (bvslt (bvadd (currentBit!13160 thiss!882) lt!411584) #b00000000000000000000000000000000))))

(assert (=> b!273543 (= lt!411584 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273544 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273544 (= e!193414 (not (invariant!0 (bvadd #b00000000000000000000000000001000 lt!411584 (currentBit!13160 thiss!882)) (bvsub (bvadd (currentByte!13165 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6667 (buf!7135 thiss!882)))))))

(declare-fun b!273545 () Bool)

(declare-fun array_inv!6391 (array!15346) Bool)

(assert (=> b!273545 (= e!193412 (array_inv!6391 (buf!7135 thiss!882)))))

(assert (= (and start!60068 res!227680) b!273543))

(assert (= (and b!273543 res!227679) b!273544))

(assert (= start!60068 b!273545))

(declare-fun m!406361 () Bool)

(assert (=> start!60068 m!406361))

(declare-fun m!406363 () Bool)

(assert (=> start!60068 m!406363))

(declare-fun m!406365 () Bool)

(assert (=> b!273544 m!406365))

(declare-fun m!406367 () Bool)

(assert (=> b!273545 m!406367))

(push 1)

(assert (not b!273545))

(assert (not start!60068))

(assert (not b!273544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93644 () Bool)

(assert (=> d!93644 (= (array_inv!6391 (buf!7135 thiss!882)) (bvsge (size!6667 (buf!7135 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273545 d!93644))

(declare-fun d!93646 () Bool)

(declare-fun res!227698 () Bool)

(declare-fun e!193444 () Bool)

(assert (=> d!93646 (=> (not res!227698) (not e!193444))))

(assert (=> d!93646 (= res!227698 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6667 (buf!7135 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6667 (buf!7135 thiss!882)))))))))

(assert (=> d!93646 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193444)))

(declare-fun b!273571 () Bool)

(declare-fun lt!411596 () (_ BitVec 64))

(assert (=> b!273571 (= e!193444 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411596) (bvsle lt!411596 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6667 (buf!7135 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273571 (= lt!411596 (bvadd (bitIndex!0 (size!6667 (buf!7135 thiss!882)) (currentByte!13165 thiss!882) (currentBit!13160 thiss!882)) diffInBits!15))))

(assert (= (and d!93646 res!227698) b!273571))

(declare-fun m!406389 () Bool)

(assert (=> b!273571 m!406389))

(assert (=> start!60068 d!93646))

(declare-fun d!93650 () Bool)

(assert (=> d!93650 (= (inv!12 thiss!882) (invariant!0 (currentBit!13160 thiss!882) (currentByte!13165 thiss!882) (size!6667 (buf!7135 thiss!882))))))

(declare-fun bs!23601 () Bool)

(assert (= bs!23601 d!93650))

(declare-fun m!406391 () Bool)

(assert (=> bs!23601 m!406391))

(assert (=> start!60068 d!93650))

(declare-fun d!93652 () Bool)

(assert (=> d!93652 (= (invariant!0 (bvadd #b00000000000000000000000000001000 lt!411584 (currentBit!13160 thiss!882)) (bvsub (bvadd (currentByte!13165 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6667 (buf!7135 thiss!882))) (and (bvsge (bvadd #b00000000000000000000000000001000 lt!411584 (currentBit!13160 thiss!882)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000001000 lt!411584 (currentBit!13160 thiss!882)) #b00000000000000000000000000001000) (bvsge (bvsub (bvadd (currentByte!13165 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (or (bvslt (bvsub (bvadd (currentByte!13165 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6667 (buf!7135 thiss!882))) (and (= (bvadd #b00000000000000000000000000001000 lt!411584 (currentBit!13160 thiss!882)) #b00000000000000000000000000000000) (= (bvsub (bvadd (currentByte!13165 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6667 (buf!7135 thiss!882)))))))))

(assert (=> b!273544 d!93652))

(push 1)

(assert (not b!273571))

(assert (not d!93650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93666 () Bool)

(declare-fun e!193453 () Bool)

(assert (=> d!93666 e!193453))

(declare-fun res!227713 () Bool)

(assert (=> d!93666 (=> (not res!227713) (not e!193453))))

(declare-fun lt!411630 () (_ BitVec 64))

(declare-fun lt!411632 () (_ BitVec 64))

(declare-fun lt!411634 () (_ BitVec 64))

(assert (=> d!93666 (= res!227713 (= lt!411632 (bvsub lt!411630 lt!411634)))))

(assert (=> d!93666 (or (= (bvand lt!411630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411630 lt!411634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93666 (= lt!411634 (remainingBits!0 ((_ sign_extend 32) (size!6667 (buf!7135 thiss!882))) ((_ sign_extend 32) (currentByte!13165 thiss!882)) ((_ sign_extend 32) (currentBit!13160 thiss!882))))))

(declare-fun lt!411633 () (_ BitVec 64))

(declare-fun lt!411631 () (_ BitVec 64))

(assert (=> d!93666 (= lt!411630 (bvmul lt!411633 lt!411631))))

(assert (=> d!93666 (or (= lt!411633 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411631 (bvsdiv (bvmul lt!411633 lt!411631) lt!411633)))))

(assert (=> d!93666 (= lt!411631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93666 (= lt!411633 ((_ sign_extend 32) (size!6667 (buf!7135 thiss!882))))))

(assert (=> d!93666 (= lt!411632 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13165 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13160 thiss!882))))))

(assert (=> d!93666 (invariant!0 (currentBit!13160 thiss!882) (currentByte!13165 thiss!882) (size!6667 (buf!7135 thiss!882)))))

(assert (=> d!93666 (= (bitIndex!0 (size!6667 (buf!7135 thiss!882)) (currentByte!13165 thiss!882) (currentBit!13160 thiss!882)) lt!411632)))

(declare-fun b!273586 () Bool)

(declare-fun res!227712 () Bool)

(assert (=> b!273586 (=> (not res!227712) (not e!193453))))

(assert (=> b!273586 (= res!227712 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411632))))

(declare-fun b!273587 () Bool)

(declare-fun lt!411635 () (_ BitVec 64))

(assert (=> b!273587 (= e!193453 (bvsle lt!411632 (bvmul lt!411635 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273587 (or (= lt!411635 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411635 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411635)))))

(assert (=> b!273587 (= lt!411635 ((_ sign_extend 32) (size!6667 (buf!7135 thiss!882))))))

(assert (= (and d!93666 res!227713) b!273586))

(assert (= (and b!273586 res!227712) b!273587))

(declare-fun m!406399 () Bool)

(assert (=> d!93666 m!406399))

(assert (=> d!93666 m!406391))

(assert (=> b!273571 d!93666))

(declare-fun d!93668 () Bool)

(assert (=> d!93668 (= (invariant!0 (currentBit!13160 thiss!882) (currentByte!13165 thiss!882) (size!6667 (buf!7135 thiss!882))) (and (bvsge (currentBit!13160 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13160 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13165 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13165 thiss!882) (size!6667 (buf!7135 thiss!882))) (and (= (currentBit!13160 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13165 thiss!882) (size!6667 (buf!7135 thiss!882)))))))))

(assert (=> d!93650 d!93668))

(push 1)

(assert (not d!93666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

