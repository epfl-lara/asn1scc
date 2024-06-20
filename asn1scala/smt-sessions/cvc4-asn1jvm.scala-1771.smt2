; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48446 () Bool)

(assert start!48446)

(declare-fun b!229556 () Bool)

(declare-fun e!157551 () Bool)

(declare-datatypes ((array!11679 0))(
  ( (array!11680 (arr!6108 (Array (_ BitVec 32) (_ BitVec 8))) (size!5121 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9338 0))(
  ( (BitStream!9339 (buf!5662 array!11679) (currentByte!10585 (_ BitVec 32)) (currentBit!10580 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9338)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229556 (= e!157551 (not (invariant!0 (currentBit!10580 b2!99) (currentByte!10585 b2!99) (size!5121 (buf!5662 b2!99)))))))

(declare-fun b!229557 () Bool)

(declare-fun res!192443 () Bool)

(assert (=> b!229557 (=> (not res!192443) (not e!157551))))

(declare-fun b1!101 () BitStream!9338)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229557 (= res!192443 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5121 (buf!5662 b1!101))) ((_ sign_extend 32) (currentByte!10585 b1!101)) ((_ sign_extend 32) (currentBit!10580 b1!101)) bytes!19))))

(declare-fun b!229558 () Bool)

(declare-fun res!192445 () Bool)

(assert (=> b!229558 (=> (not res!192445) (not e!157551))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367458 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229558 (= res!192445 (= lt!367458 (bvadd (bitIndex!0 (size!5121 (buf!5662 b1!101)) (currentByte!10585 b1!101) (currentBit!10580 b1!101)) bits!86)))))

(declare-fun res!192440 () Bool)

(declare-fun e!157553 () Bool)

(assert (=> start!48446 (=> (not res!192440) (not e!157553))))

(assert (=> start!48446 (= res!192440 (and (= (size!5121 (buf!5662 b1!101)) (size!5121 (buf!5662 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48446 e!157553))

(declare-fun e!157554 () Bool)

(declare-fun inv!12 (BitStream!9338) Bool)

(assert (=> start!48446 (and (inv!12 b1!101) e!157554)))

(declare-fun e!157552 () Bool)

(assert (=> start!48446 (and (inv!12 b2!99) e!157552)))

(assert (=> start!48446 true))

(declare-fun b!229559 () Bool)

(declare-fun res!192442 () Bool)

(assert (=> b!229559 (=> (not res!192442) (not e!157551))))

(assert (=> b!229559 (= res!192442 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5121 (buf!5662 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10585 b1!101))) ((_ sign_extend 32) (currentBit!10580 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!367458 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10585 b2!99))) ((_ sign_extend 32) (currentBit!10580 b2!99))))))))

(declare-fun b!229560 () Bool)

(assert (=> b!229560 (= e!157553 e!157551)))

(declare-fun res!192444 () Bool)

(assert (=> b!229560 (=> (not res!192444) (not e!157551))))

