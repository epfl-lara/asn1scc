; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48256 () Bool)

(assert start!48256)

(declare-fun b!229081 () Bool)

(declare-fun e!157182 () Bool)

(declare-datatypes ((array!11628 0))(
  ( (array!11629 (arr!6090 (Array (_ BitVec 32) (_ BitVec 8))) (size!5103 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9302 0))(
  ( (BitStream!9303 (buf!5644 array!11628) (currentByte!10520 (_ BitVec 32)) (currentBit!10515 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9302)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229081 (= e!157182 (not (invariant!0 (currentBit!10515 b2!99) (currentByte!10520 b2!99) (size!5103 (buf!5644 b2!99)))))))

(declare-fun b!229082 () Bool)

(declare-fun e!157184 () Bool)

(declare-fun b1!101 () BitStream!9302)

(declare-fun array_inv!4844 (array!11628) Bool)

(assert (=> b!229082 (= e!157184 (array_inv!4844 (buf!5644 b1!101)))))

(declare-fun b!229083 () Bool)

(declare-fun e!157183 () Bool)

(assert (=> b!229083 (= e!157183 (array_inv!4844 (buf!5644 b2!99)))))

(declare-fun b!229084 () Bool)

(declare-fun res!192073 () Bool)

(assert (=> b!229084 (=> (not res!192073) (not e!157182))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229084 (= res!192073 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!229085 () Bool)

(declare-fun res!192074 () Bool)

(assert (=> b!229085 (=> (not res!192074) (not e!157182))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229085 (= res!192074 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5103 (buf!5644 b1!101))) ((_ sign_extend 32) (currentByte!10520 b1!101)) ((_ sign_extend 32) (currentBit!10515 b1!101)) bytes!19))))

(declare-fun res!192075 () Bool)

(assert (=> start!48256 (=> (not res!192075) (not e!157182))))

(assert (=> start!48256 (= res!192075 (and (= (size!5103 (buf!5644 b1!101)) (size!5103 (buf!5644 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48256 e!157182))

(declare-fun inv!12 (BitStream!9302) Bool)

(assert (=> start!48256 (and (inv!12 b1!101) e!157184)))

(assert (=> start!48256 (and (inv!12 b2!99) e!157183)))

(assert (=> start!48256 true))

(declare-fun b!229086 () Bool)

(declare-fun res!192076 () Bool)

(assert (=> b!229086 (=> (not res!192076) (not e!157182))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229086 (= res!192076 (bvsle bits!86 (bitIndex!0 (size!5103 (buf!5644 b2!99)) (currentByte!10520 b2!99) (currentBit!10515 b2!99))))))

(assert (= (and start!48256 res!192075) b!229086))

(assert (= (and b!229086 res!192076) b!229084))

(assert (= (and b!229084 res!192073) b!229085))

(assert (= (and b!229085 res!192074) b!229081))

(assert (= start!48256 b!229082))

(assert (= start!48256 b!229083))

(declare-fun m!352835 () Bool)

(assert (=> b!229083 m!352835))

(declare-fun m!352837 () Bool)

(assert (=> b!229086 m!352837))

(declare-fun m!352839 () Bool)

(assert (=> b!229081 m!352839))

(declare-fun m!352841 () Bool)

(assert (=> start!48256 m!352841))

(declare-fun m!352843 () Bool)

(assert (=> start!48256 m!352843))

(declare-fun m!352845 () Bool)

(assert (=> b!229082 m!352845))

(declare-fun m!352847 () Bool)

(assert (=> b!229085 m!352847))

(push 1)

(assert (not b!229081))

(assert (not b!229082))

(assert (not b!229086))

(assert (not b!229085))

(assert (not start!48256))

(assert (not b!229083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77708 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77708 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5103 (buf!5644 b1!101))) ((_ sign_extend 32) (currentByte!10520 b1!101)) ((_ sign_extend 32) (currentBit!10515 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5103 (buf!5644 b1!101))) ((_ sign_extend 32) (currentByte!10520 b1!101)) ((_ sign_extend 32) (currentBit!10515 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19032 () Bool)

(assert (= bs!19032 d!77708))

(declare-fun m!352859 () Bool)

(assert (=> bs!19032 m!352859))

(assert (=> b!229085 d!77708))

(declare-fun d!77710 () Bool)

(declare-fun e!157195 () Bool)

(assert (=> d!77710 e!157195))

(declare-fun res!192094 () Bool)

(assert (=> d!77710 (=> (not res!192094) (not e!157195))))

(declare-fun lt!367140 () (_ BitVec 64))

(declare-fun lt!367142 () (_ BitVec 64))

(declare-fun lt!367141 () (_ BitVec 64))

(assert (=> d!77710 (= res!192094 (= lt!367142 (bvsub lt!367141 lt!367140)))))

(assert (=> d!77710 (or (= (bvand lt!367141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367141 lt!367140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77710 (= lt!367140 (remainingBits!0 ((_ sign_extend 32) (size!5103 (buf!5644 b2!99))) ((_ sign_extend 32) (currentByte!10520 b2!99)) ((_ sign_extend 32) (currentBit!10515 b2!99))))))

(declare-fun lt!367143 () (_ BitVec 64))

(declare-fun lt!367138 () (_ BitVec 64))

(assert (=> d!77710 (= lt!367141 (bvmul lt!367143 lt!367138))))

(assert (=> d!77710 (or (= lt!367143 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367138 (bvsdiv (bvmul lt!367143 lt!367138) lt!367143)))))

(assert (=> d!77710 (= lt!367138 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77710 (= lt!367143 ((_ sign_extend 32) (size!5103 (buf!5644 b2!99))))))

(assert (=> d!77710 (= lt!367142 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10520 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10515 b2!99))))))

(assert (=> d!77710 (invariant!0 (currentBit!10515 b2!99) (currentByte!10520 b2!99) (size!5103 (buf!5644 b2!99)))))

(assert (=> d!77710 (= (bitIndex!0 (size!5103 (buf!5644 b2!99)) (currentByte!10520 b2!99) (currentBit!10515 b2!99)) lt!367142)))

(declare-fun b!229103 () Bool)

(declare-fun res!192093 () Bool)

(assert (=> b!229103 (=> (not res!192093) (not e!157195))))

(assert (=> b!229103 (= res!192093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367142))))

(declare-fun b!229104 () Bool)

(declare-fun lt!367139 () (_ BitVec 64))

(assert (=> b!229104 (= e!157195 (bvsle lt!367142 (bvmul lt!367139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229104 (or (= lt!367139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367139)))))

(assert (=> b!229104 (= lt!367139 ((_ sign_extend 32) (size!5103 (buf!5644 b2!99))))))

(assert (= (and d!77710 res!192094) b!229103))

(assert (= (and b!229103 res!192093) b!229104))

(declare-fun m!352863 () Bool)

(assert (=> d!77710 m!352863))

(assert (=> d!77710 m!352839))

(assert (=> b!229086 d!77710))

(declare-fun d!77712 () Bool)

(assert (=> d!77712 (= (invariant!0 (currentBit!10515 b2!99) (currentByte!10520 b2!99) (size!5103 (buf!5644 b2!99))) (and (bvsge (currentBit!10515 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10515 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10520 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10520 b2!99) (size!5103 (buf!5644 b2!99))) (and (= (currentBit!10515 b2!99) #b00000000000000000000000000000000) (= (currentByte!10520 b2!99) (size!5103 (buf!5644 b2!99)))))))))

(assert (=> b!229081 d!77712))

(declare-fun d!77714 () Bool)

(assert (=> d!77714 (= (array_inv!4844 (buf!5644 b1!101)) (bvsge (size!5103 (buf!5644 b1!101)) #b00000000000000000000000000000000))))

