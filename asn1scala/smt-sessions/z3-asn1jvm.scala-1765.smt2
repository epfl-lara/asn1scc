; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48254 () Bool)

(assert start!48254)

(declare-fun b!229063 () Bool)

(declare-fun res!192064 () Bool)

(declare-fun e!157171 () Bool)

(assert (=> b!229063 (=> (not res!192064) (not e!157171))))

(declare-datatypes ((array!11626 0))(
  ( (array!11627 (arr!6089 (Array (_ BitVec 32) (_ BitVec 8))) (size!5102 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9300 0))(
  ( (BitStream!9301 (buf!5643 array!11626) (currentByte!10519 (_ BitVec 32)) (currentBit!10514 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9300)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229063 (= res!192064 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5102 (buf!5643 b1!101))) ((_ sign_extend 32) (currentByte!10519 b1!101)) ((_ sign_extend 32) (currentBit!10514 b1!101)) bytes!19))))

(declare-fun b!229064 () Bool)

(declare-fun res!192061 () Bool)

(assert (=> b!229064 (=> (not res!192061) (not e!157171))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!229064 (= res!192061 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!229065 () Bool)

(declare-fun e!157170 () Bool)

(declare-fun array_inv!4843 (array!11626) Bool)

(assert (=> b!229065 (= e!157170 (array_inv!4843 (buf!5643 b1!101)))))

(declare-fun b!229066 () Bool)

(declare-fun res!192063 () Bool)

(assert (=> b!229066 (=> (not res!192063) (not e!157171))))

(declare-fun b2!99 () BitStream!9300)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229066 (= res!192063 (bvsle bits!86 (bitIndex!0 (size!5102 (buf!5643 b2!99)) (currentByte!10519 b2!99) (currentBit!10514 b2!99))))))

(declare-fun res!192062 () Bool)

(assert (=> start!48254 (=> (not res!192062) (not e!157171))))

(assert (=> start!48254 (= res!192062 (and (= (size!5102 (buf!5643 b1!101)) (size!5102 (buf!5643 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48254 e!157171))

(declare-fun inv!12 (BitStream!9300) Bool)

(assert (=> start!48254 (and (inv!12 b1!101) e!157170)))

(declare-fun e!157168 () Bool)

(assert (=> start!48254 (and (inv!12 b2!99) e!157168)))

(assert (=> start!48254 true))

(declare-fun b!229067 () Bool)

(assert (=> b!229067 (= e!157168 (array_inv!4843 (buf!5643 b2!99)))))

(declare-fun b!229068 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229068 (= e!157171 (not (invariant!0 (currentBit!10514 b2!99) (currentByte!10519 b2!99) (size!5102 (buf!5643 b2!99)))))))

(assert (= (and start!48254 res!192062) b!229066))

(assert (= (and b!229066 res!192063) b!229064))

(assert (= (and b!229064 res!192061) b!229063))

(assert (= (and b!229063 res!192064) b!229068))

(assert (= start!48254 b!229065))

(assert (= start!48254 b!229067))

(declare-fun m!352821 () Bool)

(assert (=> b!229066 m!352821))

(declare-fun m!352823 () Bool)

(assert (=> b!229063 m!352823))

(declare-fun m!352825 () Bool)

(assert (=> b!229065 m!352825))

(declare-fun m!352827 () Bool)

(assert (=> b!229067 m!352827))

(declare-fun m!352829 () Bool)

(assert (=> start!48254 m!352829))

(declare-fun m!352831 () Bool)

(assert (=> start!48254 m!352831))

(declare-fun m!352833 () Bool)

(assert (=> b!229068 m!352833))

(check-sat (not start!48254) (not b!229067) (not b!229068) (not b!229065) (not b!229066) (not b!229063))
(check-sat)
(get-model)

(declare-fun d!77680 () Bool)

(assert (=> d!77680 (= (invariant!0 (currentBit!10514 b2!99) (currentByte!10519 b2!99) (size!5102 (buf!5643 b2!99))) (and (bvsge (currentBit!10514 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10514 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10519 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10519 b2!99) (size!5102 (buf!5643 b2!99))) (and (= (currentBit!10514 b2!99) #b00000000000000000000000000000000) (= (currentByte!10519 b2!99) (size!5102 (buf!5643 b2!99)))))))))

(assert (=> b!229068 d!77680))

(declare-fun d!77682 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77682 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5102 (buf!5643 b1!101))) ((_ sign_extend 32) (currentByte!10519 b1!101)) ((_ sign_extend 32) (currentBit!10514 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5102 (buf!5643 b1!101))) ((_ sign_extend 32) (currentByte!10519 b1!101)) ((_ sign_extend 32) (currentBit!10514 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19026 () Bool)

(assert (= bs!19026 d!77682))

(declare-fun m!352849 () Bool)

(assert (=> bs!19026 m!352849))

(assert (=> b!229063 d!77682))

(declare-fun d!77684 () Bool)

(assert (=> d!77684 (= (array_inv!4843 (buf!5643 b1!101)) (bvsge (size!5102 (buf!5643 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229065 d!77684))

(declare-fun d!77686 () Bool)

(assert (=> d!77686 (= (inv!12 b1!101) (invariant!0 (currentBit!10514 b1!101) (currentByte!10519 b1!101) (size!5102 (buf!5643 b1!101))))))

(declare-fun bs!19027 () Bool)

(assert (= bs!19027 d!77686))

(declare-fun m!352851 () Bool)

(assert (=> bs!19027 m!352851))

(assert (=> start!48254 d!77686))

(declare-fun d!77688 () Bool)

(assert (=> d!77688 (= (inv!12 b2!99) (invariant!0 (currentBit!10514 b2!99) (currentByte!10519 b2!99) (size!5102 (buf!5643 b2!99))))))

(declare-fun bs!19028 () Bool)

(assert (= bs!19028 d!77688))

(assert (=> bs!19028 m!352833))

(assert (=> start!48254 d!77688))

(declare-fun d!77690 () Bool)

(declare-fun e!157189 () Bool)

(assert (=> d!77690 e!157189))

(declare-fun res!192081 () Bool)

(assert (=> d!77690 (=> (not res!192081) (not e!157189))))

(declare-fun lt!367103 () (_ BitVec 64))

(declare-fun lt!367104 () (_ BitVec 64))

(declare-fun lt!367102 () (_ BitVec 64))

(assert (=> d!77690 (= res!192081 (= lt!367102 (bvsub lt!367103 lt!367104)))))

(assert (=> d!77690 (or (= (bvand lt!367103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367104 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367103 lt!367104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77690 (= lt!367104 (remainingBits!0 ((_ sign_extend 32) (size!5102 (buf!5643 b2!99))) ((_ sign_extend 32) (currentByte!10519 b2!99)) ((_ sign_extend 32) (currentBit!10514 b2!99))))))

(declare-fun lt!367105 () (_ BitVec 64))

(declare-fun lt!367107 () (_ BitVec 64))

(assert (=> d!77690 (= lt!367103 (bvmul lt!367105 lt!367107))))

(assert (=> d!77690 (or (= lt!367105 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367107 (bvsdiv (bvmul lt!367105 lt!367107) lt!367105)))))

(assert (=> d!77690 (= lt!367107 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77690 (= lt!367105 ((_ sign_extend 32) (size!5102 (buf!5643 b2!99))))))

(assert (=> d!77690 (= lt!367102 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10519 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10514 b2!99))))))

(assert (=> d!77690 (invariant!0 (currentBit!10514 b2!99) (currentByte!10519 b2!99) (size!5102 (buf!5643 b2!99)))))

(assert (=> d!77690 (= (bitIndex!0 (size!5102 (buf!5643 b2!99)) (currentByte!10519 b2!99) (currentBit!10514 b2!99)) lt!367102)))

(declare-fun b!229091 () Bool)

(declare-fun res!192082 () Bool)

(assert (=> b!229091 (=> (not res!192082) (not e!157189))))

(assert (=> b!229091 (= res!192082 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367102))))

(declare-fun b!229092 () Bool)

(declare-fun lt!367106 () (_ BitVec 64))

(assert (=> b!229092 (= e!157189 (bvsle lt!367102 (bvmul lt!367106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229092 (or (= lt!367106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367106)))))

(assert (=> b!229092 (= lt!367106 ((_ sign_extend 32) (size!5102 (buf!5643 b2!99))))))

(assert (= (and d!77690 res!192081) b!229091))

(assert (= (and b!229091 res!192082) b!229092))

(declare-fun m!352853 () Bool)

(assert (=> d!77690 m!352853))

(assert (=> d!77690 m!352833))

(assert (=> b!229066 d!77690))

(declare-fun d!77694 () Bool)

(assert (=> d!77694 (= (array_inv!4843 (buf!5643 b2!99)) (bvsge (size!5102 (buf!5643 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229067 d!77694))

(check-sat (not d!77688) (not d!77686) (not d!77682) (not d!77690))
