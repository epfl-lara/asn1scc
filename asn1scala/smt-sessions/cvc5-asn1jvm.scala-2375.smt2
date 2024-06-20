; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60590 () Bool)

(assert start!60590)

(declare-fun res!228240 () Bool)

(declare-fun e!194235 () Bool)

(assert (=> start!60590 (=> (not res!228240) (not e!194235))))

(declare-datatypes ((array!15516 0))(
  ( (array!15517 (arr!7717 (Array (_ BitVec 32) (_ BitVec 8))) (size!6730 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12274 0))(
  ( (BitStream!12275 (buf!7198 array!15516) (currentByte!13296 (_ BitVec 32)) (currentBit!13291 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12274)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12274 (_ BitVec 64)) Bool)

(assert (=> start!60590 (= res!228240 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60590 e!194235))

(declare-fun e!194236 () Bool)

(declare-fun inv!12 (BitStream!12274) Bool)

(assert (=> start!60590 (and (inv!12 thiss!882) e!194236)))

(assert (=> start!60590 true))

(declare-fun b!274336 () Bool)

(declare-fun e!194233 () Bool)

(assert (=> b!274336 (= e!194235 e!194233)))

(declare-fun res!228241 () Bool)

(assert (=> b!274336 (=> (not res!228241) (not e!194233))))

(declare-fun lt!412451 () (_ BitVec 32))

(assert (=> b!274336 (= res!228241 (bvslt (bvadd (currentBit!13291 thiss!882) lt!412451) #b00000000000000000000000000000000))))

(assert (=> b!274336 (= lt!412451 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274337 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274337 (= e!194233 (not (= (bvadd (bitIndex!0 (size!6730 (buf!7198 thiss!882)) (currentByte!13296 thiss!882) (currentBit!13291 thiss!882)) diffInBits!15) (bitIndex!0 (size!6730 (buf!7198 thiss!882)) (bvsub (bvadd (currentByte!13296 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412451 (currentBit!13291 thiss!882))))))))

(declare-fun b!274338 () Bool)

(declare-fun array_inv!6454 (array!15516) Bool)

(assert (=> b!274338 (= e!194236 (array_inv!6454 (buf!7198 thiss!882)))))

(assert (= (and start!60590 res!228240) b!274336))

(assert (= (and b!274336 res!228241) b!274337))

(assert (= start!60590 b!274338))

(declare-fun m!407033 () Bool)

(assert (=> start!60590 m!407033))

(declare-fun m!407035 () Bool)

(assert (=> start!60590 m!407035))

(declare-fun m!407037 () Bool)

(assert (=> b!274337 m!407037))

(declare-fun m!407039 () Bool)

(assert (=> b!274337 m!407039))

(declare-fun m!407041 () Bool)

(assert (=> b!274338 m!407041))

(push 1)

(assert (not b!274338))

(assert (not b!274337))

(assert (not start!60590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94136 () Bool)

(assert (=> d!94136 (= (array_inv!6454 (buf!7198 thiss!882)) (bvsge (size!6730 (buf!7198 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274338 d!94136))

(declare-fun d!94140 () Bool)

(declare-fun e!194270 () Bool)

(assert (=> d!94140 e!194270))

(declare-fun res!228270 () Bool)

(assert (=> d!94140 (=> (not res!228270) (not e!194270))))

(declare-fun lt!412501 () (_ BitVec 64))

(declare-fun lt!412498 () (_ BitVec 64))

(declare-fun lt!412499 () (_ BitVec 64))

(assert (=> d!94140 (= res!228270 (= lt!412501 (bvsub lt!412499 lt!412498)))))

(assert (=> d!94140 (or (= (bvand lt!412499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412499 lt!412498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94140 (= lt!412498 (remainingBits!0 ((_ sign_extend 32) (size!6730 (buf!7198 thiss!882))) ((_ sign_extend 32) (currentByte!13296 thiss!882)) ((_ sign_extend 32) (currentBit!13291 thiss!882))))))

(declare-fun lt!412500 () (_ BitVec 64))

(declare-fun lt!412502 () (_ BitVec 64))

(assert (=> d!94140 (= lt!412499 (bvmul lt!412500 lt!412502))))

(assert (=> d!94140 (or (= lt!412500 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412502 (bvsdiv (bvmul lt!412500 lt!412502) lt!412500)))))

(assert (=> d!94140 (= lt!412502 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94140 (= lt!412500 ((_ sign_extend 32) (size!6730 (buf!7198 thiss!882))))))

(assert (=> d!94140 (= lt!412501 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13296 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13291 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94140 (invariant!0 (currentBit!13291 thiss!882) (currentByte!13296 thiss!882) (size!6730 (buf!7198 thiss!882)))))

(assert (=> d!94140 (= (bitIndex!0 (size!6730 (buf!7198 thiss!882)) (currentByte!13296 thiss!882) (currentBit!13291 thiss!882)) lt!412501)))

(declare-fun b!274373 () Bool)

(declare-fun res!228269 () Bool)

(assert (=> b!274373 (=> (not res!228269) (not e!194270))))

(assert (=> b!274373 (= res!228269 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412501))))

(declare-fun b!274374 () Bool)

(declare-fun lt!412497 () (_ BitVec 64))

(assert (=> b!274374 (= e!194270 (bvsle lt!412501 (bvmul lt!412497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274374 (or (= lt!412497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412497)))))

(assert (=> b!274374 (= lt!412497 ((_ sign_extend 32) (size!6730 (buf!7198 thiss!882))))))

(assert (= (and d!94140 res!228270) b!274373))

(assert (= (and b!274373 res!228269) b!274374))

(declare-fun m!407071 () Bool)

(assert (=> d!94140 m!407071))

(declare-fun m!407073 () Bool)

(assert (=> d!94140 m!407073))

(assert (=> b!274337 d!94140))

(declare-fun d!94144 () Bool)

(declare-fun e!194271 () Bool)

(assert (=> d!94144 e!194271))

(declare-fun res!228272 () Bool)

(assert (=> d!94144 (=> (not res!228272) (not e!194271))))

(declare-fun lt!412507 () (_ BitVec 64))

(declare-fun lt!412504 () (_ BitVec 64))

(declare-fun lt!412505 () (_ BitVec 64))

(assert (=> d!94144 (= res!228272 (= lt!412507 (bvsub lt!412505 lt!412504)))))

(assert (=> d!94144 (or (= (bvand lt!412505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412505 lt!412504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94144 (= lt!412504 (remainingBits!0 ((_ sign_extend 32) (size!6730 (buf!7198 thiss!882))) ((_ sign_extend 32) (bvsub (bvadd (currentByte!13296 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000001000 lt!412451 (currentBit!13291 thiss!882)))))))

(declare-fun lt!412506 () (_ BitVec 64))

(declare-fun lt!412508 () (_ BitVec 64))

(assert (=> d!94144 (= lt!412505 (bvmul lt!412506 lt!412508))))

(assert (=> d!94144 (or (= lt!412506 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412508 (bvsdiv (bvmul lt!412506 lt!412508) lt!412506)))))

(assert (=> d!94144 (= lt!412508 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94144 (= lt!412506 ((_ sign_extend 32) (size!6730 (buf!7198 thiss!882))))))

(assert (=> d!94144 (= lt!412507 (bvadd (bvmul ((_ sign_extend 32) (bvsub (bvadd (currentByte!13296 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000001000 lt!412451 (currentBit!13291 thiss!882)))))))

(assert (=> d!94144 (invariant!0 (bvadd #b00000000000000000000000000001000 lt!412451 (currentBit!13291 thiss!882)) (bvsub (bvadd (currentByte!13296 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6730 (buf!7198 thiss!882)))))

(assert (=> d!94144 (= (bitIndex!0 (size!6730 (buf!7198 thiss!882)) (bvsub (bvadd (currentByte!13296 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412451 (currentBit!13291 thiss!882))) lt!412507)))

(declare-fun b!274375 () Bool)

(declare-fun res!228271 () Bool)

(assert (=> b!274375 (=> (not res!228271) (not e!194271))))

(assert (=> b!274375 (= res!228271 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412507))))

(declare-fun b!274376 () Bool)

(declare-fun lt!412503 () (_ BitVec 64))

(assert (=> b!274376 (= e!194271 (bvsle lt!412507 (bvmul lt!412503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274376 (or (= lt!412503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412503)))))

(assert (=> b!274376 (= lt!412503 ((_ sign_extend 32) (size!6730 (buf!7198 thiss!882))))))

(assert (= (and d!94144 res!228272) b!274375))

(assert (= (and b!274375 res!228271) b!274376))

(declare-fun m!407075 () Bool)

(assert (=> d!94144 m!407075))

(declare-fun m!407077 () Bool)

(assert (=> d!94144 m!407077))

(assert (=> b!274337 d!94144))

(declare-fun d!94146 () Bool)

(declare-fun res!228275 () Bool)

(declare-fun e!194274 () Bool)

(assert (=> d!94146 (=> (not res!228275) (not e!194274))))

(assert (=> d!94146 (= res!228275 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6730 (buf!7198 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6730 (buf!7198 thiss!882)))))))))

(assert (=> d!94146 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194274)))

(declare-fun b!274381 () Bool)

(declare-fun lt!412511 () (_ BitVec 64))

(assert (=> b!274381 (= e!194274 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412511) (bvsle lt!412511 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6730 (buf!7198 thiss!882)))))))))

(assert (=> b!274381 (= lt!412511 (bvadd (bitIndex!0 (size!6730 (buf!7198 thiss!882)) (currentByte!13296 thiss!882) (currentBit!13291 thiss!882)) diffInBits!15))))

(assert (= (and d!94146 res!228275) b!274381))

(assert (=> b!274381 m!407037))

(assert (=> start!60590 d!94146))

(declare-fun d!94150 () Bool)

(assert (=> d!94150 (= (inv!12 thiss!882) (invariant!0 (currentBit!13291 thiss!882) (currentByte!13296 thiss!882) (size!6730 (buf!7198 thiss!882))))))

(declare-fun bs!23715 () Bool)

(assert (= bs!23715 d!94150))

(assert (=> bs!23715 m!407073))

(assert (=> start!60590 d!94150))

(push 1)

(assert (not d!94144))

(assert (not b!274381))

(assert (not d!94150))

(assert (not d!94140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

