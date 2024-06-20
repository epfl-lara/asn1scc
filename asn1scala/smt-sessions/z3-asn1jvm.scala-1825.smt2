; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49064 () Bool)

(assert start!49064)

(declare-fun b!233114 () Bool)

(declare-fun e!160584 () Bool)

(declare-fun e!160585 () Bool)

(assert (=> b!233114 (= e!160584 e!160585)))

(declare-fun res!195031 () Bool)

(assert (=> b!233114 (=> (not res!195031) (not e!160585))))

(declare-fun lt!369111 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!233114 (= res!195031 (bvsle ((_ extract 31 0) lt!369111) bytes!19))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!233114 (= lt!369111 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233115 () Bool)

(declare-fun e!160583 () Bool)

(declare-datatypes ((array!12033 0))(
  ( (array!12034 (arr!6269 (Array (_ BitVec 32) (_ BitVec 8))) (size!5282 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9660 0))(
  ( (BitStream!9661 (buf!5823 array!12033) (currentByte!10830 (_ BitVec 32)) (currentBit!10825 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9660)

(declare-fun array_inv!5023 (array!12033) Bool)

(assert (=> b!233115 (= e!160583 (array_inv!5023 (buf!5823 b2!99)))))

(declare-fun b!233116 () Bool)

(declare-fun res!195033 () Bool)

(assert (=> b!233116 (=> (not res!195033) (not e!160585))))

(declare-fun b1!101 () BitStream!9660)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233116 (= res!195033 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5282 (buf!5823 b1!101))) ((_ sign_extend 32) (currentByte!10830 b1!101)) ((_ sign_extend 32) (currentBit!10825 b1!101)) bytes!19))))

(declare-fun b!233117 () Bool)

(declare-fun e!160586 () Bool)

(assert (=> b!233117 (= e!160586 (array_inv!5023 (buf!5823 b1!101)))))

(declare-fun b!233118 () Bool)

(declare-fun e!160588 () Bool)

(assert (=> b!233118 (= e!160588 e!160584)))

(declare-fun res!195034 () Bool)

(assert (=> b!233118 (=> (not res!195034) (not e!160584))))

(declare-fun lt!369109 () (_ BitVec 64))

(assert (=> b!233118 (= res!195034 (bvsle bits!86 lt!369109))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233118 (= lt!369109 (bitIndex!0 (size!5282 (buf!5823 b2!99)) (currentByte!10830 b2!99) (currentBit!10825 b2!99)))))

(declare-fun b!233119 () Bool)

(declare-fun res!195032 () Bool)

(assert (=> b!233119 (=> (not res!195032) (not e!160585))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233119 (= res!195032 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5282 (buf!5823 b1!101))) ((_ sign_extend 32) (currentByte!10830 b1!101)) ((_ sign_extend 32) (currentBit!10825 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233120 () Bool)

(declare-fun lt!369110 () (_ BitVec 64))

(assert (=> b!233120 (= e!160585 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5282 (buf!5823 b1!101)))) lt!369110) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14397 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10830 b2!99))) ((_ sign_extend 32) (currentBit!10825 b2!99))))) (and (= lt!369109 bdg!14397) (= (bvsub lt!369109 bits!86) lt!369110) (let ((bdg!14398 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5282 (buf!5823 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14398 (bvsub bdg!14397 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14398 bdg!14397) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369111)) (bvsge lt!369111 #b0000000000000000000000000000000010000000000000000000000000000000)))))))))

(assert (=> b!233120 (= lt!369110 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10830 b1!101))) ((_ sign_extend 32) (currentBit!10825 b1!101))))))

(declare-fun res!195035 () Bool)

(assert (=> start!49064 (=> (not res!195035) (not e!160588))))

