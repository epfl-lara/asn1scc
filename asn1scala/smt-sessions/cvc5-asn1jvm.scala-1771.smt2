; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48442 () Bool)

(assert start!48442)

(declare-fun b!229508 () Bool)

(declare-fun e!157519 () Bool)

(declare-datatypes ((array!11675 0))(
  ( (array!11676 (arr!6106 (Array (_ BitVec 32) (_ BitVec 8))) (size!5119 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9334 0))(
  ( (BitStream!9335 (buf!5660 array!11675) (currentByte!10583 (_ BitVec 32)) (currentBit!10578 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9334)

(declare-fun array_inv!4860 (array!11675) Bool)

(assert (=> b!229508 (= e!157519 (array_inv!4860 (buf!5660 b2!99)))))

(declare-fun b!229509 () Bool)

(declare-fun res!192408 () Bool)

(declare-fun e!157518 () Bool)

(assert (=> b!229509 (=> (not res!192408) (not e!157518))))

(declare-fun b1!101 () BitStream!9334)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229509 (= res!192408 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5119 (buf!5660 b1!101))) ((_ sign_extend 32) (currentByte!10583 b1!101)) ((_ sign_extend 32) (currentBit!10578 b1!101)) bytes!19))))

(declare-fun b!229510 () Bool)

(declare-fun e!157515 () Bool)

(assert (=> b!229510 (= e!157515 (array_inv!4860 (buf!5660 b1!101)))))

(declare-fun res!192407 () Bool)

(declare-fun e!157517 () Bool)

(assert (=> start!48442 (=> (not res!192407) (not e!157517))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> start!48442 (= res!192407 (and (= (size!5119 (buf!5660 b1!101)) (size!5119 (buf!5660 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48442 e!157517))

(declare-fun inv!12 (BitStream!9334) Bool)

(assert (=> start!48442 (and (inv!12 b1!101) e!157515)))

(assert (=> start!48442 (and (inv!12 b2!99) e!157519)))

(assert (=> start!48442 true))

(declare-fun b!229511 () Bool)

(declare-fun res!192406 () Bool)

(assert (=> b!229511 (=> (not res!192406) (not e!157518))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229511 (= res!192406 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5119 (buf!5660 b1!101))) ((_ sign_extend 32) (currentByte!10583 b1!101)) ((_ sign_extend 32) (currentBit!10578 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229512 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229512 (= e!157518 (not (invariant!0 (currentBit!10578 b2!99) (currentByte!10583 b2!99) (size!5119 (buf!5660 b2!99)))))))

(declare-fun b!229513 () Bool)

(assert (=> b!229513 (= e!157517 e!157518)))

(declare-fun res!192404 () Bool)

(assert (=> b!229513 (=> (not res!192404) (not e!157518))))

(declare-fun lt!367452 () (_ BitVec 64))

(assert (=> b!229513 (= res!192404 (and (bvsle bits!86 lt!367452) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229513 (= lt!367452 (bitIndex!0 (size!5119 (buf!5660 b2!99)) (currentByte!10583 b2!99) (currentBit!10578 b2!99)))))

(declare-fun b!229514 () Bool)

(declare-fun res!192405 () Bool)

(assert (=> b!229514 (=> (not res!192405) (not e!157518))))

(assert (=> b!229514 (= res!192405 (= lt!367452 (bvadd (bitIndex!0 (size!5119 (buf!5660 b1!101)) (currentByte!10583 b1!101) (currentBit!10578 b1!101)) bits!86)))))

(declare-fun b!229515 () Bool)

(declare-fun res!192409 () Bool)

(assert (=> b!229515 (=> (not res!192409) (not e!157518))))

(assert (=> b!229515 (= res!192409 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5119 (buf!5660 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10583 b1!101))) ((_ sign_extend 32) (currentBit!10578 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!367452 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10583 b2!99))) ((_ sign_extend 32) (currentBit!10578 b2!99))))))))

(assert (= (and start!48442 res!192407) b!229513))

(assert (= (and b!229513 res!192404) b!229509))

(assert (= (and b!229509 res!192408) b!229514))

(assert (= (and b!229514 res!192405) b!229511))

(assert (= (and b!229511 res!192406) b!229515))

(assert (= (and b!229515 res!192409) b!229512))

(assert (= start!48442 b!229510))

(assert (= start!48442 b!229508))

(declare-fun m!353173 () Bool)

(assert (=> start!48442 m!353173))

(declare-fun m!353175 () Bool)

(assert (=> start!48442 m!353175))

(declare-fun m!353177 () Bool)

(assert (=> b!229509 m!353177))

(declare-fun m!353179 () Bool)

(assert (=> b!229510 m!353179))

(declare-fun m!353181 () Bool)

(assert (=> b!229513 m!353181))

(declare-fun m!353183 () Bool)

(assert (=> b!229511 m!353183))

(declare-fun m!353185 () Bool)

(assert (=> b!229512 m!353185))

(declare-fun m!353187 () Bool)

(assert (=> b!229508 m!353187))

(declare-fun m!353189 () Bool)

(assert (=> b!229514 m!353189))

(push 1)

(assert (not b!229513))

(assert (not b!229514))

(assert (not b!229508))

(assert (not start!48442))

(assert (not b!229511))

(assert (not b!229510))

(assert (not b!229512))

(assert (not b!229509))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77946 () Bool)

(assert (=> d!77946 (= (array_inv!4860 (buf!5660 b1!101)) (bvsge (size!5119 (buf!5660 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229510 d!77946))

(declare-fun d!77948 () Bool)

(assert (=> d!77948 (= (remainingBits!0 ((_ sign_extend 32) (size!5119 (buf!5660 b1!101))) ((_ sign_extend 32) (currentByte!10583 b1!101)) ((_ sign_extend 32) (currentBit!10578 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5119 (buf!5660 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10583 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10578 b1!101)))))))

(assert (=> b!229511 d!77948))

(declare-fun d!77950 () Bool)

(assert (=> d!77950 (= (inv!12 b1!101) (invariant!0 (currentBit!10578 b1!101) (currentByte!10583 b1!101) (size!5119 (buf!5660 b1!101))))))

(declare-fun bs!19092 () Bool)

(assert (= bs!19092 d!77950))

(declare-fun m!353231 () Bool)

(assert (=> bs!19092 m!353231))

(assert (=> start!48442 d!77950))

(declare-fun d!77952 () Bool)

(assert (=> d!77952 (= (inv!12 b2!99) (invariant!0 (currentBit!10578 b2!99) (currentByte!10583 b2!99) (size!5119 (buf!5660 b2!99))))))

(declare-fun bs!19093 () Bool)

(assert (= bs!19093 d!77952))

(assert (=> bs!19093 m!353185))

(assert (=> start!48442 d!77952))

(declare-fun d!77954 () Bool)

(assert (=> d!77954 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5119 (buf!5660 b1!101))) ((_ sign_extend 32) (currentByte!10583 b1!101)) ((_ sign_extend 32) (currentBit!10578 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5119 (buf!5660 b1!101))) ((_ sign_extend 32) (currentByte!10583 b1!101)) ((_ sign_extend 32) (currentBit!10578 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19094 () Bool)

(assert (= bs!19094 d!77954))

(assert (=> bs!19094 m!353183))

(assert (=> b!229509 d!77954))

(declare-fun d!77956 () Bool)

(declare-fun e!157562 () Bool)

(assert (=> d!77956 e!157562))

(declare-fun res!192458 () Bool)

(assert (=> d!77956 (=> (not res!192458) (not e!157562))))

(declare-fun lt!367499 () (_ BitVec 64))

(declare-fun lt!367495 () (_ BitVec 64))

(declare-fun lt!367497 () (_ BitVec 64))

(assert (=> d!77956 (= res!192458 (= lt!367495 (bvsub lt!367497 lt!367499)))))

(assert (=> d!77956 (or (= (bvand lt!367497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367499 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367497 lt!367499) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77956 (= lt!367499 (remainingBits!0 ((_ sign_extend 32) (size!5119 (buf!5660 b1!101))) ((_ sign_extend 32) (currentByte!10583 b1!101)) ((_ sign_extend 32) (currentBit!10578 b1!101))))))

(declare-fun lt!367500 () (_ BitVec 64))

(declare-fun lt!367496 () (_ BitVec 64))

(assert (=> d!77956 (= lt!367497 (bvmul lt!367500 lt!367496))))

(assert (=> d!77956 (or (= lt!367500 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367496 (bvsdiv (bvmul lt!367500 lt!367496) lt!367500)))))

(assert (=> d!77956 (= lt!367496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77956 (= lt!367500 ((_ sign_extend 32) (size!5119 (buf!5660 b1!101))))))

(assert (=> d!77956 (= lt!367495 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10583 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10578 b1!101))))))

(assert (=> d!77956 (invariant!0 (currentBit!10578 b1!101) (currentByte!10583 b1!101) (size!5119 (buf!5660 b1!101)))))

(assert (=> d!77956 (= (bitIndex!0 (size!5119 (buf!5660 b1!101)) (currentByte!10583 b1!101) (currentBit!10578 b1!101)) lt!367495)))

(declare-fun b!229576 () Bool)

(declare-fun res!192459 () Bool)

(assert (=> b!229576 (=> (not res!192459) (not e!157562))))

(assert (=> b!229576 (= res!192459 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367495))))

(declare-fun b!229577 () Bool)

(declare-fun lt!367498 () (_ BitVec 64))

(assert (=> b!229577 (= e!157562 (bvsle lt!367495 (bvmul lt!367498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229577 (or (= lt!367498 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367498 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367498)))))

(assert (=> b!229577 (= lt!367498 ((_ sign_extend 32) (size!5119 (buf!5660 b1!101))))))

(assert (= (and d!77956 res!192458) b!229576))

(assert (= (and b!229576 res!192459) b!229577))

(assert (=> d!77956 m!353183))

(assert (=> d!77956 m!353231))

(assert (=> b!229514 d!77956))

(declare-fun d!77966 () Bool)

(declare-fun e!157563 () Bool)

(assert (=> d!77966 e!157563))

(declare-fun res!192460 () Bool)

(assert (=> d!77966 (=> (not res!192460) (not e!157563))))

(declare-fun lt!367501 () (_ BitVec 64))

(declare-fun lt!367503 () (_ BitVec 64))

(declare-fun lt!367505 () (_ BitVec 64))

(assert (=> d!77966 (= res!192460 (= lt!367501 (bvsub lt!367503 lt!367505)))))

(assert (=> d!77966 (or (= (bvand lt!367503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367503 lt!367505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77966 (= lt!367505 (remainingBits!0 ((_ sign_extend 32) (size!5119 (buf!5660 b2!99))) ((_ sign_extend 32) (currentByte!10583 b2!99)) ((_ sign_extend 32) (currentBit!10578 b2!99))))))

(declare-fun lt!367506 () (_ BitVec 64))

(declare-fun lt!367502 () (_ BitVec 64))

(assert (=> d!77966 (= lt!367503 (bvmul lt!367506 lt!367502))))

(assert (=> d!77966 (or (= lt!367506 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367502 (bvsdiv (bvmul lt!367506 lt!367502) lt!367506)))))

(assert (=> d!77966 (= lt!367502 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77966 (= lt!367506 ((_ sign_extend 32) (size!5119 (buf!5660 b2!99))))))

(assert (=> d!77966 (= lt!367501 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10583 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10578 b2!99))))))

(assert (=> d!77966 (invariant!0 (currentBit!10578 b2!99) (currentByte!10583 b2!99) (size!5119 (buf!5660 b2!99)))))

(assert (=> d!77966 (= (bitIndex!0 (size!5119 (buf!5660 b2!99)) (currentByte!10583 b2!99) (currentBit!10578 b2!99)) lt!367501)))

(declare-fun b!229578 () Bool)

(declare-fun res!192461 () Bool)

(assert (=> b!229578 (=> (not res!192461) (not e!157563))))

(assert (=> b!229578 (= res!192461 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367501))))

(declare-fun b!229579 () Bool)

(declare-fun lt!367504 () (_ BitVec 64))

(assert (=> b!229579 (= e!157563 (bvsle lt!367501 (bvmul lt!367504 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229579 (or (= lt!367504 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367504 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367504)))))

(assert (=> b!229579 (= lt!367504 ((_ sign_extend 32) (size!5119 (buf!5660 b2!99))))))

(assert (= (and d!77966 res!192460) b!229578))

(assert (= (and b!229578 res!192461) b!229579))

(declare-fun m!353235 () Bool)

(assert (=> d!77966 m!353235))

(assert (=> d!77966 m!353185))

(assert (=> b!229513 d!77966))

(declare-fun d!77968 () Bool)

(assert (=> d!77968 (= (array_inv!4860 (buf!5660 b2!99)) (bvsge (size!5119 (buf!5660 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229508 d!77968))

(declare-fun d!77970 () Bool)

(assert (=> d!77970 (= (invariant!0 (currentBit!10578 b2!99) (currentByte!10583 b2!99) (size!5119 (buf!5660 b2!99))) (and (bvsge (currentBit!10578 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10578 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10583 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10583 b2!99) (size!5119 (buf!5660 b2!99))) (and (= (currentBit!10578 b2!99) #b00000000000000000000000000000000) (= (currentByte!10583 b2!99) (size!5119 (buf!5660 b2!99)))))))))

(assert (=> b!229512 d!77970))

(push 1)

(assert (not d!77954))

(assert (not d!77956))

(assert (not d!77950))

(assert (not d!77952))

(assert (not d!77966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

