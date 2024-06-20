; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60626 () Bool)

(assert start!60626)

(declare-fun res!228292 () Bool)

(declare-fun e!194297 () Bool)

(assert (=> start!60626 (=> (not res!228292) (not e!194297))))

(declare-datatypes ((array!15527 0))(
  ( (array!15528 (arr!7721 (Array (_ BitVec 32) (_ BitVec 8))) (size!6734 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12282 0))(
  ( (BitStream!12283 (buf!7202 array!15527) (currentByte!13305 (_ BitVec 32)) (currentBit!13300 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12282)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12282 (_ BitVec 64)) Bool)

(assert (=> start!60626 (= res!228292 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60626 e!194297))

(declare-fun e!194299 () Bool)

(declare-fun inv!12 (BitStream!12282) Bool)

(assert (=> start!60626 (and (inv!12 thiss!882) e!194299)))

(assert (=> start!60626 true))

(declare-fun b!274403 () Bool)

(declare-fun lt!412549 () (_ BitVec 32))

(declare-fun lt!412550 () (_ BitVec 32))

(assert (=> b!274403 (= e!194297 (and (bvsge lt!412550 #b00000000000000000000000000000000) (= (bvand (currentBit!13300 thiss!882) #b10000000000000000000000000000000) (bvand lt!412549 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13300 thiss!882) #b10000000000000000000000000000000) (bvand lt!412550 #b10000000000000000000000000000000)))))))

(assert (=> b!274403 (= lt!412550 (bvadd (currentBit!13300 thiss!882) lt!412549))))

(assert (=> b!274403 (= lt!412549 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274404 () Bool)

(declare-fun array_inv!6458 (array!15527) Bool)

(assert (=> b!274404 (= e!194299 (array_inv!6458 (buf!7202 thiss!882)))))

(assert (= (and start!60626 res!228292) b!274403))

(assert (= start!60626 b!274404))

(declare-fun m!407093 () Bool)

(assert (=> start!60626 m!407093))

(declare-fun m!407095 () Bool)

(assert (=> start!60626 m!407095))

(declare-fun m!407097 () Bool)

(assert (=> b!274404 m!407097))

(check-sat (not start!60626) (not b!274404))
(check-sat)
(get-model)

(declare-fun d!94170 () Bool)

(declare-fun res!228298 () Bool)

(declare-fun e!194311 () Bool)

(assert (=> d!94170 (=> (not res!228298) (not e!194311))))

(assert (=> d!94170 (= res!228298 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6734 (buf!7202 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6734 (buf!7202 thiss!882)))))))))

(assert (=> d!94170 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194311)))

(declare-fun b!274414 () Bool)

(declare-fun lt!412559 () (_ BitVec 64))

(assert (=> b!274414 (= e!194311 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412559) (bvsle lt!412559 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6734 (buf!7202 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274414 (= lt!412559 (bvadd (bitIndex!0 (size!6734 (buf!7202 thiss!882)) (currentByte!13305 thiss!882) (currentBit!13300 thiss!882)) diffInBits!15))))

(assert (= (and d!94170 res!228298) b!274414))

(declare-fun m!407105 () Bool)

(assert (=> b!274414 m!407105))

(assert (=> start!60626 d!94170))

(declare-fun d!94174 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94174 (= (inv!12 thiss!882) (invariant!0 (currentBit!13300 thiss!882) (currentByte!13305 thiss!882) (size!6734 (buf!7202 thiss!882))))))

(declare-fun bs!23720 () Bool)

(assert (= bs!23720 d!94174))

(declare-fun m!407107 () Bool)

(assert (=> bs!23720 m!407107))

(assert (=> start!60626 d!94174))

(declare-fun d!94176 () Bool)

(assert (=> d!94176 (= (array_inv!6458 (buf!7202 thiss!882)) (bvsge (size!6734 (buf!7202 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274404 d!94176))

(check-sat (not d!94174) (not b!274414))
(check-sat)
(get-model)

(declare-fun d!94188 () Bool)

(assert (=> d!94188 (= (invariant!0 (currentBit!13300 thiss!882) (currentByte!13305 thiss!882) (size!6734 (buf!7202 thiss!882))) (and (bvsge (currentBit!13300 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13300 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13305 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13305 thiss!882) (size!6734 (buf!7202 thiss!882))) (and (= (currentBit!13300 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13305 thiss!882) (size!6734 (buf!7202 thiss!882)))))))))

(assert (=> d!94174 d!94188))

(declare-fun d!94190 () Bool)

(declare-fun e!194320 () Bool)

(assert (=> d!94190 e!194320))

(declare-fun res!228310 () Bool)

(assert (=> d!94190 (=> (not res!228310) (not e!194320))))

(declare-fun lt!412579 () (_ BitVec 64))

(declare-fun lt!412578 () (_ BitVec 64))

(declare-fun lt!412580 () (_ BitVec 64))

(assert (=> d!94190 (= res!228310 (= lt!412580 (bvsub lt!412578 lt!412579)))))

(assert (=> d!94190 (or (= (bvand lt!412578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412578 lt!412579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94190 (= lt!412579 (remainingBits!0 ((_ sign_extend 32) (size!6734 (buf!7202 thiss!882))) ((_ sign_extend 32) (currentByte!13305 thiss!882)) ((_ sign_extend 32) (currentBit!13300 thiss!882))))))

(declare-fun lt!412583 () (_ BitVec 64))

(declare-fun lt!412582 () (_ BitVec 64))

(assert (=> d!94190 (= lt!412578 (bvmul lt!412583 lt!412582))))

(assert (=> d!94190 (or (= lt!412583 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412582 (bvsdiv (bvmul lt!412583 lt!412582) lt!412583)))))

(assert (=> d!94190 (= lt!412582 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94190 (= lt!412583 ((_ sign_extend 32) (size!6734 (buf!7202 thiss!882))))))

(assert (=> d!94190 (= lt!412580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13305 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13300 thiss!882))))))

(assert (=> d!94190 (invariant!0 (currentBit!13300 thiss!882) (currentByte!13305 thiss!882) (size!6734 (buf!7202 thiss!882)))))

(assert (=> d!94190 (= (bitIndex!0 (size!6734 (buf!7202 thiss!882)) (currentByte!13305 thiss!882) (currentBit!13300 thiss!882)) lt!412580)))

(declare-fun b!274427 () Bool)

(declare-fun res!228309 () Bool)

(assert (=> b!274427 (=> (not res!228309) (not e!194320))))

(assert (=> b!274427 (= res!228309 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412580))))

(declare-fun b!274428 () Bool)

(declare-fun lt!412581 () (_ BitVec 64))

(assert (=> b!274428 (= e!194320 (bvsle lt!412580 (bvmul lt!412581 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274428 (or (= lt!412581 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412581 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412581)))))

(assert (=> b!274428 (= lt!412581 ((_ sign_extend 32) (size!6734 (buf!7202 thiss!882))))))

(assert (= (and d!94190 res!228310) b!274427))

(assert (= (and b!274427 res!228309) b!274428))

(declare-fun m!407117 () Bool)

(assert (=> d!94190 m!407117))

(assert (=> d!94190 m!407107))

(assert (=> b!274414 d!94190))

(check-sat (not d!94190))
