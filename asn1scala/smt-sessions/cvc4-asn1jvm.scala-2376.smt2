; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60628 () Bool)

(assert start!60628)

(declare-fun res!228295 () Bool)

(declare-fun e!194307 () Bool)

(assert (=> start!60628 (=> (not res!228295) (not e!194307))))

(declare-datatypes ((array!15529 0))(
  ( (array!15530 (arr!7722 (Array (_ BitVec 32) (_ BitVec 8))) (size!6735 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12284 0))(
  ( (BitStream!12285 (buf!7203 array!15529) (currentByte!13306 (_ BitVec 32)) (currentBit!13301 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12284)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12284 (_ BitVec 64)) Bool)

(assert (=> start!60628 (= res!228295 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60628 e!194307))

(declare-fun e!194308 () Bool)

(declare-fun inv!12 (BitStream!12284) Bool)

(assert (=> start!60628 (and (inv!12 thiss!882) e!194308)))

(assert (=> start!60628 true))

(declare-fun b!274409 () Bool)

(declare-fun lt!412555 () (_ BitVec 32))

(declare-fun lt!412556 () (_ BitVec 32))

(assert (=> b!274409 (= e!194307 (and (bvsge lt!412555 #b00000000000000000000000000000000) (= (bvand (currentBit!13301 thiss!882) #b10000000000000000000000000000000) (bvand lt!412556 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13301 thiss!882) #b10000000000000000000000000000000) (bvand lt!412555 #b10000000000000000000000000000000)))))))

(assert (=> b!274409 (= lt!412555 (bvadd (currentBit!13301 thiss!882) lt!412556))))

(assert (=> b!274409 (= lt!412556 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274410 () Bool)

(declare-fun array_inv!6459 (array!15529) Bool)

(assert (=> b!274410 (= e!194308 (array_inv!6459 (buf!7203 thiss!882)))))

(assert (= (and start!60628 res!228295) b!274409))

(assert (= start!60628 b!274410))

(declare-fun m!407099 () Bool)

(assert (=> start!60628 m!407099))

(declare-fun m!407101 () Bool)

(assert (=> start!60628 m!407101))

(declare-fun m!407103 () Bool)

(assert (=> b!274410 m!407103))

(push 1)

(assert (not start!60628))

(assert (not b!274410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94178 () Bool)

(declare-fun res!228304 () Bool)

(declare-fun e!194317 () Bool)

(assert (=> d!94178 (=> (not res!228304) (not e!194317))))

(assert (=> d!94178 (= res!228304 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6735 (buf!7203 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6735 (buf!7203 thiss!882)))))))))

(assert (=> d!94178 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194317)))

(declare-fun b!274422 () Bool)

(declare-fun lt!412565 () (_ BitVec 64))

(assert (=> b!274422 (= e!194317 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412565) (bvsle lt!412565 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6735 (buf!7203 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274422 (= lt!412565 (bvadd (bitIndex!0 (size!6735 (buf!7203 thiss!882)) (currentByte!13306 thiss!882) (currentBit!13301 thiss!882)) diffInBits!15))))

(assert (= (and d!94178 res!228304) b!274422))

(declare-fun m!407113 () Bool)

(assert (=> b!274422 m!407113))

(assert (=> start!60628 d!94178))

(declare-fun d!94184 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94184 (= (inv!12 thiss!882) (invariant!0 (currentBit!13301 thiss!882) (currentByte!13306 thiss!882) (size!6735 (buf!7203 thiss!882))))))

(declare-fun bs!23722 () Bool)

(assert (= bs!23722 d!94184))

(declare-fun m!407115 () Bool)

(assert (=> bs!23722 m!407115))

(assert (=> start!60628 d!94184))

(declare-fun d!94186 () Bool)

(assert (=> d!94186 (= (array_inv!6459 (buf!7203 thiss!882)) (bvsge (size!6735 (buf!7203 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274410 d!94186))

(push 1)

(assert (not d!94184))

(assert (not b!274422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94196 () Bool)

(assert (=> d!94196 (= (invariant!0 (currentBit!13301 thiss!882) (currentByte!13306 thiss!882) (size!6735 (buf!7203 thiss!882))) (and (bvsge (currentBit!13301 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13301 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13306 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13306 thiss!882) (size!6735 (buf!7203 thiss!882))) (and (= (currentBit!13301 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13306 thiss!882) (size!6735 (buf!7203 thiss!882)))))))))

(assert (=> d!94184 d!94196))

(declare-fun d!94198 () Bool)

(declare-fun e!194325 () Bool)

(assert (=> d!94198 e!194325))

(declare-fun res!228319 () Bool)

(assert (=> d!94198 (=> (not res!228319) (not e!194325))))

(declare-fun lt!412610 () (_ BitVec 64))

(declare-fun lt!412611 () (_ BitVec 64))

(declare-fun lt!412613 () (_ BitVec 64))

(assert (=> d!94198 (= res!228319 (= lt!412610 (bvsub lt!412613 lt!412611)))))

(assert (=> d!94198 (or (= (bvand lt!412613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412613 lt!412611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94198 (= lt!412611 (remainingBits!0 ((_ sign_extend 32) (size!6735 (buf!7203 thiss!882))) ((_ sign_extend 32) (currentByte!13306 thiss!882)) ((_ sign_extend 32) (currentBit!13301 thiss!882))))))

(declare-fun lt!412612 () (_ BitVec 64))

(declare-fun lt!412609 () (_ BitVec 64))

(assert (=> d!94198 (= lt!412613 (bvmul lt!412612 lt!412609))))

(assert (=> d!94198 (or (= lt!412612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412609 (bvsdiv (bvmul lt!412612 lt!412609) lt!412612)))))

(assert (=> d!94198 (= lt!412609 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94198 (= lt!412612 ((_ sign_extend 32) (size!6735 (buf!7203 thiss!882))))))

(assert (=> d!94198 (= lt!412610 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13306 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13301 thiss!882))))))

(assert (=> d!94198 (invariant!0 (currentBit!13301 thiss!882) (currentByte!13306 thiss!882) (size!6735 (buf!7203 thiss!882)))))

(assert (=> d!94198 (= (bitIndex!0 (size!6735 (buf!7203 thiss!882)) (currentByte!13306 thiss!882) (currentBit!13301 thiss!882)) lt!412610)))

(declare-fun b!274437 () Bool)

(declare-fun res!228320 () Bool)

(assert (=> b!274437 (=> (not res!228320) (not e!194325))))

(assert (=> b!274437 (= res!228320 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412610))))

(declare-fun b!274438 () Bool)

(declare-fun lt!412608 () (_ BitVec 64))

(assert (=> b!274438 (= e!194325 (bvsle lt!412610 (bvmul lt!412608 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274438 (or (= lt!412608 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412608 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412608)))))

(assert (=> b!274438 (= lt!412608 ((_ sign_extend 32) (size!6735 (buf!7203 thiss!882))))))

(assert (= (and d!94198 res!228319) b!274437))

(assert (= (and b!274437 res!228320) b!274438))

(declare-fun m!407119 () Bool)

(assert (=> d!94198 m!407119))

(assert (=> d!94198 m!407115))

(assert (=> b!274422 d!94198))

(push 1)

(assert (not d!94198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

