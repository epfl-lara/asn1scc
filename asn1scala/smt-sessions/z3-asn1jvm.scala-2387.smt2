; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60948 () Bool)

(assert start!60948)

(declare-fun res!228699 () Bool)

(declare-fun e!194819 () Bool)

(assert (=> start!60948 (=> (not res!228699) (not e!194819))))

(declare-datatypes ((array!15620 0))(
  ( (array!15621 (arr!7754 (Array (_ BitVec 32) (_ BitVec 8))) (size!6767 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12348 0))(
  ( (BitStream!12349 (buf!7235 array!15620) (currentByte!13385 (_ BitVec 32)) (currentBit!13380 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12348)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12348 (_ BitVec 64)) Bool)

(assert (=> start!60948 (= res!228699 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60948 e!194819))

(declare-fun e!194818 () Bool)

(declare-fun inv!12 (BitStream!12348) Bool)

(assert (=> start!60948 (and (inv!12 thiss!882) e!194818)))

(assert (=> start!60948 true))

(declare-fun b!274936 () Bool)

(declare-fun e!194820 () Bool)

(assert (=> b!274936 (= e!194819 e!194820)))

(declare-fun res!228700 () Bool)

(assert (=> b!274936 (=> (not res!228700) (not e!194820))))

(declare-fun lt!413300 () (_ BitVec 32))

(assert (=> b!274936 (= res!228700 (and (bvsge lt!413300 #b00000000000000000000000000000000) (bvslt lt!413300 #b00000000000000000000000000001000)))))

(assert (=> b!274936 (= lt!413300 (bvadd (currentBit!13380 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274937 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274937 (= e!194820 (not (= (bvadd (bitIndex!0 (size!6767 (buf!7235 thiss!882)) (currentByte!13385 thiss!882) (currentBit!13380 thiss!882)) diffInBits!15) (bitIndex!0 (size!6767 (buf!7235 thiss!882)) (bvadd (currentByte!13385 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413300))))))

(declare-fun b!274938 () Bool)

(declare-fun array_inv!6491 (array!15620) Bool)

(assert (=> b!274938 (= e!194818 (array_inv!6491 (buf!7235 thiss!882)))))

(assert (= (and start!60948 res!228699) b!274936))

(assert (= (and b!274936 res!228700) b!274937))

(assert (= start!60948 b!274938))

(declare-fun m!407511 () Bool)

(assert (=> start!60948 m!407511))

(declare-fun m!407513 () Bool)

(assert (=> start!60948 m!407513))

(declare-fun m!407515 () Bool)

(assert (=> b!274937 m!407515))

(declare-fun m!407517 () Bool)

(assert (=> b!274937 m!407517))

(declare-fun m!407519 () Bool)

(assert (=> b!274938 m!407519))

(check-sat (not b!274938) (not b!274937) (not start!60948))
(check-sat)
(get-model)

(declare-fun d!94496 () Bool)

(assert (=> d!94496 (= (array_inv!6491 (buf!7235 thiss!882)) (bvsge (size!6767 (buf!7235 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274938 d!94496))

(declare-fun d!94498 () Bool)

(declare-fun e!194846 () Bool)

(assert (=> d!94498 e!194846))

(declare-fun res!228726 () Bool)

(assert (=> d!94498 (=> (not res!228726) (not e!194846))))

(declare-fun lt!413347 () (_ BitVec 64))

(declare-fun lt!413350 () (_ BitVec 64))

(declare-fun lt!413349 () (_ BitVec 64))

(assert (=> d!94498 (= res!228726 (= lt!413350 (bvsub lt!413347 lt!413349)))))

(assert (=> d!94498 (or (= (bvand lt!413347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413349 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413347 lt!413349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94498 (= lt!413349 (remainingBits!0 ((_ sign_extend 32) (size!6767 (buf!7235 thiss!882))) ((_ sign_extend 32) (currentByte!13385 thiss!882)) ((_ sign_extend 32) (currentBit!13380 thiss!882))))))

(declare-fun lt!413346 () (_ BitVec 64))

(declare-fun lt!413348 () (_ BitVec 64))

(assert (=> d!94498 (= lt!413347 (bvmul lt!413346 lt!413348))))

(assert (=> d!94498 (or (= lt!413346 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413348 (bvsdiv (bvmul lt!413346 lt!413348) lt!413346)))))

(assert (=> d!94498 (= lt!413348 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94498 (= lt!413346 ((_ sign_extend 32) (size!6767 (buf!7235 thiss!882))))))

(assert (=> d!94498 (= lt!413350 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13385 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13380 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94498 (invariant!0 (currentBit!13380 thiss!882) (currentByte!13385 thiss!882) (size!6767 (buf!7235 thiss!882)))))

(assert (=> d!94498 (= (bitIndex!0 (size!6767 (buf!7235 thiss!882)) (currentByte!13385 thiss!882) (currentBit!13380 thiss!882)) lt!413350)))

(declare-fun b!274968 () Bool)

(declare-fun res!228725 () Bool)

(assert (=> b!274968 (=> (not res!228725) (not e!194846))))

(assert (=> b!274968 (= res!228725 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413350))))

(declare-fun b!274969 () Bool)

(declare-fun lt!413351 () (_ BitVec 64))

(assert (=> b!274969 (= e!194846 (bvsle lt!413350 (bvmul lt!413351 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274969 (or (= lt!413351 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413351 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413351)))))

(assert (=> b!274969 (= lt!413351 ((_ sign_extend 32) (size!6767 (buf!7235 thiss!882))))))

(assert (= (and d!94498 res!228726) b!274968))

(assert (= (and b!274968 res!228725) b!274969))

(declare-fun m!407541 () Bool)

(assert (=> d!94498 m!407541))

(declare-fun m!407543 () Bool)

(assert (=> d!94498 m!407543))

(assert (=> b!274937 d!94498))

(declare-fun d!94516 () Bool)

(declare-fun e!194847 () Bool)

(assert (=> d!94516 e!194847))

(declare-fun res!228728 () Bool)

(assert (=> d!94516 (=> (not res!228728) (not e!194847))))

(declare-fun lt!413353 () (_ BitVec 64))

(declare-fun lt!413355 () (_ BitVec 64))

(declare-fun lt!413356 () (_ BitVec 64))

(assert (=> d!94516 (= res!228728 (= lt!413356 (bvsub lt!413353 lt!413355)))))

(assert (=> d!94516 (or (= (bvand lt!413353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413353 lt!413355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94516 (= lt!413355 (remainingBits!0 ((_ sign_extend 32) (size!6767 (buf!7235 thiss!882))) ((_ sign_extend 32) (bvadd (currentByte!13385 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 32) lt!413300)))))

(declare-fun lt!413352 () (_ BitVec 64))

(declare-fun lt!413354 () (_ BitVec 64))

(assert (=> d!94516 (= lt!413353 (bvmul lt!413352 lt!413354))))

(assert (=> d!94516 (or (= lt!413352 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413354 (bvsdiv (bvmul lt!413352 lt!413354) lt!413352)))))

(assert (=> d!94516 (= lt!413354 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94516 (= lt!413352 ((_ sign_extend 32) (size!6767 (buf!7235 thiss!882))))))

(assert (=> d!94516 (= lt!413356 (bvadd (bvmul ((_ sign_extend 32) (bvadd (currentByte!13385 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!413300)))))

(assert (=> d!94516 (invariant!0 lt!413300 (bvadd (currentByte!13385 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6767 (buf!7235 thiss!882)))))

(assert (=> d!94516 (= (bitIndex!0 (size!6767 (buf!7235 thiss!882)) (bvadd (currentByte!13385 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413300) lt!413356)))

(declare-fun b!274970 () Bool)

(declare-fun res!228727 () Bool)

(assert (=> b!274970 (=> (not res!228727) (not e!194847))))

(assert (=> b!274970 (= res!228727 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413356))))

(declare-fun b!274971 () Bool)

(declare-fun lt!413357 () (_ BitVec 64))

(assert (=> b!274971 (= e!194847 (bvsle lt!413356 (bvmul lt!413357 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274971 (or (= lt!413357 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413357 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413357)))))

(assert (=> b!274971 (= lt!413357 ((_ sign_extend 32) (size!6767 (buf!7235 thiss!882))))))

(assert (= (and d!94516 res!228728) b!274970))

(assert (= (and b!274970 res!228727) b!274971))

(declare-fun m!407545 () Bool)

(assert (=> d!94516 m!407545))

(declare-fun m!407547 () Bool)

(assert (=> d!94516 m!407547))

(assert (=> b!274937 d!94516))

(declare-fun d!94518 () Bool)

(declare-fun res!228731 () Bool)

(declare-fun e!194850 () Bool)

(assert (=> d!94518 (=> (not res!228731) (not e!194850))))

(assert (=> d!94518 (= res!228731 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6767 (buf!7235 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6767 (buf!7235 thiss!882)))))))))

(assert (=> d!94518 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194850)))

(declare-fun b!274975 () Bool)

(declare-fun lt!413362 () (_ BitVec 64))

(assert (=> b!274975 (= e!194850 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413362) (bvsle lt!413362 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6767 (buf!7235 thiss!882)))))))))

(assert (=> b!274975 (= lt!413362 (bvadd (bitIndex!0 (size!6767 (buf!7235 thiss!882)) (currentByte!13385 thiss!882) (currentBit!13380 thiss!882)) diffInBits!15))))

(assert (= (and d!94518 res!228731) b!274975))

(assert (=> b!274975 m!407515))

(assert (=> start!60948 d!94518))

(declare-fun d!94520 () Bool)

(assert (=> d!94520 (= (inv!12 thiss!882) (invariant!0 (currentBit!13380 thiss!882) (currentByte!13385 thiss!882) (size!6767 (buf!7235 thiss!882))))))

(declare-fun bs!23791 () Bool)

(assert (= bs!23791 d!94520))

(assert (=> bs!23791 m!407543))

(assert (=> start!60948 d!94520))

(check-sat (not d!94516) (not b!274975) (not d!94498) (not d!94520))
(check-sat)
