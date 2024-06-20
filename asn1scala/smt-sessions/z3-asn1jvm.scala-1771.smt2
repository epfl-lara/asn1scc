; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48444 () Bool)

(assert start!48444)

(declare-fun b!229532 () Bool)

(declare-fun e!157533 () Bool)

(declare-datatypes ((array!11677 0))(
  ( (array!11678 (arr!6107 (Array (_ BitVec 32) (_ BitVec 8))) (size!5120 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9336 0))(
  ( (BitStream!9337 (buf!5661 array!11677) (currentByte!10584 (_ BitVec 32)) (currentBit!10579 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9336)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229532 (= e!157533 (not (invariant!0 (currentBit!10579 b2!99) (currentByte!10584 b2!99) (size!5120 (buf!5661 b2!99)))))))

(declare-fun b!229533 () Bool)

(declare-fun res!192424 () Bool)

(assert (=> b!229533 (=> (not res!192424) (not e!157533))))

(declare-fun b1!101 () BitStream!9336)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229533 (= res!192424 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5120 (buf!5661 b1!101))) ((_ sign_extend 32) (currentByte!10584 b1!101)) ((_ sign_extend 32) (currentBit!10579 b1!101)) bytes!19))))

(declare-fun b!229534 () Bool)

(declare-fun e!157534 () Bool)

(declare-fun array_inv!4861 (array!11677) Bool)

(assert (=> b!229534 (= e!157534 (array_inv!4861 (buf!5661 b1!101)))))

(declare-fun b!229535 () Bool)

(declare-fun res!192427 () Bool)

(assert (=> b!229535 (=> (not res!192427) (not e!157533))))

(declare-fun lt!367455 () (_ BitVec 64))

(assert (=> b!229535 (= res!192427 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5120 (buf!5661 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10584 b1!101))) ((_ sign_extend 32) (currentBit!10579 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!367455 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10584 b2!99))) ((_ sign_extend 32) (currentBit!10579 b2!99))))))))

(declare-fun b!229536 () Bool)

(declare-fun e!157532 () Bool)

(assert (=> b!229536 (= e!157532 e!157533)))

(declare-fun res!192425 () Bool)

