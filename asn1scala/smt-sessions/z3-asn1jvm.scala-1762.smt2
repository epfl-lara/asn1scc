; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48190 () Bool)

(assert start!48190)

(declare-fun b!228884 () Bool)

(declare-fun e!157018 () Bool)

(declare-datatypes ((array!11602 0))(
  ( (array!11603 (arr!6080 (Array (_ BitVec 32) (_ BitVec 8))) (size!5093 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9282 0))(
  ( (BitStream!9283 (buf!5634 array!11602) (currentByte!10499 (_ BitVec 32)) (currentBit!10494 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9282)

(declare-fun array_inv!4834 (array!11602) Bool)

(assert (=> b!228884 (= e!157018 (array_inv!4834 (buf!5634 b1!101)))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b!228883 () Bool)

(declare-fun e!157016 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!228883 (= e!157016 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (bvsle ((_ sign_extend 32) (size!5093 (buf!5634 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10499 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10494 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5093 (buf!5634 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10499 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10494 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!191935 () Bool)

(assert (=> start!48190 (=> (not res!191935) (not e!157016))))

(declare-fun b2!99 () BitStream!9282)

(assert (=> start!48190 (= res!191935 (and (= (size!5093 (buf!5634 b1!101)) (size!5093 (buf!5634 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48190 e!157016))

(declare-fun inv!12 (BitStream!9282) Bool)

(assert (=> start!48190 (and (inv!12 b1!101) e!157018)))

(declare-fun e!157015 () Bool)

(assert (=> start!48190 (and (inv!12 b2!99) e!157015)))

(assert (=> start!48190 true))

(declare-fun b!228885 () Bool)

(assert (=> b!228885 (= e!157015 (array_inv!4834 (buf!5634 b2!99)))))

(declare-fun b!228882 () Bool)

(declare-fun res!191934 () Bool)

(assert (=> b!228882 (=> (not res!191934) (not e!157016))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228882 (= res!191934 (bvsle bits!86 (bitIndex!0 (size!5093 (buf!5634 b2!99)) (currentByte!10499 b2!99) (currentBit!10494 b2!99))))))

(assert (= (and start!48190 res!191935) b!228882))

(assert (= (and b!228882 res!191934) b!228883))

(assert (= start!48190 b!228884))

(assert (= start!48190 b!228885))

(declare-fun m!352679 () Bool)

(assert (=> b!228884 m!352679))

(declare-fun m!352681 () Bool)

(assert (=> start!48190 m!352681))

(declare-fun m!352683 () Bool)

(assert (=> start!48190 m!352683))

(declare-fun m!352685 () Bool)

(assert (=> b!228885 m!352685))

(declare-fun m!352687 () Bool)

(assert (=> b!228882 m!352687))

(check-sat (not start!48190) (not b!228884) (not b!228885) (not b!228882))
(check-sat)
(get-model)

(declare-fun d!77602 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77602 (= (inv!12 b1!101) (invariant!0 (currentBit!10494 b1!101) (currentByte!10499 b1!101) (size!5093 (buf!5634 b1!101))))))

(declare-fun bs!19005 () Bool)

(assert (= bs!19005 d!77602))

(declare-fun m!352699 () Bool)

(assert (=> bs!19005 m!352699))

(assert (=> start!48190 d!77602))

(declare-fun d!77604 () Bool)

(assert (=> d!77604 (= (inv!12 b2!99) (invariant!0 (currentBit!10494 b2!99) (currentByte!10499 b2!99) (size!5093 (buf!5634 b2!99))))))

(declare-fun bs!19006 () Bool)

(assert (= bs!19006 d!77604))

(declare-fun m!352701 () Bool)

(assert (=> bs!19006 m!352701))

(assert (=> start!48190 d!77604))

(declare-fun d!77606 () Bool)

(assert (=> d!77606 (= (array_inv!4834 (buf!5634 b1!101)) (bvsge (size!5093 (buf!5634 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!228884 d!77606))

(declare-fun d!77608 () Bool)

(assert (=> d!77608 (= (array_inv!4834 (buf!5634 b2!99)) (bvsge (size!5093 (buf!5634 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!228885 d!77608))

(declare-fun d!77610 () Bool)

(declare-fun e!157039 () Bool)

(assert (=> d!77610 e!157039))

(declare-fun res!191953 () Bool)

(assert (=> d!77610 (=> (not res!191953) (not e!157039))))

(declare-fun lt!367015 () (_ BitVec 64))

(declare-fun lt!367012 () (_ BitVec 64))

(declare-fun lt!367016 () (_ BitVec 64))

(assert (=> d!77610 (= res!191953 (= lt!367016 (bvsub lt!367015 lt!367012)))))

(assert (=> d!77610 (or (= (bvand lt!367015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367012 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367015 lt!367012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77610 (= lt!367012 (remainingBits!0 ((_ sign_extend 32) (size!5093 (buf!5634 b2!99))) ((_ sign_extend 32) (currentByte!10499 b2!99)) ((_ sign_extend 32) (currentBit!10494 b2!99))))))

(declare-fun lt!367017 () (_ BitVec 64))

(declare-fun lt!367013 () (_ BitVec 64))

(assert (=> d!77610 (= lt!367015 (bvmul lt!367017 lt!367013))))

(assert (=> d!77610 (or (= lt!367017 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367013 (bvsdiv (bvmul lt!367017 lt!367013) lt!367017)))))

(assert (=> d!77610 (= lt!367013 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77610 (= lt!367017 ((_ sign_extend 32) (size!5093 (buf!5634 b2!99))))))

(assert (=> d!77610 (= lt!367016 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10499 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10494 b2!99))))))

(assert (=> d!77610 (invariant!0 (currentBit!10494 b2!99) (currentByte!10499 b2!99) (size!5093 (buf!5634 b2!99)))))

(assert (=> d!77610 (= (bitIndex!0 (size!5093 (buf!5634 b2!99)) (currentByte!10499 b2!99) (currentBit!10494 b2!99)) lt!367016)))

(declare-fun b!228908 () Bool)

(declare-fun res!191952 () Bool)

(assert (=> b!228908 (=> (not res!191952) (not e!157039))))

(assert (=> b!228908 (= res!191952 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367016))))

(declare-fun b!228909 () Bool)

(declare-fun lt!367014 () (_ BitVec 64))

(assert (=> b!228909 (= e!157039 (bvsle lt!367016 (bvmul lt!367014 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228909 (or (= lt!367014 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367014 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367014)))))

(assert (=> b!228909 (= lt!367014 ((_ sign_extend 32) (size!5093 (buf!5634 b2!99))))))

(assert (= (and d!77610 res!191953) b!228908))

(assert (= (and b!228908 res!191952) b!228909))

(declare-fun m!352709 () Bool)

(assert (=> d!77610 m!352709))

(assert (=> d!77610 m!352701))

(assert (=> b!228882 d!77610))

(check-sat (not d!77604) (not d!77610) (not d!77602))
