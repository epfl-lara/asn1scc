; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69628 () Bool)

(assert start!69628)

(declare-fun b!313291 () Bool)

(declare-fun res!256484 () Bool)

(declare-fun e!225415 () Bool)

(assert (=> b!313291 (=> (not res!256484) (not e!225415))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19228 0))(
  ( (array!19229 (arr!9421 (Array (_ BitVec 32) (_ BitVec 8))) (size!8341 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13786 0))(
  ( (BitStream!13787 (buf!7954 array!19228) (currentByte!14673 (_ BitVec 32)) (currentBit!14668 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13786)

(declare-fun b2!97 () BitStream!13786)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313291 (= res!256484 (bvsle (bitIndex!0 (size!8341 (buf!7954 b2!97)) (currentByte!14673 b2!97) (currentBit!14668 b2!97)) (bvadd (bitIndex!0 (size!8341 (buf!7954 b1!97)) (currentByte!14673 b1!97) (currentBit!14668 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313292 () Bool)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun e!225416 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313292 (= e!225416 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8341 (buf!7954 b2!97))) ((_ sign_extend 32) (currentByte!14673 b2!97)) ((_ sign_extend 32) (currentBit!14668 b2!97)) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(declare-fun b!313293 () Bool)

(declare-fun res!256487 () Bool)

(assert (=> b!313293 (=> (not res!256487) (not e!225416))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313293 (= res!256487 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8341 (buf!7954 b2!97))) ((_ sign_extend 32) (currentByte!14673 b2!97)) ((_ sign_extend 32) (currentBit!14668 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!313294 () Bool)

(declare-fun e!225417 () Bool)

(declare-fun array_inv!7893 (array!19228) Bool)

(assert (=> b!313294 (= e!225417 (array_inv!7893 (buf!7954 b1!97)))))

(declare-fun b!313295 () Bool)

(declare-fun e!225419 () Bool)

(assert (=> b!313295 (= e!225415 e!225419)))

(declare-fun res!256485 () Bool)

(assert (=> b!313295 (=> (not res!256485) (not e!225419))))

(declare-fun lt!442177 () (_ BitVec 64))

(declare-fun lt!442176 () (_ BitVec 64))

(assert (=> b!313295 (= res!256485 (bvsge (bvsub lt!442176 lt!442177) b1ValidateOffsetBits!10))))

(assert (=> b!313295 (= lt!442177 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14673 b1!97))) ((_ sign_extend 32) (currentBit!14668 b1!97))))))

(assert (=> b!313295 (= lt!442176 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8341 (buf!7954 b1!97)))))))

(declare-fun b!313296 () Bool)

(declare-fun res!256486 () Bool)

(assert (=> b!313296 (=> (not res!256486) (not e!225415))))

(assert (=> b!313296 (= res!256486 (validate_offset_bits!1 ((_ sign_extend 32) (size!8341 (buf!7954 b1!97))) ((_ sign_extend 32) (currentByte!14673 b1!97)) ((_ sign_extend 32) (currentBit!14668 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313297 () Bool)

(assert (=> b!313297 (= e!225419 e!225416)))

(declare-fun res!256482 () Bool)

(assert (=> b!313297 (=> (not res!256482) (not e!225416))))

(declare-fun lt!442178 () (_ BitVec 64))

(assert (=> b!313297 (= res!256482 (and (bvsle lt!442178 (bvadd lt!442177 advancedAtMostBits!9)) (bvsge (bvsub lt!442176 lt!442178) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!313297 (= lt!442178 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14673 b2!97))) ((_ sign_extend 32) (currentBit!14668 b2!97))))))

(declare-fun b!313298 () Bool)

(declare-fun res!256483 () Bool)

(assert (=> b!313298 (=> (not res!256483) (not e!225415))))

(assert (=> b!313298 (= res!256483 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8341 (buf!7954 b1!97))) ((_ sign_extend 32) (currentByte!14673 b1!97)) ((_ sign_extend 32) (currentBit!14668 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!256481 () Bool)

(assert (=> start!69628 (=> (not res!256481) (not e!225415))))

(assert (=> start!69628 (= res!256481 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8341 (buf!7954 b1!97)) (size!8341 (buf!7954 b2!97)))))))

(assert (=> start!69628 e!225415))

(assert (=> start!69628 true))

(declare-fun inv!12 (BitStream!13786) Bool)

(assert (=> start!69628 (and (inv!12 b1!97) e!225417)))

(declare-fun e!225418 () Bool)

(assert (=> start!69628 (and (inv!12 b2!97) e!225418)))

(declare-fun b!313299 () Bool)

(assert (=> b!313299 (= e!225418 (array_inv!7893 (buf!7954 b2!97)))))

(assert (= (and start!69628 res!256481) b!313296))

(assert (= (and b!313296 res!256486) b!313291))

(assert (= (and b!313291 res!256484) b!313298))

(assert (= (and b!313298 res!256483) b!313295))

(assert (= (and b!313295 res!256485) b!313297))

(assert (= (and b!313297 res!256482) b!313293))

(assert (= (and b!313293 res!256487) b!313292))

(assert (= start!69628 b!313294))

(assert (= start!69628 b!313299))

(declare-fun m!450839 () Bool)

(assert (=> b!313294 m!450839))

(declare-fun m!450841 () Bool)

(assert (=> b!313292 m!450841))

(declare-fun m!450843 () Bool)

(assert (=> b!313298 m!450843))

(declare-fun m!450845 () Bool)

(assert (=> b!313291 m!450845))

(declare-fun m!450847 () Bool)

(assert (=> b!313291 m!450847))

(declare-fun m!450849 () Bool)

(assert (=> b!313296 m!450849))

(declare-fun m!450851 () Bool)

(assert (=> b!313299 m!450851))

(declare-fun m!450853 () Bool)

(assert (=> b!313293 m!450853))

(declare-fun m!450855 () Bool)

(assert (=> start!69628 m!450855))

(declare-fun m!450857 () Bool)

(assert (=> start!69628 m!450857))

(push 1)

(assert (not b!313292))

(assert (not b!313298))

(assert (not b!313299))

(assert (not b!313294))

(assert (not b!313296))

(assert (not start!69628))

(assert (not b!313293))

(assert (not b!313291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103820 () Bool)

(assert (=> d!103820 (= (array_inv!7893 (buf!7954 b2!97)) (bvsge (size!8341 (buf!7954 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!313299 d!103820))

(declare-fun d!103822 () Bool)

(assert (=> d!103822 (= (array_inv!7893 (buf!7954 b1!97)) (bvsge (size!8341 (buf!7954 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!313294 d!103822))

(declare-fun d!103824 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103824 (= (inv!12 b1!97) (invariant!0 (currentBit!14668 b1!97) (currentByte!14673 b1!97) (size!8341 (buf!7954 b1!97))))))

(declare-fun bs!26904 () Bool)

(assert (= bs!26904 d!103824))

(declare-fun m!450903 () Bool)

(assert (=> bs!26904 m!450903))

(assert (=> start!69628 d!103824))

(declare-fun d!103826 () Bool)

(assert (=> d!103826 (= (inv!12 b2!97) (invariant!0 (currentBit!14668 b2!97) (currentByte!14673 b2!97) (size!8341 (buf!7954 b2!97))))))

(declare-fun bs!26905 () Bool)

(assert (= bs!26905 d!103826))

(declare-fun m!450905 () Bool)

(assert (=> bs!26905 m!450905))

(assert (=> start!69628 d!103826))

(declare-fun d!103828 () Bool)

(assert (=> d!103828 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8341 (buf!7954 b1!97))) ((_ sign_extend 32) (currentByte!14673 b1!97)) ((_ sign_extend 32) (currentBit!14668 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8341 (buf!7954 b1!97))) ((_ sign_extend 32) (currentByte!14673 b1!97)) ((_ sign_extend 32) (currentBit!14668 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26906 () Bool)

(assert (= bs!26906 d!103828))

(assert (=> bs!26906 m!450843))

(assert (=> b!313296 d!103828))

(declare-fun d!103830 () Bool)

(declare-fun e!225470 () Bool)

(assert (=> d!103830 e!225470))

(declare-fun res!256543 () Bool)

(assert (=> d!103830 (=> (not res!256543) (not e!225470))))

(declare-fun lt!442236 () (_ BitVec 64))

(declare-fun lt!442238 () (_ BitVec 64))

(declare-fun lt!442233 () (_ BitVec 64))

(assert (=> d!103830 (= res!256543 (= lt!442236 (bvsub lt!442238 lt!442233)))))

(assert (=> d!103830 (or (= (bvand lt!442238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!442233 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!442238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!442238 lt!442233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103830 (= lt!442233 (remainingBits!0 ((_ sign_extend 32) (size!8341 (buf!7954 b2!97))) ((_ sign_extend 32) (currentByte!14673 b2!97)) ((_ sign_extend 32) (currentBit!14668 b2!97))))))

(declare-fun lt!442234 () (_ BitVec 64))

(declare-fun lt!442235 () (_ BitVec 64))

(assert (=> d!103830 (= lt!442238 (bvmul lt!442234 lt!442235))))

(assert (=> d!103830 (or (= lt!442234 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!442235 (bvsdiv (bvmul lt!442234 lt!442235) lt!442234)))))

(assert (=> d!103830 (= lt!442235 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103830 (= lt!442234 ((_ sign_extend 32) (size!8341 (buf!7954 b2!97))))))

(assert (=> d!103830 (= lt!442236 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14673 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14668 b2!97))))))

(assert (=> d!103830 (invariant!0 (currentBit!14668 b2!97) (currentByte!14673 b2!97) (size!8341 (buf!7954 b2!97)))))

(assert (=> d!103830 (= (bitIndex!0 (size!8341 (buf!7954 b2!97)) (currentByte!14673 b2!97) (currentBit!14668 b2!97)) lt!442236)))

(declare-fun b!313366 () Bool)

(declare-fun res!256542 () Bool)

(assert (=> b!313366 (=> (not res!256542) (not e!225470))))

(assert (=> b!313366 (= res!256542 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!442236))))

(declare-fun b!313367 () Bool)

(declare-fun lt!442237 () (_ BitVec 64))

(assert (=> b!313367 (= e!225470 (bvsle lt!442236 (bvmul lt!442237 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313367 (or (= lt!442237 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!442237 #b0000000000000000000000000000000000000000000000000000000000001000) lt!442237)))))

(assert (=> b!313367 (= lt!442237 ((_ sign_extend 32) (size!8341 (buf!7954 b2!97))))))

(assert (= (and d!103830 res!256543) b!313366))

(assert (= (and b!313366 res!256542) b!313367))

(assert (=> d!103830 m!450853))

(assert (=> d!103830 m!450905))

(assert (=> b!313291 d!103830))

(declare-fun d!103840 () Bool)

(declare-fun e!225471 () Bool)

(assert (=> d!103840 e!225471))

(declare-fun res!256545 () Bool)

(assert (=> d!103840 (=> (not res!256545) (not e!225471))))

(declare-fun lt!442239 () (_ BitVec 64))

(declare-fun lt!442244 () (_ BitVec 64))

(declare-fun lt!442242 () (_ BitVec 64))

(assert (=> d!103840 (= res!256545 (= lt!442242 (bvsub lt!442244 lt!442239)))))

(assert (=> d!103840 (or (= (bvand lt!442244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!442239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!442244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!442244 lt!442239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103840 (= lt!442239 (remainingBits!0 ((_ sign_extend 32) (size!8341 (buf!7954 b1!97))) ((_ sign_extend 32) (currentByte!14673 b1!97)) ((_ sign_extend 32) (currentBit!14668 b1!97))))))

(declare-fun lt!442240 () (_ BitVec 64))

(declare-fun lt!442241 () (_ BitVec 64))

(assert (=> d!103840 (= lt!442244 (bvmul lt!442240 lt!442241))))

(assert (=> d!103840 (or (= lt!442240 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!442241 (bvsdiv (bvmul lt!442240 lt!442241) lt!442240)))))

(assert (=> d!103840 (= lt!442241 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103840 (= lt!442240 ((_ sign_extend 32) (size!8341 (buf!7954 b1!97))))))

(assert (=> d!103840 (= lt!442242 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14673 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14668 b1!97))))))

(assert (=> d!103840 (invariant!0 (currentBit!14668 b1!97) (currentByte!14673 b1!97) (size!8341 (buf!7954 b1!97)))))

(assert (=> d!103840 (= (bitIndex!0 (size!8341 (buf!7954 b1!97)) (currentByte!14673 b1!97) (currentBit!14668 b1!97)) lt!442242)))

(declare-fun b!313368 () Bool)

(declare-fun res!256544 () Bool)

(assert (=> b!313368 (=> (not res!256544) (not e!225471))))

(assert (=> b!313368 (= res!256544 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!442242))))

(declare-fun b!313369 () Bool)

(declare-fun lt!442243 () (_ BitVec 64))

(assert (=> b!313369 (= e!225471 (bvsle lt!442242 (bvmul lt!442243 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313369 (or (= lt!442243 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!442243 #b0000000000000000000000000000000000000000000000000000000000001000) lt!442243)))))

(assert (=> b!313369 (= lt!442243 ((_ sign_extend 32) (size!8341 (buf!7954 b1!97))))))

(assert (= (and d!103840 res!256545) b!313368))

(assert (= (and b!313368 res!256544) b!313369))

(assert (=> d!103840 m!450843))

(assert (=> d!103840 m!450903))

(assert (=> b!313291 d!103840))

(declare-fun d!103842 () Bool)

(assert (=> d!103842 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8341 (buf!7954 b2!97))) ((_ sign_extend 32) (currentByte!14673 b2!97)) ((_ sign_extend 32) (currentBit!14668 b2!97)) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8341 (buf!7954 b2!97))) ((_ sign_extend 32) (currentByte!14673 b2!97)) ((_ sign_extend 32) (currentBit!14668 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun bs!26908 () Bool)

(assert (= bs!26908 d!103842))

(assert (=> bs!26908 m!450853))

(assert (=> b!313292 d!103842))

(declare-fun d!103844 () Bool)

(assert (=> d!103844 (= (remainingBits!0 ((_ sign_extend 32) (size!8341 (buf!7954 b1!97))) ((_ sign_extend 32) (currentByte!14673 b1!97)) ((_ sign_extend 32) (currentBit!14668 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8341 (buf!7954 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14673 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14668 b1!97)))))))

(assert (=> b!313298 d!103844))

(declare-fun d!103854 () Bool)

(assert (=> d!103854 (= (remainingBits!0 ((_ sign_extend 32) (size!8341 (buf!7954 b2!97))) ((_ sign_extend 32) (currentByte!14673 b2!97)) ((_ sign_extend 32) (currentBit!14668 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8341 (buf!7954 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14673 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14668 b2!97)))))))

(assert (=> b!313293 d!103854))

(push 1)

(assert (not d!103826))

(assert (not d!103824))

(assert (not d!103830))

(assert (not d!103842))

(assert (not d!103828))

(assert (not d!103840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

