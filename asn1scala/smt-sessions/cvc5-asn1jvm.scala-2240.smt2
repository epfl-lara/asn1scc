; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56938 () Bool)

(assert start!56938)

(declare-fun res!218831 () Bool)

(declare-fun e!181916 () Bool)

(assert (=> start!56938 (=> (not res!218831) (not e!181916))))

(declare-datatypes ((array!14493 0))(
  ( (array!14494 (arr!7312 (Array (_ BitVec 32) (_ BitVec 8))) (size!6325 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11572 0))(
  ( (BitStream!11573 (buf!6847 array!14493) (currentByte!12663 (_ BitVec 32)) (currentBit!12658 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11572)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56938 (= res!218831 (validate_offset_bit!0 ((_ sign_extend 32) (size!6325 (buf!6847 thiss!914))) ((_ sign_extend 32) (currentByte!12663 thiss!914)) ((_ sign_extend 32) (currentBit!12658 thiss!914))))))

(assert (=> start!56938 e!181916))

(declare-fun e!181917 () Bool)

(declare-fun inv!12 (BitStream!11572) Bool)

(assert (=> start!56938 (and (inv!12 thiss!914) e!181917)))

(assert (=> start!56938 true))

(declare-fun b!261447 () Bool)

(declare-fun e!181918 () Bool)

(assert (=> b!261447 (= e!181916 (not e!181918))))

(declare-fun res!218830 () Bool)

(assert (=> b!261447 (=> res!218830 e!181918)))

(declare-datatypes ((Unit!18633 0))(
  ( (Unit!18634) )
))
(declare-datatypes ((tuple2!22376 0))(
  ( (tuple2!22377 (_1!12124 Unit!18633) (_2!12124 BitStream!11572)) )
))
(declare-fun lt!403364 () tuple2!22376)

(declare-fun increaseBitIndex!0 (BitStream!11572) tuple2!22376)

(assert (=> b!261447 (= res!218830 (not (= (size!6325 (buf!6847 thiss!914)) (size!6325 (buf!6847 (_2!12124 (increaseBitIndex!0 (_2!12124 lt!403364))))))))))

(declare-fun arrayRangesEq!950 (array!14493 array!14493 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261447 (arrayRangesEq!950 (buf!6847 thiss!914) (array!14494 (store (arr!7312 (buf!6847 thiss!914)) (currentByte!12663 (_2!12124 lt!403364)) (select (arr!7312 (buf!6847 (_2!12124 lt!403364))) (currentByte!12663 (_2!12124 lt!403364)))) (size!6325 (buf!6847 thiss!914))) #b00000000000000000000000000000000 (currentByte!12663 (_2!12124 lt!403364)))))

(declare-fun lt!403362 () Unit!18633)

(declare-fun arrayUpdatedAtPrefixLemma!466 (array!14493 (_ BitVec 32) (_ BitVec 8)) Unit!18633)

(assert (=> b!261447 (= lt!403362 (arrayUpdatedAtPrefixLemma!466 (buf!6847 thiss!914) (currentByte!12663 (_2!12124 lt!403364)) (select (arr!7312 (buf!6847 (_2!12124 lt!403364))) (currentByte!12663 (_2!12124 lt!403364)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18635 () Unit!18633)

(declare-fun Unit!18636 () Unit!18633)

(assert (=> b!261447 (= lt!403364 (ite b!187 (tuple2!22377 Unit!18635 (BitStream!11573 (array!14494 (store (arr!7312 (buf!6847 thiss!914)) (currentByte!12663 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7312 (buf!6847 thiss!914)) (currentByte!12663 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12658 thiss!914)))))) (size!6325 (buf!6847 thiss!914))) (currentByte!12663 thiss!914) (currentBit!12658 thiss!914))) (tuple2!22377 Unit!18636 (BitStream!11573 (array!14494 (store (arr!7312 (buf!6847 thiss!914)) (currentByte!12663 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7312 (buf!6847 thiss!914)) (currentByte!12663 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12658 thiss!914))))))) (size!6325 (buf!6847 thiss!914))) (currentByte!12663 thiss!914) (currentBit!12658 thiss!914)))))))

(declare-fun b!261448 () Bool)

(declare-fun lt!403363 () (_ BitVec 64))

(declare-fun lt!403361 () (_ BitVec 64))

(assert (=> b!261448 (= e!181918 (or (not (= lt!403363 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!403363 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!403361) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261448 (= lt!403363 (bvand lt!403361 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!261448 (= lt!403361 (bitIndex!0 (size!6325 (buf!6847 thiss!914)) (currentByte!12663 thiss!914) (currentBit!12658 thiss!914)))))

(declare-fun b!261449 () Bool)

(declare-fun array_inv!6066 (array!14493) Bool)

(assert (=> b!261449 (= e!181917 (array_inv!6066 (buf!6847 thiss!914)))))

(assert (= (and start!56938 res!218831) b!261447))

(assert (= (and b!261447 (not res!218830)) b!261448))

(assert (= start!56938 b!261449))

(declare-fun m!391297 () Bool)

(assert (=> start!56938 m!391297))

(declare-fun m!391299 () Bool)

(assert (=> start!56938 m!391299))

(declare-fun m!391301 () Bool)

(assert (=> b!261447 m!391301))

(declare-fun m!391303 () Bool)

(assert (=> b!261447 m!391303))

(declare-fun m!391305 () Bool)

(assert (=> b!261447 m!391305))

(declare-fun m!391307 () Bool)

(assert (=> b!261447 m!391307))

(declare-fun m!391309 () Bool)

(assert (=> b!261447 m!391309))

(declare-fun m!391311 () Bool)

(assert (=> b!261447 m!391311))

(declare-fun m!391313 () Bool)

(assert (=> b!261447 m!391313))

(declare-fun m!391315 () Bool)

(assert (=> b!261447 m!391315))

(declare-fun m!391317 () Bool)

(assert (=> b!261447 m!391317))

(assert (=> b!261447 m!391301))

(declare-fun m!391319 () Bool)

(assert (=> b!261448 m!391319))

(declare-fun m!391321 () Bool)

(assert (=> b!261449 m!391321))

(push 1)

(assert (not b!261447))

(assert (not b!261448))

(assert (not b!261449))

(assert (not start!56938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88128 () Bool)

(declare-fun e!181947 () Bool)

(assert (=> d!88128 e!181947))

(declare-fun res!218851 () Bool)

(assert (=> d!88128 (=> (not res!218851) (not e!181947))))

(declare-fun lt!403408 () tuple2!22376)

(declare-fun lt!403410 () (_ BitVec 64))

(declare-fun lt!403411 () (_ BitVec 64))

(assert (=> d!88128 (= res!218851 (= (bvadd lt!403410 lt!403411) (bitIndex!0 (size!6325 (buf!6847 (_2!12124 lt!403408))) (currentByte!12663 (_2!12124 lt!403408)) (currentBit!12658 (_2!12124 lt!403408)))))))

(assert (=> d!88128 (or (not (= (bvand lt!403410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403411 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403410 lt!403411) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88128 (= lt!403411 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!88128 (= lt!403410 (bitIndex!0 (size!6325 (buf!6847 (_2!12124 lt!403364))) (currentByte!12663 (_2!12124 lt!403364)) (currentBit!12658 (_2!12124 lt!403364))))))

(declare-fun Unit!18645 () Unit!18633)

(declare-fun Unit!18646 () Unit!18633)

(assert (=> d!88128 (= lt!403408 (ite (bvslt (currentBit!12658 (_2!12124 lt!403364)) #b00000000000000000000000000000111) (tuple2!22377 Unit!18645 (BitStream!11573 (buf!6847 (_2!12124 lt!403364)) (currentByte!12663 (_2!12124 lt!403364)) (bvadd (currentBit!12658 (_2!12124 lt!403364)) #b00000000000000000000000000000001))) (tuple2!22377 Unit!18646 (BitStream!11573 (buf!6847 (_2!12124 lt!403364)) (bvadd (currentByte!12663 (_2!12124 lt!403364)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88128 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6325 (buf!6847 (_2!12124 lt!403364)))) ((_ sign_extend 32) (currentByte!12663 (_2!12124 lt!403364))) ((_ sign_extend 32) (currentBit!12658 (_2!12124 lt!403364)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!88128 (= (increaseBitIndex!0 (_2!12124 lt!403364)) lt!403408)))

(declare-fun b!261472 () Bool)

(declare-fun res!218850 () Bool)

(assert (=> b!261472 (=> (not res!218850) (not e!181947))))

(declare-fun lt!403407 () (_ BitVec 64))

(declare-fun lt!403409 () (_ BitVec 64))

(assert (=> b!261472 (= res!218850 (= (bvsub lt!403407 lt!403409) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261472 (or (= (bvand lt!403407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403409 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403407 lt!403409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261472 (= lt!403409 (remainingBits!0 ((_ sign_extend 32) (size!6325 (buf!6847 (_2!12124 lt!403408)))) ((_ sign_extend 32) (currentByte!12663 (_2!12124 lt!403408))) ((_ sign_extend 32) (currentBit!12658 (_2!12124 lt!403408)))))))

(assert (=> b!261472 (= lt!403407 (remainingBits!0 ((_ sign_extend 32) (size!6325 (buf!6847 (_2!12124 lt!403364)))) ((_ sign_extend 32) (currentByte!12663 (_2!12124 lt!403364))) ((_ sign_extend 32) (currentBit!12658 (_2!12124 lt!403364)))))))

(declare-fun b!261473 () Bool)

(assert (=> b!261473 (= e!181947 (= (size!6325 (buf!6847 (_2!12124 lt!403364))) (size!6325 (buf!6847 (_2!12124 lt!403408)))))))

(assert (= (and d!88128 res!218851) b!261472))

(assert (= (and b!261472 res!218850) b!261473))

(declare-fun m!391379 () Bool)

(assert (=> d!88128 m!391379))

(declare-fun m!391381 () Bool)

(assert (=> d!88128 m!391381))

(declare-fun m!391383 () Bool)

(assert (=> d!88128 m!391383))

(declare-fun m!391385 () Bool)

(assert (=> b!261472 m!391385))

(assert (=> b!261472 m!391383))

(assert (=> b!261447 d!88128))

(declare-fun d!88138 () Bool)

(declare-fun res!218860 () Bool)

(declare-fun e!181953 () Bool)

(assert (=> d!88138 (=> res!218860 e!181953)))

(assert (=> d!88138 (= res!218860 (= #b00000000000000000000000000000000 (currentByte!12663 (_2!12124 lt!403364))))))

(assert (=> d!88138 (= (arrayRangesEq!950 (buf!6847 thiss!914) (array!14494 (store (arr!7312 (buf!6847 thiss!914)) (currentByte!12663 (_2!12124 lt!403364)) (select (arr!7312 (buf!6847 (_2!12124 lt!403364))) (currentByte!12663 (_2!12124 lt!403364)))) (size!6325 (buf!6847 thiss!914))) #b00000000000000000000000000000000 (currentByte!12663 (_2!12124 lt!403364))) e!181953)))

(declare-fun b!261484 () Bool)

(declare-fun e!181954 () Bool)

(assert (=> b!261484 (= e!181953 e!181954)))

(declare-fun res!218861 () Bool)

(assert (=> b!261484 (=> (not res!218861) (not e!181954))))

(assert (=> b!261484 (= res!218861 (= (select (arr!7312 (buf!6847 thiss!914)) #b00000000000000000000000000000000) (select (arr!7312 (array!14494 (store (arr!7312 (buf!6847 thiss!914)) (currentByte!12663 (_2!12124 lt!403364)) (select (arr!7312 (buf!6847 (_2!12124 lt!403364))) (currentByte!12663 (_2!12124 lt!403364)))) (size!6325 (buf!6847 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!261485 () Bool)

(assert (=> b!261485 (= e!181954 (arrayRangesEq!950 (buf!6847 thiss!914) (array!14494 (store (arr!7312 (buf!6847 thiss!914)) (currentByte!12663 (_2!12124 lt!403364)) (select (arr!7312 (buf!6847 (_2!12124 lt!403364))) (currentByte!12663 (_2!12124 lt!403364)))) (size!6325 (buf!6847 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12663 (_2!12124 lt!403364))))))

(assert (= (and d!88138 (not res!218860)) b!261484))

(assert (= (and b!261484 res!218861) b!261485))

(declare-fun m!391391 () Bool)

(assert (=> b!261484 m!391391))

(declare-fun m!391393 () Bool)

(assert (=> b!261484 m!391393))

(declare-fun m!391395 () Bool)

(assert (=> b!261485 m!391395))

(assert (=> b!261447 d!88138))

(declare-fun d!88144 () Bool)

(declare-fun e!181959 () Bool)

(assert (=> d!88144 e!181959))

(declare-fun res!218868 () Bool)

(assert (=> d!88144 (=> (not res!218868) (not e!181959))))

(assert (=> d!88144 (= res!218868 (and (bvsge (currentByte!12663 (_2!12124 lt!403364)) #b00000000000000000000000000000000) (bvslt (currentByte!12663 (_2!12124 lt!403364)) (size!6325 (buf!6847 thiss!914)))))))

(declare-fun lt!403434 () Unit!18633)

(declare-fun choose!360 (array!14493 (_ BitVec 32) (_ BitVec 8)) Unit!18633)

(assert (=> d!88144 (= lt!403434 (choose!360 (buf!6847 thiss!914) (currentByte!12663 (_2!12124 lt!403364)) (select (arr!7312 (buf!6847 (_2!12124 lt!403364))) (currentByte!12663 (_2!12124 lt!403364)))))))

(assert (=> d!88144 (and (bvsle #b00000000000000000000000000000000 (currentByte!12663 (_2!12124 lt!403364))) (bvslt (currentByte!12663 (_2!12124 lt!403364)) (size!6325 (buf!6847 thiss!914))))))

(assert (=> d!88144 (= (arrayUpdatedAtPrefixLemma!466 (buf!6847 thiss!914) (currentByte!12663 (_2!12124 lt!403364)) (select (arr!7312 (buf!6847 (_2!12124 lt!403364))) (currentByte!12663 (_2!12124 lt!403364)))) lt!403434)))

(declare-fun b!261492 () Bool)

(assert (=> b!261492 (= e!181959 (arrayRangesEq!950 (buf!6847 thiss!914) (array!14494 (store (arr!7312 (buf!6847 thiss!914)) (currentByte!12663 (_2!12124 lt!403364)) (select (arr!7312 (buf!6847 (_2!12124 lt!403364))) (currentByte!12663 (_2!12124 lt!403364)))) (size!6325 (buf!6847 thiss!914))) #b00000000000000000000000000000000 (currentByte!12663 (_2!12124 lt!403364))))))

(assert (= (and d!88144 res!218868) b!261492))

(assert (=> d!88144 m!391301))

(declare-fun m!391397 () Bool)

(assert (=> d!88144 m!391397))

(assert (=> b!261492 m!391309))

(assert (=> b!261492 m!391317))

(assert (=> b!261447 d!88144))

(declare-fun d!88150 () Bool)

(declare-fun e!181974 () Bool)

(assert (=> d!88150 e!181974))

(declare-fun res!218889 () Bool)

(assert (=> d!88150 (=> (not res!218889) (not e!181974))))

(declare-fun lt!403469 () (_ BitVec 64))

(declare-fun lt!403467 () (_ BitVec 64))

(declare-fun lt!403468 () (_ BitVec 64))

(assert (=> d!88150 (= res!218889 (= lt!403469 (bvsub lt!403467 lt!403468)))))

(assert (=> d!88150 (or (= (bvand lt!403467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403468 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403467 lt!403468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88150 (= lt!403468 (remainingBits!0 ((_ sign_extend 32) (size!6325 (buf!6847 thiss!914))) ((_ sign_extend 32) (currentByte!12663 thiss!914)) ((_ sign_extend 32) (currentBit!12658 thiss!914))))))

(declare-fun lt!403465 () (_ BitVec 64))

(declare-fun lt!403470 () (_ BitVec 64))

(assert (=> d!88150 (= lt!403467 (bvmul lt!403465 lt!403470))))

(assert (=> d!88150 (or (= lt!403465 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403470 (bvsdiv (bvmul lt!403465 lt!403470) lt!403465)))))

(assert (=> d!88150 (= lt!403470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88150 (= lt!403465 ((_ sign_extend 32) (size!6325 (buf!6847 thiss!914))))))

(assert (=> d!88150 (= lt!403469 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12663 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12658 thiss!914))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88150 (invariant!0 (currentBit!12658 thiss!914) (currentByte!12663 thiss!914) (size!6325 (buf!6847 thiss!914)))))

(assert (=> d!88150 (= (bitIndex!0 (size!6325 (buf!6847 thiss!914)) (currentByte!12663 thiss!914) (currentBit!12658 thiss!914)) lt!403469)))

(declare-fun b!261512 () Bool)

(declare-fun res!218888 () Bool)

(assert (=> b!261512 (=> (not res!218888) (not e!181974))))

(assert (=> b!261512 (= res!218888 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403469))))

(declare-fun b!261513 () Bool)

(declare-fun lt!403466 () (_ BitVec 64))

(assert (=> b!261513 (= e!181974 (bvsle lt!403469 (bvmul lt!403466 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261513 (or (= lt!403466 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403466 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403466)))))

(assert (=> b!261513 (= lt!403466 ((_ sign_extend 32) (size!6325 (buf!6847 thiss!914))))))

(assert (= (and d!88150 res!218889) b!261512))

(assert (= (and b!261512 res!218888) b!261513))

(declare-fun m!391415 () Bool)

(assert (=> d!88150 m!391415))

(declare-fun m!391417 () Bool)

(assert (=> d!88150 m!391417))

(assert (=> b!261448 d!88150))

(declare-fun d!88158 () Bool)

(assert (=> d!88158 (= (array_inv!6066 (buf!6847 thiss!914)) (bvsge (size!6325 (buf!6847 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261449 d!88158))

(declare-fun d!88160 () Bool)

(assert (=> d!88160 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6325 (buf!6847 thiss!914))) ((_ sign_extend 32) (currentByte!12663 thiss!914)) ((_ sign_extend 32) (currentBit!12658 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6325 (buf!6847 thiss!914))) ((_ sign_extend 32) (currentByte!12663 thiss!914)) ((_ sign_extend 32) (currentBit!12658 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22345 () Bool)

(assert (= bs!22345 d!88160))

(assert (=> bs!22345 m!391415))

(assert (=> start!56938 d!88160))

(declare-fun d!88162 () Bool)

(assert (=> d!88162 (= (inv!12 thiss!914) (invariant!0 (currentBit!12658 thiss!914) (currentByte!12663 thiss!914) (size!6325 (buf!6847 thiss!914))))))

(declare-fun bs!22346 () Bool)

(assert (= bs!22346 d!88162))

(assert (=> bs!22346 m!391417))

(assert (=> start!56938 d!88162))

(push 1)

(assert (not b!261485))

(assert (not d!88150))

(assert (not b!261492))

(assert (not d!88128))

(assert (not b!261472))

(assert (not d!88160))

(assert (not d!88144))

(assert (not d!88162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

