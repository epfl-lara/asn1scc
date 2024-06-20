; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60482 () Bool)

(assert start!60482)

(declare-fun res!228105 () Bool)

(declare-fun e!194065 () Bool)

(assert (=> start!60482 (=> (not res!228105) (not e!194065))))

(declare-datatypes ((array!15483 0))(
  ( (array!15484 (arr!7705 (Array (_ BitVec 32) (_ BitVec 8))) (size!6718 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12250 0))(
  ( (BitStream!12251 (buf!7186 array!15483) (currentByte!13269 (_ BitVec 32)) (currentBit!13264 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12250)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12250 (_ BitVec 64)) Bool)

(assert (=> start!60482 (= res!228105 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60482 e!194065))

(declare-fun e!194064 () Bool)

(declare-fun inv!12 (BitStream!12250) Bool)

(assert (=> start!60482 (and (inv!12 thiss!882) e!194064)))

(assert (=> start!60482 true))

(declare-fun b!274156 () Bool)

(declare-fun e!194062 () Bool)

(assert (=> b!274156 (= e!194065 e!194062)))

(declare-fun res!228106 () Bool)

(assert (=> b!274156 (=> (not res!228106) (not e!194062))))

(declare-fun lt!412217 () (_ BitVec 32))

(assert (=> b!274156 (= res!228106 (bvslt (bvadd (currentBit!13264 thiss!882) lt!412217) #b00000000000000000000000000000000))))

(assert (=> b!274156 (= lt!412217 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274157 () Bool)

(assert (=> b!274157 (= e!194062 (not (inv!12 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882))))))))

(declare-fun b!274158 () Bool)

(declare-fun array_inv!6442 (array!15483) Bool)

(assert (=> b!274158 (= e!194064 (array_inv!6442 (buf!7186 thiss!882)))))

(assert (= (and start!60482 res!228105) b!274156))

(assert (= (and b!274156 res!228106) b!274157))

(assert (= start!60482 b!274158))

(declare-fun m!406895 () Bool)

(assert (=> start!60482 m!406895))

(declare-fun m!406897 () Bool)

(assert (=> start!60482 m!406897))

(declare-fun m!406899 () Bool)

(assert (=> b!274157 m!406899))

(declare-fun m!406901 () Bool)

(assert (=> b!274158 m!406901))

(push 1)

(assert (not b!274157))

(assert (not b!274158))

(assert (not start!60482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94028 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94028 (= (inv!12 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) (invariant!0 (currentBit!13264 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) (currentByte!13269 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) (size!6718 (buf!7186 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))))))))

(declare-fun bs!23690 () Bool)

(assert (= bs!23690 d!94028))

(declare-fun m!406919 () Bool)

(assert (=> bs!23690 m!406919))

(assert (=> b!274157 d!94028))

(declare-fun d!94030 () Bool)

(assert (=> d!94030 (= (array_inv!6442 (buf!7186 thiss!882)) (bvsge (size!6718 (buf!7186 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274158 d!94030))

(declare-fun d!94032 () Bool)

(declare-fun res!228124 () Bool)

(declare-fun e!194095 () Bool)

(assert (=> d!94032 (=> (not res!228124) (not e!194095))))

(assert (=> d!94032 (= res!228124 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6718 (buf!7186 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6718 (buf!7186 thiss!882)))))))))

(assert (=> d!94032 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194095)))

(declare-fun b!274184 () Bool)

(declare-fun lt!412229 () (_ BitVec 64))

(assert (=> b!274184 (= e!194095 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412229) (bvsle lt!412229 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6718 (buf!7186 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274184 (= lt!412229 (bvadd (bitIndex!0 (size!6718 (buf!7186 thiss!882)) (currentByte!13269 thiss!882) (currentBit!13264 thiss!882)) diffInBits!15))))

(assert (= (and d!94032 res!228124) b!274184))

(declare-fun m!406927 () Bool)

(assert (=> b!274184 m!406927))

(assert (=> start!60482 d!94032))

(declare-fun d!94040 () Bool)

(assert (=> d!94040 (= (inv!12 thiss!882) (invariant!0 (currentBit!13264 thiss!882) (currentByte!13269 thiss!882) (size!6718 (buf!7186 thiss!882))))))

(declare-fun bs!23693 () Bool)

(assert (= bs!23693 d!94040))

(declare-fun m!406929 () Bool)

(assert (=> bs!23693 m!406929))

(assert (=> start!60482 d!94040))

(push 1)

(assert (not d!94040))

(assert (not d!94028))

(assert (not b!274184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94056 () Bool)

(assert (=> d!94056 (= (invariant!0 (currentBit!13264 thiss!882) (currentByte!13269 thiss!882) (size!6718 (buf!7186 thiss!882))) (and (bvsge (currentBit!13264 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13264 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13269 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13269 thiss!882) (size!6718 (buf!7186 thiss!882))) (and (= (currentBit!13264 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13269 thiss!882) (size!6718 (buf!7186 thiss!882)))))))))

(assert (=> d!94040 d!94056))

(declare-fun d!94058 () Bool)

(assert (=> d!94058 (= (invariant!0 (currentBit!13264 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) (currentByte!13269 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) (size!6718 (buf!7186 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))))) (and (bvsge (currentBit!13264 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) #b00000000000000000000000000000000) (bvslt (currentBit!13264 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) #b00000000000000000000000000001000) (bvsge (currentByte!13269 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13269 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) (size!6718 (buf!7186 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))))) (and (= (currentBit!13264 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) #b00000000000000000000000000000000) (= (currentByte!13269 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882)))) (size!6718 (buf!7186 (BitStream!12251 (buf!7186 thiss!882) (bvsub (bvadd (currentByte!13269 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412217 (currentBit!13264 thiss!882))))))))))))

(assert (=> d!94028 d!94058))

(declare-fun d!94060 () Bool)

(declare-fun e!194104 () Bool)

(assert (=> d!94060 e!194104))

(declare-fun res!228139 () Bool)

(assert (=> d!94060 (=> (not res!228139) (not e!194104))))

(declare-fun lt!412266 () (_ BitVec 64))

(declare-fun lt!412263 () (_ BitVec 64))

(declare-fun lt!412268 () (_ BitVec 64))

(assert (=> d!94060 (= res!228139 (= lt!412268 (bvsub lt!412266 lt!412263)))))

(assert (=> d!94060 (or (= (bvand lt!412266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412266 lt!412263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94060 (= lt!412263 (remainingBits!0 ((_ sign_extend 32) (size!6718 (buf!7186 thiss!882))) ((_ sign_extend 32) (currentByte!13269 thiss!882)) ((_ sign_extend 32) (currentBit!13264 thiss!882))))))

(declare-fun lt!412267 () (_ BitVec 64))

(declare-fun lt!412264 () (_ BitVec 64))

(assert (=> d!94060 (= lt!412266 (bvmul lt!412267 lt!412264))))

(assert (=> d!94060 (or (= lt!412267 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412264 (bvsdiv (bvmul lt!412267 lt!412264) lt!412267)))))

(assert (=> d!94060 (= lt!412264 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94060 (= lt!412267 ((_ sign_extend 32) (size!6718 (buf!7186 thiss!882))))))

(assert (=> d!94060 (= lt!412268 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13269 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13264 thiss!882))))))

(assert (=> d!94060 (invariant!0 (currentBit!13264 thiss!882) (currentByte!13269 thiss!882) (size!6718 (buf!7186 thiss!882)))))

(assert (=> d!94060 (= (bitIndex!0 (size!6718 (buf!7186 thiss!882)) (currentByte!13269 thiss!882) (currentBit!13264 thiss!882)) lt!412268)))

(declare-fun b!274199 () Bool)

(declare-fun res!228138 () Bool)

(assert (=> b!274199 (=> (not res!228138) (not e!194104))))

(assert (=> b!274199 (= res!228138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412268))))

(declare-fun b!274200 () Bool)

(declare-fun lt!412265 () (_ BitVec 64))

(assert (=> b!274200 (= e!194104 (bvsle lt!412268 (bvmul lt!412265 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274200 (or (= lt!412265 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412265 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412265)))))

(assert (=> b!274200 (= lt!412265 ((_ sign_extend 32) (size!6718 (buf!7186 thiss!882))))))

(assert (= (and d!94060 res!228139) b!274199))

(assert (= (and b!274199 res!228138) b!274200))

(declare-fun m!406939 () Bool)

(assert (=> d!94060 m!406939))

(assert (=> d!94060 m!406929))

(assert (=> b!274184 d!94060))

(push 1)

(assert (not d!94060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

