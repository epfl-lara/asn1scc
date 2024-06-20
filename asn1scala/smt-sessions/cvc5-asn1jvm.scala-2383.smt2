; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60840 () Bool)

(assert start!60840)

(declare-fun res!228544 () Bool)

(declare-fun e!194614 () Bool)

(assert (=> start!60840 (=> (not res!228544) (not e!194614))))

(declare-datatypes ((array!15585 0))(
  ( (array!15586 (arr!7741 (Array (_ BitVec 32) (_ BitVec 8))) (size!6754 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12322 0))(
  ( (BitStream!12323 (buf!7222 array!15585) (currentByte!13358 (_ BitVec 32)) (currentBit!13353 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12322)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12322 (_ BitVec 64)) Bool)

(assert (=> start!60840 (= res!228544 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60840 e!194614))

(declare-fun e!194617 () Bool)

(declare-fun inv!12 (BitStream!12322) Bool)

(assert (=> start!60840 (and (inv!12 thiss!882) e!194617)))

(assert (=> start!60840 true))

(declare-fun b!274732 () Bool)

(declare-fun e!194615 () Bool)

(assert (=> b!274732 (= e!194614 e!194615)))

(declare-fun res!228543 () Bool)

(assert (=> b!274732 (=> (not res!228543) (not e!194615))))

(declare-fun lt!413027 () (_ BitVec 32))

(assert (=> b!274732 (= res!228543 (and (bvsge lt!413027 #b00000000000000000000000000000000) (bvsge lt!413027 #b00000000000000000000000000001000)))))

(assert (=> b!274732 (= lt!413027 (bvadd (currentBit!13353 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274733 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274733 (= e!194615 (not (= (bvadd (bitIndex!0 (size!6754 (buf!7222 thiss!882)) (currentByte!13358 thiss!882) (currentBit!13353 thiss!882)) diffInBits!15) (bitIndex!0 (size!6754 (buf!7222 thiss!882)) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13358 thiss!882)) (bvsub lt!413027 #b00000000000000000000000000001000)))))))

(declare-fun b!274734 () Bool)

(declare-fun array_inv!6478 (array!15585) Bool)

(assert (=> b!274734 (= e!194617 (array_inv!6478 (buf!7222 thiss!882)))))

(assert (= (and start!60840 res!228544) b!274732))

(assert (= (and b!274732 res!228543) b!274733))

(assert (= start!60840 b!274734))

(declare-fun m!407345 () Bool)

(assert (=> start!60840 m!407345))

(declare-fun m!407347 () Bool)

(assert (=> start!60840 m!407347))

(declare-fun m!407349 () Bool)

(assert (=> b!274733 m!407349))

(declare-fun m!407351 () Bool)

(assert (=> b!274733 m!407351))

(declare-fun m!407353 () Bool)

(assert (=> b!274734 m!407353))

(push 1)

(assert (not b!274734))

(assert (not b!274733))

(assert (not start!60840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94390 () Bool)

(assert (=> d!94390 (= (array_inv!6478 (buf!7222 thiss!882)) (bvsge (size!6754 (buf!7222 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274734 d!94390))

(declare-fun d!94392 () Bool)

(declare-fun e!194651 () Bool)

(assert (=> d!94392 e!194651))

(declare-fun res!228572 () Bool)

(assert (=> d!94392 (=> (not res!228572) (not e!194651))))

(declare-fun lt!413078 () (_ BitVec 64))

(declare-fun lt!413073 () (_ BitVec 64))

(declare-fun lt!413077 () (_ BitVec 64))

(assert (=> d!94392 (= res!228572 (= lt!413077 (bvsub lt!413073 lt!413078)))))

(assert (=> d!94392 (or (= (bvand lt!413073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413073 lt!413078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94392 (= lt!413078 (remainingBits!0 ((_ sign_extend 32) (size!6754 (buf!7222 thiss!882))) ((_ sign_extend 32) (currentByte!13358 thiss!882)) ((_ sign_extend 32) (currentBit!13353 thiss!882))))))

(declare-fun lt!413074 () (_ BitVec 64))

(declare-fun lt!413076 () (_ BitVec 64))

(assert (=> d!94392 (= lt!413073 (bvmul lt!413074 lt!413076))))

(assert (=> d!94392 (or (= lt!413074 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413076 (bvsdiv (bvmul lt!413074 lt!413076) lt!413074)))))

(assert (=> d!94392 (= lt!413076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94392 (= lt!413074 ((_ sign_extend 32) (size!6754 (buf!7222 thiss!882))))))

(assert (=> d!94392 (= lt!413077 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13358 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13353 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94392 (invariant!0 (currentBit!13353 thiss!882) (currentByte!13358 thiss!882) (size!6754 (buf!7222 thiss!882)))))

(assert (=> d!94392 (= (bitIndex!0 (size!6754 (buf!7222 thiss!882)) (currentByte!13358 thiss!882) (currentBit!13353 thiss!882)) lt!413077)))

(declare-fun b!274769 () Bool)

(declare-fun res!228573 () Bool)

(assert (=> b!274769 (=> (not res!228573) (not e!194651))))

(assert (=> b!274769 (= res!228573 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413077))))

(declare-fun b!274770 () Bool)

(declare-fun lt!413075 () (_ BitVec 64))

(assert (=> b!274770 (= e!194651 (bvsle lt!413077 (bvmul lt!413075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274770 (or (= lt!413075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413075)))))

(assert (=> b!274770 (= lt!413075 ((_ sign_extend 32) (size!6754 (buf!7222 thiss!882))))))

(assert (= (and d!94392 res!228572) b!274769))

(assert (= (and b!274769 res!228573) b!274770))

(declare-fun m!407383 () Bool)

(assert (=> d!94392 m!407383))

(declare-fun m!407385 () Bool)

(assert (=> d!94392 m!407385))

(assert (=> b!274733 d!94392))

(declare-fun d!94398 () Bool)

(declare-fun e!194652 () Bool)

(assert (=> d!94398 e!194652))

(declare-fun res!228574 () Bool)

(assert (=> d!94398 (=> (not res!228574) (not e!194652))))

(declare-fun lt!413084 () (_ BitVec 64))

(declare-fun lt!413079 () (_ BitVec 64))

(declare-fun lt!413083 () (_ BitVec 64))

(assert (=> d!94398 (= res!228574 (= lt!413083 (bvsub lt!413079 lt!413084)))))

(assert (=> d!94398 (or (= (bvand lt!413079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413079 lt!413084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94398 (= lt!413084 (remainingBits!0 ((_ sign_extend 32) (size!6754 (buf!7222 thiss!882))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13358 thiss!882))) ((_ sign_extend 32) (bvsub lt!413027 #b00000000000000000000000000001000))))))

(declare-fun lt!413080 () (_ BitVec 64))

(declare-fun lt!413082 () (_ BitVec 64))

(assert (=> d!94398 (= lt!413079 (bvmul lt!413080 lt!413082))))

(assert (=> d!94398 (or (= lt!413080 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413082 (bvsdiv (bvmul lt!413080 lt!413082) lt!413080)))))

(assert (=> d!94398 (= lt!413082 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94398 (= lt!413080 ((_ sign_extend 32) (size!6754 (buf!7222 thiss!882))))))

(assert (=> d!94398 (= lt!413083 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13358 thiss!882))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvsub lt!413027 #b00000000000000000000000000001000))))))

(assert (=> d!94398 (invariant!0 (bvsub lt!413027 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13358 thiss!882)) (size!6754 (buf!7222 thiss!882)))))

(assert (=> d!94398 (= (bitIndex!0 (size!6754 (buf!7222 thiss!882)) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13358 thiss!882)) (bvsub lt!413027 #b00000000000000000000000000001000)) lt!413083)))

(declare-fun b!274771 () Bool)

(declare-fun res!228575 () Bool)

(assert (=> b!274771 (=> (not res!228575) (not e!194652))))

(assert (=> b!274771 (= res!228575 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413083))))

(declare-fun b!274772 () Bool)

(declare-fun lt!413081 () (_ BitVec 64))

(assert (=> b!274772 (= e!194652 (bvsle lt!413083 (bvmul lt!413081 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274772 (or (= lt!413081 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413081 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413081)))))

(assert (=> b!274772 (= lt!413081 ((_ sign_extend 32) (size!6754 (buf!7222 thiss!882))))))

(assert (= (and d!94398 res!228574) b!274771))

(assert (= (and b!274771 res!228575) b!274772))

(declare-fun m!407387 () Bool)

(assert (=> d!94398 m!407387))

(declare-fun m!407389 () Bool)

(assert (=> d!94398 m!407389))

(assert (=> b!274733 d!94398))

(declare-fun d!94400 () Bool)

(declare-fun res!228582 () Bool)

(declare-fun e!194657 () Bool)

(assert (=> d!94400 (=> (not res!228582) (not e!194657))))

(assert (=> d!94400 (= res!228582 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6754 (buf!7222 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6754 (buf!7222 thiss!882)))))))))

(assert (=> d!94400 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194657)))

(declare-fun b!274780 () Bool)

(declare-fun lt!413099 () (_ BitVec 64))

(assert (=> b!274780 (= e!194657 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413099) (bvsle lt!413099 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6754 (buf!7222 thiss!882)))))))))

(assert (=> b!274780 (= lt!413099 (bvadd (bitIndex!0 (size!6754 (buf!7222 thiss!882)) (currentByte!13358 thiss!882) (currentBit!13353 thiss!882)) diffInBits!15))))

(assert (= (and d!94400 res!228582) b!274780))

(assert (=> b!274780 m!407349))

(assert (=> start!60840 d!94400))

(declare-fun d!94402 () Bool)

(assert (=> d!94402 (= (inv!12 thiss!882) (invariant!0 (currentBit!13353 thiss!882) (currentByte!13358 thiss!882) (size!6754 (buf!7222 thiss!882))))))

(declare-fun bs!23766 () Bool)

(assert (= bs!23766 d!94402))

(assert (=> bs!23766 m!407385))

(assert (=> start!60840 d!94402))

(push 1)

(assert (not b!274780))

(assert (not d!94398))

(assert (not d!94392))

(assert (not d!94402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

