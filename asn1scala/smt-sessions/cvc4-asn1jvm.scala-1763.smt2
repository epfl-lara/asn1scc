; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48220 () Bool)

(assert start!48220)

(declare-fun b!228956 () Bool)

(declare-fun e!157083 () Bool)

(declare-datatypes ((array!11613 0))(
  ( (array!11614 (arr!6084 (Array (_ BitVec 32) (_ BitVec 8))) (size!5097 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9290 0))(
  ( (BitStream!9291 (buf!5638 array!11613) (currentByte!10508 (_ BitVec 32)) (currentBit!10503 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9290)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228956 (= e!157083 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10503 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10508 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5097 (buf!5638 b1!101)))))))))

(declare-fun b!228957 () Bool)

(declare-fun res!191986 () Bool)

(assert (=> b!228957 (=> (not res!191986) (not e!157083))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9290)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228957 (= res!191986 (bvsle bits!86 (bitIndex!0 (size!5097 (buf!5638 b2!99)) (currentByte!10508 b2!99) (currentBit!10503 b2!99))))))

(declare-fun res!191984 () Bool)

(assert (=> start!48220 (=> (not res!191984) (not e!157083))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48220 (= res!191984 (and (= (size!5097 (buf!5638 b1!101)) (size!5097 (buf!5638 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48220 e!157083))

(declare-fun e!157086 () Bool)

(declare-fun inv!12 (BitStream!9290) Bool)

(assert (=> start!48220 (and (inv!12 b1!101) e!157086)))

(declare-fun e!157085 () Bool)

(assert (=> start!48220 (and (inv!12 b2!99) e!157085)))

(assert (=> start!48220 true))

(declare-fun b!228958 () Bool)

(declare-fun array_inv!4838 (array!11613) Bool)

(assert (=> b!228958 (= e!157086 (array_inv!4838 (buf!5638 b1!101)))))

(declare-fun b!228959 () Bool)

(assert (=> b!228959 (= e!157085 (array_inv!4838 (buf!5638 b2!99)))))

(declare-fun b!228960 () Bool)

(declare-fun res!191985 () Bool)

(assert (=> b!228960 (=> (not res!191985) (not e!157083))))

(assert (=> b!228960 (= res!191985 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (bvsle ((_ sign_extend 32) (size!5097 (buf!5638 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10508 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10503 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5097 (buf!5638 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10508 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10503 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!48220 res!191984) b!228957))

(assert (= (and b!228957 res!191986) b!228960))

(assert (= (and b!228960 res!191985) b!228956))

(assert (= start!48220 b!228958))

(assert (= start!48220 b!228959))

(declare-fun m!352741 () Bool)

(assert (=> b!228956 m!352741))

(declare-fun m!352743 () Bool)

(assert (=> b!228957 m!352743))

(declare-fun m!352745 () Bool)

(assert (=> b!228958 m!352745))

(declare-fun m!352747 () Bool)

(assert (=> start!48220 m!352747))

(declare-fun m!352749 () Bool)

(assert (=> start!48220 m!352749))

(declare-fun m!352751 () Bool)

(assert (=> b!228959 m!352751))

(push 1)

(assert (not b!228959))

(assert (not b!228957))

(assert (not start!48220))

(assert (not b!228958))

(assert (not b!228956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77656 () Bool)

(assert (=> d!77656 (= (inv!12 b1!101) (invariant!0 (currentBit!10503 b1!101) (currentByte!10508 b1!101) (size!5097 (buf!5638 b1!101))))))

(declare-fun bs!19016 () Bool)

(assert (= bs!19016 d!77656))

(declare-fun m!352759 () Bool)

(assert (=> bs!19016 m!352759))

(assert (=> start!48220 d!77656))

(declare-fun d!77658 () Bool)

(assert (=> d!77658 (= (inv!12 b2!99) (invariant!0 (currentBit!10503 b2!99) (currentByte!10508 b2!99) (size!5097 (buf!5638 b2!99))))))

(declare-fun bs!19017 () Bool)

(assert (= bs!19017 d!77658))

(declare-fun m!352761 () Bool)

(assert (=> bs!19017 m!352761))

(assert (=> start!48220 d!77658))

(declare-fun d!77660 () Bool)

(assert (=> d!77660 (= (array_inv!4838 (buf!5638 b1!101)) (bvsge (size!5097 (buf!5638 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!228958 d!77660))

(declare-fun d!77662 () Bool)

(assert (=> d!77662 (= (array_inv!4838 (buf!5638 b2!99)) (bvsge (size!5097 (buf!5638 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!228959 d!77662))

(declare-fun d!77664 () Bool)

(assert (=> d!77664 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10503 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10508 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5097 (buf!5638 b1!101))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10503 b1!101))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10503 b1!101))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10508 b1!101))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10508 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5097 (buf!5638 b1!101))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10503 b1!101))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10508 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5097 (buf!5638 b1!101)))))))))))

(assert (=> b!228956 d!77664))

(declare-fun d!77666 () Bool)

(declare-fun e!157096 () Bool)

(assert (=> d!77666 e!157096))

(declare-fun res!192004 () Bool)

(assert (=> d!77666 (=> (not res!192004) (not e!157096))))

(declare-fun lt!367085 () (_ BitVec 64))

(declare-fun lt!367089 () (_ BitVec 64))

(declare-fun lt!367088 () (_ BitVec 64))

(assert (=> d!77666 (= res!192004 (= lt!367085 (bvsub lt!367088 lt!367089)))))

(assert (=> d!77666 (or (= (bvand lt!367088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367089 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367088 lt!367089) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77666 (= lt!367089 (remainingBits!0 ((_ sign_extend 32) (size!5097 (buf!5638 b2!99))) ((_ sign_extend 32) (currentByte!10508 b2!99)) ((_ sign_extend 32) (currentBit!10503 b2!99))))))

(declare-fun lt!367087 () (_ BitVec 64))

(declare-fun lt!367086 () (_ BitVec 64))

(assert (=> d!77666 (= lt!367088 (bvmul lt!367087 lt!367086))))

(assert (=> d!77666 (or (= lt!367087 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367086 (bvsdiv (bvmul lt!367087 lt!367086) lt!367087)))))

(assert (=> d!77666 (= lt!367086 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77666 (= lt!367087 ((_ sign_extend 32) (size!5097 (buf!5638 b2!99))))))

(assert (=> d!77666 (= lt!367085 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10508 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10503 b2!99))))))

(assert (=> d!77666 (invariant!0 (currentBit!10503 b2!99) (currentByte!10508 b2!99) (size!5097 (buf!5638 b2!99)))))

(assert (=> d!77666 (= (bitIndex!0 (size!5097 (buf!5638 b2!99)) (currentByte!10508 b2!99) (currentBit!10503 b2!99)) lt!367085)))

(declare-fun b!228977 () Bool)

(declare-fun res!192003 () Bool)

(assert (=> b!228977 (=> (not res!192003) (not e!157096))))

(assert (=> b!228977 (= res!192003 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367085))))

(declare-fun b!228978 () Bool)

(declare-fun lt!367084 () (_ BitVec 64))

(assert (=> b!228978 (= e!157096 (bvsle lt!367085 (bvmul lt!367084 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228978 (or (= lt!367084 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367084 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367084)))))

(assert (=> b!228978 (= lt!367084 ((_ sign_extend 32) (size!5097 (buf!5638 b2!99))))))

(assert (= (and d!77666 res!192004) b!228977))

(assert (= (and b!228977 res!192003) b!228978))

(declare-fun m!352769 () Bool)

(assert (=> d!77666 m!352769))

(assert (=> d!77666 m!352761))

(assert (=> b!228957 d!77666))

(push 1)

