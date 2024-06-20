; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60528 () Bool)

(assert start!60528)

(declare-fun res!228163 () Bool)

(declare-fun e!194160 () Bool)

(assert (=> start!60528 (=> (not res!228163) (not e!194160))))

(declare-datatypes ((array!15502 0))(
  ( (array!15503 (arr!7713 (Array (_ BitVec 32) (_ BitVec 8))) (size!6726 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12266 0))(
  ( (BitStream!12267 (buf!7194 array!15502) (currentByte!13283 (_ BitVec 32)) (currentBit!13278 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12266)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12266 (_ BitVec 64)) Bool)

(assert (=> start!60528 (= res!228163 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60528 e!194160))

(declare-fun e!194161 () Bool)

(declare-fun inv!12 (BitStream!12266) Bool)

(assert (=> start!60528 (and (inv!12 thiss!882) e!194161)))

(assert (=> start!60528 true))

(declare-fun b!274241 () Bool)

(declare-fun lt!412304 () (_ BitVec 32))

(assert (=> b!274241 (= e!194160 (and (bvslt (bvadd (currentBit!13278 thiss!882) lt!412304) #b00000000000000000000000000000000) (let ((bdg!16587 (bvand (bvadd #b00000000000000000000000000001000 lt!412304) #b10000000000000000000000000000000))) (and (= bdg!16587 (bvand (currentBit!13278 thiss!882) #b10000000000000000000000000000000)) (not (= bdg!16587 (bvand (bvadd #b00000000000000000000000000001000 lt!412304 (currentBit!13278 thiss!882)) #b10000000000000000000000000000000)))))))))

(assert (=> b!274241 (= lt!412304 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274242 () Bool)

(declare-fun array_inv!6450 (array!15502) Bool)

(assert (=> b!274242 (= e!194161 (array_inv!6450 (buf!7194 thiss!882)))))

(assert (= (and start!60528 res!228163) b!274241))

(assert (= start!60528 b!274242))

(declare-fun m!406973 () Bool)

(assert (=> start!60528 m!406973))

(declare-fun m!406975 () Bool)

(assert (=> start!60528 m!406975))

(declare-fun m!406977 () Bool)

(assert (=> b!274242 m!406977))

(push 1)

(assert (not start!60528))

(assert (not b!274242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94082 () Bool)

(declare-fun res!228172 () Bool)

(declare-fun e!194170 () Bool)

(assert (=> d!94082 (=> (not res!228172) (not e!194170))))

(assert (=> d!94082 (= res!228172 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6726 (buf!7194 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6726 (buf!7194 thiss!882)))))))))

(assert (=> d!94082 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194170)))

(declare-fun b!274254 () Bool)

(declare-fun lt!412313 () (_ BitVec 64))

(assert (=> b!274254 (= e!194170 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412313) (bvsle lt!412313 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6726 (buf!7194 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274254 (= lt!412313 (bvadd (bitIndex!0 (size!6726 (buf!7194 thiss!882)) (currentByte!13283 thiss!882) (currentBit!13278 thiss!882)) diffInBits!15))))

(assert (= (and d!94082 res!228172) b!274254))

(declare-fun m!406987 () Bool)

(assert (=> b!274254 m!406987))

(assert (=> start!60528 d!94082))

(declare-fun d!94088 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94088 (= (inv!12 thiss!882) (invariant!0 (currentBit!13278 thiss!882) (currentByte!13283 thiss!882) (size!6726 (buf!7194 thiss!882))))))

(declare-fun bs!23704 () Bool)

(assert (= bs!23704 d!94088))

(declare-fun m!406989 () Bool)

(assert (=> bs!23704 m!406989))

(assert (=> start!60528 d!94088))

(declare-fun d!94090 () Bool)

(assert (=> d!94090 (= (array_inv!6450 (buf!7194 thiss!882)) (bvsge (size!6726 (buf!7194 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274242 d!94090))

(push 1)

(assert (not d!94088))

(assert (not b!274254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94098 () Bool)

(assert (=> d!94098 (= (invariant!0 (currentBit!13278 thiss!882) (currentByte!13283 thiss!882) (size!6726 (buf!7194 thiss!882))) (and (bvsge (currentBit!13278 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13278 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13283 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13283 thiss!882) (size!6726 (buf!7194 thiss!882))) (and (= (currentBit!13278 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13283 thiss!882) (size!6726 (buf!7194 thiss!882)))))))))

(assert (=> d!94088 d!94098))

(declare-fun d!94100 () Bool)

(declare-fun e!194179 () Bool)

(assert (=> d!94100 e!194179))

(declare-fun res!228189 () Bool)

(assert (=> d!94100 (=> (not res!228189) (not e!194179))))

(declare-fun lt!412363 () (_ BitVec 64))

(declare-fun lt!412365 () (_ BitVec 64))

(declare-fun lt!412364 () (_ BitVec 64))

(assert (=> d!94100 (= res!228189 (= lt!412365 (bvsub lt!412363 lt!412364)))))

(assert (=> d!94100 (or (= (bvand lt!412363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412364 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412363 lt!412364) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94100 (= lt!412364 (remainingBits!0 ((_ sign_extend 32) (size!6726 (buf!7194 thiss!882))) ((_ sign_extend 32) (currentByte!13283 thiss!882)) ((_ sign_extend 32) (currentBit!13278 thiss!882))))))

(declare-fun lt!412366 () (_ BitVec 64))

(declare-fun lt!412362 () (_ BitVec 64))

(assert (=> d!94100 (= lt!412363 (bvmul lt!412366 lt!412362))))

(assert (=> d!94100 (or (= lt!412366 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412362 (bvsdiv (bvmul lt!412366 lt!412362) lt!412366)))))

(assert (=> d!94100 (= lt!412362 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94100 (= lt!412366 ((_ sign_extend 32) (size!6726 (buf!7194 thiss!882))))))

(assert (=> d!94100 (= lt!412365 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13283 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13278 thiss!882))))))

(assert (=> d!94100 (invariant!0 (currentBit!13278 thiss!882) (currentByte!13283 thiss!882) (size!6726 (buf!7194 thiss!882)))))

(assert (=> d!94100 (= (bitIndex!0 (size!6726 (buf!7194 thiss!882)) (currentByte!13283 thiss!882) (currentBit!13278 thiss!882)) lt!412365)))

(declare-fun b!274271 () Bool)

(declare-fun res!228190 () Bool)

(assert (=> b!274271 (=> (not res!228190) (not e!194179))))

(assert (=> b!274271 (= res!228190 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412365))))

(declare-fun b!274272 () Bool)

(declare-fun lt!412367 () (_ BitVec 64))

(assert (=> b!274272 (= e!194179 (bvsle lt!412365 (bvmul lt!412367 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274272 (or (= lt!412367 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412367 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412367)))))

(assert (=> b!274272 (= lt!412367 ((_ sign_extend 32) (size!6726 (buf!7194 thiss!882))))))

(assert (= (and d!94100 res!228189) b!274271))

(assert (= (and b!274271 res!228190) b!274272))

(declare-fun m!406995 () Bool)

(assert (=> d!94100 m!406995))

(assert (=> d!94100 m!406989))

(assert (=> b!274254 d!94100))

(push 1)

(assert (not d!94100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

