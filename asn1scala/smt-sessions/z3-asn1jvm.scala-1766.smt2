; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48290 () Bool)

(assert start!48290)

(declare-fun res!192118 () Bool)

(declare-fun e!157221 () Bool)

(assert (=> start!48290 (=> (not res!192118) (not e!157221))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11635 0))(
  ( (array!11636 (arr!6092 (Array (_ BitVec 32) (_ BitVec 8))) (size!5105 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9306 0))(
  ( (BitStream!9307 (buf!5646 array!11635) (currentByte!10531 (_ BitVec 32)) (currentBit!10526 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9306)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9306)

(assert (=> start!48290 (= res!192118 (and (= (size!5105 (buf!5646 b1!101)) (size!5105 (buf!5646 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48290 e!157221))

(declare-fun e!157225 () Bool)

(declare-fun inv!12 (BitStream!9306) Bool)

(assert (=> start!48290 (and (inv!12 b1!101) e!157225)))

(declare-fun e!157222 () Bool)

(assert (=> start!48290 (and (inv!12 b2!99) e!157222)))

(assert (=> start!48290 true))

(declare-fun b!229135 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229135 (= e!157221 (not (invariant!0 (currentBit!10526 b1!101) (currentByte!10531 b1!101) (size!5105 (buf!5646 b1!101)))))))

(declare-fun b!229136 () Bool)

(declare-fun array_inv!4846 (array!11635) Bool)

(assert (=> b!229136 (= e!157225 (array_inv!4846 (buf!5646 b1!101)))))

(declare-fun b!229137 () Bool)

(declare-fun res!192116 () Bool)

(assert (=> b!229137 (=> (not res!192116) (not e!157221))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229137 (= res!192116 (bvsle bits!86 (bitIndex!0 (size!5105 (buf!5646 b2!99)) (currentByte!10531 b2!99) (currentBit!10526 b2!99))))))

(declare-fun b!229138 () Bool)

(assert (=> b!229138 (= e!157222 (array_inv!4846 (buf!5646 b2!99)))))

(declare-fun b!229139 () Bool)

(declare-fun res!192115 () Bool)

(assert (=> b!229139 (=> (not res!192115) (not e!157221))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229139 (= res!192115 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5105 (buf!5646 b1!101))) ((_ sign_extend 32) (currentByte!10531 b1!101)) ((_ sign_extend 32) (currentBit!10526 b1!101)) bytes!19))))

(declare-fun b!229140 () Bool)

(declare-fun res!192117 () Bool)

(assert (=> b!229140 (=> (not res!192117) (not e!157221))))

(assert (=> b!229140 (= res!192117 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!48290 res!192118) b!229137))

(assert (= (and b!229137 res!192116) b!229140))

(assert (= (and b!229140 res!192117) b!229139))

(assert (= (and b!229139 res!192115) b!229135))

(assert (= start!48290 b!229136))

(assert (= start!48290 b!229138))

(declare-fun m!352881 () Bool)

(assert (=> b!229136 m!352881))

(declare-fun m!352883 () Bool)

(assert (=> b!229139 m!352883))

(declare-fun m!352885 () Bool)

(assert (=> b!229135 m!352885))

(declare-fun m!352887 () Bool)

(assert (=> b!229137 m!352887))

(declare-fun m!352889 () Bool)

(assert (=> start!48290 m!352889))

(declare-fun m!352891 () Bool)

(assert (=> start!48290 m!352891))

(declare-fun m!352893 () Bool)

(assert (=> b!229138 m!352893))

(check-sat (not start!48290) (not b!229138) (not b!229139) (not b!229135) (not b!229137) (not b!229136))
(check-sat)
(get-model)

(declare-fun d!77724 () Bool)

(declare-fun e!157243 () Bool)

(assert (=> d!77724 e!157243))

(declare-fun res!192136 () Bool)

(assert (=> d!77724 (=> (not res!192136) (not e!157243))))

(declare-fun lt!367158 () (_ BitVec 64))

(declare-fun lt!367160 () (_ BitVec 64))

(declare-fun lt!367157 () (_ BitVec 64))

(assert (=> d!77724 (= res!192136 (= lt!367160 (bvsub lt!367157 lt!367158)))))

(assert (=> d!77724 (or (= (bvand lt!367157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367158 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367157 lt!367158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77724 (= lt!367158 (remainingBits!0 ((_ sign_extend 32) (size!5105 (buf!5646 b2!99))) ((_ sign_extend 32) (currentByte!10531 b2!99)) ((_ sign_extend 32) (currentBit!10526 b2!99))))))

(declare-fun lt!367156 () (_ BitVec 64))

(declare-fun lt!367161 () (_ BitVec 64))

(assert (=> d!77724 (= lt!367157 (bvmul lt!367156 lt!367161))))

(assert (=> d!77724 (or (= lt!367156 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367161 (bvsdiv (bvmul lt!367156 lt!367161) lt!367156)))))

(assert (=> d!77724 (= lt!367161 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77724 (= lt!367156 ((_ sign_extend 32) (size!5105 (buf!5646 b2!99))))))

(assert (=> d!77724 (= lt!367160 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10531 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10526 b2!99))))))

(assert (=> d!77724 (invariant!0 (currentBit!10526 b2!99) (currentByte!10531 b2!99) (size!5105 (buf!5646 b2!99)))))

(assert (=> d!77724 (= (bitIndex!0 (size!5105 (buf!5646 b2!99)) (currentByte!10531 b2!99) (currentBit!10526 b2!99)) lt!367160)))

(declare-fun b!229163 () Bool)

(declare-fun res!192135 () Bool)

(assert (=> b!229163 (=> (not res!192135) (not e!157243))))

(assert (=> b!229163 (= res!192135 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367160))))

(declare-fun b!229164 () Bool)

(declare-fun lt!367159 () (_ BitVec 64))

(assert (=> b!229164 (= e!157243 (bvsle lt!367160 (bvmul lt!367159 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229164 (or (= lt!367159 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367159 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367159)))))

(assert (=> b!229164 (= lt!367159 ((_ sign_extend 32) (size!5105 (buf!5646 b2!99))))))

(assert (= (and d!77724 res!192136) b!229163))

(assert (= (and b!229163 res!192135) b!229164))

(declare-fun m!352909 () Bool)

(assert (=> d!77724 m!352909))

(declare-fun m!352911 () Bool)

(assert (=> d!77724 m!352911))

(assert (=> b!229137 d!77724))

(declare-fun d!77726 () Bool)

(assert (=> d!77726 (= (inv!12 b1!101) (invariant!0 (currentBit!10526 b1!101) (currentByte!10531 b1!101) (size!5105 (buf!5646 b1!101))))))

(declare-fun bs!19038 () Bool)

(assert (= bs!19038 d!77726))

(assert (=> bs!19038 m!352885))

(assert (=> start!48290 d!77726))

(declare-fun d!77728 () Bool)

(assert (=> d!77728 (= (inv!12 b2!99) (invariant!0 (currentBit!10526 b2!99) (currentByte!10531 b2!99) (size!5105 (buf!5646 b2!99))))))

(declare-fun bs!19039 () Bool)

(assert (= bs!19039 d!77728))

(assert (=> bs!19039 m!352911))

(assert (=> start!48290 d!77728))

(declare-fun d!77730 () Bool)

(assert (=> d!77730 (= (array_inv!4846 (buf!5646 b2!99)) (bvsge (size!5105 (buf!5646 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229138 d!77730))

(declare-fun d!77732 () Bool)

(assert (=> d!77732 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5105 (buf!5646 b1!101))) ((_ sign_extend 32) (currentByte!10531 b1!101)) ((_ sign_extend 32) (currentBit!10526 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5105 (buf!5646 b1!101))) ((_ sign_extend 32) (currentByte!10531 b1!101)) ((_ sign_extend 32) (currentBit!10526 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19040 () Bool)

(assert (= bs!19040 d!77732))

(declare-fun m!352913 () Bool)

(assert (=> bs!19040 m!352913))

(assert (=> b!229139 d!77732))

(declare-fun d!77734 () Bool)

(assert (=> d!77734 (= (invariant!0 (currentBit!10526 b1!101) (currentByte!10531 b1!101) (size!5105 (buf!5646 b1!101))) (and (bvsge (currentBit!10526 b1!101) #b00000000000000000000000000000000) (bvslt (currentBit!10526 b1!101) #b00000000000000000000000000001000) (bvsge (currentByte!10531 b1!101) #b00000000000000000000000000000000) (or (bvslt (currentByte!10531 b1!101) (size!5105 (buf!5646 b1!101))) (and (= (currentBit!10526 b1!101) #b00000000000000000000000000000000) (= (currentByte!10531 b1!101) (size!5105 (buf!5646 b1!101)))))))))

(assert (=> b!229135 d!77734))

(declare-fun d!77738 () Bool)

(assert (=> d!77738 (= (array_inv!4846 (buf!5646 b1!101)) (bvsge (size!5105 (buf!5646 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229136 d!77738))

(check-sat (not d!77726) (not d!77728) (not d!77732) (not d!77724))
