; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48364 () Bool)

(assert start!48364)

(declare-fun b!229323 () Bool)

(declare-fun res!192255 () Bool)

(declare-fun e!157384 () Bool)

(assert (=> b!229323 (=> (not res!192255) (not e!157384))))

(declare-datatypes ((array!11657 0))(
  ( (array!11658 (arr!6100 (Array (_ BitVec 32) (_ BitVec 8))) (size!5113 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9322 0))(
  ( (BitStream!9323 (buf!5654 array!11657) (currentByte!10556 (_ BitVec 32)) (currentBit!10551 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9322)

(assert (=> b!229323 (= res!192255 (and (bvsle ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10556 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10551 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10556 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10551 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!229324 () Bool)

(declare-fun e!157387 () Bool)

(assert (=> b!229324 (= e!157387 e!157384)))

(declare-fun res!192257 () Bool)

(assert (=> b!229324 (=> (not res!192257) (not e!157384))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!367290 () (_ BitVec 64))

(assert (=> b!229324 (= res!192257 (and (bvsle bits!86 lt!367290) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9322)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229324 (= lt!367290 (bitIndex!0 (size!5113 (buf!5654 b2!99)) (currentByte!10556 b2!99) (currentBit!10551 b2!99)))))

(declare-fun b!229325 () Bool)

(declare-fun res!192259 () Bool)

(assert (=> b!229325 (=> (not res!192259) (not e!157384))))

(assert (=> b!229325 (= res!192259 (= lt!367290 (bvadd (bitIndex!0 (size!5113 (buf!5654 b1!101)) (currentByte!10556 b1!101) (currentBit!10551 b1!101)) bits!86)))))

(declare-fun b!229326 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229326 (= e!157384 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10551 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10556 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5113 (buf!5654 b1!101)))))))))

(declare-fun b!229327 () Bool)

(declare-fun e!157386 () Bool)

(declare-fun array_inv!4854 (array!11657) Bool)

(assert (=> b!229327 (= e!157386 (array_inv!4854 (buf!5654 b1!101)))))

(declare-fun b!229328 () Bool)

(declare-fun e!157382 () Bool)

(assert (=> b!229328 (= e!157382 (array_inv!4854 (buf!5654 b2!99)))))

(declare-fun res!192258 () Bool)

(assert (=> start!48364 (=> (not res!192258) (not e!157387))))

(assert (=> start!48364 (= res!192258 (and (= (size!5113 (buf!5654 b1!101)) (size!5113 (buf!5654 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48364 e!157387))

(declare-fun inv!12 (BitStream!9322) Bool)

(assert (=> start!48364 (and (inv!12 b1!101) e!157386)))

(assert (=> start!48364 (and (inv!12 b2!99) e!157382)))

(assert (=> start!48364 true))

(declare-fun b!229329 () Bool)

(declare-fun res!192256 () Bool)

(assert (=> b!229329 (=> (not res!192256) (not e!157384))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229329 (= res!192256 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))) ((_ sign_extend 32) (currentByte!10556 b1!101)) ((_ sign_extend 32) (currentBit!10551 b1!101)) bytes!19))))

(assert (= (and start!48364 res!192258) b!229324))

(assert (= (and b!229324 res!192257) b!229329))

(assert (= (and b!229329 res!192256) b!229325))

(assert (= (and b!229325 res!192259) b!229323))

(assert (= (and b!229323 res!192255) b!229326))

(assert (= start!48364 b!229327))

(assert (= start!48364 b!229328))

(declare-fun m!353035 () Bool)

(assert (=> b!229325 m!353035))

(declare-fun m!353037 () Bool)

(assert (=> b!229327 m!353037))

(declare-fun m!353039 () Bool)

(assert (=> start!48364 m!353039))

(declare-fun m!353041 () Bool)

(assert (=> start!48364 m!353041))

(declare-fun m!353043 () Bool)

(assert (=> b!229326 m!353043))

(declare-fun m!353045 () Bool)

(assert (=> b!229324 m!353045))

(declare-fun m!353047 () Bool)

(assert (=> b!229328 m!353047))

(declare-fun m!353049 () Bool)

(assert (=> b!229329 m!353049))

(push 1)

(assert (not b!229327))

(assert (not b!229325))

(assert (not start!48364))

(assert (not b!229326))

(assert (not b!229329))

(assert (not b!229328))

(assert (not b!229324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77838 () Bool)

(assert (=> d!77838 (= (array_inv!4854 (buf!5654 b2!99)) (bvsge (size!5113 (buf!5654 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229328 d!77838))

(declare-fun d!77840 () Bool)

(assert (=> d!77840 (= (array_inv!4854 (buf!5654 b1!101)) (bvsge (size!5113 (buf!5654 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229327 d!77840))

(declare-fun d!77842 () Bool)

(assert (=> d!77842 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10551 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10556 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10551 b1!101))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10551 b1!101))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10556 b1!101))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10556 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10551 b1!101))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10556 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5113 (buf!5654 b1!101)))))))))))

