; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69632 () Bool)

(assert start!69632)

(declare-fun res!256524 () Bool)

(declare-fun e!225462 () Bool)

(assert (=> start!69632 (=> (not res!256524) (not e!225462))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19232 0))(
  ( (array!19233 (arr!9423 (Array (_ BitVec 32) (_ BitVec 8))) (size!8343 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13790 0))(
  ( (BitStream!13791 (buf!7956 array!19232) (currentByte!14675 (_ BitVec 32)) (currentBit!14670 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13790)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13790)

(assert (=> start!69632 (= res!256524 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8343 (buf!7956 b1!97)) (size!8343 (buf!7956 b2!97)))))))

(assert (=> start!69632 e!225462))

(assert (=> start!69632 true))

(declare-fun e!225458 () Bool)

(declare-fun inv!12 (BitStream!13790) Bool)

(assert (=> start!69632 (and (inv!12 b1!97) e!225458)))

(declare-fun e!225461 () Bool)

(assert (=> start!69632 (and (inv!12 b2!97) e!225461)))

(declare-fun b!313345 () Bool)

(declare-fun res!256527 () Bool)

(declare-fun e!225459 () Bool)

(assert (=> b!313345 (=> (not res!256527) (not e!225459))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313345 (= res!256527 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8343 (buf!7956 b2!97))) ((_ sign_extend 32) (currentByte!14675 b2!97)) ((_ sign_extend 32) (currentBit!14670 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!313346 () Bool)

(declare-fun res!256523 () Bool)

(assert (=> b!313346 (=> (not res!256523) (not e!225462))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313346 (= res!256523 (validate_offset_bits!1 ((_ sign_extend 32) (size!8343 (buf!7956 b1!97))) ((_ sign_extend 32) (currentByte!14675 b1!97)) ((_ sign_extend 32) (currentBit!14670 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313347 () Bool)

(declare-fun array_inv!7895 (array!19232) Bool)

(assert (=> b!313347 (= e!225461 (array_inv!7895 (buf!7956 b2!97)))))

(declare-fun b!313348 () Bool)

(declare-fun e!225457 () Bool)

(assert (=> b!313348 (= e!225457 e!225459)))

(declare-fun res!256526 () Bool)

(assert (=> b!313348 (=> (not res!256526) (not e!225459))))

(declare-fun lt!442196 () (_ BitVec 64))

(declare-fun lt!442195 () (_ BitVec 64))

(declare-fun lt!442194 () (_ BitVec 64))

(assert (=> b!313348 (= res!256526 (and (bvsle lt!442194 (bvadd lt!442195 advancedAtMostBits!9)) (bvsge (bvsub lt!442196 lt!442194) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!313348 (= lt!442194 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14675 b2!97))) ((_ sign_extend 32) (currentBit!14670 b2!97))))))

(declare-fun b!313349 () Bool)

(assert (=> b!313349 (= e!225459 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8343 (buf!7956 b2!97))) ((_ sign_extend 32) (currentByte!14675 b2!97)) ((_ sign_extend 32) (currentBit!14670 b2!97)) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(declare-fun b!313350 () Bool)

(assert (=> b!313350 (= e!225462 e!225457)))

(declare-fun res!256525 () Bool)

(assert (=> b!313350 (=> (not res!256525) (not e!225457))))

(assert (=> b!313350 (= res!256525 (bvsge (bvsub lt!442196 lt!442195) b1ValidateOffsetBits!10))))

(assert (=> b!313350 (= lt!442195 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14675 b1!97))) ((_ sign_extend 32) (currentBit!14670 b1!97))))))

(assert (=> b!313350 (= lt!442196 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8343 (buf!7956 b1!97)))))))

(declare-fun b!313351 () Bool)

(declare-fun res!256528 () Bool)

(assert (=> b!313351 (=> (not res!256528) (not e!225462))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313351 (= res!256528 (bvsle (bitIndex!0 (size!8343 (buf!7956 b2!97)) (currentByte!14675 b2!97) (currentBit!14670 b2!97)) (bvadd (bitIndex!0 (size!8343 (buf!7956 b1!97)) (currentByte!14675 b1!97) (currentBit!14670 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313352 () Bool)

(assert (=> b!313352 (= e!225458 (array_inv!7895 (buf!7956 b1!97)))))

(declare-fun b!313353 () Bool)

(declare-fun res!256529 () Bool)

(assert (=> b!313353 (=> (not res!256529) (not e!225462))))

(assert (=> b!313353 (= res!256529 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8343 (buf!7956 b1!97))) ((_ sign_extend 32) (currentByte!14675 b1!97)) ((_ sign_extend 32) (currentBit!14670 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69632 res!256524) b!313346))

(assert (= (and b!313346 res!256523) b!313351))

(assert (= (and b!313351 res!256528) b!313353))

(assert (= (and b!313353 res!256529) b!313350))

(assert (= (and b!313350 res!256525) b!313348))

(assert (= (and b!313348 res!256526) b!313345))

(assert (= (and b!313345 res!256527) b!313349))

(assert (= start!69632 b!313352))

(assert (= start!69632 b!313347))

(declare-fun m!450879 () Bool)

(assert (=> b!313352 m!450879))

(declare-fun m!450881 () Bool)

(assert (=> b!313353 m!450881))

(declare-fun m!450883 () Bool)

(assert (=> b!313347 m!450883))

(declare-fun m!450885 () Bool)

(assert (=> b!313346 m!450885))

(declare-fun m!450887 () Bool)

(assert (=> start!69632 m!450887))

(declare-fun m!450889 () Bool)

(assert (=> start!69632 m!450889))

(declare-fun m!450891 () Bool)

(assert (=> b!313345 m!450891))

(declare-fun m!450893 () Bool)

(assert (=> b!313349 m!450893))

(declare-fun m!450895 () Bool)

(assert (=> b!313351 m!450895))

(declare-fun m!450897 () Bool)

(assert (=> b!313351 m!450897))

(push 1)

(assert (not b!313351))

(assert (not b!313347))

(assert (not b!313346))

(assert (not b!313352))

(assert (not b!313345))

(assert (not start!69632))

(assert (not b!313349))

(assert (not b!313353))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103832 () Bool)

(assert (=> d!103832 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8343 (buf!7956 b1!97))) ((_ sign_extend 32) (currentByte!14675 b1!97)) ((_ sign_extend 32) (currentBit!14670 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8343 (buf!7956 b1!97))) ((_ sign_extend 32) (currentByte!14675 b1!97)) ((_ sign_extend 32) (currentBit!14670 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26907 () Bool)

(assert (= bs!26907 d!103832))

(assert (=> bs!26907 m!450881))

(assert (=> b!313346 d!103832))

(declare-fun d!103834 () Bool)

(assert (=> d!103834 (= (array_inv!7895 (buf!7956 b1!97)) (bvsge (size!8343 (buf!7956 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!313352 d!103834))

(declare-fun d!103836 () Bool)

(assert (=> d!103836 (= (array_inv!7895 (buf!7956 b2!97)) (bvsge (size!8343 (buf!7956 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!313347 d!103836))

(declare-fun d!103838 () Bool)

(assert (=> d!103838 (= (remainingBits!0 ((_ sign_extend 32) (size!8343 (buf!7956 b1!97))) ((_ sign_extend 32) (currentByte!14675 b1!97)) ((_ sign_extend 32) (currentBit!14670 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8343 (buf!7956 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14675 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14670 b1!97)))))))

(assert (=> b!313353 d!103838))

(declare-fun d!103846 () Bool)

(assert (=> d!103846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8343 (buf!7956 b2!97))) ((_ sign_extend 32) (currentByte!14675 b2!97)) ((_ sign_extend 32) (currentBit!14670 b2!97)) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8343 (buf!7956 b2!97))) ((_ sign_extend 32) (currentByte!14675 b2!97)) ((_ sign_extend 32) (currentBit!14670 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun bs!26909 () Bool)

(assert (= bs!26909 d!103846))

(assert (=> bs!26909 m!450891))

(assert (=> b!313349 d!103846))

(declare-fun d!103848 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103848 (= (inv!12 b1!97) (invariant!0 (currentBit!14670 b1!97) (currentByte!14675 b1!97) (size!8343 (buf!7956 b1!97))))))

(declare-fun bs!26910 () Bool)

(assert (= bs!26910 d!103848))

(declare-fun m!450907 () Bool)

(assert (=> bs!26910 m!450907))

(assert (=> start!69632 d!103848))

(declare-fun d!103850 () Bool)

(assert (=> d!103850 (= (inv!12 b2!97) (invariant!0 (currentBit!14670 b2!97) (currentByte!14675 b2!97) (size!8343 (buf!7956 b2!97))))))

(declare-fun bs!26911 () Bool)

(assert (= bs!26911 d!103850))

(declare-fun m!450909 () Bool)

(assert (=> bs!26911 m!450909))

(assert (=> start!69632 d!103850))

(declare-fun d!103852 () Bool)

(assert (=> d!103852 (= (remainingBits!0 ((_ sign_extend 32) (size!8343 (buf!7956 b2!97))) ((_ sign_extend 32) (currentByte!14675 b2!97)) ((_ sign_extend 32) (currentBit!14670 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8343 (buf!7956 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14675 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14670 b2!97)))))))

(assert (=> b!313345 d!103852))

(declare-fun d!103856 () Bool)

(declare-fun e!225474 () Bool)

(assert (=> d!103856 e!225474))

(declare-fun res!256551 () Bool)

(assert (=> d!103856 (=> (not res!256551) (not e!225474))))

(declare-fun lt!442262 () (_ BitVec 64))

(declare-fun lt!442259 () (_ BitVec 64))

(declare-fun lt!442261 () (_ BitVec 64))

(assert (=> d!103856 (= res!256551 (= lt!442259 (bvsub lt!442261 lt!442262)))))

(assert (=> d!103856 (or (= (bvand lt!442261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!442262 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!442261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!442261 lt!442262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103856 (= lt!442262 (remainingBits!0 ((_ sign_extend 32) (size!8343 (buf!7956 b2!97))) ((_ sign_extend 32) (currentByte!14675 b2!97)) ((_ sign_extend 32) (currentBit!14670 b2!97))))))

(declare-fun lt!442260 () (_ BitVec 64))

(declare-fun lt!442257 () (_ BitVec 64))

(assert (=> d!103856 (= lt!442261 (bvmul lt!442260 lt!442257))))

(assert (=> d!103856 (or (= lt!442260 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!442257 (bvsdiv (bvmul lt!442260 lt!442257) lt!442260)))))

(assert (=> d!103856 (= lt!442257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103856 (= lt!442260 ((_ sign_extend 32) (size!8343 (buf!7956 b2!97))))))

(assert (=> d!103856 (= lt!442259 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14675 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14670 b2!97))))))

(assert (=> d!103856 (invariant!0 (currentBit!14670 b2!97) (currentByte!14675 b2!97) (size!8343 (buf!7956 b2!97)))))

(assert (=> d!103856 (= (bitIndex!0 (size!8343 (buf!7956 b2!97)) (currentByte!14675 b2!97) (currentBit!14670 b2!97)) lt!442259)))

(declare-fun b!313374 () Bool)

(declare-fun res!256550 () Bool)

(assert (=> b!313374 (=> (not res!256550) (not e!225474))))

(assert (=> b!313374 (= res!256550 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!442259))))

(declare-fun b!313375 () Bool)

(declare-fun lt!442258 () (_ BitVec 64))

(assert (=> b!313375 (= e!225474 (bvsle lt!442259 (bvmul lt!442258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

