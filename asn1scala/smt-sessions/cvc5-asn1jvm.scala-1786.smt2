; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48750 () Bool)

(assert start!48750)

(declare-fun b!230801 () Bool)

(declare-fun e!158558 () Bool)

(declare-datatypes ((array!11785 0))(
  ( (array!11786 (arr!6151 (Array (_ BitVec 32) (_ BitVec 8))) (size!5164 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9424 0))(
  ( (BitStream!9425 (buf!5705 array!11785) (currentByte!10697 (_ BitVec 32)) (currentBit!10692 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9424)

(declare-fun array_inv!4905 (array!11785) Bool)

(assert (=> b!230801 (= e!158558 (array_inv!4905 (buf!5705 b2!99)))))

(declare-fun b!230798 () Bool)

(declare-fun res!193424 () Bool)

(declare-fun e!158561 () Bool)

(assert (=> b!230798 (=> (not res!193424) (not e!158561))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230798 (= res!193424 (bvsle bits!86 (bitIndex!0 (size!5164 (buf!5705 b2!99)) (currentByte!10697 b2!99) (currentBit!10692 b2!99))))))

(declare-fun res!193425 () Bool)

(assert (=> start!48750 (=> (not res!193425) (not e!158561))))

(declare-fun b1!101 () BitStream!9424)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48750 (= res!193425 (and (= (size!5164 (buf!5705 b1!101)) (size!5164 (buf!5705 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48750 e!158561))

(declare-fun e!158560 () Bool)

(declare-fun inv!12 (BitStream!9424) Bool)

(assert (=> start!48750 (and (inv!12 b1!101) e!158560)))

(assert (=> start!48750 (and (inv!12 b2!99) e!158558)))

(assert (=> start!48750 true))

(declare-fun b!230799 () Bool)

(assert (=> b!230799 (= e!158561 (and (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!230800 () Bool)

(assert (=> b!230800 (= e!158560 (array_inv!4905 (buf!5705 b1!101)))))

(assert (= (and start!48750 res!193425) b!230798))

(assert (= (and b!230798 res!193424) b!230799))

(assert (= start!48750 b!230800))

(assert (= start!48750 b!230801))

(declare-fun m!354029 () Bool)

(assert (=> b!230801 m!354029))

(declare-fun m!354031 () Bool)

(assert (=> b!230798 m!354031))

(declare-fun m!354033 () Bool)

(assert (=> start!48750 m!354033))

(declare-fun m!354035 () Bool)

(assert (=> start!48750 m!354035))

(declare-fun m!354037 () Bool)

(assert (=> b!230800 m!354037))

(push 1)

(assert (not b!230801))

(assert (not start!48750))

(assert (not b!230800))

(assert (not b!230798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78320 () Bool)

(assert (=> d!78320 (= (array_inv!4905 (buf!5705 b2!99)) (bvsge (size!5164 (buf!5705 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230801 d!78320))

(declare-fun d!78322 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78322 (= (inv!12 b1!101) (invariant!0 (currentBit!10692 b1!101) (currentByte!10697 b1!101) (size!5164 (buf!5705 b1!101))))))

(declare-fun bs!19200 () Bool)

(assert (= bs!19200 d!78322))

(declare-fun m!354063 () Bool)

(assert (=> bs!19200 m!354063))

(assert (=> start!48750 d!78322))

(declare-fun d!78324 () Bool)

(assert (=> d!78324 (= (inv!12 b2!99) (invariant!0 (currentBit!10692 b2!99) (currentByte!10697 b2!99) (size!5164 (buf!5705 b2!99))))))

(declare-fun bs!19201 () Bool)

(assert (= bs!19201 d!78324))

(declare-fun m!354065 () Bool)

(assert (=> bs!19201 m!354065))

(assert (=> start!48750 d!78324))

(declare-fun d!78326 () Bool)

(assert (=> d!78326 (= (array_inv!4905 (buf!5705 b1!101)) (bvsge (size!5164 (buf!5705 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230800 d!78326))

(declare-fun d!78328 () Bool)

(declare-fun e!158596 () Bool)

(assert (=> d!78328 e!158596))

(declare-fun res!193444 () Bool)

(assert (=> d!78328 (=> (not res!193444) (not e!158596))))

(declare-fun lt!368345 () (_ BitVec 64))

(declare-fun lt!368344 () (_ BitVec 64))

(declare-fun lt!368346 () (_ BitVec 64))

(assert (=> d!78328 (= res!193444 (= lt!368344 (bvsub lt!368346 lt!368345)))))

(assert (=> d!78328 (or (= (bvand lt!368346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368346 lt!368345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78328 (= lt!368345 (remainingBits!0 ((_ sign_extend 32) (size!5164 (buf!5705 b2!99))) ((_ sign_extend 32) (currentByte!10697 b2!99)) ((_ sign_extend 32) (currentBit!10692 b2!99))))))

(declare-fun lt!368347 () (_ BitVec 64))

(declare-fun lt!368343 () (_ BitVec 64))

(assert (=> d!78328 (= lt!368346 (bvmul lt!368347 lt!368343))))

(assert (=> d!78328 (or (= lt!368347 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368343 (bvsdiv (bvmul lt!368347 lt!368343) lt!368347)))))

(assert (=> d!78328 (= lt!368343 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78328 (= lt!368347 ((_ sign_extend 32) (size!5164 (buf!5705 b2!99))))))

(assert (=> d!78328 (= lt!368344 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10697 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10692 b2!99))))))

(assert (=> d!78328 (invariant!0 (currentBit!10692 b2!99) (currentByte!10697 b2!99) (size!5164 (buf!5705 b2!99)))))

(assert (=> d!78328 (= (bitIndex!0 (size!5164 (buf!5705 b2!99)) (currentByte!10697 b2!99) (currentBit!10692 b2!99)) lt!368344)))

(declare-fun b!230830 () Bool)

(declare-fun res!193445 () Bool)

(assert (=> b!230830 (=> (not res!193445) (not e!158596))))

(assert (=> b!230830 (= res!193445 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368344))))

(declare-fun b!230831 () Bool)

(declare-fun lt!368342 () (_ BitVec 64))

(assert (=> b!230831 (= e!158596 (bvsle lt!368344 (bvmul lt!368342 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230831 (or (= lt!368342 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368342 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368342)))))

(assert (=> b!230831 (= lt!368342 ((_ sign_extend 32) (size!5164 (buf!5705 b2!99))))))

(assert (= (and d!78328 res!193444) b!230830))

(assert (= (and b!230830 res!193445) b!230831))

(declare-fun m!354067 () Bool)

(assert (=> d!78328 m!354067))

(assert (=> d!78328 m!354065))

(assert (=> b!230798 d!78328))

(push 1)

(assert (not d!78324))

(assert (not d!78322))

(assert (not d!78328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

