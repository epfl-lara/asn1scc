; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69148 () Bool)

(assert start!69148)

(declare-fun b!311343 () Bool)

(declare-fun res!255069 () Bool)

(declare-fun e!223856 () Bool)

(assert (=> b!311343 (=> (not res!255069) (not e!223856))))

(declare-datatypes ((array!19020 0))(
  ( (array!19021 (arr!9332 (Array (_ BitVec 32) (_ BitVec 8))) (size!8252 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13608 0))(
  ( (BitStream!13609 (buf!7865 array!19020) (currentByte!14492 (_ BitVec 32)) (currentBit!14487 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13608)

(assert (=> b!311343 (= res!255069 (and (bvsle ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14492 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14487 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14492 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14487 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!311344 () Bool)

(declare-fun res!255067 () Bool)

(assert (=> b!311344 (=> (not res!255067) (not e!223856))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13608)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311344 (= res!255067 (bvsle (bitIndex!0 (size!8252 (buf!7865 b2!97)) (currentByte!14492 b2!97) (currentBit!14487 b2!97)) (bvadd (bitIndex!0 (size!8252 (buf!7865 b1!97)) (currentByte!14492 b1!97) (currentBit!14487 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311345 () Bool)

(declare-fun e!223852 () Bool)

(declare-fun array_inv!7804 (array!19020) Bool)

(assert (=> b!311345 (= e!223852 (array_inv!7804 (buf!7865 b2!97)))))

(declare-fun b!311346 () Bool)

(declare-fun e!223855 () Bool)

(assert (=> b!311346 (= e!223855 (array_inv!7804 (buf!7865 b1!97)))))

(declare-fun b!311347 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311347 (= e!223856 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14487 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14492 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8252 (buf!7865 b1!97)))))))))

(declare-fun b!311348 () Bool)

(declare-fun res!255070 () Bool)

(assert (=> b!311348 (=> (not res!255070) (not e!223856))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311348 (= res!255070 (validate_offset_bits!1 ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))) ((_ sign_extend 32) (currentByte!14492 b1!97)) ((_ sign_extend 32) (currentBit!14487 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!255068 () Bool)

(assert (=> start!69148 (=> (not res!255068) (not e!223856))))

(assert (=> start!69148 (= res!255068 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8252 (buf!7865 b1!97)) (size!8252 (buf!7865 b2!97)))))))

(assert (=> start!69148 e!223856))

(assert (=> start!69148 true))

(declare-fun inv!12 (BitStream!13608) Bool)

(assert (=> start!69148 (and (inv!12 b1!97) e!223855)))

(assert (=> start!69148 (and (inv!12 b2!97) e!223852)))

(assert (= (and start!69148 res!255068) b!311348))

(assert (= (and b!311348 res!255070) b!311344))

(assert (= (and b!311344 res!255067) b!311343))

(assert (= (and b!311343 res!255069) b!311347))

(assert (= start!69148 b!311346))

(assert (= start!69148 b!311345))

(declare-fun m!449229 () Bool)

(assert (=> start!69148 m!449229))

(declare-fun m!449231 () Bool)

(assert (=> start!69148 m!449231))

(declare-fun m!449233 () Bool)

(assert (=> b!311347 m!449233))

(declare-fun m!449235 () Bool)

(assert (=> b!311346 m!449235))

(declare-fun m!449237 () Bool)

(assert (=> b!311345 m!449237))

(declare-fun m!449239 () Bool)

(assert (=> b!311348 m!449239))

(declare-fun m!449241 () Bool)

(assert (=> b!311344 m!449241))

(declare-fun m!449243 () Bool)

(assert (=> b!311344 m!449243))

(check-sat (not b!311345) (not b!311348) (not b!311344) (not start!69148) (not b!311346) (not b!311347))
(check-sat)
(get-model)

(declare-fun d!103246 () Bool)

(assert (=> d!103246 (= (array_inv!7804 (buf!7865 b2!97)) (bvsge (size!8252 (buf!7865 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311345 d!103246))

(declare-fun d!103248 () Bool)

(declare-fun e!223882 () Bool)

(assert (=> d!103248 e!223882))

(declare-fun res!255103 () Bool)

(assert (=> d!103248 (=> (not res!255103) (not e!223882))))

(declare-fun lt!441112 () (_ BitVec 64))

(declare-fun lt!441114 () (_ BitVec 64))

(declare-fun lt!441113 () (_ BitVec 64))

(assert (=> d!103248 (= res!255103 (= lt!441113 (bvsub lt!441112 lt!441114)))))

(assert (=> d!103248 (or (= (bvand lt!441112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441114 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441112 lt!441114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103248 (= lt!441114 (remainingBits!0 ((_ sign_extend 32) (size!8252 (buf!7865 b2!97))) ((_ sign_extend 32) (currentByte!14492 b2!97)) ((_ sign_extend 32) (currentBit!14487 b2!97))))))

(declare-fun lt!441116 () (_ BitVec 64))

(declare-fun lt!441111 () (_ BitVec 64))

(assert (=> d!103248 (= lt!441112 (bvmul lt!441116 lt!441111))))

(assert (=> d!103248 (or (= lt!441116 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441111 (bvsdiv (bvmul lt!441116 lt!441111) lt!441116)))))

(assert (=> d!103248 (= lt!441111 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103248 (= lt!441116 ((_ sign_extend 32) (size!8252 (buf!7865 b2!97))))))

(assert (=> d!103248 (= lt!441113 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14492 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14487 b2!97))))))

(assert (=> d!103248 (invariant!0 (currentBit!14487 b2!97) (currentByte!14492 b2!97) (size!8252 (buf!7865 b2!97)))))

(assert (=> d!103248 (= (bitIndex!0 (size!8252 (buf!7865 b2!97)) (currentByte!14492 b2!97) (currentBit!14487 b2!97)) lt!441113)))

(declare-fun b!311387 () Bool)

(declare-fun res!255104 () Bool)

(assert (=> b!311387 (=> (not res!255104) (not e!223882))))

(assert (=> b!311387 (= res!255104 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441113))))

(declare-fun b!311388 () Bool)

(declare-fun lt!441115 () (_ BitVec 64))

(assert (=> b!311388 (= e!223882 (bvsle lt!441113 (bvmul lt!441115 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311388 (or (= lt!441115 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441115 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441115)))))

(assert (=> b!311388 (= lt!441115 ((_ sign_extend 32) (size!8252 (buf!7865 b2!97))))))

(assert (= (and d!103248 res!255103) b!311387))

(assert (= (and b!311387 res!255104) b!311388))

(declare-fun m!449277 () Bool)

(assert (=> d!103248 m!449277))

(declare-fun m!449279 () Bool)

(assert (=> d!103248 m!449279))

(assert (=> b!311344 d!103248))

(declare-fun d!103282 () Bool)

(declare-fun e!223883 () Bool)

(assert (=> d!103282 e!223883))

(declare-fun res!255105 () Bool)

(assert (=> d!103282 (=> (not res!255105) (not e!223883))))

(declare-fun lt!441120 () (_ BitVec 64))

(declare-fun lt!441118 () (_ BitVec 64))

(declare-fun lt!441119 () (_ BitVec 64))

(assert (=> d!103282 (= res!255105 (= lt!441119 (bvsub lt!441118 lt!441120)))))

(assert (=> d!103282 (or (= (bvand lt!441118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441120 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441118 lt!441120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103282 (= lt!441120 (remainingBits!0 ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))) ((_ sign_extend 32) (currentByte!14492 b1!97)) ((_ sign_extend 32) (currentBit!14487 b1!97))))))

(declare-fun lt!441122 () (_ BitVec 64))

(declare-fun lt!441117 () (_ BitVec 64))

(assert (=> d!103282 (= lt!441118 (bvmul lt!441122 lt!441117))))

(assert (=> d!103282 (or (= lt!441122 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441117 (bvsdiv (bvmul lt!441122 lt!441117) lt!441122)))))

(assert (=> d!103282 (= lt!441117 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103282 (= lt!441122 ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))))))

(assert (=> d!103282 (= lt!441119 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14492 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14487 b1!97))))))

(assert (=> d!103282 (invariant!0 (currentBit!14487 b1!97) (currentByte!14492 b1!97) (size!8252 (buf!7865 b1!97)))))

(assert (=> d!103282 (= (bitIndex!0 (size!8252 (buf!7865 b1!97)) (currentByte!14492 b1!97) (currentBit!14487 b1!97)) lt!441119)))

(declare-fun b!311389 () Bool)

(declare-fun res!255106 () Bool)

(assert (=> b!311389 (=> (not res!255106) (not e!223883))))

(assert (=> b!311389 (= res!255106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441119))))

(declare-fun b!311390 () Bool)

(declare-fun lt!441121 () (_ BitVec 64))

(assert (=> b!311390 (= e!223883 (bvsle lt!441119 (bvmul lt!441121 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311390 (or (= lt!441121 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441121 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441121)))))

(assert (=> b!311390 (= lt!441121 ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))))))

(assert (= (and d!103282 res!255105) b!311389))

(assert (= (and b!311389 res!255106) b!311390))

(declare-fun m!449281 () Bool)

(assert (=> d!103282 m!449281))

(declare-fun m!449283 () Bool)

(assert (=> d!103282 m!449283))

(assert (=> b!311344 d!103282))

(declare-fun d!103284 () Bool)

(assert (=> d!103284 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14487 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14492 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14487 b1!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14487 b1!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14492 b1!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14492 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14487 b1!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14492 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8252 (buf!7865 b1!97)))))))))))

(assert (=> b!311347 d!103284))

(declare-fun d!103286 () Bool)

(assert (=> d!103286 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))) ((_ sign_extend 32) (currentByte!14492 b1!97)) ((_ sign_extend 32) (currentBit!14487 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8252 (buf!7865 b1!97))) ((_ sign_extend 32) (currentByte!14492 b1!97)) ((_ sign_extend 32) (currentBit!14487 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26729 () Bool)

(assert (= bs!26729 d!103286))

(assert (=> bs!26729 m!449281))

(assert (=> b!311348 d!103286))

(declare-fun d!103288 () Bool)

(assert (=> d!103288 (= (array_inv!7804 (buf!7865 b1!97)) (bvsge (size!8252 (buf!7865 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311346 d!103288))

(declare-fun d!103290 () Bool)

(assert (=> d!103290 (= (inv!12 b1!97) (invariant!0 (currentBit!14487 b1!97) (currentByte!14492 b1!97) (size!8252 (buf!7865 b1!97))))))

(declare-fun bs!26730 () Bool)

(assert (= bs!26730 d!103290))

(assert (=> bs!26730 m!449283))

(assert (=> start!69148 d!103290))

