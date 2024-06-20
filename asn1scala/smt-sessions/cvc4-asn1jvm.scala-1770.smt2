; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48404 () Bool)

(assert start!48404)

(declare-fun b!229460 () Bool)

(declare-fun res!192363 () Bool)

(declare-fun e!157486 () Bool)

(assert (=> b!229460 (=> (not res!192363) (not e!157486))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11670 0))(
  ( (array!11671 (arr!6105 (Array (_ BitVec 32) (_ BitVec 8))) (size!5118 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9332 0))(
  ( (BitStream!9333 (buf!5659 array!11670) (currentByte!10570 (_ BitVec 32)) (currentBit!10565 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9332)

(declare-fun lt!367377 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229460 (= res!192363 (= lt!367377 (bvadd (bitIndex!0 (size!5118 (buf!5659 b1!101)) (currentByte!10570 b1!101) (currentBit!10565 b1!101)) bits!86)))))

(declare-fun b!229461 () Bool)

(declare-fun b2!99 () BitStream!9332)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229461 (= e!157486 (not (invariant!0 (currentBit!10565 b2!99) (currentByte!10570 b2!99) (size!5118 (buf!5659 b2!99)))))))

(declare-fun b!229462 () Bool)

(declare-fun e!157488 () Bool)

(declare-fun array_inv!4859 (array!11670) Bool)

(assert (=> b!229462 (= e!157488 (array_inv!4859 (buf!5659 b1!101)))))

(declare-fun b!229463 () Bool)

(declare-fun e!157489 () Bool)

(assert (=> b!229463 (= e!157489 (array_inv!4859 (buf!5659 b2!99)))))

(declare-fun b!229464 () Bool)

(declare-fun e!157485 () Bool)

(assert (=> b!229464 (= e!157485 e!157486)))

(declare-fun res!192367 () Bool)

(assert (=> b!229464 (=> (not res!192367) (not e!157486))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229464 (= res!192367 (and (bvsle bits!86 lt!367377) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!229464 (= lt!367377 (bitIndex!0 (size!5118 (buf!5659 b2!99)) (currentByte!10570 b2!99) (currentBit!10565 b2!99)))))

(declare-fun b!229465 () Bool)

(declare-fun res!192366 () Bool)

(assert (=> b!229465 (=> (not res!192366) (not e!157486))))

(assert (=> b!229465 (= res!192366 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5118 (buf!5659 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10570 b1!101))) ((_ sign_extend 32) (currentBit!10565 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!192362 () Bool)

(assert (=> start!48404 (=> (not res!192362) (not e!157485))))

(assert (=> start!48404 (= res!192362 (and (= (size!5118 (buf!5659 b1!101)) (size!5118 (buf!5659 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48404 e!157485))

(declare-fun inv!12 (BitStream!9332) Bool)

(assert (=> start!48404 (and (inv!12 b1!101) e!157488)))

(assert (=> start!48404 (and (inv!12 b2!99) e!157489)))

(assert (=> start!48404 true))

(declare-fun b!229466 () Bool)

(declare-fun res!192364 () Bool)

(assert (=> b!229466 (=> (not res!192364) (not e!157486))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229466 (= res!192364 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5118 (buf!5659 b1!101))) ((_ sign_extend 32) (currentByte!10570 b1!101)) ((_ sign_extend 32) (currentBit!10565 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229467 () Bool)

(declare-fun res!192365 () Bool)

(assert (=> b!229467 (=> (not res!192365) (not e!157486))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229467 (= res!192365 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5118 (buf!5659 b1!101))) ((_ sign_extend 32) (currentByte!10570 b1!101)) ((_ sign_extend 32) (currentBit!10565 b1!101)) bytes!19))))

(assert (= (and start!48404 res!192362) b!229464))

(assert (= (and b!229464 res!192367) b!229467))

(assert (= (and b!229467 res!192365) b!229460))

(assert (= (and b!229460 res!192363) b!229466))

(assert (= (and b!229466 res!192364) b!229465))

(assert (= (and b!229465 res!192366) b!229461))

(assert (= start!48404 b!229462))

(assert (= start!48404 b!229463))

(declare-fun m!353143 () Bool)

(assert (=> b!229466 m!353143))

(declare-fun m!353145 () Bool)

(assert (=> start!48404 m!353145))

(declare-fun m!353147 () Bool)

(assert (=> start!48404 m!353147))

(declare-fun m!353149 () Bool)

(assert (=> b!229462 m!353149))

(declare-fun m!353151 () Bool)

(assert (=> b!229461 m!353151))

(declare-fun m!353153 () Bool)

(assert (=> b!229467 m!353153))

(declare-fun m!353155 () Bool)

(assert (=> b!229460 m!353155))

(declare-fun m!353157 () Bool)

(assert (=> b!229463 m!353157))

(declare-fun m!353159 () Bool)

(assert (=> b!229464 m!353159))

(push 1)

(assert (not start!48404))

(assert (not b!229462))

(assert (not b!229460))

(assert (not b!229466))

(assert (not b!229463))

(assert (not b!229461))

(assert (not b!229464))

(assert (not b!229467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77906 () Bool)

(declare-fun e!157496 () Bool)

(assert (=> d!77906 e!157496))

(declare-fun res!192381 () Bool)

(assert (=> d!77906 (=> (not res!192381) (not e!157496))))

(declare-fun lt!367419 () (_ BitVec 64))

(declare-fun lt!367415 () (_ BitVec 64))

(declare-fun lt!367417 () (_ BitVec 64))

(assert (=> d!77906 (= res!192381 (= lt!367417 (bvsub lt!367419 lt!367415)))))

(assert (=> d!77906 (or (= (bvand lt!367419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367419 lt!367415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77906 (= lt!367415 (remainingBits!0 ((_ sign_extend 32) (size!5118 (buf!5659 b1!101))) ((_ sign_extend 32) (currentByte!10570 b1!101)) ((_ sign_extend 32) (currentBit!10565 b1!101))))))

(declare-fun lt!367418 () (_ BitVec 64))

(declare-fun lt!367416 () (_ BitVec 64))

(assert (=> d!77906 (= lt!367419 (bvmul lt!367418 lt!367416))))

(assert (=> d!77906 (or (= lt!367418 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367416 (bvsdiv (bvmul lt!367418 lt!367416) lt!367418)))))

(assert (=> d!77906 (= lt!367416 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77906 (= lt!367418 ((_ sign_extend 32) (size!5118 (buf!5659 b1!101))))))

(assert (=> d!77906 (= lt!367417 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10570 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10565 b1!101))))))

(assert (=> d!77906 (invariant!0 (currentBit!10565 b1!101) (currentByte!10570 b1!101) (size!5118 (buf!5659 b1!101)))))

(assert (=> d!77906 (= (bitIndex!0 (size!5118 (buf!5659 b1!101)) (currentByte!10570 b1!101) (currentBit!10565 b1!101)) lt!367417)))

(declare-fun b!229480 () Bool)

(declare-fun res!192380 () Bool)

(assert (=> b!229480 (=> (not res!192380) (not e!157496))))

(assert (=> b!229480 (= res!192380 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367417))))

(declare-fun b!229481 () Bool)

(declare-fun lt!367414 () (_ BitVec 64))

(assert (=> b!229481 (= e!157496 (bvsle lt!367417 (bvmul lt!367414 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229481 (or (= lt!367414 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367414 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367414)))))

(assert (=> b!229481 (= lt!367414 ((_ sign_extend 32) (size!5118 (buf!5659 b1!101))))))

(assert (= (and d!77906 res!192381) b!229480))

(assert (= (and b!229480 res!192380) b!229481))

(assert (=> d!77906 m!353143))

(declare-fun m!353167 () Bool)

(assert (=> d!77906 m!353167))

(assert (=> b!229460 d!77906))

(declare-fun d!77908 () Bool)

(declare-fun e!157497 () Bool)

(assert (=> d!77908 e!157497))

(declare-fun res!192383 () Bool)

(assert (=> d!77908 (=> (not res!192383) (not e!157497))))

(declare-fun lt!367423 () (_ BitVec 64))

(declare-fun lt!367425 () (_ BitVec 64))

(declare-fun lt!367421 () (_ BitVec 64))

(assert (=> d!77908 (= res!192383 (= lt!367423 (bvsub lt!367425 lt!367421)))))

(assert (=> d!77908 (or (= (bvand lt!367425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367425 lt!367421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77908 (= lt!367421 (remainingBits!0 ((_ sign_extend 32) (size!5118 (buf!5659 b2!99))) ((_ sign_extend 32) (currentByte!10570 b2!99)) ((_ sign_extend 32) (currentBit!10565 b2!99))))))

(declare-fun lt!367424 () (_ BitVec 64))

(declare-fun lt!367422 () (_ BitVec 64))

(assert (=> d!77908 (= lt!367425 (bvmul lt!367424 lt!367422))))

(assert (=> d!77908 (or (= lt!367424 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367422 (bvsdiv (bvmul lt!367424 lt!367422) lt!367424)))))

(assert (=> d!77908 (= lt!367422 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77908 (= lt!367424 ((_ sign_extend 32) (size!5118 (buf!5659 b2!99))))))

(assert (=> d!77908 (= lt!367423 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10570 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10565 b2!99))))))

(assert (=> d!77908 (invariant!0 (currentBit!10565 b2!99) (currentByte!10570 b2!99) (size!5118 (buf!5659 b2!99)))))

(assert (=> d!77908 (= (bitIndex!0 (size!5118 (buf!5659 b2!99)) (currentByte!10570 b2!99) (currentBit!10565 b2!99)) lt!367423)))

(declare-fun b!229482 () Bool)

(declare-fun res!192382 () Bool)

(assert (=> b!229482 (=> (not res!192382) (not e!157497))))

(assert (=> b!229482 (= res!192382 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367423))))

(declare-fun b!229483 () Bool)

(declare-fun lt!367420 () (_ BitVec 64))

(assert (=> b!229483 (= e!157497 (bvsle lt!367423 (bvmul lt!367420 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229483 (or (= lt!367420 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367420 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367420)))))

(assert (=> b!229483 (= lt!367420 ((_ sign_extend 32) (size!5118 (buf!5659 b2!99))))))

(assert (= (and d!77908 res!192383) b!229482))

(assert (= (and b!229482 res!192382) b!229483))

(declare-fun m!353169 () Bool)

(assert (=> d!77908 m!353169))

(assert (=> d!77908 m!353151))

(assert (=> b!229464 d!77908))

(declare-fun d!77910 () Bool)

(assert (=> d!77910 (= (inv!12 b1!101) (invariant!0 (currentBit!10565 b1!101) (currentByte!10570 b1!101) (size!5118 (buf!5659 b1!101))))))

(declare-fun bs!19083 () Bool)

(assert (= bs!19083 d!77910))

(assert (=> bs!19083 m!353167))

(assert (=> start!48404 d!77910))

(declare-fun d!77912 () Bool)

(assert (=> d!77912 (= (inv!12 b2!99) (invariant!0 (currentBit!10565 b2!99) (currentByte!10570 b2!99) (size!5118 (buf!5659 b2!99))))))

(declare-fun bs!19084 () Bool)

(assert (= bs!19084 d!77912))

(assert (=> bs!19084 m!353151))

(assert (=> start!48404 d!77912))

(declare-fun d!77914 () Bool)

(assert (=> d!77914 (= (array_inv!4859 (buf!5659 b2!99)) (bvsge (size!5118 (buf!5659 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229463 d!77914))

(declare-fun d!77916 () Bool)

(assert (=> d!77916 (= (array_inv!4859 (buf!5659 b1!101)) (bvsge (size!5118 (buf!5659 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229462 d!77916))

(declare-fun d!77918 () Bool)

(assert (=> d!77918 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5118 (buf!5659 b1!101))) ((_ sign_extend 32) (currentByte!10570 b1!101)) ((_ sign_extend 32) (currentBit!10565 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5118 (buf!5659 b1!101))) ((_ sign_extend 32) (currentByte!10570 b1!101)) ((_ sign_extend 32) (currentBit!10565 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19085 () Bool)

(assert (= bs!19085 d!77918))

(assert (=> bs!19085 m!353143))

(assert (=> b!229467 d!77918))

(declare-fun d!77920 () Bool)

(assert (=> d!77920 (= (remainingBits!0 ((_ sign_extend 32) (size!5118 (buf!5659 b1!101))) ((_ sign_extend 32) (currentByte!10570 b1!101)) ((_ sign_extend 32) (currentBit!10565 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5118 (buf!5659 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10570 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10565 b1!101)))))))

(assert (=> b!229466 d!77920))

(declare-fun d!77922 () Bool)

(assert (=> d!77922 (= (invariant!0 (currentBit!10565 b2!99) (currentByte!10570 b2!99) (size!5118 (buf!5659 b2!99))) (and (bvsge (currentBit!10565 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10565 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10570 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10570 b2!99) (size!5118 (buf!5659 b2!99))) (and (= (currentBit!10565 b2!99) #b00000000000000000000000000000000) (= (currentByte!10570 b2!99) (size!5118 (buf!5659 b2!99)))))))))

(assert (=> b!229461 d!77922))

(push 1)

