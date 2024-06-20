; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48366 () Bool)

(assert start!48366)

(declare-fun b!229344 () Bool)

(declare-fun e!157404 () Bool)

(declare-datatypes ((array!11659 0))(
  ( (array!11660 (arr!6101 (Array (_ BitVec 32) (_ BitVec 8))) (size!5114 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9324 0))(
  ( (BitStream!9325 (buf!5655 array!11659) (currentByte!10557 (_ BitVec 32)) (currentBit!10552 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9324)

(declare-fun array_inv!4855 (array!11659) Bool)

(assert (=> b!229344 (= e!157404 (array_inv!4855 (buf!5655 b2!99)))))

(declare-fun b!229345 () Bool)

(declare-fun e!157400 () Bool)

(declare-fun e!157405 () Bool)

(assert (=> b!229345 (= e!157400 e!157405)))

(declare-fun res!192273 () Bool)

(assert (=> b!229345 (=> (not res!192273) (not e!157405))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367293 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229345 (= res!192273 (and (bvsle bits!86 lt!367293) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229345 (= lt!367293 (bitIndex!0 (size!5114 (buf!5655 b2!99)) (currentByte!10557 b2!99) (currentBit!10552 b2!99)))))

(declare-fun b!229346 () Bool)

(declare-fun res!192274 () Bool)

(assert (=> b!229346 (=> (not res!192274) (not e!157405))))

(declare-fun b1!101 () BitStream!9324)

(assert (=> b!229346 (= res!192274 (and (bvsle ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10557 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10552 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10557 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10552 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!229347 () Bool)

(declare-fun e!157403 () Bool)

(assert (=> b!229347 (= e!157403 (array_inv!4855 (buf!5655 b1!101)))))

(declare-fun b!229348 () Bool)

(declare-fun res!192270 () Bool)

(assert (=> b!229348 (=> (not res!192270) (not e!157405))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229348 (= res!192270 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))) ((_ sign_extend 32) (currentByte!10557 b1!101)) ((_ sign_extend 32) (currentBit!10552 b1!101)) bytes!19))))

(declare-fun b!229350 () Bool)

(declare-fun res!192271 () Bool)

(assert (=> b!229350 (=> (not res!192271) (not e!157405))))

(assert (=> b!229350 (= res!192271 (= lt!367293 (bvadd (bitIndex!0 (size!5114 (buf!5655 b1!101)) (currentByte!10557 b1!101) (currentBit!10552 b1!101)) bits!86)))))

(declare-fun res!192272 () Bool)

(assert (=> start!48366 (=> (not res!192272) (not e!157400))))

(assert (=> start!48366 (= res!192272 (and (= (size!5114 (buf!5655 b1!101)) (size!5114 (buf!5655 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48366 e!157400))

(declare-fun inv!12 (BitStream!9324) Bool)

(assert (=> start!48366 (and (inv!12 b1!101) e!157403)))

(assert (=> start!48366 (and (inv!12 b2!99) e!157404)))

(assert (=> start!48366 true))

(declare-fun b!229349 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229349 (= e!157405 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10552 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10557 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5114 (buf!5655 b1!101)))))))))

(assert (= (and start!48366 res!192272) b!229345))

(assert (= (and b!229345 res!192273) b!229348))

(assert (= (and b!229348 res!192270) b!229350))

(assert (= (and b!229350 res!192271) b!229346))

(assert (= (and b!229346 res!192274) b!229349))

(assert (= start!48366 b!229347))

(assert (= start!48366 b!229344))

(declare-fun m!353051 () Bool)

(assert (=> start!48366 m!353051))

(declare-fun m!353053 () Bool)

(assert (=> start!48366 m!353053))

(declare-fun m!353055 () Bool)

(assert (=> b!229350 m!353055))

(declare-fun m!353057 () Bool)

(assert (=> b!229349 m!353057))

(declare-fun m!353059 () Bool)

(assert (=> b!229348 m!353059))

(declare-fun m!353061 () Bool)

(assert (=> b!229345 m!353061))

(declare-fun m!353063 () Bool)

(assert (=> b!229344 m!353063))

(declare-fun m!353065 () Bool)

(assert (=> b!229347 m!353065))

(check-sat (not b!229348) (not b!229344) (not b!229345) (not start!48366) (not b!229349) (not b!229347) (not b!229350))
(check-sat)
(get-model)

(declare-fun d!77822 () Bool)

(declare-fun e!157426 () Bool)

(assert (=> d!77822 e!157426))

(declare-fun res!192294 () Bool)

(assert (=> d!77822 (=> (not res!192294) (not e!157426))))

(declare-fun lt!367313 () (_ BitVec 64))

(declare-fun lt!367310 () (_ BitVec 64))

(declare-fun lt!367314 () (_ BitVec 64))

(assert (=> d!77822 (= res!192294 (= lt!367310 (bvsub lt!367313 lt!367314)))))

(assert (=> d!77822 (or (= (bvand lt!367313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367314 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367313 lt!367314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77822 (= lt!367314 (remainingBits!0 ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))) ((_ sign_extend 32) (currentByte!10557 b1!101)) ((_ sign_extend 32) (currentBit!10552 b1!101))))))

(declare-fun lt!367309 () (_ BitVec 64))

(declare-fun lt!367312 () (_ BitVec 64))

(assert (=> d!77822 (= lt!367313 (bvmul lt!367309 lt!367312))))

(assert (=> d!77822 (or (= lt!367309 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367312 (bvsdiv (bvmul lt!367309 lt!367312) lt!367309)))))

(assert (=> d!77822 (= lt!367312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77822 (= lt!367309 ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))))))

(assert (=> d!77822 (= lt!367310 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10557 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10552 b1!101))))))

(assert (=> d!77822 (invariant!0 (currentBit!10552 b1!101) (currentByte!10557 b1!101) (size!5114 (buf!5655 b1!101)))))

(assert (=> d!77822 (= (bitIndex!0 (size!5114 (buf!5655 b1!101)) (currentByte!10557 b1!101) (currentBit!10552 b1!101)) lt!367310)))

(declare-fun b!229376 () Bool)

(declare-fun res!192295 () Bool)

(assert (=> b!229376 (=> (not res!192295) (not e!157426))))

(assert (=> b!229376 (= res!192295 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367310))))

(declare-fun b!229377 () Bool)

(declare-fun lt!367311 () (_ BitVec 64))

(assert (=> b!229377 (= e!157426 (bvsle lt!367310 (bvmul lt!367311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229377 (or (= lt!367311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367311)))))

(assert (=> b!229377 (= lt!367311 ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))))))