(assert (=> b!229536 (=> (not res!192425) (not e!157533))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!229536 (= res!192425 (and (bvsle bits!86 lt!367455) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229536 (= lt!367455 (bitIndex!0 (size!5120 (buf!5661 b2!99)) (currentByte!10584 b2!99) (currentBit!10579 b2!99)))))

(declare-fun b!229537 () Bool)

(declare-fun res!192422 () Bool)

(assert (=> b!229537 (=> (not res!192422) (not e!157533))))

(assert (=> b!229537 (= res!192422 (= lt!367455 (bvadd (bitIndex!0 (size!5120 (buf!5661 b1!101)) (currentByte!10584 b1!101) (currentBit!10579 b1!101)) bits!86)))))

(declare-fun res!192426 () Bool)

(assert (=> start!48444 (=> (not res!192426) (not e!157532))))

(assert (=> start!48444 (= res!192426 (and (= (size!5120 (buf!5661 b1!101)) (size!5120 (buf!5661 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48444 e!157532))

(declare-fun inv!12 (BitStream!9336) Bool)

(assert (=> start!48444 (and (inv!12 b1!101) e!157534)))

(declare-fun e!157536 () Bool)

(assert (=> start!48444 (and (inv!12 b2!99) e!157536)))

(assert (=> start!48444 true))

(declare-fun b!229538 () Bool)

(assert (=> b!229538 (= e!157536 (array_inv!4861 (buf!5661 b2!99)))))

(declare-fun b!229539 () Bool)

(declare-fun res!192423 () Bool)

(assert (=> b!229539 (=> (not res!192423) (not e!157533))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229539 (= res!192423 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5120 (buf!5661 b1!101))) ((_ sign_extend 32) (currentByte!10584 b1!101)) ((_ sign_extend 32) (currentBit!10579 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48444 res!192426) b!229536))

(assert (= (and b!229536 res!192425) b!229533))

(assert (= (and b!229533 res!192424) b!229537))

(assert (= (and b!229537 res!192422) b!229539))

(assert (= (and b!229539 res!192423) b!229535))

(assert (= (and b!229535 res!192427) b!229532))

(assert (= start!48444 b!229534))

(assert (= start!48444 b!229538))

(declare-fun m!353191 () Bool)

(assert (=> b!229539 m!353191))

(declare-fun m!353193 () Bool)

(assert (=> b!229532 m!353193))

(declare-fun m!353195 () Bool)

(assert (=> b!229538 m!353195))

(declare-fun m!353197 () Bool)

(assert (=> start!48444 m!353197))

(declare-fun m!353199 () Bool)

(assert (=> start!48444 m!353199))

(declare-fun m!353201 () Bool)

(assert (=> b!229536 m!353201))

(declare-fun m!353203 () Bool)

(assert (=> b!229537 m!353203))

(declare-fun m!353205 () Bool)

(assert (=> b!229534 m!353205))

(declare-fun m!353207 () Bool)

(assert (=> b!229533 m!353207))

(check-sat (not start!48444) (not b!229538) (not b!229532) (not b!229533) (not b!229536) (not b!229539) (not b!229534) (not b!229537))
(check-sat)
(get-model)

(declare-fun d!77928 () Bool)

(assert (=> d!77928 (= (invariant!0 (currentBit!10579 b2!99) (currentByte!10584 b2!99) (size!5120 (buf!5661 b2!99))) (and (bvsge (currentBit!10579 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10579 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10584 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10584 b2!99) (size!5120 (buf!5661 b2!99))) (and (= (currentBit!10579 b2!99) #b00000000000000000000000000000000) (= (currentByte!10584 b2!99) (size!5120 (buf!5661 b2!99)))))))))

(assert (=> b!229532 d!77928))

(declare-fun d!77930 () Bool)

(declare-fun e!157558 () Bool)

(assert (=> d!77930 e!157558))

(declare-fun res!192451 () Bool)

(assert (=> d!77930 (=> (not res!192451) (not e!157558))))

(declare-fun lt!367475 () (_ BitVec 64))

(declare-fun lt!367472 () (_ BitVec 64))

(declare-fun lt!367476 () (_ BitVec 64))

(assert (=> d!77930 (= res!192451 (= lt!367476 (bvsub lt!367475 lt!367472)))))

(assert (=> d!77930 (or (= (bvand lt!367475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367472 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367475 lt!367472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77930 (= lt!367472 (remainingBits!0 ((_ sign_extend 32) (size!5120 (buf!5661 b1!101))) ((_ sign_extend 32) (currentByte!10584 b1!101)) ((_ sign_extend 32) (currentBit!10579 b1!101))))))

(declare-fun lt!367471 () (_ BitVec 64))

(declare-fun lt!367474 () (_ BitVec 64))

(assert (=> d!77930 (= lt!367475 (bvmul lt!367471 lt!367474))))

(assert (=> d!77930 (or (= lt!367471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367474 (bvsdiv (bvmul lt!367471 lt!367474) lt!367471)))))

(assert (=> d!77930 (= lt!367474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77930 (= lt!367471 ((_ sign_extend 32) (size!5120 (buf!5661 b1!101))))))

(assert (=> d!77930 (= lt!367476 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10584 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10579 b1!101))))))

(assert (=> d!77930 (invariant!0 (currentBit!10579 b1!101) (currentByte!10584 b1!101) (size!5120 (buf!5661 b1!101)))))

(assert (=> d!77930 (= (bitIndex!0 (size!5120 (buf!5661 b1!101)) (currentByte!10584 b1!101) (currentBit!10579 b1!101)) lt!367476)))

(declare-fun b!229568 () Bool)

(declare-fun res!192450 () Bool)

(assert (=> b!229568 (=> (not res!192450) (not e!157558))))

(assert (=> b!229568 (= res!192450 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367476))))

(declare-fun b!229569 () Bool)

(declare-fun lt!367473 () (_ BitVec 64))

(assert (=> b!229569 (= e!157558 (bvsle lt!367476 (bvmul lt!367473 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229569 (or (= lt!367473 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367473 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367473)))))

(assert (=> b!229569 (= lt!367473 ((_ sign_extend 32) (size!5120 (buf!5661 b1!101))))))

(assert (= (and d!77930 res!192451) b!229568))

(assert (= (and b!229568 res!192450) b!229569))

(assert (=> d!77930 m!353191))

(declare-fun m!353227 () Bool)

(assert (=> d!77930 m!353227))

(assert (=> b!229537 d!77930))

(declare-fun d!77932 () Bool)

(assert (=> d!77932 (= (array_inv!4861 (buf!5661 b2!99)) (bvsge (size!5120 (buf!5661 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229538 d!77932))

(declare-fun d!77934 () Bool)

(declare-fun e!157559 () Bool)

(assert (=> d!77934 e!157559))

(declare-fun res!192453 () Bool)

(assert (=> d!77934 (=> (not res!192453) (not e!157559))))

(declare-fun lt!367482 () (_ BitVec 64))

(declare-fun lt!367481 () (_ BitVec 64))

(declare-fun lt!367478 () (_ BitVec 64))

(assert (=> d!77934 (= res!192453 (= lt!367482 (bvsub lt!367481 lt!367478)))))

(assert (=> d!77934 (or (= (bvand lt!367481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367478 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367481 lt!367478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77934 (= lt!367478 (remainingBits!0 ((_ sign_extend 32) (size!5120 (buf!5661 b2!99))) ((_ sign_extend 32) (currentByte!10584 b2!99)) ((_ sign_extend 32) (currentBit!10579 b2!99))))))

(declare-fun lt!367477 () (_ BitVec 64))

(declare-fun lt!367480 () (_ BitVec 64))

(assert (=> d!77934 (= lt!367481 (bvmul lt!367477 lt!367480))))

(assert (=> d!77934 (or (= lt!367477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367480 (bvsdiv (bvmul lt!367477 lt!367480) lt!367477)))))

(assert (=> d!77934 (= lt!367480 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77934 (= lt!367477 ((_ sign_extend 32) (size!5120 (buf!5661 b2!99))))))

(assert (=> d!77934 (= lt!367482 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10584 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10579 b2!99))))))

(assert (=> d!77934 (invariant!0 (currentBit!10579 b2!99) (currentByte!10584 b2!99) (size!5120 (buf!5661 b2!99)))))

(assert (=> d!77934 (= (bitIndex!0 (size!5120 (buf!5661 b2!99)) (currentByte!10584 b2!99) (currentBit!10579 b2!99)) lt!367482)))

(declare-fun b!229570 () Bool)

(declare-fun res!192452 () Bool)

(assert (=> b!229570 (=> (not res!192452) (not e!157559))))

(assert (=> b!229570 (= res!192452 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367482))))

(declare-fun b!229571 () Bool)

(declare-fun lt!367479 () (_ BitVec 64))

(assert (=> b!229571 (= e!157559 (bvsle lt!367482 (bvmul lt!367479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229571 (or (= lt!367479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367479)))))

(assert (=> b!229571 (= lt!367479 ((_ sign_extend 32) (size!5120 (buf!5661 b2!99))))))

(assert (= (and d!77934 res!192453) b!229570))

(assert (= (and b!229570 res!192452) b!229571))

(declare-fun m!353229 () Bool)

(assert (=> d!77934 m!353229))

(assert (=> d!77934 m!353193))

(assert (=> b!229536 d!77934))

(declare-fun d!77936 () Bool)

(assert (=> d!77936 (= (inv!12 b1!101) (invariant!0 (currentBit!10579 b1!101) (currentByte!10584 b1!101) (size!5120 (buf!5661 b1!101))))))

(declare-fun bs!19089 () Bool)

(assert (= bs!19089 d!77936))

(assert (=> bs!19089 m!353227))

(assert (=> start!48444 d!77936))

(declare-fun d!77938 () Bool)

(assert (=> d!77938 (= (inv!12 b2!99) (invariant!0 (currentBit!10579 b2!99) (currentByte!10584 b2!99) (size!5120 (buf!5661 b2!99))))))

(declare-fun bs!19090 () Bool)

(assert (= bs!19090 d!77938))

(assert (=> bs!19090 m!353193))

(assert (=> start!48444 d!77938))

(declare-fun d!77940 () Bool)

(assert (=> d!77940 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5120 (buf!5661 b1!101))) ((_ sign_extend 32) (currentByte!10584 b1!101)) ((_ sign_extend 32) (currentBit!10579 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5120 (buf!5661 b1!101))) ((_ sign_extend 32) (currentByte!10584 b1!101)) ((_ sign_extend 32) (currentBit!10579 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19091 () Bool)

(assert (= bs!19091 d!77940))

(assert (=> bs!19091 m!353191))

(assert (=> b!229533 d!77940))

(declare-fun d!77942 () Bool)

(assert (=> d!77942 (= (array_inv!4861 (buf!5661 b1!101)) (bvsge (size!5120 (buf!5661 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229534 d!77942))

(declare-fun d!77944 () Bool)

(assert (=> d!77944 (= (remainingBits!0 ((_ sign_extend 32) (size!5120 (buf!5661 b1!101))) ((_ sign_extend 32) (currentByte!10584 b1!101)) ((_ sign_extend 32) (currentBit!10579 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5120 (buf!5661 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10584 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10579 b1!101)))))))

(assert (=> b!229539 d!77944))

(check-sat (not d!77934) (not d!77940) (not d!77936) (not d!77938) (not d!77930))
