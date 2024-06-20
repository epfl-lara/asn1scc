; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48368 () Bool)

(assert start!48368)

(declare-fun b!229366 () Bool)

(declare-fun e!157423 () Bool)

(declare-datatypes ((array!11661 0))(
  ( (array!11662 (arr!6102 (Array (_ BitVec 32) (_ BitVec 8))) (size!5115 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9326 0))(
  ( (BitStream!9327 (buf!5656 array!11661) (currentByte!10558 (_ BitVec 32)) (currentBit!10553 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9326)

(declare-fun array_inv!4856 (array!11661) Bool)

(assert (=> b!229366 (= e!157423 (array_inv!4856 (buf!5656 b2!99)))))

(declare-fun b!229367 () Bool)

(declare-fun res!192288 () Bool)

(declare-fun e!157419 () Bool)

(assert (=> b!229367 (=> (not res!192288) (not e!157419))))

(declare-fun b1!101 () BitStream!9326)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229367 (= res!192288 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))) ((_ sign_extend 32) (currentByte!10558 b1!101)) ((_ sign_extend 32) (currentBit!10553 b1!101)) bytes!19))))

(declare-fun b!229365 () Bool)

(declare-fun e!157420 () Bool)

(assert (=> b!229365 (= e!157420 e!157419)))

(declare-fun res!192285 () Bool)

