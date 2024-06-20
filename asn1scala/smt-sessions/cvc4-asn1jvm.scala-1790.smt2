; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48814 () Bool)

(assert start!48814)

(declare-fun b!230985 () Bool)

(declare-fun e!158785 () Bool)

(declare-fun lt!368454 () (_ BitVec 64))

(assert (=> b!230985 (= e!158785 (and (bvslt lt!368454 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!368454 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!230985 (= lt!368454 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230986 () Bool)

(declare-fun e!158789 () Bool)

(declare-datatypes ((array!11819 0))(
  ( (array!11820 (arr!6165 (Array (_ BitVec 32) (_ BitVec 8))) (size!5178 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9452 0))(
  ( (BitStream!9453 (buf!5719 array!11819) (currentByte!10717 (_ BitVec 32)) (currentBit!10712 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9452)

(declare-fun array_inv!4919 (array!11819) Bool)

(assert (=> b!230986 (= e!158789 (array_inv!4919 (buf!5719 b1!101)))))

(declare-fun b!230987 () Bool)

(declare-fun e!158787 () Bool)

(declare-fun b2!99 () BitStream!9452)

(assert (=> b!230987 (= e!158787 (array_inv!4919 (buf!5719 b2!99)))))

(declare-fun res!193527 () Bool)

(assert (=> start!48814 (=> (not res!193527) (not e!158785))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48814 (= res!193527 (and (= (size!5178 (buf!5719 b1!101)) (size!5178 (buf!5719 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48814 e!158785))

(declare-fun inv!12 (BitStream!9452) Bool)

(assert (=> start!48814 (and (inv!12 b1!101) e!158789)))

(assert (=> start!48814 (and (inv!12 b2!99) e!158787)))

(assert (=> start!48814 true))

(declare-fun b!230984 () Bool)

(declare-fun res!193526 () Bool)

(assert (=> b!230984 (=> (not res!193526) (not e!158785))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230984 (= res!193526 (bvsle bits!86 (bitIndex!0 (size!5178 (buf!5719 b2!99)) (currentByte!10717 b2!99) (currentBit!10712 b2!99))))))

(assert (= (and start!48814 res!193527) b!230984))

(assert (= (and b!230984 res!193526) b!230985))

(assert (= start!48814 b!230986))

(assert (= start!48814 b!230987))

(declare-fun m!354205 () Bool)

(assert (=> b!230986 m!354205))

(declare-fun m!354207 () Bool)

(assert (=> b!230987 m!354207))

(declare-fun m!354209 () Bool)

(assert (=> start!48814 m!354209))

(declare-fun m!354211 () Bool)

(assert (=> start!48814 m!354211))

(declare-fun m!354213 () Bool)

(assert (=> b!230984 m!354213))

(push 1)

(assert (not b!230986))

(assert (not b!230984))

(assert (not start!48814))

(assert (not b!230987))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78398 () Bool)

(assert (=> d!78398 (= (array_inv!4919 (buf!5719 b1!101)) (bvsge (size!5178 (buf!5719 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230986 d!78398))

(declare-fun d!78400 () Bool)

(declare-fun e!158798 () Bool)

(assert (=> d!78400 e!158798))

(declare-fun res!193545 () Bool)

(assert (=> d!78400 (=> (not res!193545) (not e!158798))))

(declare-fun lt!368503 () (_ BitVec 64))

(declare-fun lt!368505 () (_ BitVec 64))

(declare-fun lt!368508 () (_ BitVec 64))

(assert (=> d!78400 (= res!193545 (= lt!368508 (bvsub lt!368505 lt!368503)))))

(assert (=> d!78400 (or (= (bvand lt!368505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368505 lt!368503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78400 (= lt!368503 (remainingBits!0 ((_ sign_extend 32) (size!5178 (buf!5719 b2!99))) ((_ sign_extend 32) (currentByte!10717 b2!99)) ((_ sign_extend 32) (currentBit!10712 b2!99))))))

(declare-fun lt!368506 () (_ BitVec 64))

(declare-fun lt!368504 () (_ BitVec 64))

(assert (=> d!78400 (= lt!368505 (bvmul lt!368506 lt!368504))))

(assert (=> d!78400 (or (= lt!368506 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368504 (bvsdiv (bvmul lt!368506 lt!368504) lt!368506)))))

(assert (=> d!78400 (= lt!368504 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78400 (= lt!368506 ((_ sign_extend 32) (size!5178 (buf!5719 b2!99))))))

(assert (=> d!78400 (= lt!368508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10717 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10712 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78400 (invariant!0 (currentBit!10712 b2!99) (currentByte!10717 b2!99) (size!5178 (buf!5719 b2!99)))))

(assert (=> d!78400 (= (bitIndex!0 (size!5178 (buf!5719 b2!99)) (currentByte!10717 b2!99) (currentBit!10712 b2!99)) lt!368508)))

(declare-fun b!231004 () Bool)

(declare-fun res!193544 () Bool)

(assert (=> b!231004 (=> (not res!193544) (not e!158798))))

(assert (=> b!231004 (= res!193544 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368508))))

(declare-fun b!231005 () Bool)

(declare-fun lt!368507 () (_ BitVec 64))

(assert (=> b!231005 (= e!158798 (bvsle lt!368508 (bvmul lt!368507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!231005 (or (= lt!368507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368507)))))

(assert (=> b!231005 (= lt!368507 ((_ sign_extend 32) (size!5178 (buf!5719 b2!99))))))

(assert (= (and d!78400 res!193545) b!231004))

(assert (= (and b!231004 res!193544) b!231005))

(declare-fun m!354227 () Bool)

(assert (=> d!78400 m!354227))

(declare-fun m!354229 () Bool)

(assert (=> d!78400 m!354229))

(assert (=> b!230984 d!78400))

(declare-fun d!78402 () Bool)

(assert (=> d!78402 (= (inv!12 b1!101) (invariant!0 (currentBit!10712 b1!101) (currentByte!10717 b1!101) (size!5178 (buf!5719 b1!101))))))

(declare-fun bs!19226 () Bool)

(assert (= bs!19226 d!78402))

(declare-fun m!354231 () Bool)

(assert (=> bs!19226 m!354231))

(assert (=> start!48814 d!78402))

(declare-fun d!78404 () Bool)

(assert (=> d!78404 (= (inv!12 b2!99) (invariant!0 (currentBit!10712 b2!99) (currentByte!10717 b2!99) (size!5178 (buf!5719 b2!99))))))

(declare-fun bs!19227 () Bool)

(assert (= bs!19227 d!78404))

(assert (=> bs!19227 m!354229))

(assert (=> start!48814 d!78404))

(declare-fun d!78406 () Bool)

(assert (=> d!78406 (= (array_inv!4919 (buf!5719 b2!99)) (bvsge (size!5178 (buf!5719 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230987 d!78406))

(push 1)

(assert (not d!78402))

(assert (not d!78404))

(assert (not d!78400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

