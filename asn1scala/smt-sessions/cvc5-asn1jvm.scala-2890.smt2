; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69188 () Bool)

(assert start!69188)

(declare-fun b!311457 () Bool)

(declare-fun res!255152 () Bool)

(declare-fun e!223939 () Bool)

(assert (=> b!311457 (=> (not res!255152) (not e!223939))))

(declare-datatypes ((array!19033 0))(
  ( (array!19034 (arr!9337 (Array (_ BitVec 32) (_ BitVec 8))) (size!8257 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13618 0))(
  ( (BitStream!13619 (buf!7870 array!19033) (currentByte!14506 (_ BitVec 32)) (currentBit!14501 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13618)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311457 (= res!255152 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8257 (buf!7870 b1!97))) ((_ sign_extend 32) (currentByte!14506 b1!97)) ((_ sign_extend 32) (currentBit!14501 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun lt!441145 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13618)

(declare-fun b!311458 () Bool)

(declare-fun lt!441146 () (_ BitVec 64))

(assert (=> b!311458 (= e!223939 (and (bvsge (bvsub lt!441146 lt!441145) b1ValidateOffsetBits!10) (let ((bdg!18594 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14506 b2!97))) ((_ sign_extend 32) (currentBit!14501 b2!97))))) (and (bvsle bdg!18594 (bvadd lt!441145 advancedAtMostBits!9)) (bvsge (bvsub lt!441146 bdg!18594) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (bvsle ((_ sign_extend 32) (size!8257 (buf!7870 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14506 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14501 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8257 (buf!7870 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14506 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14501 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!311458 (= lt!441145 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14506 b1!97))) ((_ sign_extend 32) (currentBit!14501 b1!97))))))

(assert (=> b!311458 (= lt!441146 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8257 (buf!7870 b1!97)))))))

(declare-fun res!255151 () Bool)

(assert (=> start!69188 (=> (not res!255151) (not e!223939))))

(assert (=> start!69188 (= res!255151 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8257 (buf!7870 b1!97)) (size!8257 (buf!7870 b2!97)))))))

(assert (=> start!69188 e!223939))

(assert (=> start!69188 true))

(declare-fun e!223941 () Bool)

(declare-fun inv!12 (BitStream!13618) Bool)

(assert (=> start!69188 (and (inv!12 b1!97) e!223941)))

(declare-fun e!223942 () Bool)

(assert (=> start!69188 (and (inv!12 b2!97) e!223942)))

(declare-fun b!311459 () Bool)

(declare-fun array_inv!7809 (array!19033) Bool)

(assert (=> b!311459 (= e!223942 (array_inv!7809 (buf!7870 b2!97)))))

(declare-fun b!311460 () Bool)

(assert (=> b!311460 (= e!223941 (array_inv!7809 (buf!7870 b1!97)))))

(declare-fun b!311461 () Bool)

(declare-fun res!255153 () Bool)

(assert (=> b!311461 (=> (not res!255153) (not e!223939))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311461 (= res!255153 (validate_offset_bits!1 ((_ sign_extend 32) (size!8257 (buf!7870 b1!97))) ((_ sign_extend 32) (currentByte!14506 b1!97)) ((_ sign_extend 32) (currentBit!14501 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311462 () Bool)

(declare-fun res!255154 () Bool)

(assert (=> b!311462 (=> (not res!255154) (not e!223939))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311462 (= res!255154 (bvsle (bitIndex!0 (size!8257 (buf!7870 b2!97)) (currentByte!14506 b2!97) (currentBit!14501 b2!97)) (bvadd (bitIndex!0 (size!8257 (buf!7870 b1!97)) (currentByte!14506 b1!97) (currentBit!14501 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69188 res!255151) b!311461))

(assert (= (and b!311461 res!255153) b!311462))

(assert (= (and b!311462 res!255154) b!311457))

(assert (= (and b!311457 res!255152) b!311458))

(assert (= start!69188 b!311460))

(assert (= start!69188 b!311459))

(declare-fun m!449333 () Bool)

(assert (=> b!311462 m!449333))

(declare-fun m!449335 () Bool)

(assert (=> b!311462 m!449335))

(declare-fun m!449337 () Bool)

(assert (=> start!69188 m!449337))

(declare-fun m!449339 () Bool)

(assert (=> start!69188 m!449339))

(declare-fun m!449341 () Bool)

(assert (=> b!311460 m!449341))

(declare-fun m!449343 () Bool)

(assert (=> b!311457 m!449343))

(declare-fun m!449345 () Bool)

(assert (=> b!311459 m!449345))

(declare-fun m!449347 () Bool)

(assert (=> b!311461 m!449347))

(push 1)

(assert (not start!69188))

(assert (not b!311459))

(assert (not b!311461))

(assert (not b!311462))

(assert (not b!311460))

(assert (not b!311457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103314 () Bool)

(declare-fun e!223980 () Bool)

(assert (=> d!103314 e!223980))

(declare-fun res!255191 () Bool)

(assert (=> d!103314 (=> (not res!255191) (not e!223980))))

(declare-fun lt!441197 () (_ BitVec 64))

(declare-fun lt!441195 () (_ BitVec 64))

(declare-fun lt!441199 () (_ BitVec 64))

(assert (=> d!103314 (= res!255191 (= lt!441197 (bvsub lt!441195 lt!441199)))))

(assert (=> d!103314 (or (= (bvand lt!441195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441199 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441195 lt!441199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103314 (= lt!441199 (remainingBits!0 ((_ sign_extend 32) (size!8257 (buf!7870 b2!97))) ((_ sign_extend 32) (currentByte!14506 b2!97)) ((_ sign_extend 32) (currentBit!14501 b2!97))))))

(declare-fun lt!441198 () (_ BitVec 64))

(declare-fun lt!441200 () (_ BitVec 64))

(assert (=> d!103314 (= lt!441195 (bvmul lt!441198 lt!441200))))

(assert (=> d!103314 (or (= lt!441198 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441200 (bvsdiv (bvmul lt!441198 lt!441200) lt!441198)))))

(assert (=> d!103314 (= lt!441200 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103314 (= lt!441198 ((_ sign_extend 32) (size!8257 (buf!7870 b2!97))))))

(assert (=> d!103314 (= lt!441197 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14506 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14501 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103314 (invariant!0 (currentBit!14501 b2!97) (currentByte!14506 b2!97) (size!8257 (buf!7870 b2!97)))))

(assert (=> d!103314 (= (bitIndex!0 (size!8257 (buf!7870 b2!97)) (currentByte!14506 b2!97) (currentBit!14501 b2!97)) lt!441197)))

(declare-fun b!311511 () Bool)

(declare-fun res!255192 () Bool)

(assert (=> b!311511 (=> (not res!255192) (not e!223980))))

(assert (=> b!311511 (= res!255192 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441197))))

(declare-fun b!311512 () Bool)

(declare-fun lt!441196 () (_ BitVec 64))

(assert (=> b!311512 (= e!223980 (bvsle lt!441197 (bvmul lt!441196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311512 (or (= lt!441196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441196)))))

(assert (=> b!311512 (= lt!441196 ((_ sign_extend 32) (size!8257 (buf!7870 b2!97))))))

(assert (= (and d!103314 res!255191) b!311511))

(assert (= (and b!311511 res!255192) b!311512))

(declare-fun m!449387 () Bool)

(assert (=> d!103314 m!449387))

(declare-fun m!449389 () Bool)

(assert (=> d!103314 m!449389))

(assert (=> b!311462 d!103314))

(declare-fun d!103316 () Bool)

(declare-fun e!223981 () Bool)

(assert (=> d!103316 e!223981))

(declare-fun res!255193 () Bool)

(assert (=> d!103316 (=> (not res!255193) (not e!223981))))

(declare-fun lt!441205 () (_ BitVec 64))

(declare-fun lt!441201 () (_ BitVec 64))

(declare-fun lt!441203 () (_ BitVec 64))

(assert (=> d!103316 (= res!255193 (= lt!441203 (bvsub lt!441201 lt!441205)))))

(assert (=> d!103316 (or (= (bvand lt!441201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441205 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441201 lt!441205) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103316 (= lt!441205 (remainingBits!0 ((_ sign_extend 32) (size!8257 (buf!7870 b1!97))) ((_ sign_extend 32) (currentByte!14506 b1!97)) ((_ sign_extend 32) (currentBit!14501 b1!97))))))

(declare-fun lt!441204 () (_ BitVec 64))

(declare-fun lt!441206 () (_ BitVec 64))

(assert (=> d!103316 (= lt!441201 (bvmul lt!441204 lt!441206))))

(assert (=> d!103316 (or (= lt!441204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441206 (bvsdiv (bvmul lt!441204 lt!441206) lt!441204)))))

(assert (=> d!103316 (= lt!441206 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103316 (= lt!441204 ((_ sign_extend 32) (size!8257 (buf!7870 b1!97))))))

(assert (=> d!103316 (= lt!441203 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14506 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14501 b1!97))))))

(assert (=> d!103316 (invariant!0 (currentBit!14501 b1!97) (currentByte!14506 b1!97) (size!8257 (buf!7870 b1!97)))))

(assert (=> d!103316 (= (bitIndex!0 (size!8257 (buf!7870 b1!97)) (currentByte!14506 b1!97) (currentBit!14501 b1!97)) lt!441203)))

(declare-fun b!311513 () Bool)

(declare-fun res!255194 () Bool)

(assert (=> b!311513 (=> (not res!255194) (not e!223981))))

(assert (=> b!311513 (= res!255194 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441203))))

(declare-fun b!311514 () Bool)

(declare-fun lt!441202 () (_ BitVec 64))

(assert (=> b!311514 (= e!223981 (bvsle lt!441203 (bvmul lt!441202 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311514 (or (= lt!441202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441202)))))

(assert (=> b!311514 (= lt!441202 ((_ sign_extend 32) (size!8257 (buf!7870 b1!97))))))

(assert (= (and d!103316 res!255193) b!311513))

(assert (= (and b!311513 res!255194) b!311514))

(assert (=> d!103316 m!449343))

(declare-fun m!449391 () Bool)

(assert (=> d!103316 m!449391))

(assert (=> b!311462 d!103316))

(declare-fun d!103318 () Bool)

(assert (=> d!103318 (= (remainingBits!0 ((_ sign_extend 32) (size!8257 (buf!7870 b1!97))) ((_ sign_extend 32) (currentByte!14506 b1!97)) ((_ sign_extend 32) (currentBit!14501 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8257 (buf!7870 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14506 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14501 b1!97)))))))

(assert (=> b!311457 d!103318))

(declare-fun d!103320 () Bool)

(assert (=> d!103320 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8257 (buf!7870 b1!97))) ((_ sign_extend 32) (currentByte!14506 b1!97)) ((_ sign_extend 32) (currentBit!14501 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8257 (buf!7870 b1!97))) ((_ sign_extend 32) (currentByte!14506 b1!97)) ((_ sign_extend 32) (currentBit!14501 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26741 () Bool)

(assert (= bs!26741 d!103320))

(assert (=> bs!26741 m!449343))

(assert (=> b!311461 d!103320))

(declare-fun d!103322 () Bool)

(assert (=> d!103322 (= (array_inv!7809 (buf!7870 b2!97)) (bvsge (size!8257 (buf!7870 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311459 d!103322))

(declare-fun d!103324 () Bool)

(assert (=> d!103324 (= (inv!12 b1!97) (invariant!0 (currentBit!14501 b1!97) (currentByte!14506 b1!97) (size!8257 (buf!7870 b1!97))))))

(declare-fun bs!26742 () Bool)

(assert (= bs!26742 d!103324))

(assert (=> bs!26742 m!449391))

(assert (=> start!69188 d!103324))

(declare-fun d!103326 () Bool)

(assert (=> d!103326 (= (inv!12 b2!97) (invariant!0 (currentBit!14501 b2!97) (currentByte!14506 b2!97) (size!8257 (buf!7870 b2!97))))))

(declare-fun bs!26743 () Bool)

(assert (= bs!26743 d!103326))

(assert (=> bs!26743 m!449389))

(assert (=> start!69188 d!103326))

(declare-fun d!103328 () Bool)

(assert (=> d!103328 (= (array_inv!7809 (buf!7870 b1!97)) (bvsge (size!8257 (buf!7870 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311460 d!103328))

(push 1)

(assert (not d!103326))

(assert (not d!103314))

(assert (not d!103324))

(assert (not d!103320))

(assert (not d!103316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!103316 d!103318))

(declare-fun d!103346 () Bool)

(assert (=> d!103346 (= (invariant!0 (currentBit!14501 b1!97) (currentByte!14506 b1!97) (size!8257 (buf!7870 b1!97))) (and (bvsge (currentBit!14501 b1!97) #b00000000000000000000000000000000) (bvslt (currentBit!14501 b1!97) #b00000000000000000000000000001000) (bvsge (currentByte!14506 b1!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14506 b1!97) (size!8257 (buf!7870 b1!97))) (and (= (currentBit!14501 b1!97) #b00000000000000000000000000000000) (= (currentByte!14506 b1!97) (size!8257 (buf!7870 b1!97)))))))))

(assert (=> d!103316 d!103346))

(assert (=> d!103320 d!103318))

(assert (=> d!103324 d!103346))

(declare-fun d!103348 () Bool)

(assert (=> d!103348 (= (remainingBits!0 ((_ sign_extend 32) (size!8257 (buf!7870 b2!97))) ((_ sign_extend 32) (currentByte!14506 b2!97)) ((_ sign_extend 32) (currentBit!14501 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8257 (buf!7870 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14506 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14501 b2!97)))))))

(assert (=> d!103314 d!103348))

(declare-fun d!103350 () Bool)

(assert (=> d!103350 (= (invariant!0 (currentBit!14501 b2!97) (currentByte!14506 b2!97) (size!8257 (buf!7870 b2!97))) (and (bvsge (currentBit!14501 b2!97) #b00000000000000000000000000000000) (bvslt (currentBit!14501 b2!97) #b00000000000000000000000000001000) (bvsge (currentByte!14506 b2!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14506 b2!97) (size!8257 (buf!7870 b2!97))) (and (= (currentBit!14501 b2!97) #b00000000000000000000000000000000) (= (currentByte!14506 b2!97) (size!8257 (buf!7870 b2!97)))))))))

(assert (=> d!103314 d!103350))

(assert (=> d!103326 d!103350))

(push 1)

(check-sat)

(pop 1)

