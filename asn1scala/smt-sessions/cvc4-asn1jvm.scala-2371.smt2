; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60486 () Bool)

(assert start!60486)

(declare-fun res!228117 () Bool)

(declare-fun e!194086 () Bool)

(assert (=> start!60486 (=> (not res!228117) (not e!194086))))

(declare-datatypes ((array!15487 0))(
  ( (array!15488 (arr!7707 (Array (_ BitVec 32) (_ BitVec 8))) (size!6720 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12254 0))(
  ( (BitStream!12255 (buf!7188 array!15487) (currentByte!13271 (_ BitVec 32)) (currentBit!13266 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12254)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12254 (_ BitVec 64)) Bool)

(assert (=> start!60486 (= res!228117 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60486 e!194086))

(declare-fun e!194089 () Bool)

(declare-fun inv!12 (BitStream!12254) Bool)

(assert (=> start!60486 (and (inv!12 thiss!882) e!194089)))

(assert (=> start!60486 true))

(declare-fun b!274174 () Bool)

(declare-fun e!194087 () Bool)

(assert (=> b!274174 (= e!194086 e!194087)))

(declare-fun res!228118 () Bool)

(assert (=> b!274174 (=> (not res!228118) (not e!194087))))

(declare-fun lt!412223 () (_ BitVec 32))

(assert (=> b!274174 (= res!228118 (bvslt (bvadd (currentBit!13266 thiss!882) lt!412223) #b00000000000000000000000000000000))))

(assert (=> b!274174 (= lt!412223 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274175 () Bool)

(assert (=> b!274175 (= e!194087 (not (inv!12 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882))))))))

(declare-fun b!274176 () Bool)

(declare-fun array_inv!6444 (array!15487) Bool)

(assert (=> b!274176 (= e!194089 (array_inv!6444 (buf!7188 thiss!882)))))

(assert (= (and start!60486 res!228117) b!274174))

(assert (= (and b!274174 res!228118) b!274175))

(assert (= start!60486 b!274176))

(declare-fun m!406911 () Bool)

(assert (=> start!60486 m!406911))

(declare-fun m!406913 () Bool)

(assert (=> start!60486 m!406913))

(declare-fun m!406915 () Bool)

(assert (=> b!274175 m!406915))

(declare-fun m!406917 () Bool)

(assert (=> b!274176 m!406917))

(push 1)

(assert (not b!274175))

(assert (not b!274176))

(assert (not start!60486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94042 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94042 (= (inv!12 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) (invariant!0 (currentBit!13266 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) (currentByte!13271 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) (size!6720 (buf!7188 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))))))))

(declare-fun bs!23694 () Bool)

(assert (= bs!23694 d!94042))

(declare-fun m!406931 () Bool)

(assert (=> bs!23694 m!406931))

(assert (=> b!274175 d!94042))

(declare-fun d!94044 () Bool)

(assert (=> d!94044 (= (array_inv!6444 (buf!7188 thiss!882)) (bvsge (size!6720 (buf!7188 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274176 d!94044))

(declare-fun d!94046 () Bool)

(declare-fun res!228127 () Bool)

(declare-fun e!194098 () Bool)

(assert (=> d!94046 (=> (not res!228127) (not e!194098))))

(assert (=> d!94046 (= res!228127 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6720 (buf!7188 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6720 (buf!7188 thiss!882)))))))))

(assert (=> d!94046 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194098)))

(declare-fun b!274188 () Bool)

(declare-fun lt!412232 () (_ BitVec 64))

(assert (=> b!274188 (= e!194098 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412232) (bvsle lt!412232 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6720 (buf!7188 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274188 (= lt!412232 (bvadd (bitIndex!0 (size!6720 (buf!7188 thiss!882)) (currentByte!13271 thiss!882) (currentBit!13266 thiss!882)) diffInBits!15))))

(assert (= (and d!94046 res!228127) b!274188))

(declare-fun m!406933 () Bool)

(assert (=> b!274188 m!406933))

(assert (=> start!60486 d!94046))

(declare-fun d!94048 () Bool)

(assert (=> d!94048 (= (inv!12 thiss!882) (invariant!0 (currentBit!13266 thiss!882) (currentByte!13271 thiss!882) (size!6720 (buf!7188 thiss!882))))))

(declare-fun bs!23695 () Bool)

(assert (= bs!23695 d!94048))

(declare-fun m!406935 () Bool)

(assert (=> bs!23695 m!406935))

(assert (=> start!60486 d!94048))

(push 1)

(assert (not d!94048))

(assert (not d!94042))

(assert (not b!274188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94062 () Bool)

(assert (=> d!94062 (= (invariant!0 (currentBit!13266 thiss!882) (currentByte!13271 thiss!882) (size!6720 (buf!7188 thiss!882))) (and (bvsge (currentBit!13266 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13266 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13271 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13271 thiss!882) (size!6720 (buf!7188 thiss!882))) (and (= (currentBit!13266 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13271 thiss!882) (size!6720 (buf!7188 thiss!882)))))))))

(assert (=> d!94048 d!94062))

(declare-fun d!94064 () Bool)

(assert (=> d!94064 (= (invariant!0 (currentBit!13266 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) (currentByte!13271 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) (size!6720 (buf!7188 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))))) (and (bvsge (currentBit!13266 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) #b00000000000000000000000000000000) (bvslt (currentBit!13266 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) #b00000000000000000000000000001000) (bvsge (currentByte!13271 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13271 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) (size!6720 (buf!7188 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))))) (and (= (currentBit!13266 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) #b00000000000000000000000000000000) (= (currentByte!13271 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882)))) (size!6720 (buf!7188 (BitStream!12255 (buf!7188 thiss!882) (bvsub (bvadd (currentByte!13271 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412223 (currentBit!13266 thiss!882))))))))))))

(assert (=> d!94042 d!94064))

(declare-fun d!94066 () Bool)

(declare-fun e!194107 () Bool)

(assert (=> d!94066 e!194107))

(declare-fun res!228144 () Bool)

(assert (=> d!94066 (=> (not res!228144) (not e!194107))))

(declare-fun lt!412285 () (_ BitVec 64))

(declare-fun lt!412284 () (_ BitVec 64))

(declare-fun lt!412283 () (_ BitVec 64))

(assert (=> d!94066 (= res!228144 (= lt!412283 (bvsub lt!412285 lt!412284)))))

(assert (=> d!94066 (or (= (bvand lt!412285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412284 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412285 lt!412284) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94066 (= lt!412284 (remainingBits!0 ((_ sign_extend 32) (size!6720 (buf!7188 thiss!882))) ((_ sign_extend 32) (currentByte!13271 thiss!882)) ((_ sign_extend 32) (currentBit!13266 thiss!882))))))

(declare-fun lt!412286 () (_ BitVec 64))

(declare-fun lt!412282 () (_ BitVec 64))

(assert (=> d!94066 (= lt!412285 (bvmul lt!412286 lt!412282))))

(assert (=> d!94066 (or (= lt!412286 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412282 (bvsdiv (bvmul lt!412286 lt!412282) lt!412286)))))

(assert (=> d!94066 (= lt!412282 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94066 (= lt!412286 ((_ sign_extend 32) (size!6720 (buf!7188 thiss!882))))))

(assert (=> d!94066 (= lt!412283 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13271 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13266 thiss!882))))))

(assert (=> d!94066 (invariant!0 (currentBit!13266 thiss!882) (currentByte!13271 thiss!882) (size!6720 (buf!7188 thiss!882)))))

(assert (=> d!94066 (= (bitIndex!0 (size!6720 (buf!7188 thiss!882)) (currentByte!13271 thiss!882) (currentBit!13266 thiss!882)) lt!412283)))

(declare-fun b!274205 () Bool)

(declare-fun res!228145 () Bool)

(assert (=> b!274205 (=> (not res!228145) (not e!194107))))

(assert (=> b!274205 (= res!228145 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412283))))

(declare-fun b!274206 () Bool)

(declare-fun lt!412281 () (_ BitVec 64))

(assert (=> b!274206 (= e!194107 (bvsle lt!412283 (bvmul lt!412281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274206 (or (= lt!412281 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412281 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412281)))))

(assert (=> b!274206 (= lt!412281 ((_ sign_extend 32) (size!6720 (buf!7188 thiss!882))))))

(assert (= (and d!94066 res!228144) b!274205))

(assert (= (and b!274205 res!228145) b!274206))

(declare-fun m!406941 () Bool)

(assert (=> d!94066 m!406941))

(assert (=> d!94066 m!406935))

(assert (=> b!274188 d!94066))

(push 1)

(assert (not d!94066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

