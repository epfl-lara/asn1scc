; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48252 () Bool)

(assert start!48252)

(declare-fun b!229045 () Bool)

(declare-fun e!157155 () Bool)

(declare-datatypes ((array!11624 0))(
  ( (array!11625 (arr!6088 (Array (_ BitVec 32) (_ BitVec 8))) (size!5101 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9298 0))(
  ( (BitStream!9299 (buf!5642 array!11624) (currentByte!10518 (_ BitVec 32)) (currentBit!10513 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9298)

(declare-fun array_inv!4842 (array!11624) Bool)

(assert (=> b!229045 (= e!157155 (array_inv!4842 (buf!5642 b2!99)))))

(declare-fun b!229046 () Bool)

(declare-fun res!192052 () Bool)

(declare-fun e!157152 () Bool)

(assert (=> b!229046 (=> (not res!192052) (not e!157152))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229046 (= res!192052 (bvsle bits!86 (bitIndex!0 (size!5101 (buf!5642 b2!99)) (currentByte!10518 b2!99) (currentBit!10513 b2!99))))))

(declare-fun b!229047 () Bool)

(declare-fun res!192049 () Bool)

(assert (=> b!229047 (=> (not res!192049) (not e!157152))))

(declare-fun b1!101 () BitStream!9298)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229047 (= res!192049 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5101 (buf!5642 b1!101))) ((_ sign_extend 32) (currentByte!10518 b1!101)) ((_ sign_extend 32) (currentBit!10513 b1!101)) bytes!19))))

(declare-fun b!229048 () Bool)

(declare-fun res!192050 () Bool)

(assert (=> b!229048 (=> (not res!192050) (not e!157152))))

(assert (=> b!229048 (= res!192050 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!229049 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229049 (= e!157152 (not (invariant!0 (currentBit!10513 b2!99) (currentByte!10518 b2!99) (size!5101 (buf!5642 b2!99)))))))

(declare-fun res!192051 () Bool)

(assert (=> start!48252 (=> (not res!192051) (not e!157152))))

(assert (=> start!48252 (= res!192051 (and (= (size!5101 (buf!5642 b1!101)) (size!5101 (buf!5642 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48252 e!157152))

(declare-fun e!157153 () Bool)

(declare-fun inv!12 (BitStream!9298) Bool)

(assert (=> start!48252 (and (inv!12 b1!101) e!157153)))

(assert (=> start!48252 (and (inv!12 b2!99) e!157155)))

(assert (=> start!48252 true))

(declare-fun b!229050 () Bool)

(assert (=> b!229050 (= e!157153 (array_inv!4842 (buf!5642 b1!101)))))

(assert (= (and start!48252 res!192051) b!229046))

(assert (= (and b!229046 res!192052) b!229048))

(assert (= (and b!229048 res!192050) b!229047))

(assert (= (and b!229047 res!192049) b!229049))

(assert (= start!48252 b!229050))

(assert (= start!48252 b!229045))

(declare-fun m!352807 () Bool)

(assert (=> b!229047 m!352807))

(declare-fun m!352809 () Bool)

(assert (=> b!229049 m!352809))

(declare-fun m!352811 () Bool)

(assert (=> b!229045 m!352811))

(declare-fun m!352813 () Bool)

(assert (=> b!229050 m!352813))

(declare-fun m!352815 () Bool)

(assert (=> b!229046 m!352815))

(declare-fun m!352817 () Bool)

(assert (=> start!48252 m!352817))

(declare-fun m!352819 () Bool)

(assert (=> start!48252 m!352819))

(push 1)

(assert (not b!229047))

(assert (not b!229049))

(assert (not b!229045))

(assert (not b!229046))

(assert (not b!229050))

(assert (not start!48252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77692 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77692 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5101 (buf!5642 b1!101))) ((_ sign_extend 32) (currentByte!10518 b1!101)) ((_ sign_extend 32) (currentBit!10513 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5101 (buf!5642 b1!101))) ((_ sign_extend 32) (currentByte!10518 b1!101)) ((_ sign_extend 32) (currentBit!10513 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19029 () Bool)

(assert (= bs!19029 d!77692))

(declare-fun m!352855 () Bool)

(assert (=> bs!19029 m!352855))

(assert (=> b!229047 d!77692))

(declare-fun d!77696 () Bool)

(assert (=> d!77696 (= (inv!12 b1!101) (invariant!0 (currentBit!10513 b1!101) (currentByte!10518 b1!101) (size!5101 (buf!5642 b1!101))))))

(declare-fun bs!19030 () Bool)

(assert (= bs!19030 d!77696))

(declare-fun m!352857 () Bool)

(assert (=> bs!19030 m!352857))

(assert (=> start!48252 d!77696))

(declare-fun d!77698 () Bool)

(assert (=> d!77698 (= (inv!12 b2!99) (invariant!0 (currentBit!10513 b2!99) (currentByte!10518 b2!99) (size!5101 (buf!5642 b2!99))))))

(declare-fun bs!19031 () Bool)

(assert (= bs!19031 d!77698))

(assert (=> bs!19031 m!352809))

(assert (=> start!48252 d!77698))

(declare-fun d!77700 () Bool)

(assert (=> d!77700 (= (invariant!0 (currentBit!10513 b2!99) (currentByte!10518 b2!99) (size!5101 (buf!5642 b2!99))) (and (bvsge (currentBit!10513 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10513 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10518 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10518 b2!99) (size!5101 (buf!5642 b2!99))) (and (= (currentBit!10513 b2!99) #b00000000000000000000000000000000) (= (currentByte!10518 b2!99) (size!5101 (buf!5642 b2!99)))))))))

(assert (=> b!229049 d!77700))

(declare-fun d!77702 () Bool)

(assert (=> d!77702 (= (array_inv!4842 (buf!5642 b1!101)) (bvsge (size!5101 (buf!5642 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229050 d!77702))

(declare-fun d!77704 () Bool)

(assert (=> d!77704 (= (array_inv!4842 (buf!5642 b2!99)) (bvsge (size!5101 (buf!5642 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229045 d!77704))

(declare-fun d!77706 () Bool)

(declare-fun e!157192 () Bool)

(assert (=> d!77706 e!157192))

(declare-fun res!192088 () Bool)

(assert (=> d!77706 (=> (not res!192088) (not e!157192))))

(declare-fun lt!367124 () (_ BitVec 64))

(declare-fun lt!367121 () (_ BitVec 64))

(declare-fun lt!367122 () (_ BitVec 64))

(assert (=> d!77706 (= res!192088 (= lt!367121 (bvsub lt!367124 lt!367122)))))

(assert (=> d!77706 (or (= (bvand lt!367124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367124 lt!367122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77706 (= lt!367122 (remainingBits!0 ((_ sign_extend 32) (size!5101 (buf!5642 b2!99))) ((_ sign_extend 32) (currentByte!10518 b2!99)) ((_ sign_extend 32) (currentBit!10513 b2!99))))))

(declare-fun lt!367123 () (_ BitVec 64))

(declare-fun lt!367125 () (_ BitVec 64))

(assert (=> d!77706 (= lt!367124 (bvmul lt!367123 lt!367125))))

(assert (=> d!77706 (or (= lt!367123 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367125 (bvsdiv (bvmul lt!367123 lt!367125) lt!367123)))))

(assert (=> d!77706 (= lt!367125 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77706 (= lt!367123 ((_ sign_extend 32) (size!5101 (buf!5642 b2!99))))))

(assert (=> d!77706 (= lt!367121 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10518 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10513 b2!99))))))

(assert (=> d!77706 (invariant!0 (currentBit!10513 b2!99) (currentByte!10518 b2!99) (size!5101 (buf!5642 b2!99)))))

(assert (=> d!77706 (= (bitIndex!0 (size!5101 (buf!5642 b2!99)) (currentByte!10518 b2!99) (currentBit!10513 b2!99)) lt!367121)))

(declare-fun b!229097 () Bool)

(declare-fun res!192087 () Bool)

(assert (=> b!229097 (=> (not res!192087) (not e!157192))))

(assert (=> b!229097 (= res!192087 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367121))))

(declare-fun b!229098 () Bool)

(declare-fun lt!367120 () (_ BitVec 64))

(assert (=> b!229098 (= e!157192 (bvsle lt!367121 (bvmul lt!367120 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229098 (or (= lt!367120 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367120 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367120)))))

(assert (=> b!229098 (= lt!367120 ((_ sign_extend 32) (size!5101 (buf!5642 b2!99))))))

(assert (= (and d!77706 res!192088) b!229097))

(assert (= (and b!229097 res!192087) b!229098))

(declare-fun m!352861 () Bool)

(assert (=> d!77706 m!352861))

(assert (=> d!77706 m!352809))

(assert (=> b!229046 d!77706))

(push 1)

(assert (not d!77692))

(assert (not d!77698))

(assert (not d!77706))

(assert (not d!77696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

