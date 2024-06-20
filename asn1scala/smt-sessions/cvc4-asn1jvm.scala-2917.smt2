; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69626 () Bool)

(assert start!69626)

(declare-fun b!313264 () Bool)

(declare-fun e!225399 () Bool)

(declare-fun e!225400 () Bool)

(assert (=> b!313264 (= e!225399 e!225400)))

(declare-fun res!256465 () Bool)

(assert (=> b!313264 (=> (not res!256465) (not e!225400))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun lt!442169 () (_ BitVec 64))

(declare-fun lt!442167 () (_ BitVec 64))

(declare-fun lt!442168 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> b!313264 (= res!256465 (and (bvsle lt!442167 (bvadd lt!442168 advancedAtMostBits!9)) (bvsge (bvsub lt!442169 lt!442167) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(declare-datatypes ((array!19226 0))(
  ( (array!19227 (arr!9420 (Array (_ BitVec 32) (_ BitVec 8))) (size!8340 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13784 0))(
  ( (BitStream!13785 (buf!7953 array!19226) (currentByte!14672 (_ BitVec 32)) (currentBit!14667 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13784)

(assert (=> b!313264 (= lt!442167 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14672 b2!97))) ((_ sign_extend 32) (currentBit!14667 b2!97))))))

(declare-fun res!256462 () Bool)

(declare-fun e!225396 () Bool)

(assert (=> start!69626 (=> (not res!256462) (not e!225396))))

(declare-fun b1!97 () BitStream!13784)

(assert (=> start!69626 (= res!256462 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8340 (buf!7953 b1!97)) (size!8340 (buf!7953 b2!97)))))))

(assert (=> start!69626 e!225396))

(assert (=> start!69626 true))

(declare-fun e!225395 () Bool)

(declare-fun inv!12 (BitStream!13784) Bool)

(assert (=> start!69626 (and (inv!12 b1!97) e!225395)))

(declare-fun e!225394 () Bool)

(assert (=> start!69626 (and (inv!12 b2!97) e!225394)))

(declare-fun b!313265 () Bool)

(declare-fun res!256460 () Bool)

(assert (=> b!313265 (=> (not res!256460) (not e!225396))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313265 (= res!256460 (validate_offset_bits!1 ((_ sign_extend 32) (size!8340 (buf!7953 b1!97))) ((_ sign_extend 32) (currentByte!14672 b1!97)) ((_ sign_extend 32) (currentBit!14667 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313266 () Bool)

(assert (=> b!313266 (= e!225400 (and (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!313267 () Bool)

(declare-fun array_inv!7892 (array!19226) Bool)

(assert (=> b!313267 (= e!225395 (array_inv!7892 (buf!7953 b1!97)))))

(declare-fun b!313268 () Bool)

(assert (=> b!313268 (= e!225394 (array_inv!7892 (buf!7953 b2!97)))))

(declare-fun b!313269 () Bool)

(declare-fun res!256463 () Bool)

(assert (=> b!313269 (=> (not res!256463) (not e!225396))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313269 (= res!256463 (bvsle (bitIndex!0 (size!8340 (buf!7953 b2!97)) (currentByte!14672 b2!97) (currentBit!14667 b2!97)) (bvadd (bitIndex!0 (size!8340 (buf!7953 b1!97)) (currentByte!14672 b1!97) (currentBit!14667 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313270 () Bool)

(declare-fun res!256466 () Bool)

(assert (=> b!313270 (=> (not res!256466) (not e!225396))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313270 (= res!256466 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8340 (buf!7953 b1!97))) ((_ sign_extend 32) (currentByte!14672 b1!97)) ((_ sign_extend 32) (currentBit!14667 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313271 () Bool)

(declare-fun res!256464 () Bool)

(assert (=> b!313271 (=> (not res!256464) (not e!225400))))

(assert (=> b!313271 (= res!256464 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8340 (buf!7953 b2!97))) ((_ sign_extend 32) (currentByte!14672 b2!97)) ((_ sign_extend 32) (currentBit!14667 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!313272 () Bool)

(assert (=> b!313272 (= e!225396 e!225399)))

(declare-fun res!256461 () Bool)

(assert (=> b!313272 (=> (not res!256461) (not e!225399))))

(assert (=> b!313272 (= res!256461 (bvsge (bvsub lt!442169 lt!442168) b1ValidateOffsetBits!10))))

(assert (=> b!313272 (= lt!442168 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14672 b1!97))) ((_ sign_extend 32) (currentBit!14667 b1!97))))))

(assert (=> b!313272 (= lt!442169 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8340 (buf!7953 b1!97)))))))

(assert (= (and start!69626 res!256462) b!313265))

(assert (= (and b!313265 res!256460) b!313269))

(assert (= (and b!313269 res!256463) b!313270))

(assert (= (and b!313270 res!256466) b!313272))

(assert (= (and b!313272 res!256461) b!313264))

(assert (= (and b!313264 res!256465) b!313271))

(assert (= (and b!313271 res!256464) b!313266))

(assert (= start!69626 b!313267))

(assert (= start!69626 b!313268))

(declare-fun m!450821 () Bool)

(assert (=> b!313268 m!450821))

(declare-fun m!450823 () Bool)

(assert (=> start!69626 m!450823))

(declare-fun m!450825 () Bool)

(assert (=> start!69626 m!450825))

(declare-fun m!450827 () Bool)

(assert (=> b!313271 m!450827))

(declare-fun m!450829 () Bool)

(assert (=> b!313269 m!450829))

(declare-fun m!450831 () Bool)

(assert (=> b!313269 m!450831))

(declare-fun m!450833 () Bool)

(assert (=> b!313265 m!450833))

(declare-fun m!450835 () Bool)

(assert (=> b!313267 m!450835))

(declare-fun m!450837 () Bool)

(assert (=> b!313270 m!450837))

(push 1)

(assert (not b!313271))

(assert (not b!313265))

(assert (not start!69626))

(assert (not b!313269))

(assert (not b!313270))

(assert (not b!313268))

(assert (not b!313267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

