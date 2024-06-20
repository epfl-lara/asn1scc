; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60594 () Bool)

(assert start!60594)

(declare-fun res!228253 () Bool)

(declare-fun e!194258 () Bool)

(assert (=> start!60594 (=> (not res!228253) (not e!194258))))

(declare-datatypes ((array!15520 0))(
  ( (array!15521 (arr!7719 (Array (_ BitVec 32) (_ BitVec 8))) (size!6732 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12278 0))(
  ( (BitStream!12279 (buf!7200 array!15520) (currentByte!13298 (_ BitVec 32)) (currentBit!13293 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12278)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12278 (_ BitVec 64)) Bool)

(assert (=> start!60594 (= res!228253 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60594 e!194258))

(declare-fun e!194259 () Bool)

(declare-fun inv!12 (BitStream!12278) Bool)

(assert (=> start!60594 (and (inv!12 thiss!882) e!194259)))

(assert (=> start!60594 true))

(declare-fun b!274354 () Bool)

(declare-fun e!194257 () Bool)

(assert (=> b!274354 (= e!194258 e!194257)))

(declare-fun res!228252 () Bool)

(assert (=> b!274354 (=> (not res!228252) (not e!194257))))

(declare-fun lt!412457 () (_ BitVec 32))

(assert (=> b!274354 (= res!228252 (bvslt (bvadd (currentBit!13293 thiss!882) lt!412457) #b00000000000000000000000000000000))))

(assert (=> b!274354 (= lt!412457 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274355 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274355 (= e!194257 (not (= (bvadd (bitIndex!0 (size!6732 (buf!7200 thiss!882)) (currentByte!13298 thiss!882) (currentBit!13293 thiss!882)) diffInBits!15) (bitIndex!0 (size!6732 (buf!7200 thiss!882)) (bvsub (bvadd (currentByte!13298 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412457 (currentBit!13293 thiss!882))))))))

(declare-fun b!274356 () Bool)

(declare-fun array_inv!6456 (array!15520) Bool)

(assert (=> b!274356 (= e!194259 (array_inv!6456 (buf!7200 thiss!882)))))

(assert (= (and start!60594 res!228253) b!274354))

(assert (= (and b!274354 res!228252) b!274355))

(assert (= start!60594 b!274356))

(declare-fun m!407053 () Bool)

(assert (=> start!60594 m!407053))

(declare-fun m!407055 () Bool)

(assert (=> start!60594 m!407055))

(declare-fun m!407057 () Bool)

(assert (=> b!274355 m!407057))

(declare-fun m!407059 () Bool)

(assert (=> b!274355 m!407059))

(declare-fun m!407061 () Bool)

(assert (=> b!274356 m!407061))

(push 1)

(assert (not start!60594))

(assert (not b!274356))

(assert (not b!274355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94148 () Bool)

(declare-fun res!228278 () Bool)

(declare-fun e!194277 () Bool)

(assert (=> d!94148 (=> (not res!228278) (not e!194277))))

(assert (=> d!94148 (= res!228278 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6732 (buf!7200 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6732 (buf!7200 thiss!882)))))))))

(assert (=> d!94148 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194277)))

(declare-fun b!274384 () Bool)

(declare-fun lt!412514 () (_ BitVec 64))

(assert (=> b!274384 (= e!194277 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412514) (bvsle lt!412514 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6732 (buf!7200 thiss!882)))))))))

(assert (=> b!274384 (= lt!412514 (bvadd (bitIndex!0 (size!6732 (buf!7200 thiss!882)) (currentByte!13298 thiss!882) (currentBit!13293 thiss!882)) diffInBits!15))))

(assert (= (and d!94148 res!228278) b!274384))

(assert (=> b!274384 m!407057))

(assert (=> start!60594 d!94148))

(declare-fun d!94152 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94152 (= (inv!12 thiss!882) (invariant!0 (currentBit!13293 thiss!882) (currentByte!13298 thiss!882) (size!6732 (buf!7200 thiss!882))))))

(declare-fun bs!23716 () Bool)

(assert (= bs!23716 d!94152))

(declare-fun m!407079 () Bool)

(assert (=> bs!23716 m!407079))

(assert (=> start!60594 d!94152))

(declare-fun d!94154 () Bool)

(assert (=> d!94154 (= (array_inv!6456 (buf!7200 thiss!882)) (bvsge (size!6732 (buf!7200 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274356 d!94154))

(declare-fun d!94156 () Bool)

(declare-fun e!194280 () Bool)

(assert (=> d!94156 e!194280))

(declare-fun res!228283 () Bool)

(assert (=> d!94156 (=> (not res!228283) (not e!194280))))

(declare-fun lt!412527 () (_ BitVec 64))

(declare-fun lt!412528 () (_ BitVec 64))

(declare-fun lt!412531 () (_ BitVec 64))

(assert (=> d!94156 (= res!228283 (= lt!412527 (bvsub lt!412528 lt!412531)))))

(assert (=> d!94156 (or (= (bvand lt!412528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412531 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412528 lt!412531) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94156 (= lt!412531 (remainingBits!0 ((_ sign_extend 32) (size!6732 (buf!7200 thiss!882))) ((_ sign_extend 32) (currentByte!13298 thiss!882)) ((_ sign_extend 32) (currentBit!13293 thiss!882))))))

(declare-fun lt!412532 () (_ BitVec 64))

(declare-fun lt!412530 () (_ BitVec 64))

(assert (=> d!94156 (= lt!412528 (bvmul lt!412532 lt!412530))))

(assert (=> d!94156 (or (= lt!412532 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412530 (bvsdiv (bvmul lt!412532 lt!412530) lt!412532)))))

(assert (=> d!94156 (= lt!412530 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94156 (= lt!412532 ((_ sign_extend 32) (size!6732 (buf!7200 thiss!882))))))

(assert (=> d!94156 (= lt!412527 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13298 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13293 thiss!882))))))

(assert (=> d!94156 (invariant!0 (currentBit!13293 thiss!882) (currentByte!13298 thiss!882) (size!6732 (buf!7200 thiss!882)))))

(assert (=> d!94156 (= (bitIndex!0 (size!6732 (buf!7200 thiss!882)) (currentByte!13298 thiss!882) (currentBit!13293 thiss!882)) lt!412527)))

(declare-fun b!274389 () Bool)

(declare-fun res!228284 () Bool)

(assert (=> b!274389 (=> (not res!228284) (not e!194280))))

(assert (=> b!274389 (= res!228284 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412527))))

(declare-fun b!274390 () Bool)

(declare-fun lt!412529 () (_ BitVec 64))

(assert (=> b!274390 (= e!194280 (bvsle lt!412527 (bvmul lt!412529 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274390 (or (= lt!412529 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412529 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412529)))))

(assert (=> b!274390 (= lt!412529 ((_ sign_extend 32) (size!6732 (buf!7200 thiss!882))))))

(assert (= (and d!94156 res!228283) b!274389))

(assert (= (and b!274389 res!228284) b!274390))

(declare-fun m!407081 () Bool)

(assert (=> d!94156 m!407081))

(assert (=> d!94156 m!407079))

(assert (=> b!274355 d!94156))

(declare-fun d!94158 () Bool)

(declare-fun e!194281 () Bool)

(assert (=> d!94158 e!194281))

(declare-fun res!228285 () Bool)

(assert (=> d!94158 (=> (not res!228285) (not e!194281))))

(declare-fun lt!412534 () (_ BitVec 64))

(declare-fun lt!412533 () (_ BitVec 64))

(declare-fun lt!412537 () (_ BitVec 64))

(assert (=> d!94158 (= res!228285 (= lt!412533 (bvsub lt!412534 lt!412537)))))

(assert (=> d!94158 (or (= (bvand lt!412534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412534 lt!412537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94158 (= lt!412537 (remainingBits!0 ((_ sign_extend 32) (size!6732 (buf!7200 thiss!882))) ((_ sign_extend 32) (bvsub (bvadd (currentByte!13298 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000001000 lt!412457 (currentBit!13293 thiss!882)))))))

(declare-fun lt!412538 () (_ BitVec 64))

(declare-fun lt!412536 () (_ BitVec 64))

(assert (=> d!94158 (= lt!412534 (bvmul lt!412538 lt!412536))))

(assert (=> d!94158 (or (= lt!412538 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412536 (bvsdiv (bvmul lt!412538 lt!412536) lt!412538)))))

(assert (=> d!94158 (= lt!412536 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94158 (= lt!412538 ((_ sign_extend 32) (size!6732 (buf!7200 thiss!882))))))

(assert (=> d!94158 (= lt!412533 (bvadd (bvmul ((_ sign_extend 32) (bvsub (bvadd (currentByte!13298 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000001000 lt!412457 (currentBit!13293 thiss!882)))))))

(assert (=> d!94158 (invariant!0 (bvadd #b00000000000000000000000000001000 lt!412457 (currentBit!13293 thiss!882)) (bvsub (bvadd (currentByte!13298 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6732 (buf!7200 thiss!882)))))

(assert (=> d!94158 (= (bitIndex!0 (size!6732 (buf!7200 thiss!882)) (bvsub (bvadd (currentByte!13298 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412457 (currentBit!13293 thiss!882))) lt!412533)))

(declare-fun b!274391 () Bool)

(declare-fun res!228286 () Bool)

(assert (=> b!274391 (=> (not res!228286) (not e!194281))))

(assert (=> b!274391 (= res!228286 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412533))))

(declare-fun b!274392 () Bool)

(declare-fun lt!412535 () (_ BitVec 64))

(assert (=> b!274392 (= e!194281 (bvsle lt!412533 (bvmul lt!412535 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274392 (or (= lt!412535 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412535 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412535)))))

(assert (=> b!274392 (= lt!412535 ((_ sign_extend 32) (size!6732 (buf!7200 thiss!882))))))

(assert (= (and d!94158 res!228285) b!274391))

(assert (= (and b!274391 res!228286) b!274392))

(declare-fun m!407083 () Bool)

(assert (=> d!94158 m!407083))

(declare-fun m!407085 () Bool)

(assert (=> d!94158 m!407085))

(assert (=> b!274355 d!94158))

(push 1)

(assert (not d!94152))

(assert (not b!274384))

(assert (not d!94156))

(assert (not d!94158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