(assert (=> b!229326 d!77842))

(declare-fun d!77844 () Bool)

(assert (=> d!77844 (= (inv!12 b1!101) (invariant!0 (currentBit!10551 b1!101) (currentByte!10556 b1!101) (size!5113 (buf!5654 b1!101))))))

(declare-fun bs!19068 () Bool)

(assert (= bs!19068 d!77844))

(declare-fun m!353091 () Bool)

(assert (=> bs!19068 m!353091))

(assert (=> start!48364 d!77844))

(declare-fun d!77846 () Bool)

(assert (=> d!77846 (= (inv!12 b2!99) (invariant!0 (currentBit!10551 b2!99) (currentByte!10556 b2!99) (size!5113 (buf!5654 b2!99))))))

(declare-fun bs!19069 () Bool)

(assert (= bs!19069 d!77846))

(declare-fun m!353093 () Bool)

(assert (=> bs!19069 m!353093))

(assert (=> start!48364 d!77846))

(declare-fun d!77848 () Bool)

(declare-fun e!157430 () Bool)

(assert (=> d!77848 e!157430))

(declare-fun res!192303 () Bool)

(assert (=> d!77848 (=> (not res!192303) (not e!157430))))

(declare-fun lt!367337 () (_ BitVec 64))

(declare-fun lt!367335 () (_ BitVec 64))

(declare-fun lt!367334 () (_ BitVec 64))

(assert (=> d!77848 (= res!192303 (= lt!367335 (bvsub lt!367334 lt!367337)))))

(assert (=> d!77848 (or (= (bvand lt!367334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367337 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367334 lt!367337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77848 (= lt!367337 (remainingBits!0 ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))) ((_ sign_extend 32) (currentByte!10556 b1!101)) ((_ sign_extend 32) (currentBit!10551 b1!101))))))

(declare-fun lt!367333 () (_ BitVec 64))

(declare-fun lt!367338 () (_ BitVec 64))

(assert (=> d!77848 (= lt!367334 (bvmul lt!367333 lt!367338))))

(assert (=> d!77848 (or (= lt!367333 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367338 (bvsdiv (bvmul lt!367333 lt!367338) lt!367333)))))

(assert (=> d!77848 (= lt!367338 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77848 (= lt!367333 ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))))))

(assert (=> d!77848 (= lt!367335 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10556 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10551 b1!101))))))

(assert (=> d!77848 (invariant!0 (currentBit!10551 b1!101) (currentByte!10556 b1!101) (size!5113 (buf!5654 b1!101)))))

(assert (=> d!77848 (= (bitIndex!0 (size!5113 (buf!5654 b1!101)) (currentByte!10556 b1!101) (currentBit!10551 b1!101)) lt!367335)))

(declare-fun b!229384 () Bool)

(declare-fun res!192302 () Bool)

(assert (=> b!229384 (=> (not res!192302) (not e!157430))))

(assert (=> b!229384 (= res!192302 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367335))))

(declare-fun b!229385 () Bool)

