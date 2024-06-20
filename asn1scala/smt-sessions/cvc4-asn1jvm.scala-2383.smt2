; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60844 () Bool)

(assert start!60844)

(declare-fun res!228555 () Bool)

(declare-fun e!194639 () Bool)

(assert (=> start!60844 (=> (not res!228555) (not e!194639))))

(declare-datatypes ((array!15589 0))(
  ( (array!15590 (arr!7743 (Array (_ BitVec 32) (_ BitVec 8))) (size!6756 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12326 0))(
  ( (BitStream!12327 (buf!7224 array!15589) (currentByte!13360 (_ BitVec 32)) (currentBit!13355 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12326)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12326 (_ BitVec 64)) Bool)

(assert (=> start!60844 (= res!228555 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60844 e!194639))

(declare-fun e!194638 () Bool)

(declare-fun inv!12 (BitStream!12326) Bool)

(assert (=> start!60844 (and (inv!12 thiss!882) e!194638)))

(assert (=> start!60844 true))

(declare-fun b!274750 () Bool)

(declare-fun e!194641 () Bool)

(assert (=> b!274750 (= e!194639 e!194641)))

(declare-fun res!228556 () Bool)

(assert (=> b!274750 (=> (not res!228556) (not e!194641))))

(declare-fun lt!413033 () (_ BitVec 32))

(assert (=> b!274750 (= res!228556 (and (bvsge lt!413033 #b00000000000000000000000000000000) (bvsge lt!413033 #b00000000000000000000000000001000)))))

(assert (=> b!274750 (= lt!413033 (bvadd (currentBit!13355 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274751 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274751 (= e!194641 (not (= (bvadd (bitIndex!0 (size!6756 (buf!7224 thiss!882)) (currentByte!13360 thiss!882) (currentBit!13355 thiss!882)) diffInBits!15) (bitIndex!0 (size!6756 (buf!7224 thiss!882)) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882)) (bvsub lt!413033 #b00000000000000000000000000001000)))))))

(declare-fun b!274752 () Bool)

(declare-fun array_inv!6480 (array!15589) Bool)

(assert (=> b!274752 (= e!194638 (array_inv!6480 (buf!7224 thiss!882)))))

(assert (= (and start!60844 res!228555) b!274750))

(assert (= (and b!274750 res!228556) b!274751))

(assert (= start!60844 b!274752))

(declare-fun m!407365 () Bool)

(assert (=> start!60844 m!407365))

(declare-fun m!407367 () Bool)

(assert (=> start!60844 m!407367))

(declare-fun m!407369 () Bool)

(assert (=> b!274751 m!407369))

(declare-fun m!407371 () Bool)

(assert (=> b!274751 m!407371))

(declare-fun m!407373 () Bool)

(assert (=> b!274752 m!407373))

(push 1)

(assert (not b!274751))

(assert (not start!60844))

(assert (not b!274752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94396 () Bool)

(declare-fun e!194658 () Bool)

(assert (=> d!94396 e!194658))

(declare-fun res!228583 () Bool)

(assert (=> d!94396 (=> (not res!228583) (not e!194658))))

(declare-fun lt!413101 () (_ BitVec 64))

(declare-fun lt!413104 () (_ BitVec 64))

(declare-fun lt!413105 () (_ BitVec 64))

(assert (=> d!94396 (= res!228583 (= lt!413105 (bvsub lt!413104 lt!413101)))))

(assert (=> d!94396 (or (= (bvand lt!413104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413104 lt!413101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94396 (= lt!413101 (remainingBits!0 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))) ((_ sign_extend 32) (currentByte!13360 thiss!882)) ((_ sign_extend 32) (currentBit!13355 thiss!882))))))

(declare-fun lt!413100 () (_ BitVec 64))

(declare-fun lt!413102 () (_ BitVec 64))

(assert (=> d!94396 (= lt!413104 (bvmul lt!413100 lt!413102))))

(assert (=> d!94396 (or (= lt!413100 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413102 (bvsdiv (bvmul lt!413100 lt!413102) lt!413100)))))

(assert (=> d!94396 (= lt!413102 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94396 (= lt!413100 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))))))

(assert (=> d!94396 (= lt!413105 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13360 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13355 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94396 (invariant!0 (currentBit!13355 thiss!882) (currentByte!13360 thiss!882) (size!6756 (buf!7224 thiss!882)))))

(assert (=> d!94396 (= (bitIndex!0 (size!6756 (buf!7224 thiss!882)) (currentByte!13360 thiss!882) (currentBit!13355 thiss!882)) lt!413105)))

(declare-fun b!274781 () Bool)

(declare-fun res!228584 () Bool)

(assert (=> b!274781 (=> (not res!228584) (not e!194658))))

(assert (=> b!274781 (= res!228584 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413105))))

(declare-fun b!274782 () Bool)

(declare-fun lt!413103 () (_ BitVec 64))

(assert (=> b!274782 (= e!194658 (bvsle lt!413105 (bvmul lt!413103 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274782 (or (= lt!413103 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413103 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413103)))))

(assert (=> b!274782 (= lt!413103 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))))))

(assert (= (and d!94396 res!228583) b!274781))

(assert (= (and b!274781 res!228584) b!274782))

(declare-fun m!407391 () Bool)

(assert (=> d!94396 m!407391))

(declare-fun m!407393 () Bool)

(assert (=> d!94396 m!407393))

(assert (=> b!274751 d!94396))

(declare-fun d!94404 () Bool)

(declare-fun e!194659 () Bool)

(assert (=> d!94404 e!194659))

(declare-fun res!228585 () Bool)

(assert (=> d!94404 (=> (not res!228585) (not e!194659))))

(declare-fun lt!413107 () (_ BitVec 64))

(declare-fun lt!413111 () (_ BitVec 64))

(declare-fun lt!413110 () (_ BitVec 64))

(assert (=> d!94404 (= res!228585 (= lt!413111 (bvsub lt!413110 lt!413107)))))

(assert (=> d!94404 (or (= (bvand lt!413110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413107 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413110 lt!413107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94404 (= lt!413107 (remainingBits!0 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882))) ((_ sign_extend 32) (bvsub lt!413033 #b00000000000000000000000000001000))))))

(declare-fun lt!413106 () (_ BitVec 64))

(declare-fun lt!413108 () (_ BitVec 64))

(assert (=> d!94404 (= lt!413110 (bvmul lt!413106 lt!413108))))

(assert (=> d!94404 (or (= lt!413106 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413108 (bvsdiv (bvmul lt!413106 lt!413108) lt!413106)))))

(assert (=> d!94404 (= lt!413108 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94404 (= lt!413106 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))))))

(assert (=> d!94404 (= lt!413111 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvsub lt!413033 #b00000000000000000000000000001000))))))

(assert (=> d!94404 (invariant!0 (bvsub lt!413033 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882)) (size!6756 (buf!7224 thiss!882)))))

(assert (=> d!94404 (= (bitIndex!0 (size!6756 (buf!7224 thiss!882)) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882)) (bvsub lt!413033 #b00000000000000000000000000001000)) lt!413111)))

(declare-fun b!274783 () Bool)

(declare-fun res!228586 () Bool)

(assert (=> b!274783 (=> (not res!228586) (not e!194659))))

(assert (=> b!274783 (= res!228586 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413111))))

(declare-fun b!274784 () Bool)

(declare-fun lt!413109 () (_ BitVec 64))

(assert (=> b!274784 (= e!194659 (bvsle lt!413111 (bvmul lt!413109 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274784 (or (= lt!413109 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413109 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413109)))))

(assert (=> b!274784 (= lt!413109 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))))))

(assert (= (and d!94404 res!228585) b!274783))

(assert (= (and b!274783 res!228586) b!274784))

(declare-fun m!407395 () Bool)

(assert (=> d!94404 m!407395))

(declare-fun m!407397 () Bool)

(assert (=> d!94404 m!407397))

(assert (=> b!274751 d!94404))

(declare-fun d!94406 () Bool)

(declare-fun res!228589 () Bool)

(declare-fun e!194662 () Bool)

(assert (=> d!94406 (=> (not res!228589) (not e!194662))))

(assert (=> d!94406 (= res!228589 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882)))))))))

(assert (=> d!94406 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194662)))

(declare-fun b!274788 () Bool)

(declare-fun lt!413114 () (_ BitVec 64))

(assert (=> b!274788 (= e!194662 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413114) (bvsle lt!413114 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882)))))))))

(assert (=> b!274788 (= lt!413114 (bvadd (bitIndex!0 (size!6756 (buf!7224 thiss!882)) (currentByte!13360 thiss!882) (currentBit!13355 thiss!882)) diffInBits!15))))

(assert (= (and d!94406 res!228589) b!274788))

(assert (=> b!274788 m!407369))

(assert (=> start!60844 d!94406))

(declare-fun d!94408 () Bool)

(assert (=> d!94408 (= (inv!12 thiss!882) (invariant!0 (currentBit!13355 thiss!882) (currentByte!13360 thiss!882) (size!6756 (buf!7224 thiss!882))))))

(declare-fun bs!23767 () Bool)

(assert (= bs!23767 d!94408))

(assert (=> bs!23767 m!407393))

(assert (=> start!60844 d!94408))

(declare-fun d!94410 () Bool)

(assert (=> d!94410 (= (array_inv!6480 (buf!7224 thiss!882)) (bvsge (size!6756 (buf!7224 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274752 d!94410))

(push 1)

(assert (not d!94408))

(assert (not b!274788))

(assert (not d!94404))

(assert (not d!94396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94412 () Bool)

(assert (=> d!94412 (= (invariant!0 (currentBit!13355 thiss!882) (currentByte!13360 thiss!882) (size!6756 (buf!7224 thiss!882))) (and (bvsge (currentBit!13355 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13355 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13360 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13360 thiss!882) (size!6756 (buf!7224 thiss!882))) (and (= (currentBit!13355 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13360 thiss!882) (size!6756 (buf!7224 thiss!882)))))))))

(assert (=> d!94408 d!94412))

(assert (=> b!274788 d!94396))

(declare-fun d!94414 () Bool)

(assert (=> d!94414 (= (remainingBits!0 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882))) ((_ sign_extend 32) (bvsub lt!413033 #b00000000000000000000000000001000))) (bvsub (bvmul ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvsub lt!413033 #b00000000000000000000000000001000)))))))

(assert (=> d!94404 d!94414))

(declare-fun d!94416 () Bool)

(assert (=> d!94416 (= (invariant!0 (bvsub lt!413033 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882)) (size!6756 (buf!7224 thiss!882))) (and (bvsge (bvsub lt!413033 #b00000000000000000000000000001000) #b00000000000000000000000000000000) (bvslt (bvsub lt!413033 #b00000000000000000000000000001000) #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882)) (size!6756 (buf!7224 thiss!882))) (and (= (bvsub lt!413033 #b00000000000000000000000000001000) #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13360 thiss!882)) (size!6756 (buf!7224 thiss!882)))))))))

(assert (=> d!94404 d!94416))

(declare-fun d!94418 () Bool)

(assert (=> d!94418 (= (remainingBits!0 ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))) ((_ sign_extend 32) (currentByte!13360 thiss!882)) ((_ sign_extend 32) (currentBit!13355 thiss!882))) (bvsub (bvmul ((_ sign_extend 32) (size!6756 (buf!7224 thiss!882))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13360 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13355 thiss!882)))))))

(assert (=> d!94396 d!94418))

(assert (=> d!94396 d!94412))

(push 1)

(check-sat)

(pop 1)

