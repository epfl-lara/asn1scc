; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48644 () Bool)

(assert start!48644)

(declare-fun b!230439 () Bool)

(declare-fun e!158270 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11749 0))(
  ( (array!11750 (arr!6137 (Array (_ BitVec 32) (_ BitVec 8))) (size!5150 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9396 0))(
  ( (BitStream!9397 (buf!5691 array!11749) (currentByte!10660 (_ BitVec 32)) (currentBit!10655 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9396)

(assert (=> b!230439 (= e!158270 (bvsgt ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5150 (buf!5691 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10660 b1!101))) ((_ sign_extend 32) (currentBit!10655 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230440 () Bool)

(declare-fun res!193149 () Bool)

(assert (=> b!230440 (=> (not res!193149) (not e!158270))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230440 (= res!193149 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5150 (buf!5691 b1!101))) ((_ sign_extend 32) (currentByte!10660 b1!101)) ((_ sign_extend 32) (currentBit!10655 b1!101)) bytes!19))))

(declare-fun b!230441 () Bool)

(declare-fun e!158271 () Bool)

(declare-fun array_inv!4891 (array!11749) Bool)

(assert (=> b!230441 (= e!158271 (array_inv!4891 (buf!5691 b1!101)))))

(declare-fun b!230442 () Bool)

(declare-fun res!193153 () Bool)

(assert (=> b!230442 (=> (not res!193153) (not e!158270))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368058 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230442 (= res!193153 (= lt!368058 (bvadd (bitIndex!0 (size!5150 (buf!5691 b1!101)) (currentByte!10660 b1!101) (currentBit!10655 b1!101)) bits!86)))))

(declare-fun b!230443 () Bool)

(declare-fun res!193150 () Bool)

(assert (=> b!230443 (=> (not res!193150) (not e!158270))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230443 (= res!193150 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5150 (buf!5691 b1!101))) ((_ sign_extend 32) (currentByte!10660 b1!101)) ((_ sign_extend 32) (currentBit!10655 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230444 () Bool)

(declare-fun e!158268 () Bool)

(assert (=> b!230444 (= e!158268 e!158270)))

(declare-fun res!193151 () Bool)

(assert (=> b!230444 (=> (not res!193151) (not e!158270))))

(assert (=> b!230444 (= res!193151 (and (bvsle bits!86 lt!368058) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9396)

(assert (=> b!230444 (= lt!368058 (bitIndex!0 (size!5150 (buf!5691 b2!99)) (currentByte!10660 b2!99) (currentBit!10655 b2!99)))))

(declare-fun b!230445 () Bool)

(declare-fun e!158267 () Bool)

(assert (=> b!230445 (= e!158267 (array_inv!4891 (buf!5691 b2!99)))))

(declare-fun res!193152 () Bool)

(assert (=> start!48644 (=> (not res!193152) (not e!158268))))

(assert (=> start!48644 (= res!193152 (and (= (size!5150 (buf!5691 b1!101)) (size!5150 (buf!5691 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48644 e!158268))

(declare-fun inv!12 (BitStream!9396) Bool)

(assert (=> start!48644 (and (inv!12 b1!101) e!158271)))

(assert (=> start!48644 (and (inv!12 b2!99) e!158267)))

(assert (=> start!48644 true))

(assert (= (and start!48644 res!193152) b!230444))

(assert (= (and b!230444 res!193151) b!230440))

(assert (= (and b!230440 res!193149) b!230442))

(assert (= (and b!230442 res!193153) b!230443))

(assert (= (and b!230443 res!193150) b!230439))

(assert (= start!48644 b!230441))

(assert (= start!48644 b!230445))

(declare-fun m!353759 () Bool)

(assert (=> b!230445 m!353759))

(declare-fun m!353761 () Bool)

(assert (=> b!230440 m!353761))

(declare-fun m!353763 () Bool)

(assert (=> start!48644 m!353763))

(declare-fun m!353765 () Bool)

(assert (=> start!48644 m!353765))

(declare-fun m!353767 () Bool)

(assert (=> b!230441 m!353767))

(declare-fun m!353769 () Bool)

(assert (=> b!230444 m!353769))

(declare-fun m!353771 () Bool)

(assert (=> b!230442 m!353771))

(declare-fun m!353773 () Bool)

(assert (=> b!230443 m!353773))

(check-sat (not b!230443) (not b!230441) (not b!230442) (not b!230445) (not b!230440) (not b!230444) (not start!48644))
(check-sat)
(get-model)

(declare-fun d!78176 () Bool)

(declare-fun e!158293 () Bool)

(assert (=> d!78176 e!158293))

(declare-fun res!193174 () Bool)

(assert (=> d!78176 (=> (not res!193174) (not e!158293))))

(declare-fun lt!368076 () (_ BitVec 64))

(declare-fun lt!368075 () (_ BitVec 64))

(declare-fun lt!368074 () (_ BitVec 64))

(assert (=> d!78176 (= res!193174 (= lt!368075 (bvsub lt!368076 lt!368074)))))

(assert (=> d!78176 (or (= (bvand lt!368076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368076 lt!368074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78176 (= lt!368074 (remainingBits!0 ((_ sign_extend 32) (size!5150 (buf!5691 b2!99))) ((_ sign_extend 32) (currentByte!10660 b2!99)) ((_ sign_extend 32) (currentBit!10655 b2!99))))))

(declare-fun lt!368079 () (_ BitVec 64))

(declare-fun lt!368077 () (_ BitVec 64))

(assert (=> d!78176 (= lt!368076 (bvmul lt!368079 lt!368077))))

(assert (=> d!78176 (or (= lt!368079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368077 (bvsdiv (bvmul lt!368079 lt!368077) lt!368079)))))

(assert (=> d!78176 (= lt!368077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78176 (= lt!368079 ((_ sign_extend 32) (size!5150 (buf!5691 b2!99))))))

(assert (=> d!78176 (= lt!368075 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10660 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10655 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78176 (invariant!0 (currentBit!10655 b2!99) (currentByte!10660 b2!99) (size!5150 (buf!5691 b2!99)))))

(assert (=> d!78176 (= (bitIndex!0 (size!5150 (buf!5691 b2!99)) (currentByte!10660 b2!99) (currentBit!10655 b2!99)) lt!368075)))

(declare-fun b!230471 () Bool)

(declare-fun res!193173 () Bool)

(assert (=> b!230471 (=> (not res!193173) (not e!158293))))

(assert (=> b!230471 (= res!193173 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368075))))

(declare-fun b!230472 () Bool)

(declare-fun lt!368078 () (_ BitVec 64))

(assert (=> b!230472 (= e!158293 (bvsle lt!368075 (bvmul lt!368078 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230472 (or (= lt!368078 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368078 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368078)))))

(assert (=> b!230472 (= lt!368078 ((_ sign_extend 32) (size!5150 (buf!5691 b2!99))))))

(assert (= (and d!78176 res!193174) b!230471))

(assert (= (and b!230471 res!193173) b!230472))

(declare-fun m!353791 () Bool)

(assert (=> d!78176 m!353791))

(declare-fun m!353793 () Bool)

(assert (=> d!78176 m!353793))

(assert (=> b!230444 d!78176))

(declare-fun d!78178 () Bool)

(assert (=> d!78178 (= (array_inv!4891 (buf!5691 b2!99)) (bvsge (size!5150 (buf!5691 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230445 d!78178))

(declare-fun d!78180 () Bool)

(assert (=> d!78180 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5150 (buf!5691 b1!101))) ((_ sign_extend 32) (currentByte!10660 b1!101)) ((_ sign_extend 32) (currentBit!10655 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5150 (buf!5691 b1!101))) ((_ sign_extend 32) (currentByte!10660 b1!101)) ((_ sign_extend 32) (currentBit!10655 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19159 () Bool)

(assert (= bs!19159 d!78180))

(assert (=> bs!19159 m!353773))

(assert (=> b!230440 d!78180))

(declare-fun d!78182 () Bool)

(assert (=> d!78182 (= (array_inv!4891 (buf!5691 b1!101)) (bvsge (size!5150 (buf!5691 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230441 d!78182))

(declare-fun d!78184 () Bool)

(assert (=> d!78184 (= (inv!12 b1!101) (invariant!0 (currentBit!10655 b1!101) (currentByte!10660 b1!101) (size!5150 (buf!5691 b1!101))))))

(declare-fun bs!19160 () Bool)

(assert (= bs!19160 d!78184))

(declare-fun m!353795 () Bool)

(assert (=> bs!19160 m!353795))

(assert (=> start!48644 d!78184))

(declare-fun d!78186 () Bool)

(assert (=> d!78186 (= (inv!12 b2!99) (invariant!0 (currentBit!10655 b2!99) (currentByte!10660 b2!99) (size!5150 (buf!5691 b2!99))))))

(declare-fun bs!19161 () Bool)

(assert (= bs!19161 d!78186))

(assert (=> bs!19161 m!353793))

(assert (=> start!48644 d!78186))

(declare-fun d!78188 () Bool)

(declare-fun e!158294 () Bool)

(assert (=> d!78188 e!158294))

(declare-fun res!193176 () Bool)

(assert (=> d!78188 (=> (not res!193176) (not e!158294))))

(declare-fun lt!368081 () (_ BitVec 64))

(declare-fun lt!368082 () (_ BitVec 64))

(declare-fun lt!368080 () (_ BitVec 64))

(assert (=> d!78188 (= res!193176 (= lt!368081 (bvsub lt!368082 lt!368080)))))

(assert (=> d!78188 (or (= (bvand lt!368082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368080 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368082 lt!368080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78188 (= lt!368080 (remainingBits!0 ((_ sign_extend 32) (size!5150 (buf!5691 b1!101))) ((_ sign_extend 32) (currentByte!10660 b1!101)) ((_ sign_extend 32) (currentBit!10655 b1!101))))))

(declare-fun lt!368085 () (_ BitVec 64))

(declare-fun lt!368083 () (_ BitVec 64))

(assert (=> d!78188 (= lt!368082 (bvmul lt!368085 lt!368083))))

(assert (=> d!78188 (or (= lt!368085 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368083 (bvsdiv (bvmul lt!368085 lt!368083) lt!368085)))))

(assert (=> d!78188 (= lt!368083 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78188 (= lt!368085 ((_ sign_extend 32) (size!5150 (buf!5691 b1!101))))))

(assert (=> d!78188 (= lt!368081 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10660 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10655 b1!101))))))

(assert (=> d!78188 (invariant!0 (currentBit!10655 b1!101) (currentByte!10660 b1!101) (size!5150 (buf!5691 b1!101)))))

(assert (=> d!78188 (= (bitIndex!0 (size!5150 (buf!5691 b1!101)) (currentByte!10660 b1!101) (currentBit!10655 b1!101)) lt!368081)))

(declare-fun b!230473 () Bool)

(declare-fun res!193175 () Bool)

(assert (=> b!230473 (=> (not res!193175) (not e!158294))))

(assert (=> b!230473 (= res!193175 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368081))))

(declare-fun b!230474 () Bool)

(declare-fun lt!368084 () (_ BitVec 64))

(assert (=> b!230474 (= e!158294 (bvsle lt!368081 (bvmul lt!368084 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230474 (or (= lt!368084 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368084 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368084)))))

(assert (=> b!230474 (= lt!368084 ((_ sign_extend 32) (size!5150 (buf!5691 b1!101))))))

(assert (= (and d!78188 res!193176) b!230473))

(assert (= (and b!230473 res!193175) b!230474))

(assert (=> d!78188 m!353773))

(assert (=> d!78188 m!353795))

(assert (=> b!230442 d!78188))

(declare-fun d!78190 () Bool)

(assert (=> d!78190 (= (remainingBits!0 ((_ sign_extend 32) (size!5150 (buf!5691 b1!101))) ((_ sign_extend 32) (currentByte!10660 b1!101)) ((_ sign_extend 32) (currentBit!10655 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5150 (buf!5691 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10660 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10655 b1!101)))))))

(assert (=> b!230443 d!78190))

(check-sat (not d!78180) (not d!78184) (not d!78188) (not d!78186) (not d!78176))
(check-sat)
