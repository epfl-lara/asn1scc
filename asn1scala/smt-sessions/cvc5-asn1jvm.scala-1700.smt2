; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47156 () Bool)

(assert start!47156)

(declare-fun b!225326 () Bool)

(declare-fun res!189094 () Bool)

(declare-fun e!153761 () Bool)

(assert (=> b!225326 (=> (not res!189094) (not e!153761))))

(declare-datatypes ((array!11183 0))(
  ( (array!11184 (arr!5863 (Array (_ BitVec 32) (_ BitVec 8))) (size!4906 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8914 0))(
  ( (BitStream!8915 (buf!5450 array!11183) (currentByte!10225 (_ BitVec 32)) (currentBit!10220 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8914)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225326 (= res!189094 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4906 (buf!5450 thiss!1870))) ((_ sign_extend 32) (currentByte!10225 thiss!1870)) ((_ sign_extend 32) (currentBit!10220 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189095 () Bool)

(assert (=> start!47156 (=> (not res!189095) (not e!153761))))

(declare-fun arr!308 () array!11183)

(assert (=> start!47156 (= res!189095 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4906 arr!308))))))

(assert (=> start!47156 e!153761))

(assert (=> start!47156 true))

(declare-fun array_inv!4647 (array!11183) Bool)

(assert (=> start!47156 (array_inv!4647 arr!308)))

(declare-fun e!153760 () Bool)

(declare-fun inv!12 (BitStream!8914) Bool)

(assert (=> start!47156 (and (inv!12 thiss!1870) e!153760)))

(declare-fun b!225329 () Bool)

(assert (=> b!225329 (= e!153760 (array_inv!4647 (buf!5450 thiss!1870)))))

(declare-fun b!225327 () Bool)

(declare-fun res!189096 () Bool)

(assert (=> b!225327 (=> (not res!189096) (not e!153761))))

(assert (=> b!225327 (= res!189096 (bvsge i!761 to!496))))

(declare-fun b!225328 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225328 (= e!153761 (not (invariant!0 (currentBit!10220 thiss!1870) (currentByte!10225 thiss!1870) (size!4906 (buf!5450 thiss!1870)))))))

(declare-fun arrayRangesEq!796 (array!11183 array!11183 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225328 (arrayRangesEq!796 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16557 0))(
  ( (Unit!16558) )
))
(declare-fun lt!358489 () Unit!16557)

(declare-fun arrayRangesEqSlicedLemma!85 (array!11183 array!11183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16557)

(assert (=> b!225328 (= lt!358489 (arrayRangesEqSlicedLemma!85 arr!308 arr!308 #b00000000000000000000000000000000 (size!4906 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225328 (arrayRangesEq!796 arr!308 arr!308 #b00000000000000000000000000000000 (size!4906 arr!308))))

(declare-fun lt!358491 () Unit!16557)

(declare-fun arrayRangesEqReflexiveLemma!100 (array!11183) Unit!16557)

(assert (=> b!225328 (= lt!358491 (arrayRangesEqReflexiveLemma!100 arr!308))))

(declare-fun lt!358490 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225328 (= lt!358490 (bitIndex!0 (size!4906 (buf!5450 thiss!1870)) (currentByte!10225 thiss!1870) (currentBit!10220 thiss!1870)))))

(assert (= (and start!47156 res!189095) b!225326))

(assert (= (and b!225326 res!189094) b!225327))

(assert (= (and b!225327 res!189096) b!225328))

(assert (= start!47156 b!225329))

(declare-fun m!346275 () Bool)

(assert (=> b!225326 m!346275))

(declare-fun m!346277 () Bool)

(assert (=> start!47156 m!346277))

(declare-fun m!346279 () Bool)

(assert (=> start!47156 m!346279))

(declare-fun m!346281 () Bool)

(assert (=> b!225329 m!346281))

(declare-fun m!346283 () Bool)

(assert (=> b!225328 m!346283))

(declare-fun m!346285 () Bool)

(assert (=> b!225328 m!346285))

(declare-fun m!346287 () Bool)

(assert (=> b!225328 m!346287))

(declare-fun m!346289 () Bool)

(assert (=> b!225328 m!346289))

(declare-fun m!346291 () Bool)

(assert (=> b!225328 m!346291))

(declare-fun m!346293 () Bool)

(assert (=> b!225328 m!346293))

(push 1)

(assert (not b!225328))

(assert (not start!47156))

(assert (not b!225329))

(assert (not b!225326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76486 () Bool)

(assert (=> d!76486 (arrayRangesEq!796 arr!308 arr!308 #b00000000000000000000000000000000 (size!4906 arr!308))))

(declare-fun lt!358512 () Unit!16557)

(declare-fun choose!310 (array!11183) Unit!16557)

(assert (=> d!76486 (= lt!358512 (choose!310 arr!308))))

(assert (=> d!76486 (= (arrayRangesEqReflexiveLemma!100 arr!308) lt!358512)))

(declare-fun bs!18671 () Bool)

(assert (= bs!18671 d!76486))

(assert (=> bs!18671 m!346285))

(declare-fun m!346335 () Bool)

(assert (=> bs!18671 m!346335))

(assert (=> b!225328 d!76486))

(declare-fun d!76488 () Bool)

(declare-fun res!189119 () Bool)

(declare-fun e!153790 () Bool)

(assert (=> d!76488 (=> res!189119 e!153790)))

(assert (=> d!76488 (= res!189119 (= #b00000000000000000000000000000000 (size!4906 arr!308)))))

(assert (=> d!76488 (= (arrayRangesEq!796 arr!308 arr!308 #b00000000000000000000000000000000 (size!4906 arr!308)) e!153790)))

(declare-fun b!225358 () Bool)

(declare-fun e!153791 () Bool)

(assert (=> b!225358 (= e!153790 e!153791)))

(declare-fun res!189120 () Bool)

(assert (=> b!225358 (=> (not res!189120) (not e!153791))))

(assert (=> b!225358 (= res!189120 (= (select (arr!5863 arr!308) #b00000000000000000000000000000000) (select (arr!5863 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225359 () Bool)

(assert (=> b!225359 (= e!153791 (arrayRangesEq!796 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4906 arr!308)))))

(assert (= (and d!76488 (not res!189119)) b!225358))

(assert (= (and b!225358 res!189120) b!225359))

(declare-fun m!346337 () Bool)

(assert (=> b!225358 m!346337))

(assert (=> b!225358 m!346337))

(declare-fun m!346339 () Bool)

(assert (=> b!225359 m!346339))

(assert (=> b!225328 d!76488))

(declare-fun d!76496 () Bool)

(assert (=> d!76496 (arrayRangesEq!796 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!358518 () Unit!16557)

(declare-fun choose!311 (array!11183 array!11183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16557)

(assert (=> d!76496 (= lt!358518 (choose!311 arr!308 arr!308 #b00000000000000000000000000000000 (size!4906 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> d!76496 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!4906 arr!308)))))

(assert (=> d!76496 (= (arrayRangesEqSlicedLemma!85 arr!308 arr!308 #b00000000000000000000000000000000 (size!4906 arr!308) #b00000000000000000000000000000000 i!761) lt!358518)))

(declare-fun bs!18675 () Bool)

(assert (= bs!18675 d!76496))

(assert (=> bs!18675 m!346287))

(declare-fun m!346345 () Bool)

(assert (=> bs!18675 m!346345))

(assert (=> b!225328 d!76496))

(declare-fun d!76506 () Bool)

(assert (=> d!76506 (= (invariant!0 (currentBit!10220 thiss!1870) (currentByte!10225 thiss!1870) (size!4906 (buf!5450 thiss!1870))) (and (bvsge (currentBit!10220 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10220 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10225 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10225 thiss!1870) (size!4906 (buf!5450 thiss!1870))) (and (= (currentBit!10220 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10225 thiss!1870) (size!4906 (buf!5450 thiss!1870)))))))))

(assert (=> b!225328 d!76506))

(declare-fun d!76508 () Bool)

(declare-fun e!153806 () Bool)

(assert (=> d!76508 e!153806))

(declare-fun res!189138 () Bool)

(assert (=> d!76508 (=> (not res!189138) (not e!153806))))

(declare-fun lt!358538 () (_ BitVec 64))

(declare-fun lt!358537 () (_ BitVec 64))

(declare-fun lt!358540 () (_ BitVec 64))

(assert (=> d!76508 (= res!189138 (= lt!358537 (bvsub lt!358538 lt!358540)))))

(assert (=> d!76508 (or (= (bvand lt!358538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358540 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358538 lt!358540) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76508 (= lt!358540 (remainingBits!0 ((_ sign_extend 32) (size!4906 (buf!5450 thiss!1870))) ((_ sign_extend 32) (currentByte!10225 thiss!1870)) ((_ sign_extend 32) (currentBit!10220 thiss!1870))))))

(declare-fun lt!358541 () (_ BitVec 64))

(declare-fun lt!358542 () (_ BitVec 64))

(assert (=> d!76508 (= lt!358538 (bvmul lt!358541 lt!358542))))

(assert (=> d!76508 (or (= lt!358541 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358542 (bvsdiv (bvmul lt!358541 lt!358542) lt!358541)))))

(assert (=> d!76508 (= lt!358542 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76508 (= lt!358541 ((_ sign_extend 32) (size!4906 (buf!5450 thiss!1870))))))

(assert (=> d!76508 (= lt!358537 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10225 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10220 thiss!1870))))))

(assert (=> d!76508 (invariant!0 (currentBit!10220 thiss!1870) (currentByte!10225 thiss!1870) (size!4906 (buf!5450 thiss!1870)))))

(assert (=> d!76508 (= (bitIndex!0 (size!4906 (buf!5450 thiss!1870)) (currentByte!10225 thiss!1870) (currentBit!10220 thiss!1870)) lt!358537)))

(declare-fun b!225376 () Bool)

(declare-fun res!189137 () Bool)

(assert (=> b!225376 (=> (not res!189137) (not e!153806))))

(assert (=> b!225376 (= res!189137 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358537))))

(declare-fun b!225377 () Bool)

(declare-fun lt!358539 () (_ BitVec 64))

(assert (=> b!225377 (= e!153806 (bvsle lt!358537 (bvmul lt!358539 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225377 (or (= lt!358539 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358539 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358539)))))

(assert (=> b!225377 (= lt!358539 ((_ sign_extend 32) (size!4906 (buf!5450 thiss!1870))))))

(assert (= (and d!76508 res!189138) b!225376))

(assert (= (and b!225376 res!189137) b!225377))

(declare-fun m!346361 () Bool)

(assert (=> d!76508 m!346361))

(assert (=> d!76508 m!346293))

(assert (=> b!225328 d!76508))

(declare-fun d!76526 () Bool)

(declare-fun res!189139 () Bool)

(declare-fun e!153807 () Bool)

(assert (=> d!76526 (=> res!189139 e!153807)))

(assert (=> d!76526 (= res!189139 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76526 (= (arrayRangesEq!796 arr!308 arr!308 #b00000000000000000000000000000000 i!761) e!153807)))

(declare-fun b!225378 () Bool)

(declare-fun e!153808 () Bool)

(assert (=> b!225378 (= e!153807 e!153808)))

(declare-fun res!189140 () Bool)

(assert (=> b!225378 (=> (not res!189140) (not e!153808))))

(assert (=> b!225378 (= res!189140 (= (select (arr!5863 arr!308) #b00000000000000000000000000000000) (select (arr!5863 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225379 () Bool)

(assert (=> b!225379 (= e!153808 (arrayRangesEq!796 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76526 (not res!189139)) b!225378))

(assert (= (and b!225378 res!189140) b!225379))

(assert (=> b!225378 m!346337))

(assert (=> b!225378 m!346337))

(declare-fun m!346363 () Bool)

(assert (=> b!225379 m!346363))

(assert (=> b!225328 d!76526))

(declare-fun d!76528 () Bool)

(assert (=> d!76528 (= (array_inv!4647 arr!308) (bvsge (size!4906 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47156 d!76528))

(declare-fun d!76530 () Bool)

(assert (=> d!76530 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10220 thiss!1870) (currentByte!10225 thiss!1870) (size!4906 (buf!5450 thiss!1870))))))

(declare-fun bs!18680 () Bool)

(assert (= bs!18680 d!76530))

(assert (=> bs!18680 m!346293))

(assert (=> start!47156 d!76530))

(declare-fun d!76532 () Bool)

(assert (=> d!76532 (= (array_inv!4647 (buf!5450 thiss!1870)) (bvsge (size!4906 (buf!5450 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225329 d!76532))

(declare-fun d!76534 () Bool)

(assert (=> d!76534 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4906 (buf!5450 thiss!1870))) ((_ sign_extend 32) (currentByte!10225 thiss!1870)) ((_ sign_extend 32) (currentBit!10220 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4906 (buf!5450 thiss!1870))) ((_ sign_extend 32) (currentByte!10225 thiss!1870)) ((_ sign_extend 32) (currentBit!10220 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18681 () Bool)

(assert (= bs!18681 d!76534))

(assert (=> bs!18681 m!346361))

(assert (=> b!225326 d!76534))

(push 1)

(assert (not b!225359))

(assert (not d!76530))

(assert (not d!76508))

(assert (not d!76486))

(assert (not d!76534))

(assert (not b!225379))

(assert (not d!76496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