(declare-fun lt!367336 () (_ BitVec 64))

(assert (=> b!229385 (= e!157430 (bvsle lt!367335 (bvmul lt!367336 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229385 (or (= lt!367336 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367336 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367336)))))

(assert (=> b!229385 (= lt!367336 ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))))))

(assert (= (and d!77848 res!192303) b!229384))

(assert (= (and b!229384 res!192302) b!229385))

(declare-fun m!353095 () Bool)

(assert (=> d!77848 m!353095))

(assert (=> d!77848 m!353091))

(assert (=> b!229325 d!77848))

(declare-fun d!77852 () Bool)

(declare-fun e!157431 () Bool)

(assert (=> d!77852 e!157431))

(declare-fun res!192305 () Bool)

(assert (=> d!77852 (=> (not res!192305) (not e!157431))))

(declare-fun lt!367340 () (_ BitVec 64))

(declare-fun lt!367343 () (_ BitVec 64))

(declare-fun lt!367341 () (_ BitVec 64))

(assert (=> d!77852 (= res!192305 (= lt!367341 (bvsub lt!367340 lt!367343)))))

(assert (=> d!77852 (or (= (bvand lt!367340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367343 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367340 lt!367343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77852 (= lt!367343 (remainingBits!0 ((_ sign_extend 32) (size!5113 (buf!5654 b2!99))) ((_ sign_extend 32) (currentByte!10556 b2!99)) ((_ sign_extend 32) (currentBit!10551 b2!99))))))

(declare-fun lt!367339 () (_ BitVec 64))

(declare-fun lt!367344 () (_ BitVec 64))

(assert (=> d!77852 (= lt!367340 (bvmul lt!367339 lt!367344))))

(assert (=> d!77852 (or (= lt!367339 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367344 (bvsdiv (bvmul lt!367339 lt!367344) lt!367339)))))

(assert (=> d!77852 (= lt!367344 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77852 (= lt!367339 ((_ sign_extend 32) (size!5113 (buf!5654 b2!99))))))

(assert (=> d!77852 (= lt!367341 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10556 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10551 b2!99))))))

(assert (=> d!77852 (invariant!0 (currentBit!10551 b2!99) (currentByte!10556 b2!99) (size!5113 (buf!5654 b2!99)))))

(assert (=> d!77852 (= (bitIndex!0 (size!5113 (buf!5654 b2!99)) (currentByte!10556 b2!99) (currentBit!10551 b2!99)) lt!367341)))

(declare-fun b!229386 () Bool)

(declare-fun res!192304 () Bool)

(assert (=> b!229386 (=> (not res!192304) (not e!157431))))

(assert (=> b!229386 (= res!192304 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367341))))

(declare-fun b!229387 () Bool)

(declare-fun lt!367342 () (_ BitVec 64))

(assert (=> b!229387 (= e!157431 (bvsle lt!367341 (bvmul lt!367342 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229387 (or (= lt!367342 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367342 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367342)))))

(assert (=> b!229387 (= lt!367342 ((_ sign_extend 32) (size!5113 (buf!5654 b2!99))))))

(assert (= (and d!77852 res!192305) b!229386))

(assert (= (and b!229386 res!192304) b!229387))

(declare-fun m!353097 () Bool)

(assert (=> d!77852 m!353097))

(assert (=> d!77852 m!353093))

(assert (=> b!229324 d!77852))

(declare-fun d!77854 () Bool)

(assert (=> d!77854 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))) ((_ sign_extend 32) (currentByte!10556 b1!101)) ((_ sign_extend 32) (currentBit!10551 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5113 (buf!5654 b1!101))) ((_ sign_extend 32) (currentByte!10556 b1!101)) ((_ sign_extend 32) (currentBit!10551 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19070 () Bool)

(assert (= bs!19070 d!77854))

(assert (=> bs!19070 m!353095))

(assert (=> b!229329 d!77854))

(push 1)

(assert (not d!77848))

(assert (not d!77844))

(assert (not d!77854))

(assert (not d!77852))

(assert (not d!77846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

