; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60560 () Bool)

(assert start!60560)

(declare-fun res!228195 () Bool)

(declare-fun e!194187 () Bool)

(assert (=> start!60560 (=> (not res!228195) (not e!194187))))

(declare-datatypes ((array!15507 0))(
  ( (array!15508 (arr!7714 (Array (_ BitVec 32) (_ BitVec 8))) (size!6727 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12268 0))(
  ( (BitStream!12269 (buf!7195 array!15507) (currentByte!13290 (_ BitVec 32)) (currentBit!13285 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12268)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12268 (_ BitVec 64)) Bool)

(assert (=> start!60560 (= res!228195 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60560 e!194187))

(declare-fun e!194186 () Bool)

(declare-fun inv!12 (BitStream!12268) Bool)

(assert (=> start!60560 (and (inv!12 thiss!882) e!194186)))

(assert (=> start!60560 true))

(declare-fun b!274279 () Bool)

(declare-fun res!228196 () Bool)

(assert (=> b!274279 (=> (not res!228196) (not e!194187))))

(assert (=> b!274279 (= res!228196 (bvslt (bvadd (currentBit!13285 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000))))

(declare-fun b!274280 () Bool)

(declare-fun lt!412373 () (_ BitVec 64))

(declare-fun lt!412372 () (_ BitVec 64))

(assert (=> b!274280 (= e!194187 (and (= lt!412372 (bvand diffInBits!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!412372 (bvand (bvadd lt!412373 diffInBits!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!274280 (= lt!412372 (bvand lt!412373 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274280 (= lt!412373 (bitIndex!0 (size!6727 (buf!7195 thiss!882)) (currentByte!13290 thiss!882) (currentBit!13285 thiss!882)))))

(declare-fun b!274281 () Bool)

(declare-fun array_inv!6451 (array!15507) Bool)

(assert (=> b!274281 (= e!194186 (array_inv!6451 (buf!7195 thiss!882)))))

(assert (= (and start!60560 res!228195) b!274279))

(assert (= (and b!274279 res!228196) b!274280))

(assert (= start!60560 b!274281))

(declare-fun m!406997 () Bool)

(assert (=> start!60560 m!406997))

(declare-fun m!406999 () Bool)

(assert (=> start!60560 m!406999))

(declare-fun m!407001 () Bool)

(assert (=> b!274280 m!407001))

(declare-fun m!407003 () Bool)

(assert (=> b!274281 m!407003))

(push 1)

(assert (not b!274281))

(assert (not b!274280))

(assert (not start!60560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94106 () Bool)

(assert (=> d!94106 (= (array_inv!6451 (buf!7195 thiss!882)) (bvsge (size!6727 (buf!7195 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274281 d!94106))

(declare-fun d!94108 () Bool)

(declare-fun e!194218 () Bool)

(assert (=> d!94108 e!194218))

(declare-fun res!228225 () Bool)

(assert (=> d!94108 (=> (not res!228225) (not e!194218))))

(declare-fun lt!412424 () (_ BitVec 64))

(declare-fun lt!412425 () (_ BitVec 64))

(declare-fun lt!412422 () (_ BitVec 64))

(assert (=> d!94108 (= res!228225 (= lt!412424 (bvsub lt!412425 lt!412422)))))

(assert (=> d!94108 (or (= (bvand lt!412425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412422 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412425 lt!412422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94108 (= lt!412422 (remainingBits!0 ((_ sign_extend 32) (size!6727 (buf!7195 thiss!882))) ((_ sign_extend 32) (currentByte!13290 thiss!882)) ((_ sign_extend 32) (currentBit!13285 thiss!882))))))

(declare-fun lt!412423 () (_ BitVec 64))

(declare-fun lt!412427 () (_ BitVec 64))

(assert (=> d!94108 (= lt!412425 (bvmul lt!412423 lt!412427))))

(assert (=> d!94108 (or (= lt!412423 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412427 (bvsdiv (bvmul lt!412423 lt!412427) lt!412423)))))

(assert (=> d!94108 (= lt!412427 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94108 (= lt!412423 ((_ sign_extend 32) (size!6727 (buf!7195 thiss!882))))))

(assert (=> d!94108 (= lt!412424 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13290 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13285 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94108 (invariant!0 (currentBit!13285 thiss!882) (currentByte!13290 thiss!882) (size!6727 (buf!7195 thiss!882)))))

(assert (=> d!94108 (= (bitIndex!0 (size!6727 (buf!7195 thiss!882)) (currentByte!13290 thiss!882) (currentBit!13285 thiss!882)) lt!412424)))

(declare-fun b!274318 () Bool)

(declare-fun res!228226 () Bool)

(assert (=> b!274318 (=> (not res!228226) (not e!194218))))

(assert (=> b!274318 (= res!228226 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412424))))

(declare-fun b!274319 () Bool)

(declare-fun lt!412426 () (_ BitVec 64))

(assert (=> b!274319 (= e!194218 (bvsle lt!412424 (bvmul lt!412426 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274319 (or (= lt!412426 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412426 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412426)))))

(assert (=> b!274319 (= lt!412426 ((_ sign_extend 32) (size!6727 (buf!7195 thiss!882))))))

(assert (= (and d!94108 res!228225) b!274318))

(assert (= (and b!274318 res!228226) b!274319))

(declare-fun m!407027 () Bool)

(assert (=> d!94108 m!407027))

(declare-fun m!407029 () Bool)

(assert (=> d!94108 m!407029))

(assert (=> b!274280 d!94108))

(declare-fun d!94124 () Bool)

(declare-fun res!228229 () Bool)

(declare-fun e!194221 () Bool)

(assert (=> d!94124 (=> (not res!228229) (not e!194221))))

(assert (=> d!94124 (= res!228229 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6727 (buf!7195 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6727 (buf!7195 thiss!882)))))))))

(assert (=> d!94124 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194221)))

(declare-fun b!274323 () Bool)

(declare-fun lt!412430 () (_ BitVec 64))

(assert (=> b!274323 (= e!194221 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412430) (bvsle lt!412430 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6727 (buf!7195 thiss!882)))))))))

(assert (=> b!274323 (= lt!412430 (bvadd (bitIndex!0 (size!6727 (buf!7195 thiss!882)) (currentByte!13290 thiss!882) (currentBit!13285 thiss!882)) diffInBits!15))))

(assert (= (and d!94124 res!228229) b!274323))

(assert (=> b!274323 m!407001))

(assert (=> start!60560 d!94124))

(declare-fun d!94126 () Bool)

(assert (=> d!94126 (= (inv!12 thiss!882) (invariant!0 (currentBit!13285 thiss!882) (currentByte!13290 thiss!882) (size!6727 (buf!7195 thiss!882))))))

(declare-fun bs!23710 () Bool)

(assert (= bs!23710 d!94126))

(assert (=> bs!23710 m!407029))

(assert (=> start!60560 d!94126))

(push 1)

(assert (not d!94126))

(assert (not d!94108))

(assert (not b!274323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

