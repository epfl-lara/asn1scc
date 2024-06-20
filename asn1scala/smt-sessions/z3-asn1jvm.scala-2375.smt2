; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60592 () Bool)

(assert start!60592)

(declare-fun res!228246 () Bool)

(declare-fun e!194248 () Bool)

(assert (=> start!60592 (=> (not res!228246) (not e!194248))))

(declare-datatypes ((array!15518 0))(
  ( (array!15519 (arr!7718 (Array (_ BitVec 32) (_ BitVec 8))) (size!6731 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12276 0))(
  ( (BitStream!12277 (buf!7199 array!15518) (currentByte!13297 (_ BitVec 32)) (currentBit!13292 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12276)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12276 (_ BitVec 64)) Bool)

(assert (=> start!60592 (= res!228246 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60592 e!194248))

(declare-fun e!194245 () Bool)

(declare-fun inv!12 (BitStream!12276) Bool)

(assert (=> start!60592 (and (inv!12 thiss!882) e!194245)))

(assert (=> start!60592 true))

(declare-fun b!274345 () Bool)

(declare-fun e!194247 () Bool)

(assert (=> b!274345 (= e!194248 e!194247)))

(declare-fun res!228247 () Bool)

(assert (=> b!274345 (=> (not res!228247) (not e!194247))))

(declare-fun lt!412454 () (_ BitVec 32))

(assert (=> b!274345 (= res!228247 (bvslt (bvadd (currentBit!13292 thiss!882) lt!412454) #b00000000000000000000000000000000))))

(assert (=> b!274345 (= lt!412454 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274346 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274346 (= e!194247 (not (= (bvadd (bitIndex!0 (size!6731 (buf!7199 thiss!882)) (currentByte!13297 thiss!882) (currentBit!13292 thiss!882)) diffInBits!15) (bitIndex!0 (size!6731 (buf!7199 thiss!882)) (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882))))))))

(declare-fun b!274347 () Bool)

(declare-fun array_inv!6455 (array!15518) Bool)

(assert (=> b!274347 (= e!194245 (array_inv!6455 (buf!7199 thiss!882)))))

(assert (= (and start!60592 res!228246) b!274345))

(assert (= (and b!274345 res!228247) b!274346))

(assert (= start!60592 b!274347))

(declare-fun m!407043 () Bool)

(assert (=> start!60592 m!407043))

(declare-fun m!407045 () Bool)

(assert (=> start!60592 m!407045))

(declare-fun m!407047 () Bool)

(assert (=> b!274346 m!407047))

(declare-fun m!407049 () Bool)

(assert (=> b!274346 m!407049))

(declare-fun m!407051 () Bool)

(assert (=> b!274347 m!407051))

(check-sat (not b!274347) (not b!274346) (not start!60592))
(check-sat)
(get-model)

(declare-fun d!94130 () Bool)

(assert (=> d!94130 (= (array_inv!6455 (buf!7199 thiss!882)) (bvsge (size!6731 (buf!7199 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274347 d!94130))

(declare-fun d!94132 () Bool)

(declare-fun e!194263 () Bool)

(assert (=> d!94132 e!194263))

(declare-fun res!228258 () Bool)

(assert (=> d!94132 (=> (not res!228258) (not e!194263))))

(declare-fun lt!412475 () (_ BitVec 64))

(declare-fun lt!412474 () (_ BitVec 64))

(declare-fun lt!412473 () (_ BitVec 64))

(assert (=> d!94132 (= res!228258 (= lt!412475 (bvsub lt!412473 lt!412474)))))

(assert (=> d!94132 (or (= (bvand lt!412473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412474 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412473 lt!412474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94132 (= lt!412474 (remainingBits!0 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))) ((_ sign_extend 32) (currentByte!13297 thiss!882)) ((_ sign_extend 32) (currentBit!13292 thiss!882))))))

(declare-fun lt!412472 () (_ BitVec 64))

(declare-fun lt!412471 () (_ BitVec 64))

(assert (=> d!94132 (= lt!412473 (bvmul lt!412472 lt!412471))))

(assert (=> d!94132 (or (= lt!412472 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412471 (bvsdiv (bvmul lt!412472 lt!412471) lt!412472)))))

(assert (=> d!94132 (= lt!412471 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94132 (= lt!412472 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))))))

(assert (=> d!94132 (= lt!412475 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13297 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13292 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94132 (invariant!0 (currentBit!13292 thiss!882) (currentByte!13297 thiss!882) (size!6731 (buf!7199 thiss!882)))))

(assert (=> d!94132 (= (bitIndex!0 (size!6731 (buf!7199 thiss!882)) (currentByte!13297 thiss!882) (currentBit!13292 thiss!882)) lt!412475)))

(declare-fun b!274361 () Bool)

(declare-fun res!228259 () Bool)

(assert (=> b!274361 (=> (not res!228259) (not e!194263))))

(assert (=> b!274361 (= res!228259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412475))))

(declare-fun b!274362 () Bool)

(declare-fun lt!412470 () (_ BitVec 64))

(assert (=> b!274362 (= e!194263 (bvsle lt!412475 (bvmul lt!412470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274362 (or (= lt!412470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412470)))))

(assert (=> b!274362 (= lt!412470 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))))))

(assert (= (and d!94132 res!228258) b!274361))

(assert (= (and b!274361 res!228259) b!274362))

(declare-fun m!407063 () Bool)

(assert (=> d!94132 m!407063))

(declare-fun m!407065 () Bool)

(assert (=> d!94132 m!407065))

(assert (=> b!274346 d!94132))

(declare-fun d!94134 () Bool)

(declare-fun e!194264 () Bool)

(assert (=> d!94134 e!194264))

(declare-fun res!228260 () Bool)

(assert (=> d!94134 (=> (not res!228260) (not e!194264))))

(declare-fun lt!412481 () (_ BitVec 64))

(declare-fun lt!412480 () (_ BitVec 64))

(declare-fun lt!412479 () (_ BitVec 64))

(assert (=> d!94134 (= res!228260 (= lt!412481 (bvsub lt!412479 lt!412480)))))

(assert (=> d!94134 (or (= (bvand lt!412479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412480 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412479 lt!412480) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94134 (= lt!412480 (remainingBits!0 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))) ((_ sign_extend 32) (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882)))))))

(declare-fun lt!412478 () (_ BitVec 64))

(declare-fun lt!412477 () (_ BitVec 64))

(assert (=> d!94134 (= lt!412479 (bvmul lt!412478 lt!412477))))

(assert (=> d!94134 (or (= lt!412478 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412477 (bvsdiv (bvmul lt!412478 lt!412477) lt!412478)))))

(assert (=> d!94134 (= lt!412477 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94134 (= lt!412478 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))))))

(assert (=> d!94134 (= lt!412481 (bvadd (bvmul ((_ sign_extend 32) (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882)))))))

(assert (=> d!94134 (invariant!0 (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882)) (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6731 (buf!7199 thiss!882)))))

(assert (=> d!94134 (= (bitIndex!0 (size!6731 (buf!7199 thiss!882)) (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882))) lt!412481)))

(declare-fun b!274363 () Bool)

(declare-fun res!228261 () Bool)

(assert (=> b!274363 (=> (not res!228261) (not e!194264))))

(assert (=> b!274363 (= res!228261 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412481))))

(declare-fun b!274364 () Bool)

(declare-fun lt!412476 () (_ BitVec 64))

(assert (=> b!274364 (= e!194264 (bvsle lt!412481 (bvmul lt!412476 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274364 (or (= lt!412476 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412476 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412476)))))

(assert (=> b!274364 (= lt!412476 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))))))

(assert (= (and d!94134 res!228260) b!274363))

(assert (= (and b!274363 res!228261) b!274364))

(declare-fun m!407067 () Bool)

(assert (=> d!94134 m!407067))

(declare-fun m!407069 () Bool)

(assert (=> d!94134 m!407069))

(assert (=> b!274346 d!94134))

(declare-fun d!94138 () Bool)

(declare-fun res!228264 () Bool)

(declare-fun e!194267 () Bool)

(assert (=> d!94138 (=> (not res!228264) (not e!194267))))

(assert (=> d!94138 (= res!228264 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882)))))))))

