; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69192 () Bool)

(assert start!69192)

(declare-fun b!311493 () Bool)

(declare-fun res!255177 () Bool)

(declare-fun e!223973 () Bool)

(assert (=> b!311493 (=> (not res!255177) (not e!223973))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19037 0))(
  ( (array!19038 (arr!9339 (Array (_ BitVec 32) (_ BitVec 8))) (size!8259 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13622 0))(
  ( (BitStream!13623 (buf!7872 array!19037) (currentByte!14508 (_ BitVec 32)) (currentBit!14503 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13622)

(declare-fun b2!97 () BitStream!13622)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311493 (= res!255177 (bvsle (bitIndex!0 (size!8259 (buf!7872 b2!97)) (currentByte!14508 b2!97) (currentBit!14503 b2!97)) (bvadd (bitIndex!0 (size!8259 (buf!7872 b1!97)) (currentByte!14508 b1!97) (currentBit!14503 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!255175 () Bool)

(assert (=> start!69192 (=> (not res!255175) (not e!223973))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69192 (= res!255175 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8259 (buf!7872 b1!97)) (size!8259 (buf!7872 b2!97)))))))

(assert (=> start!69192 e!223973))

(assert (=> start!69192 true))

(declare-fun e!223970 () Bool)

(declare-fun inv!12 (BitStream!13622) Bool)

(assert (=> start!69192 (and (inv!12 b1!97) e!223970)))

(declare-fun e!223971 () Bool)

(assert (=> start!69192 (and (inv!12 b2!97) e!223971)))

(declare-fun lt!441158 () (_ BitVec 64))

(declare-fun b!311494 () Bool)

(declare-fun lt!441157 () (_ BitVec 64))

(assert (=> b!311494 (= e!223973 (and (bvsge (bvsub lt!441157 lt!441158) b1ValidateOffsetBits!10) (let ((bdg!18594 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14508 b2!97))) ((_ sign_extend 32) (currentBit!14503 b2!97))))) (and (bvsle bdg!18594 (bvadd lt!441158 advancedAtMostBits!9)) (bvsge (bvsub lt!441157 bdg!18594) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (bvsle ((_ sign_extend 32) (size!8259 (buf!7872 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14508 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14503 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8259 (buf!7872 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14508 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14503 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!311494 (= lt!441158 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14508 b1!97))) ((_ sign_extend 32) (currentBit!14503 b1!97))))))

(assert (=> b!311494 (= lt!441157 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8259 (buf!7872 b1!97)))))))

(declare-fun b!311495 () Bool)

(declare-fun res!255176 () Bool)

(assert (=> b!311495 (=> (not res!255176) (not e!223973))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311495 (= res!255176 (validate_offset_bits!1 ((_ sign_extend 32) (size!8259 (buf!7872 b1!97))) ((_ sign_extend 32) (currentByte!14508 b1!97)) ((_ sign_extend 32) (currentBit!14503 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311496 () Bool)

(declare-fun res!255178 () Bool)

(assert (=> b!311496 (=> (not res!255178) (not e!223973))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311496 (= res!255178 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8259 (buf!7872 b1!97))) ((_ sign_extend 32) (currentByte!14508 b1!97)) ((_ sign_extend 32) (currentBit!14503 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311497 () Bool)

(declare-fun array_inv!7811 (array!19037) Bool)

(assert (=> b!311497 (= e!223970 (array_inv!7811 (buf!7872 b1!97)))))

(declare-fun b!311498 () Bool)

(assert (=> b!311498 (= e!223971 (array_inv!7811 (buf!7872 b2!97)))))

(assert (= (and start!69192 res!255175) b!311495))

(assert (= (and b!311495 res!255176) b!311493))

(assert (= (and b!311493 res!255177) b!311496))

(assert (= (and b!311496 res!255178) b!311494))

(assert (= start!69192 b!311497))

(assert (= start!69192 b!311498))

(declare-fun m!449365 () Bool)

(assert (=> b!311498 m!449365))

(declare-fun m!449367 () Bool)

(assert (=> b!311496 m!449367))

(declare-fun m!449369 () Bool)

(assert (=> start!69192 m!449369))

(declare-fun m!449371 () Bool)

(assert (=> start!69192 m!449371))

(declare-fun m!449373 () Bool)

(assert (=> b!311497 m!449373))

(declare-fun m!449375 () Bool)

(assert (=> b!311493 m!449375))

(declare-fun m!449377 () Bool)

(assert (=> b!311493 m!449377))

(declare-fun m!449379 () Bool)

(assert (=> b!311495 m!449379))

(push 1)

(assert (not start!69192))

(assert (not b!311498))

(assert (not b!311497))

(assert (not b!311496))

(assert (not b!311495))

(assert (not b!311493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103330 () Bool)

(assert (=> d!103330 (= (remainingBits!0 ((_ sign_extend 32) (size!8259 (buf!7872 b1!97))) ((_ sign_extend 32) (currentByte!14508 b1!97)) ((_ sign_extend 32) (currentBit!14503 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8259 (buf!7872 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14508 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14503 b1!97)))))))

(assert (=> b!311496 d!103330))

(declare-fun d!103332 () Bool)

(assert (=> d!103332 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8259 (buf!7872 b1!97))) ((_ sign_extend 32) (currentByte!14508 b1!97)) ((_ sign_extend 32) (currentBit!14503 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8259 (buf!7872 b1!97))) ((_ sign_extend 32) (currentByte!14508 b1!97)) ((_ sign_extend 32) (currentBit!14503 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26744 () Bool)

(assert (= bs!26744 d!103332))

(assert (=> bs!26744 m!449367))

(assert (=> b!311495 d!103332))

(declare-fun d!103334 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103334 (= (inv!12 b1!97) (invariant!0 (currentBit!14503 b1!97) (currentByte!14508 b1!97) (size!8259 (buf!7872 b1!97))))))

(declare-fun bs!26745 () Bool)

(assert (= bs!26745 d!103334))

(declare-fun m!449393 () Bool)

(assert (=> bs!26745 m!449393))

(assert (=> start!69192 d!103334))

(declare-fun d!103336 () Bool)

(assert (=> d!103336 (= (inv!12 b2!97) (invariant!0 (currentBit!14503 b2!97) (currentByte!14508 b2!97) (size!8259 (buf!7872 b2!97))))))

(declare-fun bs!26746 () Bool)

(assert (= bs!26746 d!103336))

(declare-fun m!449395 () Bool)

(assert (=> bs!26746 m!449395))

(assert (=> start!69192 d!103336))

(declare-fun d!103338 () Bool)

(declare-fun e!223984 () Bool)

(assert (=> d!103338 e!223984))

(declare-fun res!255199 () Bool)

(assert (=> d!103338 (=> (not res!255199) (not e!223984))))

(declare-fun lt!441224 () (_ BitVec 64))

(declare-fun lt!441221 () (_ BitVec 64))

(declare-fun lt!441223 () (_ BitVec 64))

(assert (=> d!103338 (= res!255199 (= lt!441223 (bvsub lt!441224 lt!441221)))))

(assert (=> d!103338 (or (= (bvand lt!441224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441224 lt!441221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103338 (= lt!441221 (remainingBits!0 ((_ sign_extend 32) (size!8259 (buf!7872 b2!97))) ((_ sign_extend 32) (currentByte!14508 b2!97)) ((_ sign_extend 32) (currentBit!14503 b2!97))))))

(declare-fun lt!441219 () (_ BitVec 64))

(declare-fun lt!441222 () (_ BitVec 64))

(assert (=> d!103338 (= lt!441224 (bvmul lt!441219 lt!441222))))

(assert (=> d!103338 (or (= lt!441219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441222 (bvsdiv (bvmul lt!441219 lt!441222) lt!441219)))))

(assert (=> d!103338 (= lt!441222 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103338 (= lt!441219 ((_ sign_extend 32) (size!8259 (buf!7872 b2!97))))))

(assert (=> d!103338 (= lt!441223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14508 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14503 b2!97))))))

(assert (=> d!103338 (invariant!0 (currentBit!14503 b2!97) (currentByte!14508 b2!97) (size!8259 (buf!7872 b2!97)))))

(assert (=> d!103338 (= (bitIndex!0 (size!8259 (buf!7872 b2!97)) (currentByte!14508 b2!97) (currentBit!14503 b2!97)) lt!441223)))

(declare-fun b!311519 () Bool)

(declare-fun res!255200 () Bool)

(assert (=> b!311519 (=> (not res!255200) (not e!223984))))

(assert (=> b!311519 (= res!255200 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441223))))

(declare-fun b!311520 () Bool)

(declare-fun lt!441220 () (_ BitVec 64))

(assert (=> b!311520 (= e!223984 (bvsle lt!441223 (bvmul lt!441220 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311520 (or (= lt!441220 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441220 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441220)))))

(assert (=> b!311520 (= lt!441220 ((_ sign_extend 32) (size!8259 (buf!7872 b2!97))))))

(assert (= (and d!103338 res!255199) b!311519))

(assert (= (and b!311519 res!255200) b!311520))

(declare-fun m!449397 () Bool)

(assert (=> d!103338 m!449397))

(assert (=> d!103338 m!449395))

(assert (=> b!311493 d!103338))

(declare-fun d!103340 () Bool)

(declare-fun e!223985 () Bool)

(assert (=> d!103340 e!223985))

(declare-fun res!255201 () Bool)

(assert (=> d!103340 (=> (not res!255201) (not e!223985))))

(declare-fun lt!441229 () (_ BitVec 64))

(declare-fun lt!441230 () (_ BitVec 64))

(declare-fun lt!441227 () (_ BitVec 64))

(assert (=> d!103340 (= res!255201 (= lt!441229 (bvsub lt!441230 lt!441227)))))

(assert (=> d!103340 (or (= (bvand lt!441230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441227 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441230 lt!441227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103340 (= lt!441227 (remainingBits!0 ((_ sign_extend 32) (size!8259 (buf!7872 b1!97))) ((_ sign_extend 32) (currentByte!14508 b1!97)) ((_ sign_extend 32) (currentBit!14503 b1!97))))))

(declare-fun lt!441225 () (_ BitVec 64))

(declare-fun lt!441228 () (_ BitVec 64))

(assert (=> d!103340 (= lt!441230 (bvmul lt!441225 lt!441228))))

(assert (=> d!103340 (or (= lt!441225 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441228 (bvsdiv (bvmul lt!441225 lt!441228) lt!441225)))))

(assert (=> d!103340 (= lt!441228 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103340 (= lt!441225 ((_ sign_extend 32) (size!8259 (buf!7872 b1!97))))))

(assert (=> d!103340 (= lt!441229 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14508 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14503 b1!97))))))

(assert (=> d!103340 (invariant!0 (currentBit!14503 b1!97) (currentByte!14508 b1!97) (size!8259 (buf!7872 b1!97)))))

(assert (=> d!103340 (= (bitIndex!0 (size!8259 (buf!7872 b1!97)) (currentByte!14508 b1!97) (currentBit!14503 b1!97)) lt!441229)))

(declare-fun b!311521 () Bool)

(declare-fun res!255202 () Bool)

(assert (=> b!311521 (=> (not res!255202) (not e!223985))))

(assert (=> b!311521 (= res!255202 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441229))))

(declare-fun b!311522 () Bool)

(declare-fun lt!441226 () (_ BitVec 64))

(assert (=> b!311522 (= e!223985 (bvsle lt!441229 (bvmul lt!441226 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311522 (or (= lt!441226 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441226 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441226)))))

(assert (=> b!311522 (= lt!441226 ((_ sign_extend 32) (size!8259 (buf!7872 b1!97))))))

(assert (= (and d!103340 res!255201) b!311521))

(assert (= (and b!311521 res!255202) b!311522))

(assert (=> d!103340 m!449367))

(assert (=> d!103340 m!449393))

(assert (=> b!311493 d!103340))

(declare-fun d!103342 () Bool)

(assert (=> d!103342 (= (array_inv!7811 (buf!7872 b1!97)) (bvsge (size!8259 (buf!7872 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311497 d!103342))

(declare-fun d!103344 () Bool)

(assert (=> d!103344 (= (array_inv!7811 (buf!7872 b2!97)) (bvsge (size!8259 (buf!7872 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311498 d!103344))

(push 1)

(assert (not d!103334))

(assert (not d!103340))

(assert (not d!103338))

(assert (not d!103336))

(assert (not d!103332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

