; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48400 () Bool)

(assert start!48400)

(declare-fun b!229412 () Bool)

(declare-fun e!157453 () Bool)

(declare-fun e!157449 () Bool)

(assert (=> b!229412 (= e!157453 e!157449)))

(declare-fun res!192329 () Bool)

(assert (=> b!229412 (=> (not res!192329) (not e!157449))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367371 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229412 (= res!192329 (and (bvsle bits!86 lt!367371) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11666 0))(
  ( (array!11667 (arr!6103 (Array (_ BitVec 32) (_ BitVec 8))) (size!5116 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9328 0))(
  ( (BitStream!9329 (buf!5657 array!11666) (currentByte!10568 (_ BitVec 32)) (currentBit!10563 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9328)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229412 (= lt!367371 (bitIndex!0 (size!5116 (buf!5657 b2!99)) (currentByte!10568 b2!99) (currentBit!10563 b2!99)))))

(declare-fun b!229413 () Bool)

(declare-fun res!192328 () Bool)

(assert (=> b!229413 (=> (not res!192328) (not e!157449))))

(declare-fun b1!101 () BitStream!9328)

(assert (=> b!229413 (= res!192328 (= lt!367371 (bvadd (bitIndex!0 (size!5116 (buf!5657 b1!101)) (currentByte!10568 b1!101) (currentBit!10563 b1!101)) bits!86)))))

(declare-fun b!229414 () Bool)

(declare-fun res!192331 () Bool)

(assert (=> b!229414 (=> (not res!192331) (not e!157449))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229414 (= res!192331 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5116 (buf!5657 b1!101))) ((_ sign_extend 32) (currentByte!10568 b1!101)) ((_ sign_extend 32) (currentBit!10563 b1!101)) bytes!19))))

(declare-fun res!192326 () Bool)

(assert (=> start!48400 (=> (not res!192326) (not e!157453))))

(assert (=> start!48400 (= res!192326 (and (= (size!5116 (buf!5657 b1!101)) (size!5116 (buf!5657 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48400 e!157453))

(declare-fun e!157452 () Bool)

(declare-fun inv!12 (BitStream!9328) Bool)

(assert (=> start!48400 (and (inv!12 b1!101) e!157452)))

(declare-fun e!157448 () Bool)

(assert (=> start!48400 (and (inv!12 b2!99) e!157448)))

(assert (=> start!48400 true))

(declare-fun b!229415 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229415 (= e!157449 (not (invariant!0 (currentBit!10563 b2!99) (currentByte!10568 b2!99) (size!5116 (buf!5657 b2!99)))))))

(declare-fun b!229416 () Bool)

(declare-fun array_inv!4857 (array!11666) Bool)

(assert (=> b!229416 (= e!157452 (array_inv!4857 (buf!5657 b1!101)))))

(declare-fun b!229417 () Bool)

(assert (=> b!229417 (= e!157448 (array_inv!4857 (buf!5657 b2!99)))))

(declare-fun b!229418 () Bool)

(declare-fun res!192330 () Bool)

(assert (=> b!229418 (=> (not res!192330) (not e!157449))))

(assert (=> b!229418 (= res!192330 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5116 (buf!5657 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10568 b1!101))) ((_ sign_extend 32) (currentBit!10563 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229419 () Bool)

(declare-fun res!192327 () Bool)

(assert (=> b!229419 (=> (not res!192327) (not e!157449))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229419 (= res!192327 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5116 (buf!5657 b1!101))) ((_ sign_extend 32) (currentByte!10568 b1!101)) ((_ sign_extend 32) (currentBit!10563 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48400 res!192326) b!229412))

(assert (= (and b!229412 res!192329) b!229414))

(assert (= (and b!229414 res!192331) b!229413))

(assert (= (and b!229413 res!192328) b!229419))

(assert (= (and b!229419 res!192327) b!229418))

(assert (= (and b!229418 res!192330) b!229415))

(assert (= start!48400 b!229416))

(assert (= start!48400 b!229417))

(declare-fun m!353107 () Bool)

(assert (=> b!229414 m!353107))

(declare-fun m!353109 () Bool)

(assert (=> start!48400 m!353109))

(declare-fun m!353111 () Bool)

(assert (=> start!48400 m!353111))

(declare-fun m!353113 () Bool)

(assert (=> b!229416 m!353113))

(declare-fun m!353115 () Bool)

(assert (=> b!229419 m!353115))

(declare-fun m!353117 () Bool)

(assert (=> b!229413 m!353117))

(declare-fun m!353119 () Bool)

(assert (=> b!229415 m!353119))

(declare-fun m!353121 () Bool)

(assert (=> b!229412 m!353121))

(declare-fun m!353123 () Bool)

(assert (=> b!229417 m!353123))

(push 1)

(assert (not b!229412))

(assert (not b!229416))

(assert (not b!229419))

(assert (not b!229417))

(assert (not start!48400))

(assert (not b!229414))

(assert (not b!229415))

(assert (not b!229413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77890 () Bool)

(assert (=> d!77890 (= (array_inv!4857 (buf!5657 b2!99)) (bvsge (size!5116 (buf!5657 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229417 d!77890))

(declare-fun d!77892 () Bool)

(assert (=> d!77892 (= (array_inv!4857 (buf!5657 b1!101)) (bvsge (size!5116 (buf!5657 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229416 d!77892))

(declare-fun d!77894 () Bool)

(assert (=> d!77894 (= (inv!12 b1!101) (invariant!0 (currentBit!10563 b1!101) (currentByte!10568 b1!101) (size!5116 (buf!5657 b1!101))))))

(declare-fun bs!19080 () Bool)

(assert (= bs!19080 d!77894))

(declare-fun m!353165 () Bool)

(assert (=> bs!19080 m!353165))

(assert (=> start!48400 d!77894))

(declare-fun d!77896 () Bool)

(assert (=> d!77896 (= (inv!12 b2!99) (invariant!0 (currentBit!10563 b2!99) (currentByte!10568 b2!99) (size!5116 (buf!5657 b2!99))))))

(declare-fun bs!19081 () Bool)

(assert (= bs!19081 d!77896))

(assert (=> bs!19081 m!353119))

(assert (=> start!48400 d!77896))

(declare-fun d!77898 () Bool)

(assert (=> d!77898 (= (invariant!0 (currentBit!10563 b2!99) (currentByte!10568 b2!99) (size!5116 (buf!5657 b2!99))) (and (bvsge (currentBit!10563 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10563 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10568 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10568 b2!99) (size!5116 (buf!5657 b2!99))) (and (= (currentBit!10563 b2!99) #b00000000000000000000000000000000) (= (currentByte!10568 b2!99) (size!5116 (buf!5657 b2!99)))))))))

(assert (=> b!229415 d!77898))

(declare-fun d!77900 () Bool)

(assert (=> d!77900 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5116 (buf!5657 b1!101))) ((_ sign_extend 32) (currentByte!10568 b1!101)) ((_ sign_extend 32) (currentBit!10563 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5116 (buf!5657 b1!101))) ((_ sign_extend 32) (currentByte!10568 b1!101)) ((_ sign_extend 32) (currentBit!10563 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19082 () Bool)

(assert (= bs!19082 d!77900))

(assert (=> bs!19082 m!353115))

(assert (=> b!229414 d!77900))

(declare-fun d!77902 () Bool)

(assert (=> d!77902 (= (remainingBits!0 ((_ sign_extend 32) (size!5116 (buf!5657 b1!101))) ((_ sign_extend 32) (currentByte!10568 b1!101)) ((_ sign_extend 32) (currentBit!10563 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5116 (buf!5657 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10568 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10563 b1!101)))))))

(assert (=> b!229419 d!77902))

(declare-fun d!77904 () Bool)

(declare-fun e!157500 () Bool)

(assert (=> d!77904 e!157500))

(declare-fun res!192388 () Bool)

(assert (=> d!77904 (=> (not res!192388) (not e!157500))))

(declare-fun lt!367438 () (_ BitVec 64))

(declare-fun lt!367441 () (_ BitVec 64))

(declare-fun lt!367443 () (_ BitVec 64))

(assert (=> d!77904 (= res!192388 (= lt!367441 (bvsub lt!367438 lt!367443)))))

(assert (=> d!77904 (or (= (bvand lt!367438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367438 lt!367443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77904 (= lt!367443 (remainingBits!0 ((_ sign_extend 32) (size!5116 (buf!5657 b1!101))) ((_ sign_extend 32) (currentByte!10568 b1!101)) ((_ sign_extend 32) (currentBit!10563 b1!101))))))

(declare-fun lt!367439 () (_ BitVec 64))

(declare-fun lt!367440 () (_ BitVec 64))

(assert (=> d!77904 (= lt!367438 (bvmul lt!367439 lt!367440))))

(assert (=> d!77904 (or (= lt!367439 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367440 (bvsdiv (bvmul lt!367439 lt!367440) lt!367439)))))

(assert (=> d!77904 (= lt!367440 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77904 (= lt!367439 ((_ sign_extend 32) (size!5116 (buf!5657 b1!101))))))

(assert (=> d!77904 (= lt!367441 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10568 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10563 b1!101))))))

(assert (=> d!77904 (invariant!0 (currentBit!10563 b1!101) (currentByte!10568 b1!101) (size!5116 (buf!5657 b1!101)))))

(assert (=> d!77904 (= (bitIndex!0 (size!5116 (buf!5657 b1!101)) (currentByte!10568 b1!101) (currentBit!10563 b1!101)) lt!367441)))

(declare-fun b!229488 () Bool)

(declare-fun res!192389 () Bool)

(assert (=> b!229488 (=> (not res!192389) (not e!157500))))

(assert (=> b!229488 (= res!192389 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367441))))

(declare-fun b!229489 () Bool)

(declare-fun lt!367442 () (_ BitVec 64))

(assert (=> b!229489 (= e!157500 (bvsle lt!367441 (bvmul lt!367442 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229489 (or (= lt!367442 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367442 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367442)))))

(assert (=> b!229489 (= lt!367442 ((_ sign_extend 32) (size!5116 (buf!5657 b1!101))))))

(assert (= (and d!77904 res!192388) b!229488))

(assert (= (and b!229488 res!192389) b!229489))

(assert (=> d!77904 m!353115))

(assert (=> d!77904 m!353165))

(assert (=> b!229413 d!77904))

(declare-fun d!77924 () Bool)

(declare-fun e!157501 () Bool)

(assert (=> d!77924 e!157501))

(declare-fun res!192390 () Bool)

(assert (=> d!77924 (=> (not res!192390) (not e!157501))))

(declare-fun lt!367449 () (_ BitVec 64))

(declare-fun lt!367444 () (_ BitVec 64))

(declare-fun lt!367447 () (_ BitVec 64))

(assert (=> d!77924 (= res!192390 (= lt!367447 (bvsub lt!367444 lt!367449)))))

(assert (=> d!77924 (or (= (bvand lt!367444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367449 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367444 lt!367449) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77924 (= lt!367449 (remainingBits!0 ((_ sign_extend 32) (size!5116 (buf!5657 b2!99))) ((_ sign_extend 32) (currentByte!10568 b2!99)) ((_ sign_extend 32) (currentBit!10563 b2!99))))))

(declare-fun lt!367445 () (_ BitVec 64))

(declare-fun lt!367446 () (_ BitVec 64))

(assert (=> d!77924 (= lt!367444 (bvmul lt!367445 lt!367446))))

(assert (=> d!77924 (or (= lt!367445 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367446 (bvsdiv (bvmul lt!367445 lt!367446) lt!367445)))))

(assert (=> d!77924 (= lt!367446 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77924 (= lt!367445 ((_ sign_extend 32) (size!5116 (buf!5657 b2!99))))))

(assert (=> d!77924 (= lt!367447 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10568 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10563 b2!99))))))

(assert (=> d!77924 (invariant!0 (currentBit!10563 b2!99) (currentByte!10568 b2!99) (size!5116 (buf!5657 b2!99)))))

(assert (=> d!77924 (= (bitIndex!0 (size!5116 (buf!5657 b2!99)) (currentByte!10568 b2!99) (currentBit!10563 b2!99)) lt!367447)))

(declare-fun b!229490 () Bool)

(declare-fun res!192391 () Bool)

(assert (=> b!229490 (=> (not res!192391) (not e!157501))))

(assert (=> b!229490 (= res!192391 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367447))))

(declare-fun b!229491 () Bool)

(declare-fun lt!367448 () (_ BitVec 64))

(assert (=> b!229491 (= e!157501 (bvsle lt!367447 (bvmul lt!367448 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229491 (or (= lt!367448 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367448 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367448)))))

(assert (=> b!229491 (= lt!367448 ((_ sign_extend 32) (size!5116 (buf!5657 b2!99))))))

(assert (= (and d!77924 res!192390) b!229490))

(assert (= (and b!229490 res!192391) b!229491))

(declare-fun m!353171 () Bool)

(assert (=> d!77924 m!353171))

(assert (=> d!77924 m!353119))

(assert (=> b!229412 d!77924))

(push 1)

(assert (not d!77894))

(assert (not d!77924))

(assert (not d!77900))

(assert (not d!77904))

(assert (not d!77896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