(assert (=> d!94138 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194267)))

(declare-fun b!274368 () Bool)

(declare-fun lt!412484 () (_ BitVec 64))

(assert (=> b!274368 (= e!194267 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412484) (bvsle lt!412484 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882)))))))))

(assert (=> b!274368 (= lt!412484 (bvadd (bitIndex!0 (size!6731 (buf!7199 thiss!882)) (currentByte!13297 thiss!882) (currentBit!13292 thiss!882)) diffInBits!15))))

(assert (= (and d!94138 res!228264) b!274368))

(assert (=> b!274368 m!407047))

(assert (=> start!60592 d!94138))

(declare-fun d!94142 () Bool)

(assert (=> d!94142 (= (inv!12 thiss!882) (invariant!0 (currentBit!13292 thiss!882) (currentByte!13297 thiss!882) (size!6731 (buf!7199 thiss!882))))))

(declare-fun bs!23714 () Bool)

(assert (= bs!23714 d!94142))

(assert (=> bs!23714 m!407065))

(assert (=> start!60592 d!94142))

(check-sat (not d!94142) (not d!94132) (not d!94134) (not b!274368))
(check-sat)
(get-model)

(declare-fun d!94160 () Bool)

(assert (=> d!94160 (= (invariant!0 (currentBit!13292 thiss!882) (currentByte!13297 thiss!882) (size!6731 (buf!7199 thiss!882))) (and (bvsge (currentBit!13292 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13292 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13297 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13297 thiss!882) (size!6731 (buf!7199 thiss!882))) (and (= (currentBit!13292 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13297 thiss!882) (size!6731 (buf!7199 thiss!882)))))))))

(assert (=> d!94142 d!94160))

(declare-fun d!94162 () Bool)

(assert (=> d!94162 (= (remainingBits!0 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))) ((_ sign_extend 32) (currentByte!13297 thiss!882)) ((_ sign_extend 32) (currentBit!13292 thiss!882))) (bvsub (bvmul ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13297 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13292 thiss!882)))))))

(assert (=> d!94132 d!94162))

(assert (=> d!94132 d!94160))

(declare-fun d!94164 () Bool)

(assert (=> d!94164 (= (remainingBits!0 ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))) ((_ sign_extend 32) (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882)))) (bvsub (bvmul ((_ sign_extend 32) (size!6731 (buf!7199 thiss!882))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882))))))))

(assert (=> d!94134 d!94164))

(declare-fun d!94166 () Bool)

(assert (=> d!94166 (= (invariant!0 (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882)) (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6731 (buf!7199 thiss!882))) (and (bvsge (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882)) #b00000000000000000000000000001000) (bvsge (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (or (bvslt (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6731 (buf!7199 thiss!882))) (and (= (bvadd #b00000000000000000000000000001000 lt!412454 (currentBit!13292 thiss!882)) #b00000000000000000000000000000000) (= (bvsub (bvadd (currentByte!13297 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6731 (buf!7199 thiss!882)))))))))

(assert (=> d!94134 d!94166))

(assert (=> b!274368 d!94132))

(check-sat)
