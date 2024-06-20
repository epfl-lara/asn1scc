; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48836 () Bool)

(assert start!48836)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun e!158824 () Bool)

(declare-fun lt!368519 () (_ BitVec 64))

(declare-fun lt!368520 () (_ BitVec 64))

(declare-fun b!231036 () Bool)

(assert (=> b!231036 (= e!158824 (and (= lt!368520 (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!368520 (bvand (bvadd lt!368519 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!231036 (= lt!368520 (bvand lt!368519 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!11826 0))(
  ( (array!11827 (arr!6167 (Array (_ BitVec 32) (_ BitVec 8))) (size!5180 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9456 0))(
  ( (BitStream!9457 (buf!5721 array!11826) (currentByte!10722 (_ BitVec 32)) (currentBit!10717 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9456)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231036 (= lt!368519 (bitIndex!0 (size!5180 (buf!5721 b1!101)) (currentByte!10722 b1!101) (currentBit!10717 b1!101)))))

(declare-fun b!231037 () Bool)

(declare-fun e!158826 () Bool)

(declare-fun array_inv!4921 (array!11826) Bool)

(assert (=> b!231037 (= e!158826 (array_inv!4921 (buf!5721 b1!101)))))

(declare-fun b!231039 () Bool)

(declare-fun res!193567 () Bool)

(assert (=> b!231039 (=> (not res!193567) (not e!158824))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231039 (= res!193567 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5180 (buf!5721 b1!101))) ((_ sign_extend 32) (currentByte!10722 b1!101)) ((_ sign_extend 32) (currentBit!10717 b1!101)) bytes!19))))

(declare-fun b!231040 () Bool)

(declare-fun res!193566 () Bool)

(assert (=> b!231040 (=> (not res!193566) (not e!158824))))

(assert (=> b!231040 (= res!193566 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231041 () Bool)

(declare-fun e!158828 () Bool)

(declare-fun b2!99 () BitStream!9456)

(assert (=> b!231041 (= e!158828 (array_inv!4921 (buf!5721 b2!99)))))

(declare-fun res!193569 () Bool)

(assert (=> start!48836 (=> (not res!193569) (not e!158824))))

(assert (=> start!48836 (= res!193569 (and (= (size!5180 (buf!5721 b1!101)) (size!5180 (buf!5721 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48836 e!158824))

(declare-fun inv!12 (BitStream!9456) Bool)

(assert (=> start!48836 (and (inv!12 b1!101) e!158826)))

(assert (=> start!48836 (and (inv!12 b2!99) e!158828)))

(assert (=> start!48836 true))

(declare-fun b!231038 () Bool)

(declare-fun res!193568 () Bool)

(assert (=> b!231038 (=> (not res!193568) (not e!158824))))

(assert (=> b!231038 (= res!193568 (bvsle bits!86 (bitIndex!0 (size!5180 (buf!5721 b2!99)) (currentByte!10722 b2!99) (currentBit!10717 b2!99))))))

(assert (= (and start!48836 res!193569) b!231038))

(assert (= (and b!231038 res!193568) b!231040))

(assert (= (and b!231040 res!193566) b!231039))

(assert (= (and b!231039 res!193567) b!231036))

(assert (= start!48836 b!231037))

(assert (= start!48836 b!231041))

(declare-fun m!354247 () Bool)

(assert (=> start!48836 m!354247))

(declare-fun m!354249 () Bool)

(assert (=> start!48836 m!354249))

(declare-fun m!354251 () Bool)

(assert (=> b!231036 m!354251))

(declare-fun m!354253 () Bool)

(assert (=> b!231039 m!354253))

(declare-fun m!354255 () Bool)

(assert (=> b!231037 m!354255))

(declare-fun m!354257 () Bool)

(assert (=> b!231038 m!354257))

(declare-fun m!354259 () Bool)

(assert (=> b!231041 m!354259))

(check-sat (not b!231036) (not start!48836) (not b!231041) (not b!231039) (not b!231038) (not b!231037))
(check-sat)
(get-model)

(declare-fun d!78410 () Bool)

(assert (=> d!78410 (= (array_inv!4921 (buf!5721 b1!101)) (bvsge (size!5180 (buf!5721 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!231037 d!78410))

(declare-fun d!78412 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78412 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5180 (buf!5721 b1!101))) ((_ sign_extend 32) (currentByte!10722 b1!101)) ((_ sign_extend 32) (currentBit!10717 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5180 (buf!5721 b1!101))) ((_ sign_extend 32) (currentByte!10722 b1!101)) ((_ sign_extend 32) (currentBit!10717 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19231 () Bool)

(assert (= bs!19231 d!78412))

(declare-fun m!354275 () Bool)

(assert (=> bs!19231 m!354275))

(assert (=> b!231039 d!78412))

(declare-fun d!78414 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78414 (= (inv!12 b1!101) (invariant!0 (currentBit!10717 b1!101) (currentByte!10722 b1!101) (size!5180 (buf!5721 b1!101))))))

(declare-fun bs!19232 () Bool)

(assert (= bs!19232 d!78414))

(declare-fun m!354277 () Bool)

(assert (=> bs!19232 m!354277))

(assert (=> start!48836 d!78414))

(declare-fun d!78416 () Bool)

(assert (=> d!78416 (= (inv!12 b2!99) (invariant!0 (currentBit!10717 b2!99) (currentByte!10722 b2!99) (size!5180 (buf!5721 b2!99))))))

(declare-fun bs!19233 () Bool)

(assert (= bs!19233 d!78416))

(declare-fun m!354279 () Bool)

(assert (=> bs!19233 m!354279))

(assert (=> start!48836 d!78416))

(declare-fun d!78418 () Bool)

(declare-fun e!158846 () Bool)

(assert (=> d!78418 e!158846))

(declare-fun res!193586 () Bool)

(assert (=> d!78418 (=> (not res!193586) (not e!158846))))

(declare-fun lt!368542 () (_ BitVec 64))

(declare-fun lt!368539 () (_ BitVec 64))

(declare-fun lt!368543 () (_ BitVec 64))

(assert (=> d!78418 (= res!193586 (= lt!368543 (bvsub lt!368542 lt!368539)))))

(assert (=> d!78418 (or (= (bvand lt!368542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368542 lt!368539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78418 (= lt!368539 (remainingBits!0 ((_ sign_extend 32) (size!5180 (buf!5721 b2!99))) ((_ sign_extend 32) (currentByte!10722 b2!99)) ((_ sign_extend 32) (currentBit!10717 b2!99))))))

(declare-fun lt!368541 () (_ BitVec 64))

(declare-fun lt!368544 () (_ BitVec 64))

(assert (=> d!78418 (= lt!368542 (bvmul lt!368541 lt!368544))))

(assert (=> d!78418 (or (= lt!368541 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368544 (bvsdiv (bvmul lt!368541 lt!368544) lt!368541)))))

(assert (=> d!78418 (= lt!368544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78418 (= lt!368541 ((_ sign_extend 32) (size!5180 (buf!5721 b2!99))))))

(assert (=> d!78418 (= lt!368543 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10722 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10717 b2!99))))))

(assert (=> d!78418 (invariant!0 (currentBit!10717 b2!99) (currentByte!10722 b2!99) (size!5180 (buf!5721 b2!99)))))

(assert (=> d!78418 (= (bitIndex!0 (size!5180 (buf!5721 b2!99)) (currentByte!10722 b2!99) (currentBit!10717 b2!99)) lt!368543)))

(declare-fun b!231064 () Bool)

(declare-fun res!193587 () Bool)

(assert (=> b!231064 (=> (not res!193587) (not e!158846))))

(assert (=> b!231064 (= res!193587 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368543))))

(declare-fun b!231065 () Bool)

(declare-fun lt!368540 () (_ BitVec 64))

(assert (=> b!231065 (= e!158846 (bvsle lt!368543 (bvmul lt!368540 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!231065 (or (= lt!368540 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368540 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368540)))))

(assert (=> b!231065 (= lt!368540 ((_ sign_extend 32) (size!5180 (buf!5721 b2!99))))))

(assert (= (and d!78418 res!193586) b!231064))

(assert (= (and b!231064 res!193587) b!231065))

(declare-fun m!354281 () Bool)

(assert (=> d!78418 m!354281))

(assert (=> d!78418 m!354279))

(assert (=> b!231038 d!78418))

(declare-fun d!78420 () Bool)

(declare-fun e!158847 () Bool)

(assert (=> d!78420 e!158847))

(declare-fun res!193588 () Bool)

(assert (=> d!78420 (=> (not res!193588) (not e!158847))))

(declare-fun lt!368548 () (_ BitVec 64))

(declare-fun lt!368545 () (_ BitVec 64))

(declare-fun lt!368549 () (_ BitVec 64))

(assert (=> d!78420 (= res!193588 (= lt!368549 (bvsub lt!368548 lt!368545)))))

(assert (=> d!78420 (or (= (bvand lt!368548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368548 lt!368545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78420 (= lt!368545 (remainingBits!0 ((_ sign_extend 32) (size!5180 (buf!5721 b1!101))) ((_ sign_extend 32) (currentByte!10722 b1!101)) ((_ sign_extend 32) (currentBit!10717 b1!101))))))

(declare-fun lt!368547 () (_ BitVec 64))

(declare-fun lt!368550 () (_ BitVec 64))

(assert (=> d!78420 (= lt!368548 (bvmul lt!368547 lt!368550))))

(assert (=> d!78420 (or (= lt!368547 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368550 (bvsdiv (bvmul lt!368547 lt!368550) lt!368547)))))

(assert (=> d!78420 (= lt!368550 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78420 (= lt!368547 ((_ sign_extend 32) (size!5180 (buf!5721 b1!101))))))

(assert (=> d!78420 (= lt!368549 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10722 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10717 b1!101))))))

(assert (=> d!78420 (invariant!0 (currentBit!10717 b1!101) (currentByte!10722 b1!101) (size!5180 (buf!5721 b1!101)))))

(assert (=> d!78420 (= (bitIndex!0 (size!5180 (buf!5721 b1!101)) (currentByte!10722 b1!101) (currentBit!10717 b1!101)) lt!368549)))

(declare-fun b!231066 () Bool)

(declare-fun res!193589 () Bool)

(assert (=> b!231066 (=> (not res!193589) (not e!158847))))

(assert (=> b!231066 (= res!193589 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368549))))

(declare-fun b!231067 () Bool)

(declare-fun lt!368546 () (_ BitVec 64))

(assert (=> b!231067 (= e!158847 (bvsle lt!368549 (bvmul lt!368546 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!231067 (or (= lt!368546 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368546 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368546)))))

(assert (=> b!231067 (= lt!368546 ((_ sign_extend 32) (size!5180 (buf!5721 b1!101))))))

(assert (= (and d!78420 res!193588) b!231066))

(assert (= (and b!231066 res!193589) b!231067))

(assert (=> d!78420 m!354275))

(assert (=> d!78420 m!354277))

(assert (=> b!231036 d!78420))

(declare-fun d!78422 () Bool)

(assert (=> d!78422 (= (array_inv!4921 (buf!5721 b2!99)) (bvsge (size!5180 (buf!5721 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!231041 d!78422))

(check-sat (not d!78420) (not d!78414) (not d!78416) (not d!78412) (not d!78418))