(assert (=> b!229560 (= res!192444 (and (bvsle bits!86 lt!367458) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!229560 (= lt!367458 (bitIndex!0 (size!5121 (buf!5662 b2!99)) (currentByte!10585 b2!99) (currentBit!10580 b2!99)))))

(declare-fun b!229561 () Bool)

(declare-fun res!192441 () Bool)

(assert (=> b!229561 (=> (not res!192441) (not e!157551))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229561 (= res!192441 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5121 (buf!5662 b1!101))) ((_ sign_extend 32) (currentByte!10585 b1!101)) ((_ sign_extend 32) (currentBit!10580 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229562 () Bool)

(declare-fun array_inv!4862 (array!11679) Bool)

(assert (=> b!229562 (= e!157552 (array_inv!4862 (buf!5662 b2!99)))))

(declare-fun b!229563 () Bool)

(assert (=> b!229563 (= e!157554 (array_inv!4862 (buf!5662 b1!101)))))

(assert (= (and start!48446 res!192440) b!229560))

(assert (= (and b!229560 res!192444) b!229557))

(assert (= (and b!229557 res!192443) b!229558))

(assert (= (and b!229558 res!192445) b!229561))

(assert (= (and b!229561 res!192441) b!229559))

(assert (= (and b!229559 res!192442) b!229556))

(assert (= start!48446 b!229563))

(assert (= start!48446 b!229562))

(declare-fun m!353209 () Bool)

(assert (=> b!229561 m!353209))

(declare-fun m!353211 () Bool)

(assert (=> b!229557 m!353211))

(declare-fun m!353213 () Bool)

(assert (=> b!229556 m!353213))

(declare-fun m!353215 () Bool)

(assert (=> b!229563 m!353215))

(declare-fun m!353217 () Bool)

(assert (=> b!229560 m!353217))

(declare-fun m!353219 () Bool)

(assert (=> b!229558 m!353219))

(declare-fun m!353221 () Bool)

(assert (=> b!229562 m!353221))

(declare-fun m!353223 () Bool)

(assert (=> start!48446 m!353223))

(declare-fun m!353225 () Bool)

(assert (=> start!48446 m!353225))

(push 1)

(assert (not b!229562))

(assert (not b!229558))

(assert (not start!48446))

(assert (not b!229560))

(assert (not b!229563))

(assert (not b!229561))

(assert (not b!229556))

(assert (not b!229557))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77958 () Bool)

(assert (=> d!77958 (= (inv!12 b1!101) (invariant!0 (currentBit!10580 b1!101) (currentByte!10585 b1!101) (size!5121 (buf!5662 b1!101))))))

(declare-fun bs!19095 () Bool)

(assert (= bs!19095 d!77958))

(declare-fun m!353233 () Bool)

(assert (=> bs!19095 m!353233))

(assert (=> start!48446 d!77958))

(declare-fun d!77960 () Bool)

(assert (=> d!77960 (= (inv!12 b2!99) (invariant!0 (currentBit!10580 b2!99) (currentByte!10585 b2!99) (size!5121 (buf!5662 b2!99))))))

(declare-fun bs!19096 () Bool)

(assert (= bs!19096 d!77960))

(assert (=> bs!19096 m!353213))

(assert (=> start!48446 d!77960))

(declare-fun d!77962 () Bool)

(assert (=> d!77962 (= (array_inv!4862 (buf!5662 b1!101)) (bvsge (size!5121 (buf!5662 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229563 d!77962))

(declare-fun d!77964 () Bool)

(declare-fun e!157566 () Bool)

(assert (=> d!77964 e!157566))

(declare-fun res!192467 () Bool)

(assert (=> d!77964 (=> (not res!192467) (not e!157566))))

(declare-fun lt!367522 () (_ BitVec 64))

(declare-fun lt!367523 () (_ BitVec 64))

(declare-fun lt!367520 () (_ BitVec 64))

(assert (=> d!77964 (= res!192467 (= lt!367523 (bvsub lt!367520 lt!367522)))))

(assert (=> d!77964 (or (= (bvand lt!367520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367522 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367520 lt!367522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77964 (= lt!367522 (remainingBits!0 ((_ sign_extend 32) (size!5121 (buf!5662 b1!101))) ((_ sign_extend 32) (currentByte!10585 b1!101)) ((_ sign_extend 32) (currentBit!10580 b1!101))))))

(declare-fun lt!367519 () (_ BitVec 64))

(declare-fun lt!367521 () (_ BitVec 64))

(assert (=> d!77964 (= lt!367520 (bvmul lt!367519 lt!367521))))

(assert (=> d!77964 (or (= lt!367519 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367521 (bvsdiv (bvmul lt!367519 lt!367521) lt!367519)))))

(assert (=> d!77964 (= lt!367521 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77964 (= lt!367519 ((_ sign_extend 32) (size!5121 (buf!5662 b1!101))))))

(assert (=> d!77964 (= lt!367523 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10585 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10580 b1!101))))))

(assert (=> d!77964 (invariant!0 (currentBit!10580 b1!101) (currentByte!10585 b1!101) (size!5121 (buf!5662 b1!101)))))

(assert (=> d!77964 (= (bitIndex!0 (size!5121 (buf!5662 b1!101)) (currentByte!10585 b1!101) (currentBit!10580 b1!101)) lt!367523)))

(declare-fun b!229584 () Bool)

(declare-fun res!192466 () Bool)

(assert (=> b!229584 (=> (not res!192466) (not e!157566))))

(assert (=> b!229584 (= res!192466 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367523))))

(declare-fun b!229585 () Bool)

(declare-fun lt!367524 () (_ BitVec 64))

(assert (=> b!229585 (= e!157566 (bvsle lt!367523 (bvmul lt!367524 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229585 (or (= lt!367524 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367524 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367524)))))

(assert (=> b!229585 (= lt!367524 ((_ sign_extend 32) (size!5121 (buf!5662 b1!101))))))

(assert (= (and d!77964 res!192467) b!229584))

(assert (= (and b!229584 res!192466) b!229585))

(assert (=> d!77964 m!353209))

(assert (=> d!77964 m!353233))

(assert (=> b!229558 d!77964))

(declare-fun d!77972 () Bool)

(assert (=> d!77972 (= (invariant!0 (currentBit!10580 b2!99) (currentByte!10585 b2!99) (size!5121 (buf!5662 b2!99))) (and (bvsge (currentBit!10580 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10580 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10585 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10585 b2!99) (size!5121 (buf!5662 b2!99))) (and (= (currentBit!10580 b2!99) #b00000000000000000000000000000000) (= (currentByte!10585 b2!99) (size!5121 (buf!5662 b2!99)))))))))

(assert (=> b!229556 d!77972))

(declare-fun d!77974 () Bool)

(assert (=> d!77974 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5121 (buf!5662 b1!101))) ((_ sign_extend 32) (currentByte!10585 b1!101)) ((_ sign_extend 32) (currentBit!10580 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5121 (buf!5662 b1!101))) ((_ sign_extend 32) (currentByte!10585 b1!101)) ((_ sign_extend 32) (currentBit!10580 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19097 () Bool)

(assert (= bs!19097 d!77974))

(assert (=> bs!19097 m!353209))

(assert (=> b!229557 d!77974))

(declare-fun d!77976 () Bool)

(assert (=> d!77976 (= (array_inv!4862 (buf!5662 b2!99)) (bvsge (size!5121 (buf!5662 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229562 d!77976))

(declare-fun d!77978 () Bool)

(declare-fun e!157567 () Bool)

(assert (=> d!77978 e!157567))

(declare-fun res!192469 () Bool)

(assert (=> d!77978 (=> (not res!192469) (not e!157567))))

(declare-fun lt!367529 () (_ BitVec 64))

(declare-fun lt!367528 () (_ BitVec 64))

(declare-fun lt!367526 () (_ BitVec 64))

(assert (=> d!77978 (= res!192469 (= lt!367529 (bvsub lt!367526 lt!367528)))))

(assert (=> d!77978 (or (= (bvand lt!367526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367528 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367526 lt!367528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77978 (= lt!367528 (remainingBits!0 ((_ sign_extend 32) (size!5121 (buf!5662 b2!99))) ((_ sign_extend 32) (currentByte!10585 b2!99)) ((_ sign_extend 32) (currentBit!10580 b2!99))))))

(declare-fun lt!367525 () (_ BitVec 64))

(declare-fun lt!367527 () (_ BitVec 64))

(assert (=> d!77978 (= lt!367526 (bvmul lt!367525 lt!367527))))

(assert (=> d!77978 (or (= lt!367525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367527 (bvsdiv (bvmul lt!367525 lt!367527) lt!367525)))))

(assert (=> d!77978 (= lt!367527 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77978 (= lt!367525 ((_ sign_extend 32) (size!5121 (buf!5662 b2!99))))))

(assert (=> d!77978 (= lt!367529 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10585 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10580 b2!99))))))

(assert (=> d!77978 (invariant!0 (currentBit!10580 b2!99) (currentByte!10585 b2!99) (size!5121 (buf!5662 b2!99)))))

(assert (=> d!77978 (= (bitIndex!0 (size!5121 (buf!5662 b2!99)) (currentByte!10585 b2!99) (currentBit!10580 b2!99)) lt!367529)))

(declare-fun b!229586 () Bool)

(declare-fun res!192468 () Bool)

(assert (=> b!229586 (=> (not res!192468) (not e!157567))))

(assert (=> b!229586 (= res!192468 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367529))))

(declare-fun b!229587 () Bool)

(declare-fun lt!367530 () (_ BitVec 64))

(assert (=> b!229587 (= e!157567 (bvsle lt!367529 (bvmul lt!367530 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229587 (or (= lt!367530 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367530 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367530)))))

(assert (=> b!229587 (= lt!367530 ((_ sign_extend 32) (size!5121 (buf!5662 b2!99))))))

(assert (= (and d!77978 res!192469) b!229586))

(assert (= (and b!229586 res!192468) b!229587))

(declare-fun m!353237 () Bool)

(assert (=> d!77978 m!353237))

(assert (=> d!77978 m!353213))

(assert (=> b!229560 d!77978))

(declare-fun d!77980 () Bool)

(assert (=> d!77980 (= (remainingBits!0 ((_ sign_extend 32) (size!5121 (buf!5662 b1!101))) ((_ sign_extend 32) (currentByte!10585 b1!101)) ((_ sign_extend 32) (currentBit!10580 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5121 (buf!5662 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10585 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10580 b1!101)))))))

(assert (=> b!229561 d!77980))

(push 1)

