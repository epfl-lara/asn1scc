; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69190 () Bool)

(assert start!69190)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun lt!441152 () (_ BitVec 64))

(declare-fun b!311475 () Bool)

(declare-fun lt!441151 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun e!223957 () Bool)

(declare-datatypes ((array!19035 0))(
  ( (array!19036 (arr!9338 (Array (_ BitVec 32) (_ BitVec 8))) (size!8258 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13620 0))(
  ( (BitStream!13621 (buf!7871 array!19035) (currentByte!14507 (_ BitVec 32)) (currentBit!14502 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13620)

(assert (=> b!311475 (= e!223957 (and (bvsge (bvsub lt!441152 lt!441151) b1ValidateOffsetBits!10) (let ((bdg!18594 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14507 b2!97))) ((_ sign_extend 32) (currentBit!14502 b2!97))))) (and (bvsle bdg!18594 (bvadd lt!441151 advancedAtMostBits!9)) (bvsge (bvsub lt!441152 bdg!18594) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (bvsle ((_ sign_extend 32) (size!8258 (buf!7871 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14507 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14502 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8258 (buf!7871 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14507 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14502 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b1!97 () BitStream!13620)

(assert (=> b!311475 (= lt!441151 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14507 b1!97))) ((_ sign_extend 32) (currentBit!14502 b1!97))))))

(assert (=> b!311475 (= lt!441152 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8258 (buf!7871 b1!97)))))))

(declare-fun res!255166 () Bool)

(assert (=> start!69190 (=> (not res!255166) (not e!223957))))

(assert (=> start!69190 (= res!255166 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8258 (buf!7871 b1!97)) (size!8258 (buf!7871 b2!97)))))))

(assert (=> start!69190 e!223957))

(assert (=> start!69190 true))

(declare-fun e!223956 () Bool)

(declare-fun inv!12 (BitStream!13620) Bool)

(assert (=> start!69190 (and (inv!12 b1!97) e!223956)))

(declare-fun e!223955 () Bool)

(assert (=> start!69190 (and (inv!12 b2!97) e!223955)))

(declare-fun b!311476 () Bool)

(declare-fun res!255164 () Bool)

(assert (=> b!311476 (=> (not res!255164) (not e!223957))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311476 (= res!255164 (validate_offset_bits!1 ((_ sign_extend 32) (size!8258 (buf!7871 b1!97))) ((_ sign_extend 32) (currentByte!14507 b1!97)) ((_ sign_extend 32) (currentBit!14502 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311477 () Bool)

(declare-fun res!255163 () Bool)

(assert (=> b!311477 (=> (not res!255163) (not e!223957))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311477 (= res!255163 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8258 (buf!7871 b1!97))) ((_ sign_extend 32) (currentByte!14507 b1!97)) ((_ sign_extend 32) (currentBit!14502 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311478 () Bool)

(declare-fun res!255165 () Bool)

(assert (=> b!311478 (=> (not res!255165) (not e!223957))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311478 (= res!255165 (bvsle (bitIndex!0 (size!8258 (buf!7871 b2!97)) (currentByte!14507 b2!97) (currentBit!14502 b2!97)) (bvadd (bitIndex!0 (size!8258 (buf!7871 b1!97)) (currentByte!14507 b1!97) (currentBit!14502 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311479 () Bool)

(declare-fun array_inv!7810 (array!19035) Bool)

(assert (=> b!311479 (= e!223956 (array_inv!7810 (buf!7871 b1!97)))))

(declare-fun b!311480 () Bool)

(assert (=> b!311480 (= e!223955 (array_inv!7810 (buf!7871 b2!97)))))

(assert (= (and start!69190 res!255166) b!311476))

(assert (= (and b!311476 res!255164) b!311478))

(assert (= (and b!311478 res!255165) b!311477))

(assert (= (and b!311477 res!255163) b!311475))

(assert (= start!69190 b!311479))

(assert (= start!69190 b!311480))

(declare-fun m!449349 () Bool)

(assert (=> b!311476 m!449349))

(declare-fun m!449351 () Bool)

(assert (=> b!311477 m!449351))

(declare-fun m!449353 () Bool)

(assert (=> b!311478 m!449353))

(declare-fun m!449355 () Bool)

(assert (=> b!311478 m!449355))

(declare-fun m!449357 () Bool)

(assert (=> start!69190 m!449357))

(declare-fun m!449359 () Bool)

(assert (=> start!69190 m!449359))

(declare-fun m!449361 () Bool)

(assert (=> b!311479 m!449361))

(declare-fun m!449363 () Bool)

(assert (=> b!311480 m!449363))

(check-sat (not start!69190) (not b!311477) (not b!311480) (not b!311479) (not b!311476) (not b!311478))
(check-sat)
(get-model)

(declare-fun d!103298 () Bool)

(assert (=> d!103298 (= (remainingBits!0 ((_ sign_extend 32) (size!8258 (buf!7871 b1!97))) ((_ sign_extend 32) (currentByte!14507 b1!97)) ((_ sign_extend 32) (currentBit!14502 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8258 (buf!7871 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14507 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14502 b1!97)))))))

(assert (=> b!311477 d!103298))

(declare-fun d!103300 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103300 (= (inv!12 b1!97) (invariant!0 (currentBit!14502 b1!97) (currentByte!14507 b1!97) (size!8258 (buf!7871 b1!97))))))

(declare-fun bs!26738 () Bool)

(assert (= bs!26738 d!103300))

(declare-fun m!449381 () Bool)

(assert (=> bs!26738 m!449381))

(assert (=> start!69190 d!103300))

(declare-fun d!103302 () Bool)

(assert (=> d!103302 (= (inv!12 b2!97) (invariant!0 (currentBit!14502 b2!97) (currentByte!14507 b2!97) (size!8258 (buf!7871 b2!97))))))

(declare-fun bs!26739 () Bool)

(assert (= bs!26739 d!103302))

(declare-fun m!449383 () Bool)

(assert (=> bs!26739 m!449383))

(assert (=> start!69190 d!103302))

(declare-fun d!103304 () Bool)

(assert (=> d!103304 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8258 (buf!7871 b1!97))) ((_ sign_extend 32) (currentByte!14507 b1!97)) ((_ sign_extend 32) (currentBit!14502 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8258 (buf!7871 b1!97))) ((_ sign_extend 32) (currentByte!14507 b1!97)) ((_ sign_extend 32) (currentBit!14502 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26740 () Bool)

(assert (= bs!26740 d!103304))

(assert (=> bs!26740 m!449351))

(assert (=> b!311476 d!103304))

(declare-fun d!103306 () Bool)

(assert (=> d!103306 (= (array_inv!7810 (buf!7871 b2!97)) (bvsge (size!8258 (buf!7871 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311480 d!103306))

(declare-fun d!103308 () Bool)

(declare-fun e!223976 () Bool)

(assert (=> d!103308 e!223976))

(declare-fun res!255184 () Bool)

(assert (=> d!103308 (=> (not res!255184) (not e!223976))))

(declare-fun lt!441176 () (_ BitVec 64))

(declare-fun lt!441173 () (_ BitVec 64))

(declare-fun lt!441172 () (_ BitVec 64))

(assert (=> d!103308 (= res!255184 (= lt!441172 (bvsub lt!441176 lt!441173)))))

(assert (=> d!103308 (or (= (bvand lt!441176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441173 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441176 lt!441173) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103308 (= lt!441173 (remainingBits!0 ((_ sign_extend 32) (size!8258 (buf!7871 b2!97))) ((_ sign_extend 32) (currentByte!14507 b2!97)) ((_ sign_extend 32) (currentBit!14502 b2!97))))))

(declare-fun lt!441174 () (_ BitVec 64))

(declare-fun lt!441175 () (_ BitVec 64))

(assert (=> d!103308 (= lt!441176 (bvmul lt!441174 lt!441175))))

(assert (=> d!103308 (or (= lt!441174 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441175 (bvsdiv (bvmul lt!441174 lt!441175) lt!441174)))))

(assert (=> d!103308 (= lt!441175 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103308 (= lt!441174 ((_ sign_extend 32) (size!8258 (buf!7871 b2!97))))))

(assert (=> d!103308 (= lt!441172 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14507 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14502 b2!97))))))

(assert (=> d!103308 (invariant!0 (currentBit!14502 b2!97) (currentByte!14507 b2!97) (size!8258 (buf!7871 b2!97)))))

(assert (=> d!103308 (= (bitIndex!0 (size!8258 (buf!7871 b2!97)) (currentByte!14507 b2!97) (currentBit!14502 b2!97)) lt!441172)))

(declare-fun b!311503 () Bool)

(declare-fun res!255183 () Bool)

(assert (=> b!311503 (=> (not res!255183) (not e!223976))))

(assert (=> b!311503 (= res!255183 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441172))))

(declare-fun b!311504 () Bool)

(declare-fun lt!441171 () (_ BitVec 64))

(assert (=> b!311504 (= e!223976 (bvsle lt!441172 (bvmul lt!441171 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311504 (or (= lt!441171 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441171 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441171)))))

(assert (=> b!311504 (= lt!441171 ((_ sign_extend 32) (size!8258 (buf!7871 b2!97))))))

(assert (= (and d!103308 res!255184) b!311503))

(assert (= (and b!311503 res!255183) b!311504))

(declare-fun m!449385 () Bool)

(assert (=> d!103308 m!449385))

(assert (=> d!103308 m!449383))

(assert (=> b!311478 d!103308))

(declare-fun d!103310 () Bool)

(declare-fun e!223977 () Bool)

(assert (=> d!103310 e!223977))

(declare-fun res!255186 () Bool)

(assert (=> d!103310 (=> (not res!255186) (not e!223977))))

(declare-fun lt!441182 () (_ BitVec 64))

(declare-fun lt!441179 () (_ BitVec 64))

(declare-fun lt!441178 () (_ BitVec 64))

(assert (=> d!103310 (= res!255186 (= lt!441178 (bvsub lt!441182 lt!441179)))))

(assert (=> d!103310 (or (= (bvand lt!441182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441179 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441182 lt!441179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103310 (= lt!441179 (remainingBits!0 ((_ sign_extend 32) (size!8258 (buf!7871 b1!97))) ((_ sign_extend 32) (currentByte!14507 b1!97)) ((_ sign_extend 32) (currentBit!14502 b1!97))))))

(declare-fun lt!441180 () (_ BitVec 64))

(declare-fun lt!441181 () (_ BitVec 64))

(assert (=> d!103310 (= lt!441182 (bvmul lt!441180 lt!441181))))

(assert (=> d!103310 (or (= lt!441180 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441181 (bvsdiv (bvmul lt!441180 lt!441181) lt!441180)))))

(assert (=> d!103310 (= lt!441181 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103310 (= lt!441180 ((_ sign_extend 32) (size!8258 (buf!7871 b1!97))))))

(assert (=> d!103310 (= lt!441178 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14507 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14502 b1!97))))))

(assert (=> d!103310 (invariant!0 (currentBit!14502 b1!97) (currentByte!14507 b1!97) (size!8258 (buf!7871 b1!97)))))

(assert (=> d!103310 (= (bitIndex!0 (size!8258 (buf!7871 b1!97)) (currentByte!14507 b1!97) (currentBit!14502 b1!97)) lt!441178)))

(declare-fun b!311505 () Bool)

(declare-fun res!255185 () Bool)

(assert (=> b!311505 (=> (not res!255185) (not e!223977))))

(assert (=> b!311505 (= res!255185 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441178))))

(declare-fun b!311506 () Bool)

(declare-fun lt!441177 () (_ BitVec 64))

(assert (=> b!311506 (= e!223977 (bvsle lt!441178 (bvmul lt!441177 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311506 (or (= lt!441177 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441177 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441177)))))

(assert (=> b!311506 (= lt!441177 ((_ sign_extend 32) (size!8258 (buf!7871 b1!97))))))

(assert (= (and d!103310 res!255186) b!311505))

(assert (= (and b!311505 res!255185) b!311506))

(assert (=> d!103310 m!449351))

(assert (=> d!103310 m!449381))

(assert (=> b!311478 d!103310))

(declare-fun d!103312 () Bool)

(assert (=> d!103312 (= (array_inv!7810 (buf!7871 b1!97)) (bvsge (size!8258 (buf!7871 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311479 d!103312))

(check-sat (not d!103300) (not d!103302) (not d!103304) (not d!103310) (not d!103308))