(assert (= (and d!77822 res!192294) b!229376))

(assert (= (and b!229376 res!192295) b!229377))

(declare-fun m!353083 () Bool)

(assert (=> d!77822 m!353083))

(declare-fun m!353085 () Bool)

(assert (=> d!77822 m!353085))

(assert (=> b!229350 d!77822))

(declare-fun d!77824 () Bool)

(assert (=> d!77824 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10552 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10557 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10552 b1!101))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10552 b1!101))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10557 b1!101))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10557 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10552 b1!101))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10557 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5114 (buf!5655 b1!101)))))))))))

(assert (=> b!229349 d!77824))

(declare-fun d!77826 () Bool)

(assert (=> d!77826 (= (array_inv!4855 (buf!5655 b2!99)) (bvsge (size!5114 (buf!5655 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229344 d!77826))

(declare-fun d!77828 () Bool)

(assert (=> d!77828 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))) ((_ sign_extend 32) (currentByte!10557 b1!101)) ((_ sign_extend 32) (currentBit!10552 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5114 (buf!5655 b1!101))) ((_ sign_extend 32) (currentByte!10557 b1!101)) ((_ sign_extend 32) (currentBit!10552 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19065 () Bool)

(assert (= bs!19065 d!77828))

(assert (=> bs!19065 m!353083))

(assert (=> b!229348 d!77828))

(declare-fun d!77830 () Bool)

(assert (=> d!77830 (= (array_inv!4855 (buf!5655 b1!101)) (bvsge (size!5114 (buf!5655 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229347 d!77830))

(declare-fun d!77832 () Bool)

(assert (=> d!77832 (= (inv!12 b1!101) (invariant!0 (currentBit!10552 b1!101) (currentByte!10557 b1!101) (size!5114 (buf!5655 b1!101))))))

(declare-fun bs!19066 () Bool)

(assert (= bs!19066 d!77832))

(assert (=> bs!19066 m!353085))

(assert (=> start!48366 d!77832))

(declare-fun d!77834 () Bool)

(assert (=> d!77834 (= (inv!12 b2!99) (invariant!0 (currentBit!10552 b2!99) (currentByte!10557 b2!99) (size!5114 (buf!5655 b2!99))))))

(declare-fun bs!19067 () Bool)

(assert (= bs!19067 d!77834))

(declare-fun m!353087 () Bool)

(assert (=> bs!19067 m!353087))

(assert (=> start!48366 d!77834))

(declare-fun d!77836 () Bool)

(declare-fun e!157427 () Bool)

(assert (=> d!77836 e!157427))

(declare-fun res!192296 () Bool)

(assert (=> d!77836 (=> (not res!192296) (not e!157427))))

(declare-fun lt!367319 () (_ BitVec 64))

(declare-fun lt!367316 () (_ BitVec 64))

(declare-fun lt!367320 () (_ BitVec 64))

(assert (=> d!77836 (= res!192296 (= lt!367316 (bvsub lt!367319 lt!367320)))))

(assert (=> d!77836 (or (= (bvand lt!367319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367320 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367319 lt!367320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77836 (= lt!367320 (remainingBits!0 ((_ sign_extend 32) (size!5114 (buf!5655 b2!99))) ((_ sign_extend 32) (currentByte!10557 b2!99)) ((_ sign_extend 32) (currentBit!10552 b2!99))))))

(declare-fun lt!367315 () (_ BitVec 64))

(declare-fun lt!367318 () (_ BitVec 64))

(assert (=> d!77836 (= lt!367319 (bvmul lt!367315 lt!367318))))

(assert (=> d!77836 (or (= lt!367315 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367318 (bvsdiv (bvmul lt!367315 lt!367318) lt!367315)))))

(assert (=> d!77836 (= lt!367318 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77836 (= lt!367315 ((_ sign_extend 32) (size!5114 (buf!5655 b2!99))))))

(assert (=> d!77836 (= lt!367316 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10557 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10552 b2!99))))))

(assert (=> d!77836 (invariant!0 (currentBit!10552 b2!99) (currentByte!10557 b2!99) (size!5114 (buf!5655 b2!99)))))

(assert (=> d!77836 (= (bitIndex!0 (size!5114 (buf!5655 b2!99)) (currentByte!10557 b2!99) (currentBit!10552 b2!99)) lt!367316)))

(declare-fun b!229378 () Bool)

(declare-fun res!192297 () Bool)

(assert (=> b!229378 (=> (not res!192297) (not e!157427))))

(assert (=> b!229378 (= res!192297 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367316))))

(declare-fun b!229379 () Bool)

(declare-fun lt!367317 () (_ BitVec 64))

(assert (=> b!229379 (= e!157427 (bvsle lt!367316 (bvmul lt!367317 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229379 (or (= lt!367317 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367317 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367317)))))

(assert (=> b!229379 (= lt!367317 ((_ sign_extend 32) (size!5114 (buf!5655 b2!99))))))

(assert (= (and d!77836 res!192296) b!229378))

(assert (= (and b!229378 res!192297) b!229379))

(declare-fun m!353089 () Bool)

(assert (=> d!77836 m!353089))

(assert (=> d!77836 m!353087))

(assert (=> b!229345 d!77836))

(check-sat (not d!77834) (not d!77836) (not d!77832) (not d!77822) (not d!77828))
