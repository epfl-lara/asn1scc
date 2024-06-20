; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48642 () Bool)

(assert start!48642)

(declare-fun b!230418 () Bool)

(declare-fun e!158254 () Bool)

(declare-datatypes ((array!11747 0))(
  ( (array!11748 (arr!6136 (Array (_ BitVec 32) (_ BitVec 8))) (size!5149 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9394 0))(
  ( (BitStream!9395 (buf!5690 array!11747) (currentByte!10659 (_ BitVec 32)) (currentBit!10654 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9394)

(declare-fun array_inv!4890 (array!11747) Bool)

(assert (=> b!230418 (= e!158254 (array_inv!4890 (buf!5690 b1!101)))))

(declare-fun b!230419 () Bool)

(declare-fun e!158252 () Bool)

(declare-fun b2!99 () BitStream!9394)

(assert (=> b!230419 (= e!158252 (array_inv!4890 (buf!5690 b2!99)))))

(declare-fun b!230420 () Bool)

(declare-fun res!193134 () Bool)

(declare-fun e!158250 () Bool)

(assert (=> b!230420 (=> (not res!193134) (not e!158250))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230420 (= res!193134 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5149 (buf!5690 b1!101))) ((_ sign_extend 32) (currentByte!10659 b1!101)) ((_ sign_extend 32) (currentBit!10654 b1!101)) bytes!19))))

(declare-fun b!230421 () Bool)

(assert (=> b!230421 (= e!158250 (bvsgt ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5149 (buf!5690 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10659 b1!101))) ((_ sign_extend 32) (currentBit!10654 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!193137 () Bool)

(declare-fun e!158253 () Bool)

(assert (=> start!48642 (=> (not res!193137) (not e!158253))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> start!48642 (= res!193137 (and (= (size!5149 (buf!5690 b1!101)) (size!5149 (buf!5690 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48642 e!158253))

(declare-fun inv!12 (BitStream!9394) Bool)

(assert (=> start!48642 (and (inv!12 b1!101) e!158254)))

(assert (=> start!48642 (and (inv!12 b2!99) e!158252)))

(assert (=> start!48642 true))

(declare-fun b!230422 () Bool)

(declare-fun res!193136 () Bool)

(assert (=> b!230422 (=> (not res!193136) (not e!158250))))

(declare-fun lt!368055 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230422 (= res!193136 (= lt!368055 (bvadd (bitIndex!0 (size!5149 (buf!5690 b1!101)) (currentByte!10659 b1!101) (currentBit!10654 b1!101)) bits!86)))))

(declare-fun b!230423 () Bool)

(declare-fun res!193138 () Bool)

(assert (=> b!230423 (=> (not res!193138) (not e!158250))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230423 (= res!193138 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5149 (buf!5690 b1!101))) ((_ sign_extend 32) (currentByte!10659 b1!101)) ((_ sign_extend 32) (currentBit!10654 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230424 () Bool)

(assert (=> b!230424 (= e!158253 e!158250)))

(declare-fun res!193135 () Bool)

(assert (=> b!230424 (=> (not res!193135) (not e!158250))))

(assert (=> b!230424 (= res!193135 (and (bvsle bits!86 lt!368055) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230424 (= lt!368055 (bitIndex!0 (size!5149 (buf!5690 b2!99)) (currentByte!10659 b2!99) (currentBit!10654 b2!99)))))

(assert (= (and start!48642 res!193137) b!230424))

(assert (= (and b!230424 res!193135) b!230420))

(assert (= (and b!230420 res!193134) b!230422))

(assert (= (and b!230422 res!193136) b!230423))

(assert (= (and b!230423 res!193138) b!230421))

(assert (= start!48642 b!230418))

(assert (= start!48642 b!230419))

(declare-fun m!353743 () Bool)

(assert (=> start!48642 m!353743))

(declare-fun m!353745 () Bool)

(assert (=> start!48642 m!353745))

(declare-fun m!353747 () Bool)

(assert (=> b!230419 m!353747))

(declare-fun m!353749 () Bool)

(assert (=> b!230418 m!353749))

(declare-fun m!353751 () Bool)

(assert (=> b!230422 m!353751))

(declare-fun m!353753 () Bool)

(assert (=> b!230420 m!353753))

(declare-fun m!353755 () Bool)

(assert (=> b!230423 m!353755))

(declare-fun m!353757 () Bool)

(assert (=> b!230424 m!353757))

(push 1)

(assert (not b!230423))

(assert (not b!230420))

(assert (not b!230424))

(assert (not b!230422))

(assert (not b!230419))

(assert (not b!230418))

(assert (not start!48642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78192 () Bool)

(declare-fun e!158297 () Bool)

(assert (=> d!78192 e!158297))

(declare-fun res!193181 () Bool)

(assert (=> d!78192 (=> (not res!193181) (not e!158297))))

(declare-fun lt!368099 () (_ BitVec 64))

(declare-fun lt!368101 () (_ BitVec 64))

(declare-fun lt!368098 () (_ BitVec 64))

(assert (=> d!78192 (= res!193181 (= lt!368101 (bvsub lt!368098 lt!368099)))))

(assert (=> d!78192 (or (= (bvand lt!368098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368099 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368098 lt!368099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78192 (= lt!368099 (remainingBits!0 ((_ sign_extend 32) (size!5149 (buf!5690 b1!101))) ((_ sign_extend 32) (currentByte!10659 b1!101)) ((_ sign_extend 32) (currentBit!10654 b1!101))))))

(declare-fun lt!368103 () (_ BitVec 64))

(declare-fun lt!368100 () (_ BitVec 64))

(assert (=> d!78192 (= lt!368098 (bvmul lt!368103 lt!368100))))

(assert (=> d!78192 (or (= lt!368103 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368100 (bvsdiv (bvmul lt!368103 lt!368100) lt!368103)))))

(assert (=> d!78192 (= lt!368100 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78192 (= lt!368103 ((_ sign_extend 32) (size!5149 (buf!5690 b1!101))))))

(assert (=> d!78192 (= lt!368101 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10659 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10654 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78192 (invariant!0 (currentBit!10654 b1!101) (currentByte!10659 b1!101) (size!5149 (buf!5690 b1!101)))))

(assert (=> d!78192 (= (bitIndex!0 (size!5149 (buf!5690 b1!101)) (currentByte!10659 b1!101) (currentBit!10654 b1!101)) lt!368101)))

(declare-fun b!230479 () Bool)

(declare-fun res!193182 () Bool)

(assert (=> b!230479 (=> (not res!193182) (not e!158297))))

(assert (=> b!230479 (= res!193182 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368101))))

(declare-fun b!230480 () Bool)

(declare-fun lt!368102 () (_ BitVec 64))

(assert (=> b!230480 (= e!158297 (bvsle lt!368101 (bvmul lt!368102 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230480 (or (= lt!368102 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368102 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368102)))))

(assert (=> b!230480 (= lt!368102 ((_ sign_extend 32) (size!5149 (buf!5690 b1!101))))))

(assert (= (and d!78192 res!193181) b!230479))

(assert (= (and b!230479 res!193182) b!230480))

(assert (=> d!78192 m!353755))

(declare-fun m!353797 () Bool)

(assert (=> d!78192 m!353797))

(assert (=> b!230422 d!78192))

(declare-fun d!78194 () Bool)

(assert (=> d!78194 (= (remainingBits!0 ((_ sign_extend 32) (size!5149 (buf!5690 b1!101))) ((_ sign_extend 32) (currentByte!10659 b1!101)) ((_ sign_extend 32) (currentBit!10654 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5149 (buf!5690 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10659 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10654 b1!101)))))))

(assert (=> b!230423 d!78194))

(declare-fun d!78196 () Bool)

(assert (=> d!78196 (= (array_inv!4890 (buf!5690 b1!101)) (bvsge (size!5149 (buf!5690 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230418 d!78196))

(declare-fun d!78198 () Bool)

(declare-fun e!158298 () Bool)

(assert (=> d!78198 e!158298))

(declare-fun res!193183 () Bool)

(assert (=> d!78198 (=> (not res!193183) (not e!158298))))

(declare-fun lt!368107 () (_ BitVec 64))

(declare-fun lt!368104 () (_ BitVec 64))

(declare-fun lt!368105 () (_ BitVec 64))

(assert (=> d!78198 (= res!193183 (= lt!368107 (bvsub lt!368104 lt!368105)))))

(assert (=> d!78198 (or (= (bvand lt!368104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368105 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368104 lt!368105) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78198 (= lt!368105 (remainingBits!0 ((_ sign_extend 32) (size!5149 (buf!5690 b2!99))) ((_ sign_extend 32) (currentByte!10659 b2!99)) ((_ sign_extend 32) (currentBit!10654 b2!99))))))

(declare-fun lt!368109 () (_ BitVec 64))

(declare-fun lt!368106 () (_ BitVec 64))

(assert (=> d!78198 (= lt!368104 (bvmul lt!368109 lt!368106))))

(assert (=> d!78198 (or (= lt!368109 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368106 (bvsdiv (bvmul lt!368109 lt!368106) lt!368109)))))

(assert (=> d!78198 (= lt!368106 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78198 (= lt!368109 ((_ sign_extend 32) (size!5149 (buf!5690 b2!99))))))

(assert (=> d!78198 (= lt!368107 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10659 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10654 b2!99))))))

(assert (=> d!78198 (invariant!0 (currentBit!10654 b2!99) (currentByte!10659 b2!99) (size!5149 (buf!5690 b2!99)))))

(assert (=> d!78198 (= (bitIndex!0 (size!5149 (buf!5690 b2!99)) (currentByte!10659 b2!99) (currentBit!10654 b2!99)) lt!368107)))

(declare-fun b!230481 () Bool)

(declare-fun res!193184 () Bool)

(assert (=> b!230481 (=> (not res!193184) (not e!158298))))

(assert (=> b!230481 (= res!193184 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368107))))

(declare-fun b!230482 () Bool)

(declare-fun lt!368108 () (_ BitVec 64))

(assert (=> b!230482 (= e!158298 (bvsle lt!368107 (bvmul lt!368108 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230482 (or (= lt!368108 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368108 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368108)))))

(assert (=> b!230482 (= lt!368108 ((_ sign_extend 32) (size!5149 (buf!5690 b2!99))))))

(assert (= (and d!78198 res!193183) b!230481))

(assert (= (and b!230481 res!193184) b!230482))

(declare-fun m!353799 () Bool)

(assert (=> d!78198 m!353799))

(declare-fun m!353801 () Bool)

(assert (=> d!78198 m!353801))

(assert (=> b!230424 d!78198))

(declare-fun d!78200 () Bool)

(assert (=> d!78200 (= (array_inv!4890 (buf!5690 b2!99)) (bvsge (size!5149 (buf!5690 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230419 d!78200))

(declare-fun d!78202 () Bool)

(assert (=> d!78202 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5149 (buf!5690 b1!101))) ((_ sign_extend 32) (currentByte!10659 b1!101)) ((_ sign_extend 32) (currentBit!10654 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5149 (buf!5690 b1!101))) ((_ sign_extend 32) (currentByte!10659 b1!101)) ((_ sign_extend 32) (currentBit!10654 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19162 () Bool)

(assert (= bs!19162 d!78202))

(assert (=> bs!19162 m!353755))

(assert (=> b!230420 d!78202))

(declare-fun d!78204 () Bool)

(assert (=> d!78204 (= (inv!12 b1!101) (invariant!0 (currentBit!10654 b1!101) (currentByte!10659 b1!101) (size!5149 (buf!5690 b1!101))))))

(declare-fun bs!19163 () Bool)

(assert (= bs!19163 d!78204))

(assert (=> bs!19163 m!353797))

(assert (=> start!48642 d!78204))

(declare-fun d!78206 () Bool)

(assert (=> d!78206 (= (inv!12 b2!99) (invariant!0 (currentBit!10654 b2!99) (currentByte!10659 b2!99) (size!5149 (buf!5690 b2!99))))))

(declare-fun bs!19164 () Bool)

(assert (= bs!19164 d!78206))

(assert (=> bs!19164 m!353801))

(assert (=> start!48642 d!78206))

(push 1)

(assert (not d!78202))

(assert (not d!78198))

(assert (not d!78192))

(assert (not d!78206))

(assert (not d!78204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

