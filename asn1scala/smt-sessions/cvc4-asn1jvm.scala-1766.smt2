; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48292 () Bool)

(assert start!48292)

(declare-fun b!229153 () Bool)

(declare-fun e!157238 () Bool)

(declare-datatypes ((array!11637 0))(
  ( (array!11638 (arr!6093 (Array (_ BitVec 32) (_ BitVec 8))) (size!5106 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9308 0))(
  ( (BitStream!9309 (buf!5647 array!11637) (currentByte!10532 (_ BitVec 32)) (currentBit!10527 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9308)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229153 (= e!157238 (not (invariant!0 (currentBit!10527 b1!101) (currentByte!10532 b1!101) (size!5106 (buf!5647 b1!101)))))))

(declare-fun b!229154 () Bool)

(declare-fun res!192129 () Bool)

(assert (=> b!229154 (=> (not res!192129) (not e!157238))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229154 (= res!192129 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5106 (buf!5647 b1!101))) ((_ sign_extend 32) (currentByte!10532 b1!101)) ((_ sign_extend 32) (currentBit!10527 b1!101)) bytes!19))))

(declare-fun res!192127 () Bool)

(assert (=> start!48292 (=> (not res!192127) (not e!157238))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9308)

(assert (=> start!48292 (= res!192127 (and (= (size!5106 (buf!5647 b1!101)) (size!5106 (buf!5647 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48292 e!157238))

(declare-fun e!157240 () Bool)

(declare-fun inv!12 (BitStream!9308) Bool)

(assert (=> start!48292 (and (inv!12 b1!101) e!157240)))

(declare-fun e!157237 () Bool)

(assert (=> start!48292 (and (inv!12 b2!99) e!157237)))

(assert (=> start!48292 true))

(declare-fun b!229155 () Bool)

(declare-fun array_inv!4847 (array!11637) Bool)

(assert (=> b!229155 (= e!157240 (array_inv!4847 (buf!5647 b1!101)))))

(declare-fun b!229156 () Bool)

(declare-fun res!192130 () Bool)

(assert (=> b!229156 (=> (not res!192130) (not e!157238))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229156 (= res!192130 (bvsle bits!86 (bitIndex!0 (size!5106 (buf!5647 b2!99)) (currentByte!10532 b2!99) (currentBit!10527 b2!99))))))

(declare-fun b!229157 () Bool)

(assert (=> b!229157 (= e!157237 (array_inv!4847 (buf!5647 b2!99)))))

(declare-fun b!229158 () Bool)

(declare-fun res!192128 () Bool)

(assert (=> b!229158 (=> (not res!192128) (not e!157238))))

(assert (=> b!229158 (= res!192128 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!48292 res!192127) b!229156))

(assert (= (and b!229156 res!192130) b!229158))

(assert (= (and b!229158 res!192128) b!229154))

(assert (= (and b!229154 res!192129) b!229153))

(assert (= start!48292 b!229155))

(assert (= start!48292 b!229157))

(declare-fun m!352895 () Bool)

(assert (=> b!229157 m!352895))

(declare-fun m!352897 () Bool)

(assert (=> b!229153 m!352897))

(declare-fun m!352899 () Bool)

(assert (=> b!229156 m!352899))

(declare-fun m!352901 () Bool)

(assert (=> b!229155 m!352901))

(declare-fun m!352903 () Bool)

(assert (=> start!48292 m!352903))

(declare-fun m!352905 () Bool)

(assert (=> start!48292 m!352905))

(declare-fun m!352907 () Bool)

(assert (=> b!229154 m!352907))

(push 1)

(assert (not b!229154))

(assert (not b!229156))

(assert (not b!229157))

(assert (not b!229153))

(assert (not b!229155))

(assert (not start!48292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77742 () Bool)

(assert (=> d!77742 (= (invariant!0 (currentBit!10527 b1!101) (currentByte!10532 b1!101) (size!5106 (buf!5647 b1!101))) (and (bvsge (currentBit!10527 b1!101) #b00000000000000000000000000000000) (bvslt (currentBit!10527 b1!101) #b00000000000000000000000000001000) (bvsge (currentByte!10532 b1!101) #b00000000000000000000000000000000) (or (bvslt (currentByte!10532 b1!101) (size!5106 (buf!5647 b1!101))) (and (= (currentBit!10527 b1!101) #b00000000000000000000000000000000) (= (currentByte!10532 b1!101) (size!5106 (buf!5647 b1!101)))))))))

(assert (=> b!229153 d!77742))

(declare-fun d!77746 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77746 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5106 (buf!5647 b1!101))) ((_ sign_extend 32) (currentByte!10532 b1!101)) ((_ sign_extend 32) (currentBit!10527 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5106 (buf!5647 b1!101))) ((_ sign_extend 32) (currentByte!10532 b1!101)) ((_ sign_extend 32) (currentBit!10527 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19042 () Bool)

(assert (= bs!19042 d!77746))

(declare-fun m!352921 () Bool)

(assert (=> bs!19042 m!352921))

(assert (=> b!229154 d!77746))

(declare-fun d!77752 () Bool)

(assert (=> d!77752 (= (array_inv!4847 (buf!5647 b1!101)) (bvsge (size!5106 (buf!5647 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229155 d!77752))

(declare-fun d!77754 () Bool)

(assert (=> d!77754 (= (inv!12 b1!101) (invariant!0 (currentBit!10527 b1!101) (currentByte!10532 b1!101) (size!5106 (buf!5647 b1!101))))))

(declare-fun bs!19043 () Bool)

(assert (= bs!19043 d!77754))

(assert (=> bs!19043 m!352897))

(assert (=> start!48292 d!77754))

(declare-fun d!77758 () Bool)

(assert (=> d!77758 (= (inv!12 b2!99) (invariant!0 (currentBit!10527 b2!99) (currentByte!10532 b2!99) (size!5106 (buf!5647 b2!99))))))

(declare-fun bs!19044 () Bool)

(assert (= bs!19044 d!77758))

(declare-fun m!352923 () Bool)

(assert (=> bs!19044 m!352923))

(assert (=> start!48292 d!77758))

(declare-fun d!77760 () Bool)

(declare-fun e!157249 () Bool)

(assert (=> d!77760 e!157249))

(declare-fun res!192148 () Bool)

(assert (=> d!77760 (=> (not res!192148) (not e!157249))))

(declare-fun lt!367196 () (_ BitVec 64))

(declare-fun lt!367194 () (_ BitVec 64))

(declare-fun lt!367195 () (_ BitVec 64))

(assert (=> d!77760 (= res!192148 (= lt!367195 (bvsub lt!367196 lt!367194)))))

(assert (=> d!77760 (or (= (bvand lt!367196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367196 lt!367194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77760 (= lt!367194 (remainingBits!0 ((_ sign_extend 32) (size!5106 (buf!5647 b2!99))) ((_ sign_extend 32) (currentByte!10532 b2!99)) ((_ sign_extend 32) (currentBit!10527 b2!99))))))

(declare-fun lt!367197 () (_ BitVec 64))

(declare-fun lt!367193 () (_ BitVec 64))

(assert (=> d!77760 (= lt!367196 (bvmul lt!367197 lt!367193))))

(assert (=> d!77760 (or (= lt!367197 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367193 (bvsdiv (bvmul lt!367197 lt!367193) lt!367197)))))

(assert (=> d!77760 (= lt!367193 #b0000000000000000000000000000000000000000000000000000000000001000)))

