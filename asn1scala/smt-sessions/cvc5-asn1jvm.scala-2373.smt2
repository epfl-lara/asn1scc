; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60524 () Bool)

(assert start!60524)

(declare-fun res!228157 () Bool)

(declare-fun e!194142 () Bool)

(assert (=> start!60524 (=> (not res!228157) (not e!194142))))

(declare-datatypes ((array!15498 0))(
  ( (array!15499 (arr!7711 (Array (_ BitVec 32) (_ BitVec 8))) (size!6724 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12262 0))(
  ( (BitStream!12263 (buf!7192 array!15498) (currentByte!13281 (_ BitVec 32)) (currentBit!13276 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12262)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12262 (_ BitVec 64)) Bool)

(assert (=> start!60524 (= res!228157 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60524 e!194142))

(declare-fun e!194143 () Bool)

(declare-fun inv!12 (BitStream!12262) Bool)

(assert (=> start!60524 (and (inv!12 thiss!882) e!194143)))

(assert (=> start!60524 true))

(declare-fun b!274229 () Bool)

(declare-fun lt!412298 () (_ BitVec 32))

(assert (=> b!274229 (= e!194142 (and (bvslt (bvadd (currentBit!13276 thiss!882) lt!412298) #b00000000000000000000000000000000) (let ((bdg!16587 (bvand (bvadd #b00000000000000000000000000001000 lt!412298) #b10000000000000000000000000000000))) (and (= bdg!16587 (bvand (currentBit!13276 thiss!882) #b10000000000000000000000000000000)) (not (= bdg!16587 (bvand (bvadd #b00000000000000000000000000001000 lt!412298 (currentBit!13276 thiss!882)) #b10000000000000000000000000000000)))))))))

(assert (=> b!274229 (= lt!412298 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274230 () Bool)

(declare-fun array_inv!6448 (array!15498) Bool)

(assert (=> b!274230 (= e!194143 (array_inv!6448 (buf!7192 thiss!882)))))

(assert (= (and start!60524 res!228157) b!274229))

(assert (= start!60524 b!274230))

(declare-fun m!406961 () Bool)

(assert (=> start!60524 m!406961))

(declare-fun m!406963 () Bool)

(assert (=> start!60524 m!406963))

(declare-fun m!406965 () Bool)

(assert (=> b!274230 m!406965))

(push 1)

(assert (not b!274230))

(assert (not start!60524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94078 () Bool)

(assert (=> d!94078 (= (array_inv!6448 (buf!7192 thiss!882)) (bvsge (size!6724 (buf!7192 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274230 d!94078))

(declare-fun d!94080 () Bool)

(declare-fun res!228169 () Bool)

(declare-fun e!194167 () Bool)

(assert (=> d!94080 (=> (not res!228169) (not e!194167))))

(assert (=> d!94080 (= res!228169 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6724 (buf!7192 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6724 (buf!7192 thiss!882)))))))))

(assert (=> d!94080 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194167)))

(declare-fun b!274250 () Bool)

(declare-fun lt!412310 () (_ BitVec 64))

(assert (=> b!274250 (= e!194167 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412310) (bvsle lt!412310 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6724 (buf!7192 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274250 (= lt!412310 (bvadd (bitIndex!0 (size!6724 (buf!7192 thiss!882)) (currentByte!13281 thiss!882) (currentBit!13276 thiss!882)) diffInBits!15))))

(assert (= (and d!94080 res!228169) b!274250))

(declare-fun m!406983 () Bool)

(assert (=> b!274250 m!406983))

(assert (=> start!60524 d!94080))

(declare-fun d!94084 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94084 (= (inv!12 thiss!882) (invariant!0 (currentBit!13276 thiss!882) (currentByte!13281 thiss!882) (size!6724 (buf!7192 thiss!882))))))

(declare-fun bs!23703 () Bool)

(assert (= bs!23703 d!94084))

(declare-fun m!406985 () Bool)

(assert (=> bs!23703 m!406985))

(assert (=> start!60524 d!94084))

(push 1)

(assert (not d!94084))

(assert (not b!274250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94094 () Bool)

(assert (=> d!94094 (= (invariant!0 (currentBit!13276 thiss!882) (currentByte!13281 thiss!882) (size!6724 (buf!7192 thiss!882))) (and (bvsge (currentBit!13276 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13276 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13281 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13281 thiss!882) (size!6724 (buf!7192 thiss!882))) (and (= (currentBit!13276 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13281 thiss!882) (size!6724 (buf!7192 thiss!882)))))))))

(assert (=> d!94084 d!94094))

(declare-fun d!94096 () Bool)

(declare-fun e!194176 () Bool)

(assert (=> d!94096 e!194176))

(declare-fun res!228183 () Bool)

(assert (=> d!94096 (=> (not res!228183) (not e!194176))))

(declare-fun lt!412347 () (_ BitVec 64))

(declare-fun lt!412346 () (_ BitVec 64))

(declare-fun lt!412349 () (_ BitVec 64))

(assert (=> d!94096 (= res!228183 (= lt!412349 (bvsub lt!412347 lt!412346)))))

(assert (=> d!94096 (or (= (bvand lt!412347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412346 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412347 lt!412346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94096 (= lt!412346 (remainingBits!0 ((_ sign_extend 32) (size!6724 (buf!7192 thiss!882))) ((_ sign_extend 32) (currentByte!13281 thiss!882)) ((_ sign_extend 32) (currentBit!13276 thiss!882))))))

(declare-fun lt!412345 () (_ BitVec 64))

(declare-fun lt!412344 () (_ BitVec 64))

(assert (=> d!94096 (= lt!412347 (bvmul lt!412345 lt!412344))))

(assert (=> d!94096 (or (= lt!412345 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412344 (bvsdiv (bvmul lt!412345 lt!412344) lt!412345)))))

(assert (=> d!94096 (= lt!412344 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94096 (= lt!412345 ((_ sign_extend 32) (size!6724 (buf!7192 thiss!882))))))

(assert (=> d!94096 (= lt!412349 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13281 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13276 thiss!882))))))

(assert (=> d!94096 (invariant!0 (currentBit!13276 thiss!882) (currentByte!13281 thiss!882) (size!6724 (buf!7192 thiss!882)))))

(assert (=> d!94096 (= (bitIndex!0 (size!6724 (buf!7192 thiss!882)) (currentByte!13281 thiss!882) (currentBit!13276 thiss!882)) lt!412349)))

(declare-fun b!274265 () Bool)

(declare-fun res!228184 () Bool)

(assert (=> b!274265 (=> (not res!228184) (not e!194176))))

(assert (=> b!274265 (= res!228184 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412349))))

(declare-fun b!274266 () Bool)

(declare-fun lt!412348 () (_ BitVec 64))

(assert (=> b!274266 (= e!194176 (bvsle lt!412349 (bvmul lt!412348 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274266 (or (= lt!412348 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412348 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412348)))))

(assert (=> b!274266 (= lt!412348 ((_ sign_extend 32) (size!6724 (buf!7192 thiss!882))))))

(assert (= (and d!94096 res!228183) b!274265))

(assert (= (and b!274265 res!228184) b!274266))

(declare-fun m!406993 () Bool)

(assert (=> d!94096 m!406993))

(assert (=> d!94096 m!406985))

(assert (=> b!274250 d!94096))

(push 1)

(assert (not d!94096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