(assert (=> b!229365 (=> (not res!192285) (not e!157419))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367296 () (_ BitVec 64))

(assert (=> b!229365 (= res!192285 (and (bvsle bits!86 lt!367296) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229365 (= lt!367296 (bitIndex!0 (size!5115 (buf!5656 b2!99)) (currentByte!10558 b2!99) (currentBit!10553 b2!99)))))

(declare-fun res!192287 () Bool)

(assert (=> start!48368 (=> (not res!192287) (not e!157420))))

(assert (=> start!48368 (= res!192287 (and (= (size!5115 (buf!5656 b1!101)) (size!5115 (buf!5656 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48368 e!157420))

(declare-fun e!157421 () Bool)

(declare-fun inv!12 (BitStream!9326) Bool)

(assert (=> start!48368 (and (inv!12 b1!101) e!157421)))

(assert (=> start!48368 (and (inv!12 b2!99) e!157423)))

(assert (=> start!48368 true))

(declare-fun b!229368 () Bool)

(assert (=> b!229368 (= e!157421 (array_inv!4856 (buf!5656 b1!101)))))

(declare-fun b!229369 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229369 (= e!157419 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10553 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10558 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5115 (buf!5656 b1!101)))))))))

(declare-fun b!229370 () Bool)

(declare-fun res!192289 () Bool)

(assert (=> b!229370 (=> (not res!192289) (not e!157419))))

(assert (=> b!229370 (= res!192289 (and (bvsle ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10558 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10553 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10558 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10553 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!229371 () Bool)

(declare-fun res!192286 () Bool)

(assert (=> b!229371 (=> (not res!192286) (not e!157419))))

(assert (=> b!229371 (= res!192286 (= lt!367296 (bvadd (bitIndex!0 (size!5115 (buf!5656 b1!101)) (currentByte!10558 b1!101) (currentBit!10553 b1!101)) bits!86)))))

(assert (= (and start!48368 res!192287) b!229365))

(assert (= (and b!229365 res!192285) b!229367))

(assert (= (and b!229367 res!192288) b!229371))

(assert (= (and b!229371 res!192286) b!229370))

(assert (= (and b!229370 res!192289) b!229369))

(assert (= start!48368 b!229368))

(assert (= start!48368 b!229366))

(declare-fun m!353067 () Bool)

(assert (=> b!229365 m!353067))

(declare-fun m!353069 () Bool)

(assert (=> b!229367 m!353069))

(declare-fun m!353071 () Bool)

(assert (=> b!229371 m!353071))

(declare-fun m!353073 () Bool)

(assert (=> b!229369 m!353073))

(declare-fun m!353075 () Bool)

(assert (=> b!229368 m!353075))

(declare-fun m!353077 () Bool)

(assert (=> start!48368 m!353077))

(declare-fun m!353079 () Bool)

(assert (=> start!48368 m!353079))

(declare-fun m!353081 () Bool)

(assert (=> b!229366 m!353081))

(push 1)

(assert (not b!229369))

(assert (not b!229371))

(assert (not b!229365))

(assert (not start!48368))

(assert (not b!229366))

(assert (not b!229367))

(assert (not b!229368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77850 () Bool)

(declare-fun e!157434 () Bool)

(assert (=> d!77850 e!157434))

(declare-fun res!192311 () Bool)

(assert (=> d!77850 (=> (not res!192311) (not e!157434))))

(declare-fun lt!367360 () (_ BitVec 64))

(declare-fun lt!367362 () (_ BitVec 64))

(declare-fun lt!367359 () (_ BitVec 64))

(assert (=> d!77850 (= res!192311 (= lt!367359 (bvsub lt!367360 lt!367362)))))

(assert (=> d!77850 (or (= (bvand lt!367360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367362 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367360 lt!367362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77850 (= lt!367362 (remainingBits!0 ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))) ((_ sign_extend 32) (currentByte!10558 b1!101)) ((_ sign_extend 32) (currentBit!10553 b1!101))))))

(declare-fun lt!367358 () (_ BitVec 64))

(declare-fun lt!367361 () (_ BitVec 64))

(assert (=> d!77850 (= lt!367360 (bvmul lt!367358 lt!367361))))

(assert (=> d!77850 (or (= lt!367358 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367361 (bvsdiv (bvmul lt!367358 lt!367361) lt!367358)))))

(assert (=> d!77850 (= lt!367361 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77850 (= lt!367358 ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))))))

(assert (=> d!77850 (= lt!367359 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10558 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10553 b1!101))))))

(assert (=> d!77850 (invariant!0 (currentBit!10553 b1!101) (currentByte!10558 b1!101) (size!5115 (buf!5656 b1!101)))))

(assert (=> d!77850 (= (bitIndex!0 (size!5115 (buf!5656 b1!101)) (currentByte!10558 b1!101) (currentBit!10553 b1!101)) lt!367359)))

(declare-fun b!229392 () Bool)

(declare-fun res!192310 () Bool)

(assert (=> b!229392 (=> (not res!192310) (not e!157434))))

(assert (=> b!229392 (= res!192310 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367359))))

(declare-fun b!229393 () Bool)

(declare-fun lt!367357 () (_ BitVec 64))

(assert (=> b!229393 (= e!157434 (bvsle lt!367359 (bvmul lt!367357 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229393 (or (= lt!367357 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367357 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367357)))))

(assert (=> b!229393 (= lt!367357 ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))))))

(assert (= (and d!77850 res!192311) b!229392))

(assert (= (and b!229392 res!192310) b!229393))

(declare-fun m!353099 () Bool)

(assert (=> d!77850 m!353099))

(declare-fun m!353101 () Bool)

(assert (=> d!77850 m!353101))

(assert (=> b!229371 d!77850))

(declare-fun d!77856 () Bool)

