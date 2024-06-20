; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48334 () Bool)

(assert start!48334)

(declare-fun b!229279 () Bool)

(declare-fun res!192220 () Bool)

(declare-fun e!157354 () Bool)

(assert (=> b!229279 (=> (not res!192220) (not e!157354))))

(declare-datatypes ((array!11652 0))(
  ( (array!11653 (arr!6099 (Array (_ BitVec 32) (_ BitVec 8))) (size!5112 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9320 0))(
  ( (BitStream!9321 (buf!5653 array!11652) (currentByte!10547 (_ BitVec 32)) (currentBit!10542 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9320)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229279 (= res!192220 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5112 (buf!5653 b1!101))) ((_ sign_extend 32) (currentByte!10547 b1!101)) ((_ sign_extend 32) (currentBit!10542 b1!101)) bytes!19))))

(declare-fun b!229280 () Bool)

(assert (=> b!229280 (= e!157354 (and (bvsle ((_ sign_extend 32) (size!5112 (buf!5653 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10547 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10542 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5112 (buf!5653 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10547 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10542 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229281 () Bool)

(declare-fun res!192219 () Bool)

(assert (=> b!229281 (=> (not res!192219) (not e!157354))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367215 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229281 (= res!192219 (= lt!367215 (bvadd (bitIndex!0 (size!5112 (buf!5653 b1!101)) (currentByte!10547 b1!101) (currentBit!10542 b1!101)) bits!86)))))

(declare-fun b!229282 () Bool)

(declare-fun e!157355 () Bool)

(declare-fun array_inv!4853 (array!11652) Bool)

(assert (=> b!229282 (= e!157355 (array_inv!4853 (buf!5653 b1!101)))))

(declare-fun b!229283 () Bool)

(declare-fun e!157357 () Bool)

(assert (=> b!229283 (= e!157357 e!157354)))

(declare-fun res!192218 () Bool)

(assert (=> b!229283 (=> (not res!192218) (not e!157354))))

(assert (=> b!229283 (= res!192218 (and (bvsle bits!86 lt!367215) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9320)

(assert (=> b!229283 (= lt!367215 (bitIndex!0 (size!5112 (buf!5653 b2!99)) (currentByte!10547 b2!99) (currentBit!10542 b2!99)))))

(declare-fun res!192217 () Bool)

(assert (=> start!48334 (=> (not res!192217) (not e!157357))))

(assert (=> start!48334 (= res!192217 (and (= (size!5112 (buf!5653 b1!101)) (size!5112 (buf!5653 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48334 e!157357))

(declare-fun inv!12 (BitStream!9320) Bool)

(assert (=> start!48334 (and (inv!12 b1!101) e!157355)))

(declare-fun e!157353 () Bool)

(assert (=> start!48334 (and (inv!12 b2!99) e!157353)))

(assert (=> start!48334 true))

(declare-fun b!229284 () Bool)

(assert (=> b!229284 (= e!157353 (array_inv!4853 (buf!5653 b2!99)))))

(assert (= (and start!48334 res!192217) b!229283))

(assert (= (and b!229283 res!192218) b!229279))

(assert (= (and b!229279 res!192220) b!229281))

(assert (= (and b!229281 res!192219) b!229280))

(assert (= start!48334 b!229282))

(assert (= start!48334 b!229284))

(declare-fun m!352997 () Bool)

(assert (=> b!229284 m!352997))

(declare-fun m!352999 () Bool)

(assert (=> b!229283 m!352999))

(declare-fun m!353001 () Bool)

(assert (=> b!229282 m!353001))

(declare-fun m!353003 () Bool)

(assert (=> b!229281 m!353003))

(declare-fun m!353005 () Bool)

(assert (=> b!229279 m!353005))

(declare-fun m!353007 () Bool)

(assert (=> start!48334 m!353007))

(declare-fun m!353009 () Bool)

(assert (=> start!48334 m!353009))

(push 1)

(assert (not b!229279))

(assert (not start!48334))

(assert (not b!229283))

(assert (not b!229282))

(assert (not b!229284))

(assert (not b!229281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77780 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77780 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5112 (buf!5653 b1!101))) ((_ sign_extend 32) (currentByte!10547 b1!101)) ((_ sign_extend 32) (currentBit!10542 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5112 (buf!5653 b1!101))) ((_ sign_extend 32) (currentByte!10547 b1!101)) ((_ sign_extend 32) (currentBit!10542 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19054 () Bool)

(assert (= bs!19054 d!77780))

(declare-fun m!353017 () Bool)

(assert (=> bs!19054 m!353017))

(assert (=> b!229279 d!77780))

(declare-fun d!77784 () Bool)

(assert (=> d!77784 (= (array_inv!4853 (buf!5653 b2!99)) (bvsge (size!5112 (buf!5653 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229284 d!77784))

(declare-fun d!77790 () Bool)

(declare-fun e!157368 () Bool)

(assert (=> d!77790 e!157368))

(declare-fun res!192242 () Bool)

(assert (=> d!77790 (=> (not res!192242) (not e!157368))))

(declare-fun lt!367278 () (_ BitVec 64))

(declare-fun lt!367277 () (_ BitVec 64))

(declare-fun lt!367280 () (_ BitVec 64))

(assert (=> d!77790 (= res!192242 (= lt!367278 (bvsub lt!367280 lt!367277)))))

(assert (=> d!77790 (or (= (bvand lt!367280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367277 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367280 lt!367277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77790 (= lt!367277 (remainingBits!0 ((_ sign_extend 32) (size!5112 (buf!5653 b2!99))) ((_ sign_extend 32) (currentByte!10547 b2!99)) ((_ sign_extend 32) (currentBit!10542 b2!99))))))

(declare-fun lt!367281 () (_ BitVec 64))

(declare-fun lt!367279 () (_ BitVec 64))

(assert (=> d!77790 (= lt!367280 (bvmul lt!367281 lt!367279))))

(assert (=> d!77790 (or (= lt!367281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367279 (bvsdiv (bvmul lt!367281 lt!367279) lt!367281)))))

(assert (=> d!77790 (= lt!367279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77790 (= lt!367281 ((_ sign_extend 32) (size!5112 (buf!5653 b2!99))))))

(assert (=> d!77790 (= lt!367278 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10547 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10542 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77790 (invariant!0 (currentBit!10542 b2!99) (currentByte!10547 b2!99) (size!5112 (buf!5653 b2!99)))))

(assert (=> d!77790 (= (bitIndex!0 (size!5112 (buf!5653 b2!99)) (currentByte!10547 b2!99) (currentBit!10542 b2!99)) lt!367278)))

(declare-fun b!229305 () Bool)

(declare-fun res!192241 () Bool)

(assert (=> b!229305 (=> (not res!192241) (not e!157368))))

(assert (=> b!229305 (= res!192241 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367278))))

(declare-fun b!229306 () Bool)

(declare-fun lt!367276 () (_ BitVec 64))

(assert (=> b!229306 (= e!157368 (bvsle lt!367278 (bvmul lt!367276 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229306 (or (= lt!367276 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367276 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367276)))))

(assert (=> b!229306 (= lt!367276 ((_ sign_extend 32) (size!5112 (buf!5653 b2!99))))))

(assert (= (and d!77790 res!192242) b!229305))

(assert (= (and b!229305 res!192241) b!229306))

(declare-fun m!353029 () Bool)

(assert (=> d!77790 m!353029))

(declare-fun m!353031 () Bool)

(assert (=> d!77790 m!353031))

(assert (=> b!229283 d!77790))

(declare-fun d!77804 () Bool)

(assert (=> d!77804 (= (array_inv!4853 (buf!5653 b1!101)) (bvsge (size!5112 (buf!5653 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229282 d!77804))

(declare-fun d!77806 () Bool)

(declare-fun e!157369 () Bool)

(assert (=> d!77806 e!157369))

(declare-fun res!192244 () Bool)

(assert (=> d!77806 (=> (not res!192244) (not e!157369))))

(declare-fun lt!367284 () (_ BitVec 64))

(declare-fun lt!367283 () (_ BitVec 64))

(declare-fun lt!367286 () (_ BitVec 64))

(assert (=> d!77806 (= res!192244 (= lt!367284 (bvsub lt!367286 lt!367283)))))

(assert (=> d!77806 (or (= (bvand lt!367286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367283 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367286 lt!367283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77806 (= lt!367283 (remainingBits!0 ((_ sign_extend 32) (size!5112 (buf!5653 b1!101))) ((_ sign_extend 32) (currentByte!10547 b1!101)) ((_ sign_extend 32) (currentBit!10542 b1!101))))))

(declare-fun lt!367287 () (_ BitVec 64))

(declare-fun lt!367285 () (_ BitVec 64))

(assert (=> d!77806 (= lt!367286 (bvmul lt!367287 lt!367285))))

(assert (=> d!77806 (or (= lt!367287 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367285 (bvsdiv (bvmul lt!367287 lt!367285) lt!367287)))))

(assert (=> d!77806 (= lt!367285 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77806 (= lt!367287 ((_ sign_extend 32) (size!5112 (buf!5653 b1!101))))))

(assert (=> d!77806 (= lt!367284 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10547 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10542 b1!101))))))

(assert (=> d!77806 (invariant!0 (currentBit!10542 b1!101) (currentByte!10547 b1!101) (size!5112 (buf!5653 b1!101)))))

(assert (=> d!77806 (= (bitIndex!0 (size!5112 (buf!5653 b1!101)) (currentByte!10547 b1!101) (currentBit!10542 b1!101)) lt!367284)))

(declare-fun b!229307 () Bool)

(declare-fun res!192243 () Bool)

(assert (=> b!229307 (=> (not res!192243) (not e!157369))))

(assert (=> b!229307 (= res!192243 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367284))))

(declare-fun b!229308 () Bool)

(declare-fun lt!367282 () (_ BitVec 64))

(assert (=> b!229308 (= e!157369 (bvsle lt!367284 (bvmul lt!367282 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229308 (or (= lt!367282 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367282 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367282)))))

(assert (=> b!229308 (= lt!367282 ((_ sign_extend 32) (size!5112 (buf!5653 b1!101))))))

(assert (= (and d!77806 res!192244) b!229307))

(assert (= (and b!229307 res!192243) b!229308))

(assert (=> d!77806 m!353017))

(declare-fun m!353033 () Bool)

(assert (=> d!77806 m!353033))

(assert (=> b!229281 d!77806))

(declare-fun d!77808 () Bool)

(assert (=> d!77808 (= (inv!12 b1!101) (invariant!0 (currentBit!10542 b1!101) (currentByte!10547 b1!101) (size!5112 (buf!5653 b1!101))))))

(declare-fun bs!19060 () Bool)

(assert (= bs!19060 d!77808))

(assert (=> bs!19060 m!353033))

(assert (=> start!48334 d!77808))

(declare-fun d!77810 () Bool)

(assert (=> d!77810 (= (inv!12 b2!99) (invariant!0 (currentBit!10542 b2!99) (currentByte!10547 b2!99) (size!5112 (buf!5653 b2!99))))))

(declare-fun bs!19061 () Bool)

(assert (= bs!19061 d!77810))

(assert (=> bs!19061 m!353031))

(assert (=> start!48334 d!77810))

(push 1)

(assert (not d!77790))

(assert (not d!77810))

(assert (not d!77808))

(assert (not d!77780))

(assert (not d!77806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

