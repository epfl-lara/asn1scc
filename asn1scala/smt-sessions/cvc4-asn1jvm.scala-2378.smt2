; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60700 () Bool)

(assert start!60700)

(declare-fun res!228376 () Bool)

(declare-fun e!194405 () Bool)

(assert (=> start!60700 (=> (not res!228376) (not e!194405))))

(declare-datatypes ((array!15547 0))(
  ( (array!15548 (arr!7728 (Array (_ BitVec 32) (_ BitVec 8))) (size!6741 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12296 0))(
  ( (BitStream!12297 (buf!7209 array!15547) (currentByte!13324 (_ BitVec 32)) (currentBit!13319 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12296)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12296 (_ BitVec 64)) Bool)

(assert (=> start!60700 (= res!228376 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60700 e!194405))

(declare-fun e!194406 () Bool)

(declare-fun inv!12 (BitStream!12296) Bool)

(assert (=> start!60700 (and (inv!12 thiss!882) e!194406)))

(assert (=> start!60700 true))

(declare-fun b!274514 () Bool)

(declare-fun lt!412709 () (_ BitVec 32))

(declare-fun lt!412708 () (_ BitVec 32))

(assert (=> b!274514 (= e!194405 (and (bvsge lt!412709 #b00000000000000000000000000000000) (bvsge lt!412709 #b00000000000000000000000000001000) (= (bvand (currentBit!13319 thiss!882) #b10000000000000000000000000000000) (bvand lt!412708 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13319 thiss!882) #b10000000000000000000000000000000) (bvand lt!412709 #b10000000000000000000000000000000)))))))

(assert (=> b!274514 (= lt!412709 (bvadd (currentBit!13319 thiss!882) lt!412708))))

(assert (=> b!274514 (= lt!412708 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274515 () Bool)

(declare-fun array_inv!6465 (array!15547) Bool)

(assert (=> b!274515 (= e!194406 (array_inv!6465 (buf!7209 thiss!882)))))

(assert (= (and start!60700 res!228376) b!274514))

(assert (= start!60700 b!274515))

(declare-fun m!407183 () Bool)

(assert (=> start!60700 m!407183))

(declare-fun m!407185 () Bool)

(assert (=> start!60700 m!407185))

(declare-fun m!407187 () Bool)

(assert (=> b!274515 m!407187))

(push 1)

(assert (not start!60700))

(assert (not b!274515))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94256 () Bool)

(declare-fun res!228385 () Bool)

(declare-fun e!194416 () Bool)

(assert (=> d!94256 (=> (not res!228385) (not e!194416))))

(assert (=> d!94256 (= res!228385 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6741 (buf!7209 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6741 (buf!7209 thiss!882)))))))))

(assert (=> d!94256 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194416)))

(declare-fun b!274527 () Bool)

(declare-fun lt!412718 () (_ BitVec 64))

(assert (=> b!274527 (= e!194416 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412718) (bvsle lt!412718 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6741 (buf!7209 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274527 (= lt!412718 (bvadd (bitIndex!0 (size!6741 (buf!7209 thiss!882)) (currentByte!13324 thiss!882) (currentBit!13319 thiss!882)) diffInBits!15))))

(assert (= (and d!94256 res!228385) b!274527))

(declare-fun m!407197 () Bool)

(assert (=> b!274527 m!407197))

(assert (=> start!60700 d!94256))

(declare-fun d!94260 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94260 (= (inv!12 thiss!882) (invariant!0 (currentBit!13319 thiss!882) (currentByte!13324 thiss!882) (size!6741 (buf!7209 thiss!882))))))

(declare-fun bs!23737 () Bool)

(assert (= bs!23737 d!94260))

(declare-fun m!407199 () Bool)

(assert (=> bs!23737 m!407199))

(assert (=> start!60700 d!94260))

(declare-fun d!94262 () Bool)

(assert (=> d!94262 (= (array_inv!6465 (buf!7209 thiss!882)) (bvsge (size!6741 (buf!7209 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274515 d!94262))

(push 1)

(assert (not d!94260))

(assert (not b!274527))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94272 () Bool)

(assert (=> d!94272 (= (invariant!0 (currentBit!13319 thiss!882) (currentByte!13324 thiss!882) (size!6741 (buf!7209 thiss!882))) (and (bvsge (currentBit!13319 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13319 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13324 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13324 thiss!882) (size!6741 (buf!7209 thiss!882))) (and (= (currentBit!13319 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13324 thiss!882) (size!6741 (buf!7209 thiss!882)))))))))

(assert (=> d!94260 d!94272))

(declare-fun d!94274 () Bool)

(declare-fun e!194422 () Bool)

(assert (=> d!94274 e!194422))

(declare-fun res!228396 () Bool)

(assert (=> d!94274 (=> (not res!228396) (not e!194422))))

(declare-fun lt!412754 () (_ BitVec 64))

(declare-fun lt!412752 () (_ BitVec 64))

(declare-fun lt!412749 () (_ BitVec 64))

(assert (=> d!94274 (= res!228396 (= lt!412754 (bvsub lt!412752 lt!412749)))))

(assert (=> d!94274 (or (= (bvand lt!412752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412752 lt!412749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94274 (= lt!412749 (remainingBits!0 ((_ sign_extend 32) (size!6741 (buf!7209 thiss!882))) ((_ sign_extend 32) (currentByte!13324 thiss!882)) ((_ sign_extend 32) (currentBit!13319 thiss!882))))))

(declare-fun lt!412753 () (_ BitVec 64))

(declare-fun lt!412751 () (_ BitVec 64))

(assert (=> d!94274 (= lt!412752 (bvmul lt!412753 lt!412751))))

(assert (=> d!94274 (or (= lt!412753 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412751 (bvsdiv (bvmul lt!412753 lt!412751) lt!412753)))))

(assert (=> d!94274 (= lt!412751 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94274 (= lt!412753 ((_ sign_extend 32) (size!6741 (buf!7209 thiss!882))))))

(assert (=> d!94274 (= lt!412754 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13324 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13319 thiss!882))))))

(assert (=> d!94274 (invariant!0 (currentBit!13319 thiss!882) (currentByte!13324 thiss!882) (size!6741 (buf!7209 thiss!882)))))

(assert (=> d!94274 (= (bitIndex!0 (size!6741 (buf!7209 thiss!882)) (currentByte!13324 thiss!882) (currentBit!13319 thiss!882)) lt!412754)))

(declare-fun b!274538 () Bool)

(declare-fun res!228397 () Bool)

(assert (=> b!274538 (=> (not res!228397) (not e!194422))))

(assert (=> b!274538 (= res!228397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412754))))

(declare-fun b!274539 () Bool)

(declare-fun lt!412750 () (_ BitVec 64))

(assert (=> b!274539 (= e!194422 (bvsle lt!412754 (bvmul lt!412750 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274539 (or (= lt!412750 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412750 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412750)))))

(assert (=> b!274539 (= lt!412750 ((_ sign_extend 32) (size!6741 (buf!7209 thiss!882))))))

(assert (= (and d!94274 res!228396) b!274538))

(assert (= (and b!274538 res!228397) b!274539))

(declare-fun m!407203 () Bool)

(assert (=> d!94274 m!407203))

(assert (=> d!94274 m!407199))

(assert (=> b!274527 d!94274))

(push 1)

(assert (not d!94274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