(assert (=> d!77856 (= (array_inv!4856 (buf!5656 b2!99)) (bvsge (size!5115 (buf!5656 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229366 d!77856))

(declare-fun d!77858 () Bool)

(declare-fun e!157435 () Bool)

(assert (=> d!77858 e!157435))

(declare-fun res!192313 () Bool)

(assert (=> d!77858 (=> (not res!192313) (not e!157435))))

(declare-fun lt!367365 () (_ BitVec 64))

(declare-fun lt!367366 () (_ BitVec 64))

(declare-fun lt!367368 () (_ BitVec 64))

(assert (=> d!77858 (= res!192313 (= lt!367365 (bvsub lt!367366 lt!367368)))))

(assert (=> d!77858 (or (= (bvand lt!367366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367368 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367366 lt!367368) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77858 (= lt!367368 (remainingBits!0 ((_ sign_extend 32) (size!5115 (buf!5656 b2!99))) ((_ sign_extend 32) (currentByte!10558 b2!99)) ((_ sign_extend 32) (currentBit!10553 b2!99))))))

(declare-fun lt!367364 () (_ BitVec 64))

(declare-fun lt!367367 () (_ BitVec 64))

(assert (=> d!77858 (= lt!367366 (bvmul lt!367364 lt!367367))))

(assert (=> d!77858 (or (= lt!367364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367367 (bvsdiv (bvmul lt!367364 lt!367367) lt!367364)))))

(assert (=> d!77858 (= lt!367367 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77858 (= lt!367364 ((_ sign_extend 32) (size!5115 (buf!5656 b2!99))))))

(assert (=> d!77858 (= lt!367365 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10558 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10553 b2!99))))))

(assert (=> d!77858 (invariant!0 (currentBit!10553 b2!99) (currentByte!10558 b2!99) (size!5115 (buf!5656 b2!99)))))

(assert (=> d!77858 (= (bitIndex!0 (size!5115 (buf!5656 b2!99)) (currentByte!10558 b2!99) (currentBit!10553 b2!99)) lt!367365)))

(declare-fun b!229394 () Bool)

(declare-fun res!192312 () Bool)

(assert (=> b!229394 (=> (not res!192312) (not e!157435))))

(assert (=> b!229394 (= res!192312 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367365))))

(declare-fun b!229395 () Bool)

(declare-fun lt!367363 () (_ BitVec 64))

(assert (=> b!229395 (= e!157435 (bvsle lt!367365 (bvmul lt!367363 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229395 (or (= lt!367363 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367363 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367363)))))

(assert (=> b!229395 (= lt!367363 ((_ sign_extend 32) (size!5115 (buf!5656 b2!99))))))

(assert (= (and d!77858 res!192313) b!229394))

(assert (= (and b!229394 res!192312) b!229395))

(declare-fun m!353103 () Bool)

(assert (=> d!77858 m!353103))

(declare-fun m!353105 () Bool)

(assert (=> d!77858 m!353105))

(assert (=> b!229365 d!77858))

(declare-fun d!77860 () Bool)

(assert (=> d!77860 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10553 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10558 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10553 b1!101))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10553 b1!101))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10558 b1!101))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10558 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10553 b1!101))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10558 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5115 (buf!5656 b1!101)))))))))))

(assert (=> b!229369 d!77860))

(declare-fun d!77862 () Bool)

(assert (=> d!77862 (= (array_inv!4856 (buf!5656 b1!101)) (bvsge (size!5115 (buf!5656 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229368 d!77862))

(declare-fun d!77864 () Bool)

(assert (=> d!77864 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))) ((_ sign_extend 32) (currentByte!10558 b1!101)) ((_ sign_extend 32) (currentBit!10553 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5115 (buf!5656 b1!101))) ((_ sign_extend 32) (currentByte!10558 b1!101)) ((_ sign_extend 32) (currentBit!10553 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19071 () Bool)

(assert (= bs!19071 d!77864))

(assert (=> bs!19071 m!353099))

(assert (=> b!229367 d!77864))

(declare-fun d!77866 () Bool)

(assert (=> d!77866 (= (inv!12 b1!101) (invariant!0 (currentBit!10553 b1!101) (currentByte!10558 b1!101) (size!5115 (buf!5656 b1!101))))))

(declare-fun bs!19072 () Bool)

(assert (= bs!19072 d!77866))

(assert (=> bs!19072 m!353101))

(assert (=> start!48368 d!77866))

(declare-fun d!77868 () Bool)

(assert (=> d!77868 (= (inv!12 b2!99) (invariant!0 (currentBit!10553 b2!99) (currentByte!10558 b2!99) (size!5115 (buf!5656 b2!99))))))

(declare-fun bs!19073 () Bool)

(assert (= bs!19073 d!77868))

(assert (=> bs!19073 m!353105))

(assert (=> start!48368 d!77868))

(push 1)

