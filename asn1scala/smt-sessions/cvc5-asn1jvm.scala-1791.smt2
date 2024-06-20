; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48834 () Bool)

(assert start!48834)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b!231018 () Bool)

(declare-fun e!158812 () Bool)

(declare-fun lt!368513 () (_ BitVec 64))

(declare-fun lt!368514 () (_ BitVec 64))

(assert (=> b!231018 (= e!158812 (and (= lt!368514 (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!368514 (bvand (bvadd lt!368513 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!231018 (= lt!368514 (bvand lt!368513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!11824 0))(
  ( (array!11825 (arr!6166 (Array (_ BitVec 32) (_ BitVec 8))) (size!5179 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9454 0))(
  ( (BitStream!9455 (buf!5720 array!11824) (currentByte!10721 (_ BitVec 32)) (currentBit!10716 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9454)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231018 (= lt!368513 (bitIndex!0 (size!5179 (buf!5720 b1!101)) (currentByte!10721 b1!101) (currentBit!10716 b1!101)))))

(declare-fun b!231019 () Bool)

(declare-fun res!193557 () Bool)

(assert (=> b!231019 (=> (not res!193557) (not e!158812))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231019 (= res!193557 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5179 (buf!5720 b1!101))) ((_ sign_extend 32) (currentByte!10721 b1!101)) ((_ sign_extend 32) (currentBit!10716 b1!101)) bytes!19))))

(declare-fun b!231020 () Bool)

(declare-fun res!193555 () Bool)

(assert (=> b!231020 (=> (not res!193555) (not e!158812))))

(declare-fun b2!99 () BitStream!9454)

(assert (=> b!231020 (= res!193555 (bvsle bits!86 (bitIndex!0 (size!5179 (buf!5720 b2!99)) (currentByte!10721 b2!99) (currentBit!10716 b2!99))))))

(declare-fun b!231021 () Bool)

(declare-fun e!158813 () Bool)

(declare-fun array_inv!4920 (array!11824) Bool)

(assert (=> b!231021 (= e!158813 (array_inv!4920 (buf!5720 b2!99)))))

(declare-fun res!193554 () Bool)

(assert (=> start!48834 (=> (not res!193554) (not e!158812))))

(assert (=> start!48834 (= res!193554 (and (= (size!5179 (buf!5720 b1!101)) (size!5179 (buf!5720 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48834 e!158812))

(declare-fun e!158811 () Bool)

(declare-fun inv!12 (BitStream!9454) Bool)

(assert (=> start!48834 (and (inv!12 b1!101) e!158811)))

(assert (=> start!48834 (and (inv!12 b2!99) e!158813)))

(assert (=> start!48834 true))

(declare-fun b!231022 () Bool)

(declare-fun res!193556 () Bool)

(assert (=> b!231022 (=> (not res!193556) (not e!158812))))

(assert (=> b!231022 (= res!193556 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231023 () Bool)

(assert (=> b!231023 (= e!158811 (array_inv!4920 (buf!5720 b1!101)))))

(assert (= (and start!48834 res!193554) b!231020))

(assert (= (and b!231020 res!193555) b!231022))

(assert (= (and b!231022 res!193556) b!231019))

(assert (= (and b!231019 res!193557) b!231018))

(assert (= start!48834 b!231023))

(assert (= start!48834 b!231021))

(declare-fun m!354233 () Bool)

(assert (=> b!231018 m!354233))

(declare-fun m!354235 () Bool)

(assert (=> b!231019 m!354235))

(declare-fun m!354237 () Bool)

(assert (=> start!48834 m!354237))

(declare-fun m!354239 () Bool)

(assert (=> start!48834 m!354239))

(declare-fun m!354241 () Bool)

(assert (=> b!231021 m!354241))

(declare-fun m!354243 () Bool)

(assert (=> b!231020 m!354243))

(declare-fun m!354245 () Bool)

(assert (=> b!231023 m!354245))

(push 1)

(assert (not start!48834))

(assert (not b!231019))

(assert (not b!231018))

(assert (not b!231020))

(assert (not b!231021))

(assert (not b!231023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78424 () Bool)

(assert (=> d!78424 (= (array_inv!4920 (buf!5720 b2!99)) (bvsge (size!5179 (buf!5720 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!231021 d!78424))

(declare-fun d!78426 () Bool)

(declare-fun e!158850 () Bool)

(assert (=> d!78426 e!158850))

(declare-fun res!193594 () Bool)

(assert (=> d!78426 (=> (not res!193594) (not e!158850))))

(declare-fun lt!368566 () (_ BitVec 64))

(declare-fun lt!368564 () (_ BitVec 64))

(declare-fun lt!368565 () (_ BitVec 64))

(assert (=> d!78426 (= res!193594 (= lt!368564 (bvsub lt!368566 lt!368565)))))

(assert (=> d!78426 (or (= (bvand lt!368566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368565 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368566 lt!368565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78426 (= lt!368565 (remainingBits!0 ((_ sign_extend 32) (size!5179 (buf!5720 b1!101))) ((_ sign_extend 32) (currentByte!10721 b1!101)) ((_ sign_extend 32) (currentBit!10716 b1!101))))))

(declare-fun lt!368563 () (_ BitVec 64))

(declare-fun lt!368568 () (_ BitVec 64))

(assert (=> d!78426 (= lt!368566 (bvmul lt!368563 lt!368568))))

(assert (=> d!78426 (or (= lt!368563 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368568 (bvsdiv (bvmul lt!368563 lt!368568) lt!368563)))))

(assert (=> d!78426 (= lt!368568 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78426 (= lt!368563 ((_ sign_extend 32) (size!5179 (buf!5720 b1!101))))))

(assert (=> d!78426 (= lt!368564 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10721 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10716 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78426 (invariant!0 (currentBit!10716 b1!101) (currentByte!10721 b1!101) (size!5179 (buf!5720 b1!101)))))

(assert (=> d!78426 (= (bitIndex!0 (size!5179 (buf!5720 b1!101)) (currentByte!10721 b1!101) (currentBit!10716 b1!101)) lt!368564)))

(declare-fun b!231072 () Bool)

(declare-fun res!193595 () Bool)

(assert (=> b!231072 (=> (not res!193595) (not e!158850))))

(assert (=> b!231072 (= res!193595 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368564))))

(declare-fun b!231073 () Bool)

(declare-fun lt!368567 () (_ BitVec 64))

(assert (=> b!231073 (= e!158850 (bvsle lt!368564 (bvmul lt!368567 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!231073 (or (= lt!368567 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368567 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368567)))))

(assert (=> b!231073 (= lt!368567 ((_ sign_extend 32) (size!5179 (buf!5720 b1!101))))))

(assert (= (and d!78426 res!193594) b!231072))

(assert (= (and b!231072 res!193595) b!231073))

(declare-fun m!354283 () Bool)

(assert (=> d!78426 m!354283))

(declare-fun m!354285 () Bool)

(assert (=> d!78426 m!354285))

(assert (=> b!231018 d!78426))

(declare-fun d!78428 () Bool)

(assert (=> d!78428 (= (array_inv!4920 (buf!5720 b1!101)) (bvsge (size!5179 (buf!5720 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!231023 d!78428))

(declare-fun d!78430 () Bool)

(assert (=> d!78430 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5179 (buf!5720 b1!101))) ((_ sign_extend 32) (currentByte!10721 b1!101)) ((_ sign_extend 32) (currentBit!10716 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5179 (buf!5720 b1!101))) ((_ sign_extend 32) (currentByte!10721 b1!101)) ((_ sign_extend 32) (currentBit!10716 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19234 () Bool)

(assert (= bs!19234 d!78430))

(assert (=> bs!19234 m!354283))

(assert (=> b!231019 d!78430))

(declare-fun d!78432 () Bool)

(declare-fun e!158851 () Bool)

(assert (=> d!78432 e!158851))

(declare-fun res!193596 () Bool)

(assert (=> d!78432 (=> (not res!193596) (not e!158851))))

(declare-fun lt!368572 () (_ BitVec 64))

(declare-fun lt!368571 () (_ BitVec 64))

(declare-fun lt!368570 () (_ BitVec 64))

(assert (=> d!78432 (= res!193596 (= lt!368570 (bvsub lt!368572 lt!368571)))))

(assert (=> d!78432 (or (= (bvand lt!368572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368571 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368572 lt!368571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78432 (= lt!368571 (remainingBits!0 ((_ sign_extend 32) (size!5179 (buf!5720 b2!99))) ((_ sign_extend 32) (currentByte!10721 b2!99)) ((_ sign_extend 32) (currentBit!10716 b2!99))))))

(declare-fun lt!368569 () (_ BitVec 64))

(declare-fun lt!368574 () (_ BitVec 64))

(assert (=> d!78432 (= lt!368572 (bvmul lt!368569 lt!368574))))

(assert (=> d!78432 (or (= lt!368569 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368574 (bvsdiv (bvmul lt!368569 lt!368574) lt!368569)))))

(assert (=> d!78432 (= lt!368574 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78432 (= lt!368569 ((_ sign_extend 32) (size!5179 (buf!5720 b2!99))))))

(assert (=> d!78432 (= lt!368570 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10721 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10716 b2!99))))))

(assert (=> d!78432 (invariant!0 (currentBit!10716 b2!99) (currentByte!10721 b2!99) (size!5179 (buf!5720 b2!99)))))

(assert (=> d!78432 (= (bitIndex!0 (size!5179 (buf!5720 b2!99)) (currentByte!10721 b2!99) (currentBit!10716 b2!99)) lt!368570)))

(declare-fun b!231074 () Bool)

(declare-fun res!193597 () Bool)

(assert (=> b!231074 (=> (not res!193597) (not e!158851))))

(assert (=> b!231074 (= res!193597 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368570))))

(declare-fun b!231075 () Bool)

(declare-fun lt!368573 () (_ BitVec 64))

(assert (=> b!231075 (= e!158851 (bvsle lt!368570 (bvmul lt!368573 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!231075 (or (= lt!368573 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368573 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368573)))))

(assert (=> b!231075 (= lt!368573 ((_ sign_extend 32) (size!5179 (buf!5720 b2!99))))))

(assert (= (and d!78432 res!193596) b!231074))

(assert (= (and b!231074 res!193597) b!231075))

(declare-fun m!354287 () Bool)

(assert (=> d!78432 m!354287))

(declare-fun m!354289 () Bool)

(assert (=> d!78432 m!354289))

(assert (=> b!231020 d!78432))

(declare-fun d!78434 () Bool)

(assert (=> d!78434 (= (inv!12 b1!101) (invariant!0 (currentBit!10716 b1!101) (currentByte!10721 b1!101) (size!5179 (buf!5720 b1!101))))))

(declare-fun bs!19235 () Bool)

(assert (= bs!19235 d!78434))

(assert (=> bs!19235 m!354285))

(assert (=> start!48834 d!78434))

(declare-fun d!78436 () Bool)

(assert (=> d!78436 (= (inv!12 b2!99) (invariant!0 (currentBit!10716 b2!99) (currentByte!10721 b2!99) (size!5179 (buf!5720 b2!99))))))

(declare-fun bs!19236 () Bool)

(assert (= bs!19236 d!78436))

(assert (=> bs!19236 m!354289))

(assert (=> start!48834 d!78436))

(push 1)

(assert (not d!78426))

(assert (not d!78436))

(assert (not d!78434))

(assert (not d!78432))

(assert (not d!78430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

