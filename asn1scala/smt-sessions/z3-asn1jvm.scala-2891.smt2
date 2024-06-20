; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69228 () Bool)

(assert start!69228)

(declare-fun res!255237 () Bool)

(declare-fun e!224025 () Bool)

(assert (=> start!69228 (=> (not res!255237) (not e!224025))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19044 0))(
  ( (array!19045 (arr!9341 (Array (_ BitVec 32) (_ BitVec 8))) (size!8261 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13626 0))(
  ( (BitStream!13627 (buf!7874 array!19044) (currentByte!14520 (_ BitVec 32)) (currentBit!14515 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13626)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13626)

(assert (=> start!69228 (= res!255237 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8261 (buf!7874 b1!97)) (size!8261 (buf!7874 b2!97)))))))

(assert (=> start!69228 e!224025))

(assert (=> start!69228 true))

(declare-fun e!224023 () Bool)

(declare-fun inv!12 (BitStream!13626) Bool)

(assert (=> start!69228 (and (inv!12 b1!97) e!224023)))

(declare-fun e!224027 () Bool)

(assert (=> start!69228 (and (inv!12 b2!97) e!224027)))

(declare-fun b!311563 () Bool)

(declare-fun e!224024 () Bool)

(declare-fun e!224021 () Bool)

(assert (=> b!311563 (= e!224024 e!224021)))

(declare-fun res!255235 () Bool)

(assert (=> b!311563 (=> (not res!255235) (not e!224021))))

(declare-fun lt!441248 () (_ BitVec 64))

(declare-fun lt!441246 () (_ BitVec 64))

(declare-fun lt!441247 () (_ BitVec 64))

(assert (=> b!311563 (= res!255235 (and (bvsle lt!441246 (bvadd lt!441247 advancedAtMostBits!9)) (bvsge (bvsub lt!441248 lt!441246) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (bvsle ((_ sign_extend 32) (size!8261 (buf!7874 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14520 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14515 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8261 (buf!7874 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14520 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14515 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!311563 (= lt!441246 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14520 b2!97))) ((_ sign_extend 32) (currentBit!14515 b2!97))))))

(declare-fun b!311564 () Bool)

(assert (=> b!311564 (= e!224025 e!224024)))

(declare-fun res!255236 () Bool)

(assert (=> b!311564 (=> (not res!255236) (not e!224024))))

(assert (=> b!311564 (= res!255236 (bvsge (bvsub lt!441248 lt!441247) b1ValidateOffsetBits!10))))

(assert (=> b!311564 (= lt!441247 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14520 b1!97))) ((_ sign_extend 32) (currentBit!14515 b1!97))))))

(assert (=> b!311564 (= lt!441248 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8261 (buf!7874 b1!97)))))))

(declare-fun b!311565 () Bool)

(declare-fun res!255233 () Bool)