(assert (=> start!49064 (= res!195035 (and (= (size!5282 (buf!5823 b1!101)) (size!5282 (buf!5823 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49064 e!160588))

(declare-fun inv!12 (BitStream!9660) Bool)

(assert (=> start!49064 (and (inv!12 b1!101) e!160586)))

(assert (=> start!49064 (and (inv!12 b2!99) e!160583)))

(assert (=> start!49064 true))

(declare-fun b!233113 () Bool)

(declare-fun res!195036 () Bool)

(assert (=> b!233113 (=> (not res!195036) (not e!160585))))

(assert (=> b!233113 (= res!195036 (= lt!369109 (bvadd (bitIndex!0 (size!5282 (buf!5823 b1!101)) (currentByte!10830 b1!101) (currentBit!10825 b1!101)) bits!86)))))

(assert (= (and start!49064 res!195035) b!233118))

(assert (= (and b!233118 res!195034) b!233114))

(assert (= (and b!233114 res!195031) b!233116))

(assert (= (and b!233116 res!195033) b!233113))

(assert (= (and b!233113 res!195036) b!233119))

(assert (= (and b!233119 res!195032) b!233120))

(assert (= start!49064 b!233117))

(assert (= start!49064 b!233115))

(declare-fun m!355827 () Bool)

(assert (=> b!233118 m!355827))

(declare-fun m!355829 () Bool)

(assert (=> b!233113 m!355829))

(declare-fun m!355831 () Bool)

(assert (=> b!233116 m!355831))

(declare-fun m!355833 () Bool)

(assert (=> start!49064 m!355833))

(declare-fun m!355835 () Bool)

(assert (=> start!49064 m!355835))

(declare-fun m!355837 () Bool)

(assert (=> b!233115 m!355837))

(declare-fun m!355839 () Bool)

(assert (=> b!233119 m!355839))

(declare-fun m!355841 () Bool)

(assert (=> b!233117 m!355841))

(check-sat (not b!233117) (not b!233118) (not b!233115) (not start!49064) (not b!233113) (not b!233116) (not b!233119))
(check-sat)
(get-model)

(declare-fun d!78520 () Bool)

(assert (=> d!78520 (= (array_inv!5023 (buf!5823 b2!99)) (bvsge (size!5282 (buf!5823 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233115 d!78520))

(declare-fun d!78522 () Bool)

(assert (=> d!78522 (= (remainingBits!0 ((_ sign_extend 32) (size!5282 (buf!5823 b1!101))) ((_ sign_extend 32) (currentByte!10830 b1!101)) ((_ sign_extend 32) (currentBit!10825 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5282 (buf!5823 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10830 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10825 b1!101)))))))

(assert (=> b!233119 d!78522))

(declare-fun d!78524 () Bool)

(declare-fun e!160613 () Bool)

(assert (=> d!78524 e!160613))

(declare-fun res!195059 () Bool)

(assert (=> d!78524 (=> (not res!195059) (not e!160613))))

(declare-fun lt!369135 () (_ BitVec 64))

(declare-fun lt!369137 () (_ BitVec 64))

(declare-fun lt!369138 () (_ BitVec 64))

(assert (=> d!78524 (= res!195059 (= lt!369137 (bvsub lt!369135 lt!369138)))))

(assert (=> d!78524 (or (= (bvand lt!369135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369138 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369135 lt!369138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78524 (= lt!369138 (remainingBits!0 ((_ sign_extend 32) (size!5282 (buf!5823 b1!101))) ((_ sign_extend 32) (currentByte!10830 b1!101)) ((_ sign_extend 32) (currentBit!10825 b1!101))))))

(declare-fun lt!369136 () (_ BitVec 64))

(declare-fun lt!369133 () (_ BitVec 64))

(assert (=> d!78524 (= lt!369135 (bvmul lt!369136 lt!369133))))

(assert (=> d!78524 (or (= lt!369136 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369133 (bvsdiv (bvmul lt!369136 lt!369133) lt!369136)))))

(assert (=> d!78524 (= lt!369133 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78524 (= lt!369136 ((_ sign_extend 32) (size!5282 (buf!5823 b1!101))))))

(assert (=> d!78524 (= lt!369137 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10830 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10825 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78524 (invariant!0 (currentBit!10825 b1!101) (currentByte!10830 b1!101) (size!5282 (buf!5823 b1!101)))))

(assert (=> d!78524 (= (bitIndex!0 (size!5282 (buf!5823 b1!101)) (currentByte!10830 b1!101) (currentBit!10825 b1!101)) lt!369137)))

(declare-fun b!233149 () Bool)

(declare-fun res!195060 () Bool)

(assert (=> b!233149 (=> (not res!195060) (not e!160613))))

(assert (=> b!233149 (= res!195060 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369137))))

(declare-fun b!233150 () Bool)

(declare-fun lt!369134 () (_ BitVec 64))

(assert (=> b!233150 (= e!160613 (bvsle lt!369137 (bvmul lt!369134 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233150 (or (= lt!369134 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369134 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369134)))))

(assert (=> b!233150 (= lt!369134 ((_ sign_extend 32) (size!5282 (buf!5823 b1!101))))))

(assert (= (and d!78524 res!195059) b!233149))

(assert (= (and b!233149 res!195060) b!233150))

(assert (=> d!78524 m!355839))

(declare-fun m!355859 () Bool)

(assert (=> d!78524 m!355859))

(assert (=> b!233113 d!78524))

(declare-fun d!78526 () Bool)

(declare-fun e!160614 () Bool)

(assert (=> d!78526 e!160614))

(declare-fun res!195061 () Bool)

(assert (=> d!78526 (=> (not res!195061) (not e!160614))))

(declare-fun lt!369143 () (_ BitVec 64))

(declare-fun lt!369141 () (_ BitVec 64))

(declare-fun lt!369144 () (_ BitVec 64))

(assert (=> d!78526 (= res!195061 (= lt!369143 (bvsub lt!369141 lt!369144)))))

(assert (=> d!78526 (or (= (bvand lt!369141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369141 lt!369144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78526 (= lt!369144 (remainingBits!0 ((_ sign_extend 32) (size!5282 (buf!5823 b2!99))) ((_ sign_extend 32) (currentByte!10830 b2!99)) ((_ sign_extend 32) (currentBit!10825 b2!99))))))

(declare-fun lt!369142 () (_ BitVec 64))

(declare-fun lt!369139 () (_ BitVec 64))

(assert (=> d!78526 (= lt!369141 (bvmul lt!369142 lt!369139))))

(assert (=> d!78526 (or (= lt!369142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369139 (bvsdiv (bvmul lt!369142 lt!369139) lt!369142)))))

(assert (=> d!78526 (= lt!369139 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78526 (= lt!369142 ((_ sign_extend 32) (size!5282 (buf!5823 b2!99))))))

(assert (=> d!78526 (= lt!369143 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10830 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10825 b2!99))))))

(assert (=> d!78526 (invariant!0 (currentBit!10825 b2!99) (currentByte!10830 b2!99) (size!5282 (buf!5823 b2!99)))))

(assert (=> d!78526 (= (bitIndex!0 (size!5282 (buf!5823 b2!99)) (currentByte!10830 b2!99) (currentBit!10825 b2!99)) lt!369143)))

(declare-fun b!233151 () Bool)

(declare-fun res!195062 () Bool)

(assert (=> b!233151 (=> (not res!195062) (not e!160614))))

(assert (=> b!233151 (= res!195062 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369143))))

(declare-fun b!233152 () Bool)

(declare-fun lt!369140 () (_ BitVec 64))

(assert (=> b!233152 (= e!160614 (bvsle lt!369143 (bvmul lt!369140 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233152 (or (= lt!369140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369140)))))

(assert (=> b!233152 (= lt!369140 ((_ sign_extend 32) (size!5282 (buf!5823 b2!99))))))

(assert (= (and d!78526 res!195061) b!233151))

(assert (= (and b!233151 res!195062) b!233152))

(declare-fun m!355861 () Bool)

(assert (=> d!78526 m!355861))

(declare-fun m!355863 () Bool)

(assert (=> d!78526 m!355863))

(assert (=> b!233118 d!78526))

(declare-fun d!78528 () Bool)

(assert (=> d!78528 (= (inv!12 b1!101) (invariant!0 (currentBit!10825 b1!101) (currentByte!10830 b1!101) (size!5282 (buf!5823 b1!101))))))

(declare-fun bs!19342 () Bool)

(assert (= bs!19342 d!78528))

(assert (=> bs!19342 m!355859))

(assert (=> start!49064 d!78528))

(declare-fun d!78530 () Bool)

(assert (=> d!78530 (= (inv!12 b2!99) (invariant!0 (currentBit!10825 b2!99) (currentByte!10830 b2!99) (size!5282 (buf!5823 b2!99))))))

(declare-fun bs!19343 () Bool)

(assert (= bs!19343 d!78530))

(assert (=> bs!19343 m!355863))

(assert (=> start!49064 d!78530))

(declare-fun d!78532 () Bool)

(assert (=> d!78532 (= (array_inv!5023 (buf!5823 b1!101)) (bvsge (size!5282 (buf!5823 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233117 d!78532))

(declare-fun d!78534 () Bool)

(assert (=> d!78534 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5282 (buf!5823 b1!101))) ((_ sign_extend 32) (currentByte!10830 b1!101)) ((_ sign_extend 32) (currentBit!10825 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5282 (buf!5823 b1!101))) ((_ sign_extend 32) (currentByte!10830 b1!101)) ((_ sign_extend 32) (currentBit!10825 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19344 () Bool)

(assert (= bs!19344 d!78534))

(assert (=> bs!19344 m!355839))

(assert (=> b!233116 d!78534))

(check-sat (not d!78534) (not d!78528) (not d!78526) (not d!78524) (not d!78530))
