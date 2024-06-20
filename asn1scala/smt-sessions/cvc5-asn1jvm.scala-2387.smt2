; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60946 () Bool)

(assert start!60946)

(declare-fun res!228693 () Bool)

(declare-fun e!194809 () Bool)

(assert (=> start!60946 (=> (not res!228693) (not e!194809))))

(declare-datatypes ((array!15618 0))(
  ( (array!15619 (arr!7753 (Array (_ BitVec 32) (_ BitVec 8))) (size!6766 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12346 0))(
  ( (BitStream!12347 (buf!7234 array!15618) (currentByte!13384 (_ BitVec 32)) (currentBit!13379 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12346)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12346 (_ BitVec 64)) Bool)

(assert (=> start!60946 (= res!228693 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60946 e!194809))

(declare-fun e!194806 () Bool)

(declare-fun inv!12 (BitStream!12346) Bool)

(assert (=> start!60946 (and (inv!12 thiss!882) e!194806)))

(assert (=> start!60946 true))

(declare-fun b!274927 () Bool)

(declare-fun e!194808 () Bool)

(assert (=> b!274927 (= e!194809 e!194808)))

(declare-fun res!228694 () Bool)

(assert (=> b!274927 (=> (not res!228694) (not e!194808))))

(declare-fun lt!413297 () (_ BitVec 32))

(assert (=> b!274927 (= res!228694 (and (bvsge lt!413297 #b00000000000000000000000000000000) (bvslt lt!413297 #b00000000000000000000000000001000)))))

(assert (=> b!274927 (= lt!413297 (bvadd (currentBit!13379 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274928 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274928 (= e!194808 (not (= (bvadd (bitIndex!0 (size!6766 (buf!7234 thiss!882)) (currentByte!13384 thiss!882) (currentBit!13379 thiss!882)) diffInBits!15) (bitIndex!0 (size!6766 (buf!7234 thiss!882)) (bvadd (currentByte!13384 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413297))))))

(declare-fun b!274929 () Bool)

(declare-fun array_inv!6490 (array!15618) Bool)

(assert (=> b!274929 (= e!194806 (array_inv!6490 (buf!7234 thiss!882)))))

(assert (= (and start!60946 res!228693) b!274927))

(assert (= (and b!274927 res!228694) b!274928))

(assert (= start!60946 b!274929))

(declare-fun m!407501 () Bool)

(assert (=> start!60946 m!407501))

(declare-fun m!407503 () Bool)

(assert (=> start!60946 m!407503))

(declare-fun m!407505 () Bool)

(assert (=> b!274928 m!407505))

(declare-fun m!407507 () Bool)

(assert (=> b!274928 m!407507))

(declare-fun m!407509 () Bool)

(assert (=> b!274929 m!407509))

(push 1)

(assert (not b!274928))

(assert (not start!60946))

(assert (not b!274929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94494 () Bool)

(declare-fun e!194836 () Bool)

(assert (=> d!94494 e!194836))

(declare-fun res!228712 () Bool)

(assert (=> d!94494 (=> (not res!228712) (not e!194836))))

(declare-fun lt!413319 () (_ BitVec 64))

(declare-fun lt!413320 () (_ BitVec 64))

(declare-fun lt!413318 () (_ BitVec 64))

(assert (=> d!94494 (= res!228712 (= lt!413318 (bvsub lt!413320 lt!413319)))))

(assert (=> d!94494 (or (= (bvand lt!413320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413319 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413320 lt!413319) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94494 (= lt!413319 (remainingBits!0 ((_ sign_extend 32) (size!6766 (buf!7234 thiss!882))) ((_ sign_extend 32) (currentByte!13384 thiss!882)) ((_ sign_extend 32) (currentBit!13379 thiss!882))))))

(declare-fun lt!413317 () (_ BitVec 64))

(declare-fun lt!413321 () (_ BitVec 64))

(assert (=> d!94494 (= lt!413320 (bvmul lt!413317 lt!413321))))

(assert (=> d!94494 (or (= lt!413317 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413321 (bvsdiv (bvmul lt!413317 lt!413321) lt!413317)))))

(assert (=> d!94494 (= lt!413321 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94494 (= lt!413317 ((_ sign_extend 32) (size!6766 (buf!7234 thiss!882))))))

(assert (=> d!94494 (= lt!413318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13384 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13379 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94494 (invariant!0 (currentBit!13379 thiss!882) (currentByte!13384 thiss!882) (size!6766 (buf!7234 thiss!882)))))

(assert (=> d!94494 (= (bitIndex!0 (size!6766 (buf!7234 thiss!882)) (currentByte!13384 thiss!882) (currentBit!13379 thiss!882)) lt!413318)))

(declare-fun b!274952 () Bool)

(declare-fun res!228711 () Bool)

(assert (=> b!274952 (=> (not res!228711) (not e!194836))))

(assert (=> b!274952 (= res!228711 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413318))))

(declare-fun b!274953 () Bool)

(declare-fun lt!413316 () (_ BitVec 64))

(assert (=> b!274953 (= e!194836 (bvsle lt!413318 (bvmul lt!413316 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274953 (or (= lt!413316 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413316 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413316)))))

(assert (=> b!274953 (= lt!413316 ((_ sign_extend 32) (size!6766 (buf!7234 thiss!882))))))

(assert (= (and d!94494 res!228712) b!274952))

(assert (= (and b!274952 res!228711) b!274953))

(declare-fun m!407531 () Bool)

(assert (=> d!94494 m!407531))

(declare-fun m!407533 () Bool)

(assert (=> d!94494 m!407533))

(assert (=> b!274928 d!94494))

(declare-fun d!94500 () Bool)

(declare-fun e!194837 () Bool)

(assert (=> d!94500 e!194837))

(declare-fun res!228714 () Bool)

(assert (=> d!94500 (=> (not res!228714) (not e!194837))))

(declare-fun lt!413326 () (_ BitVec 64))

(declare-fun lt!413324 () (_ BitVec 64))

(declare-fun lt!413325 () (_ BitVec 64))

(assert (=> d!94500 (= res!228714 (= lt!413324 (bvsub lt!413326 lt!413325)))))

(assert (=> d!94500 (or (= (bvand lt!413326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413326 lt!413325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94500 (= lt!413325 (remainingBits!0 ((_ sign_extend 32) (size!6766 (buf!7234 thiss!882))) ((_ sign_extend 32) (bvadd (currentByte!13384 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 32) lt!413297)))))

(declare-fun lt!413323 () (_ BitVec 64))

(declare-fun lt!413327 () (_ BitVec 64))

(assert (=> d!94500 (= lt!413326 (bvmul lt!413323 lt!413327))))

(assert (=> d!94500 (or (= lt!413323 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413327 (bvsdiv (bvmul lt!413323 lt!413327) lt!413323)))))

(assert (=> d!94500 (= lt!413327 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94500 (= lt!413323 ((_ sign_extend 32) (size!6766 (buf!7234 thiss!882))))))

(assert (=> d!94500 (= lt!413324 (bvadd (bvmul ((_ sign_extend 32) (bvadd (currentByte!13384 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!413297)))))

(assert (=> d!94500 (invariant!0 lt!413297 (bvadd (currentByte!13384 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6766 (buf!7234 thiss!882)))))

(assert (=> d!94500 (= (bitIndex!0 (size!6766 (buf!7234 thiss!882)) (bvadd (currentByte!13384 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413297) lt!413324)))

(declare-fun b!274954 () Bool)

(declare-fun res!228713 () Bool)

(assert (=> b!274954 (=> (not res!228713) (not e!194837))))

(assert (=> b!274954 (= res!228713 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413324))))

(declare-fun b!274955 () Bool)

(declare-fun lt!413322 () (_ BitVec 64))

(assert (=> b!274955 (= e!194837 (bvsle lt!413324 (bvmul lt!413322 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274955 (or (= lt!413322 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413322 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413322)))))

(assert (=> b!274955 (= lt!413322 ((_ sign_extend 32) (size!6766 (buf!7234 thiss!882))))))

(assert (= (and d!94500 res!228714) b!274954))

(assert (= (and b!274954 res!228713) b!274955))

(declare-fun m!407535 () Bool)

(assert (=> d!94500 m!407535))

(declare-fun m!407537 () Bool)

(assert (=> d!94500 m!407537))

(assert (=> b!274928 d!94500))

(declare-fun d!94504 () Bool)

(declare-fun res!228719 () Bool)

(declare-fun e!194842 () Bool)

(assert (=> d!94504 (=> (not res!228719) (not e!194842))))

(assert (=> d!94504 (= res!228719 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6766 (buf!7234 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6766 (buf!7234 thiss!882)))))))))

(assert (=> d!94504 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194842)))

(declare-fun b!274962 () Bool)

(declare-fun lt!413332 () (_ BitVec 64))

(assert (=> b!274962 (= e!194842 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413332) (bvsle lt!413332 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6766 (buf!7234 thiss!882)))))))))

(assert (=> b!274962 (= lt!413332 (bvadd (bitIndex!0 (size!6766 (buf!7234 thiss!882)) (currentByte!13384 thiss!882) (currentBit!13379 thiss!882)) diffInBits!15))))

(assert (= (and d!94504 res!228719) b!274962))

(assert (=> b!274962 m!407505))

(assert (=> start!60946 d!94504))

(declare-fun d!94506 () Bool)

(assert (=> d!94506 (= (inv!12 thiss!882) (invariant!0 (currentBit!13379 thiss!882) (currentByte!13384 thiss!882) (size!6766 (buf!7234 thiss!882))))))

(declare-fun bs!23789 () Bool)

(assert (= bs!23789 d!94506))

(assert (=> bs!23789 m!407533))

(assert (=> start!60946 d!94506))

(declare-fun d!94510 () Bool)

(assert (=> d!94510 (= (array_inv!6490 (buf!7234 thiss!882)) (bvsge (size!6766 (buf!7234 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274929 d!94510))

(push 1)

(assert (not d!94494))

(assert (not d!94500))

(assert (not b!274962))

(assert (not d!94506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