(assert (=> b!311565 (=> (not res!255233) (not e!224025))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311565 (= res!255233 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8261 (buf!7874 b1!97))) ((_ sign_extend 32) (currentByte!14520 b1!97)) ((_ sign_extend 32) (currentBit!14515 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311566 () Bool)

(declare-fun array_inv!7813 (array!19044) Bool)

(assert (=> b!311566 (= e!224027 (array_inv!7813 (buf!7874 b2!97)))))

(declare-fun b!311567 () Bool)

(declare-fun res!255234 () Bool)

(assert (=> b!311567 (=> (not res!255234) (not e!224025))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311567 (= res!255234 (validate_offset_bits!1 ((_ sign_extend 32) (size!8261 (buf!7874 b1!97))) ((_ sign_extend 32) (currentByte!14520 b1!97)) ((_ sign_extend 32) (currentBit!14515 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311568 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311568 (= e!224021 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14515 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14520 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8261 (buf!7874 b2!97)))))))))

(declare-fun b!311569 () Bool)

(assert (=> b!311569 (= e!224023 (array_inv!7813 (buf!7874 b1!97)))))

(declare-fun b!311570 () Bool)

(declare-fun res!255238 () Bool)

(assert (=> b!311570 (=> (not res!255238) (not e!224025))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311570 (= res!255238 (bvsle (bitIndex!0 (size!8261 (buf!7874 b2!97)) (currentByte!14520 b2!97) (currentBit!14515 b2!97)) (bvadd (bitIndex!0 (size!8261 (buf!7874 b1!97)) (currentByte!14520 b1!97) (currentBit!14515 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69228 res!255237) b!311567))

(assert (= (and b!311567 res!255234) b!311570))

(assert (= (and b!311570 res!255238) b!311565))

(assert (= (and b!311565 res!255233) b!311564))

(assert (= (and b!311564 res!255236) b!311563))

(assert (= (and b!311563 res!255235) b!311568))

(assert (= start!69228 b!311569))

(assert (= start!69228 b!311566))

(declare-fun m!449417 () Bool)

(assert (=> b!311569 m!449417))

(declare-fun m!449419 () Bool)

(assert (=> b!311568 m!449419))

(declare-fun m!449421 () Bool)

(assert (=> start!69228 m!449421))

(declare-fun m!449423 () Bool)

(assert (=> start!69228 m!449423))

(declare-fun m!449425 () Bool)

(assert (=> b!311566 m!449425))

(declare-fun m!449427 () Bool)

(assert (=> b!311567 m!449427))

(declare-fun m!449429 () Bool)

(assert (=> b!311570 m!449429))

(declare-fun m!449431 () Bool)

(assert (=> b!311570 m!449431))

(declare-fun m!449433 () Bool)

(assert (=> b!311565 m!449433))

(check-sat (not b!311569) (not b!311568) (not b!311570) (not b!311565) (not b!311566) (not b!311567) (not start!69228))
(check-sat)
(get-model)

(declare-fun d!103354 () Bool)

(assert (=> d!103354 (= (array_inv!7813 (buf!7874 b1!97)) (bvsge (size!8261 (buf!7874 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311569 d!103354))

(declare-fun d!103356 () Bool)

(assert (=> d!103356 (= (remainingBits!0 ((_ sign_extend 32) (size!8261 (buf!7874 b1!97))) ((_ sign_extend 32) (currentByte!14520 b1!97)) ((_ sign_extend 32) (currentBit!14515 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8261 (buf!7874 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14520 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14515 b1!97)))))))

(assert (=> b!311565 d!103356))

(declare-fun d!103358 () Bool)

(declare-fun e!224051 () Bool)

(assert (=> d!103358 e!224051))

(declare-fun res!255261 () Bool)

(assert (=> d!103358 (=> (not res!255261) (not e!224051))))

(declare-fun lt!441272 () (_ BitVec 64))

(declare-fun lt!441271 () (_ BitVec 64))

(declare-fun lt!441273 () (_ BitVec 64))

(assert (=> d!103358 (= res!255261 (= lt!441272 (bvsub lt!441273 lt!441271)))))

(assert (=> d!103358 (or (= (bvand lt!441273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441271 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441273 lt!441271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103358 (= lt!441271 (remainingBits!0 ((_ sign_extend 32) (size!8261 (buf!7874 b2!97))) ((_ sign_extend 32) (currentByte!14520 b2!97)) ((_ sign_extend 32) (currentBit!14515 b2!97))))))

(declare-fun lt!441275 () (_ BitVec 64))

(declare-fun lt!441270 () (_ BitVec 64))

(assert (=> d!103358 (= lt!441273 (bvmul lt!441275 lt!441270))))

(assert (=> d!103358 (or (= lt!441275 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441270 (bvsdiv (bvmul lt!441275 lt!441270) lt!441275)))))

(assert (=> d!103358 (= lt!441270 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103358 (= lt!441275 ((_ sign_extend 32) (size!8261 (buf!7874 b2!97))))))

(assert (=> d!103358 (= lt!441272 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14520 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14515 b2!97))))))

(assert (=> d!103358 (invariant!0 (currentBit!14515 b2!97) (currentByte!14520 b2!97) (size!8261 (buf!7874 b2!97)))))

(assert (=> d!103358 (= (bitIndex!0 (size!8261 (buf!7874 b2!97)) (currentByte!14520 b2!97) (currentBit!14515 b2!97)) lt!441272)))

(declare-fun b!311599 () Bool)

(declare-fun res!255262 () Bool)

(assert (=> b!311599 (=> (not res!255262) (not e!224051))))

(assert (=> b!311599 (= res!255262 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441272))))

(declare-fun b!311600 () Bool)

(declare-fun lt!441274 () (_ BitVec 64))

(assert (=> b!311600 (= e!224051 (bvsle lt!441272 (bvmul lt!441274 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311600 (or (= lt!441274 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441274 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441274)))))

(assert (=> b!311600 (= lt!441274 ((_ sign_extend 32) (size!8261 (buf!7874 b2!97))))))

(assert (= (and d!103358 res!255261) b!311599))

(assert (= (and b!311599 res!255262) b!311600))

(declare-fun m!449453 () Bool)

(assert (=> d!103358 m!449453))

(declare-fun m!449455 () Bool)

(assert (=> d!103358 m!449455))

(assert (=> b!311570 d!103358))

(declare-fun d!103360 () Bool)

(declare-fun e!224052 () Bool)

(assert (=> d!103360 e!224052))

(declare-fun res!255263 () Bool)

(assert (=> d!103360 (=> (not res!255263) (not e!224052))))

(declare-fun lt!441277 () (_ BitVec 64))

(declare-fun lt!441278 () (_ BitVec 64))

(declare-fun lt!441279 () (_ BitVec 64))

(assert (=> d!103360 (= res!255263 (= lt!441278 (bvsub lt!441279 lt!441277)))))

(assert (=> d!103360 (or (= (bvand lt!441279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441277 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441279 lt!441277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103360 (= lt!441277 (remainingBits!0 ((_ sign_extend 32) (size!8261 (buf!7874 b1!97))) ((_ sign_extend 32) (currentByte!14520 b1!97)) ((_ sign_extend 32) (currentBit!14515 b1!97))))))

(declare-fun lt!441281 () (_ BitVec 64))

(declare-fun lt!441276 () (_ BitVec 64))

(assert (=> d!103360 (= lt!441279 (bvmul lt!441281 lt!441276))))

(assert (=> d!103360 (or (= lt!441281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441276 (bvsdiv (bvmul lt!441281 lt!441276) lt!441281)))))

(assert (=> d!103360 (= lt!441276 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103360 (= lt!441281 ((_ sign_extend 32) (size!8261 (buf!7874 b1!97))))))

(assert (=> d!103360 (= lt!441278 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14520 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14515 b1!97))))))

(assert (=> d!103360 (invariant!0 (currentBit!14515 b1!97) (currentByte!14520 b1!97) (size!8261 (buf!7874 b1!97)))))

(assert (=> d!103360 (= (bitIndex!0 (size!8261 (buf!7874 b1!97)) (currentByte!14520 b1!97) (currentBit!14515 b1!97)) lt!441278)))

(declare-fun b!311601 () Bool)

(declare-fun res!255264 () Bool)

(assert (=> b!311601 (=> (not res!255264) (not e!224052))))

(assert (=> b!311601 (= res!255264 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441278))))

(declare-fun b!311602 () Bool)

(declare-fun lt!441280 () (_ BitVec 64))

(assert (=> b!311602 (= e!224052 (bvsle lt!441278 (bvmul lt!441280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311602 (or (= lt!441280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441280)))))

(assert (=> b!311602 (= lt!441280 ((_ sign_extend 32) (size!8261 (buf!7874 b1!97))))))

(assert (= (and d!103360 res!255263) b!311601))

(assert (= (and b!311601 res!255264) b!311602))

(assert (=> d!103360 m!449433))

(declare-fun m!449457 () Bool)

(assert (=> d!103360 m!449457))

(assert (=> b!311570 d!103360))

(declare-fun d!103362 () Bool)

(assert (=> d!103362 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8261 (buf!7874 b1!97))) ((_ sign_extend 32) (currentByte!14520 b1!97)) ((_ sign_extend 32) (currentBit!14515 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8261 (buf!7874 b1!97))) ((_ sign_extend 32) (currentByte!14520 b1!97)) ((_ sign_extend 32) (currentBit!14515 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26750 () Bool)

(assert (= bs!26750 d!103362))

(assert (=> bs!26750 m!449433))

(assert (=> b!311567 d!103362))

(declare-fun d!103364 () Bool)

(assert (=> d!103364 (= (array_inv!7813 (buf!7874 b2!97)) (bvsge (size!8261 (buf!7874 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311566 d!103364))

(declare-fun d!103366 () Bool)

(assert (=> d!103366 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14515 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14520 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8261 (buf!7874 b2!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14515 b2!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14515 b2!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14520 b2!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14520 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8261 (buf!7874 b2!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14515 b2!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14520 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8261 (buf!7874 b2!97)))))))))))

(assert (=> b!311568 d!103366))

(declare-fun d!103368 () Bool)

(assert (=> d!103368 (= (inv!12 b1!97) (invariant!0 (currentBit!14515 b1!97) (currentByte!14520 b1!97) (size!8261 (buf!7874 b1!97))))))

(declare-fun bs!26751 () Bool)

(assert (= bs!26751 d!103368))

(assert (=> bs!26751 m!449457))

(assert (=> start!69228 d!103368))

(declare-fun d!103370 () Bool)

(assert (=> d!103370 (= (inv!12 b2!97) (invariant!0 (currentBit!14515 b2!97) (currentByte!14520 b2!97) (size!8261 (buf!7874 b2!97))))))

(declare-fun bs!26752 () Bool)

(assert (= bs!26752 d!103370))

(assert (=> bs!26752 m!449455))

(assert (=> start!69228 d!103370))

(check-sat (not d!103362) (not d!103370) (not d!103360) (not d!103358) (not d!103368))
