; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48492 () Bool)

(assert start!48492)

(declare-fun b!229700 () Bool)

(declare-fun res!192555 () Bool)

(declare-fun e!157670 () Bool)

(assert (=> b!229700 (=> (not res!192555) (not e!157670))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367575 () (_ BitVec 64))

(declare-datatypes ((array!11692 0))(
  ( (array!11693 (arr!6113 (Array (_ BitVec 32) (_ BitVec 8))) (size!5126 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9348 0))(
  ( (BitStream!9349 (buf!5667 array!11692) (currentByte!10602 (_ BitVec 32)) (currentBit!10597 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9348)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229700 (= res!192555 (= lt!367575 (bvadd (bitIndex!0 (size!5126 (buf!5667 b1!101)) (currentByte!10602 b1!101) (currentBit!10597 b1!101)) bits!86)))))

(declare-fun b!229702 () Bool)

(declare-fun res!192559 () Bool)

(assert (=> b!229702 (=> (not res!192559) (not e!157670))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229702 (= res!192559 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5126 (buf!5667 b1!101))) ((_ sign_extend 32) (currentByte!10602 b1!101)) ((_ sign_extend 32) (currentBit!10597 b1!101)) bytes!19))))

(declare-fun b!229703 () Bool)

(declare-fun res!192554 () Bool)

(assert (=> b!229703 (=> (not res!192554) (not e!157670))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229703 (= res!192554 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5126 (buf!5667 b1!101))) ((_ sign_extend 32) (currentByte!10602 b1!101)) ((_ sign_extend 32) (currentBit!10597 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229704 () Bool)

(declare-fun e!157669 () Bool)

(declare-fun e!157671 () Bool)

(assert (=> b!229704 (= e!157669 e!157671)))

(declare-fun res!192558 () Bool)

(assert (=> b!229704 (=> (not res!192558) (not e!157671))))

(assert (=> b!229704 (= res!192558 (bvsle bits!86 lt!367575))))

(declare-fun b2!99 () BitStream!9348)

(assert (=> b!229704 (= lt!367575 (bitIndex!0 (size!5126 (buf!5667 b2!99)) (currentByte!10602 b2!99) (currentBit!10597 b2!99)))))

(declare-fun b!229705 () Bool)

(declare-fun e!157668 () Bool)

(declare-fun array_inv!4867 (array!11692) Bool)

(assert (=> b!229705 (= e!157668 (array_inv!4867 (buf!5667 b2!99)))))

(declare-fun b!229706 () Bool)

(assert (=> b!229706 (= e!157671 e!157670)))

(declare-fun res!192556 () Bool)

(assert (=> b!229706 (=> (not res!192556) (not e!157670))))

(declare-fun lt!367574 () (_ BitVec 64))

(assert (=> b!229706 (= res!192556 (bvsle ((_ extract 31 0) lt!367574) bytes!19))))

(assert (=> b!229706 (= lt!367574 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229707 () Bool)

(declare-fun e!157672 () Bool)

(assert (=> b!229707 (= e!157672 (array_inv!4867 (buf!5667 b1!101)))))

(declare-fun res!192557 () Bool)

(assert (=> start!48492 (=> (not res!192557) (not e!157669))))

(assert (=> start!48492 (= res!192557 (and (= (size!5126 (buf!5667 b1!101)) (size!5126 (buf!5667 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48492 e!157669))

(declare-fun inv!12 (BitStream!9348) Bool)

(assert (=> start!48492 (and (inv!12 b1!101) e!157672)))

(assert (=> start!48492 (and (inv!12 b2!99) e!157668)))

(assert (=> start!48492 true))

(declare-fun b!229701 () Bool)

(declare-fun lt!367573 () (_ BitVec 64))

(assert (=> b!229701 (= e!157670 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5126 (buf!5667 b1!101)))) lt!367573) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14263 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10602 b2!99))) ((_ sign_extend 32) (currentBit!10597 b2!99))))) (and (= lt!367575 bdg!14263) (= (bvsub lt!367575 bits!86) lt!367573) (let ((bdg!14264 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5126 (buf!5667 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14264 (bvsub bdg!14263 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14264 bdg!14263) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367574)) (bvsle ((_ sign_extend 32) (size!5126 (buf!5667 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10602 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10597 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5126 (buf!5667 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10602 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10597 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!229701 (= lt!367573 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10602 b1!101))) ((_ sign_extend 32) (currentBit!10597 b1!101))))))

(assert (= (and start!48492 res!192557) b!229704))

(assert (= (and b!229704 res!192558) b!229706))

(assert (= (and b!229706 res!192556) b!229702))

(assert (= (and b!229702 res!192559) b!229700))

(assert (= (and b!229700 res!192555) b!229703))

(assert (= (and b!229703 res!192554) b!229701))

(assert (= start!48492 b!229707))

(assert (= start!48492 b!229705))

(declare-fun m!353303 () Bool)

(assert (=> b!229704 m!353303))

(declare-fun m!353305 () Bool)

(assert (=> b!229705 m!353305))

(declare-fun m!353307 () Bool)

(assert (=> b!229703 m!353307))

(declare-fun m!353309 () Bool)

(assert (=> b!229702 m!353309))

(declare-fun m!353311 () Bool)

(assert (=> b!229700 m!353311))

(declare-fun m!353313 () Bool)

(assert (=> start!48492 m!353313))

(declare-fun m!353315 () Bool)

(assert (=> start!48492 m!353315))

(declare-fun m!353317 () Bool)

(assert (=> b!229707 m!353317))

(check-sat (not b!229704) (not b!229703) (not start!48492) (not b!229702) (not b!229700) (not b!229705) (not b!229707))
(check-sat)
(get-model)

(declare-fun d!77986 () Bool)

(declare-fun e!157696 () Bool)

(assert (=> d!77986 e!157696))

(declare-fun res!192582 () Bool)

(assert (=> d!77986 (=> (not res!192582) (not e!157696))))

(declare-fun lt!367598 () (_ BitVec 64))

(declare-fun lt!367597 () (_ BitVec 64))

(declare-fun lt!367601 () (_ BitVec 64))

(assert (=> d!77986 (= res!192582 (= lt!367598 (bvsub lt!367597 lt!367601)))))

(assert (=> d!77986 (or (= (bvand lt!367597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367601 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367597 lt!367601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77986 (= lt!367601 (remainingBits!0 ((_ sign_extend 32) (size!5126 (buf!5667 b2!99))) ((_ sign_extend 32) (currentByte!10602 b2!99)) ((_ sign_extend 32) (currentBit!10597 b2!99))))))

(declare-fun lt!367599 () (_ BitVec 64))

(declare-fun lt!367600 () (_ BitVec 64))

(assert (=> d!77986 (= lt!367597 (bvmul lt!367599 lt!367600))))

(assert (=> d!77986 (or (= lt!367599 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367600 (bvsdiv (bvmul lt!367599 lt!367600) lt!367599)))))

(assert (=> d!77986 (= lt!367600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77986 (= lt!367599 ((_ sign_extend 32) (size!5126 (buf!5667 b2!99))))))

(assert (=> d!77986 (= lt!367598 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10602 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10597 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77986 (invariant!0 (currentBit!10597 b2!99) (currentByte!10602 b2!99) (size!5126 (buf!5667 b2!99)))))

(assert (=> d!77986 (= (bitIndex!0 (size!5126 (buf!5667 b2!99)) (currentByte!10602 b2!99) (currentBit!10597 b2!99)) lt!367598)))

(declare-fun b!229736 () Bool)

(declare-fun res!192583 () Bool)

(assert (=> b!229736 (=> (not res!192583) (not e!157696))))

(assert (=> b!229736 (= res!192583 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367598))))

(declare-fun b!229737 () Bool)

(declare-fun lt!367602 () (_ BitVec 64))

(assert (=> b!229737 (= e!157696 (bvsle lt!367598 (bvmul lt!367602 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229737 (or (= lt!367602 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367602 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367602)))))

(assert (=> b!229737 (= lt!367602 ((_ sign_extend 32) (size!5126 (buf!5667 b2!99))))))

(assert (= (and d!77986 res!192582) b!229736))

(assert (= (and b!229736 res!192583) b!229737))

(declare-fun m!353335 () Bool)

(assert (=> d!77986 m!353335))

(declare-fun m!353337 () Bool)

(assert (=> d!77986 m!353337))

(assert (=> b!229704 d!77986))

(declare-fun d!77988 () Bool)

(assert (=> d!77988 (= (inv!12 b1!101) (invariant!0 (currentBit!10597 b1!101) (currentByte!10602 b1!101) (size!5126 (buf!5667 b1!101))))))

(declare-fun bs!19104 () Bool)

(assert (= bs!19104 d!77988))

(declare-fun m!353339 () Bool)

(assert (=> bs!19104 m!353339))

(assert (=> start!48492 d!77988))

(declare-fun d!77990 () Bool)

(assert (=> d!77990 (= (inv!12 b2!99) (invariant!0 (currentBit!10597 b2!99) (currentByte!10602 b2!99) (size!5126 (buf!5667 b2!99))))))

(declare-fun bs!19105 () Bool)

(assert (= bs!19105 d!77990))

(assert (=> bs!19105 m!353337))

(assert (=> start!48492 d!77990))

(declare-fun d!77992 () Bool)

(assert (=> d!77992 (= (array_inv!4867 (buf!5667 b2!99)) (bvsge (size!5126 (buf!5667 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229705 d!77992))

(declare-fun d!77994 () Bool)

(assert (=> d!77994 (= (remainingBits!0 ((_ sign_extend 32) (size!5126 (buf!5667 b1!101))) ((_ sign_extend 32) (currentByte!10602 b1!101)) ((_ sign_extend 32) (currentBit!10597 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5126 (buf!5667 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10602 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10597 b1!101)))))))

(assert (=> b!229703 d!77994))

(declare-fun d!77996 () Bool)

(assert (=> d!77996 (= (array_inv!4867 (buf!5667 b1!101)) (bvsge (size!5126 (buf!5667 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229707 d!77996))

(declare-fun d!77998 () Bool)

(assert (=> d!77998 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5126 (buf!5667 b1!101))) ((_ sign_extend 32) (currentByte!10602 b1!101)) ((_ sign_extend 32) (currentBit!10597 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5126 (buf!5667 b1!101))) ((_ sign_extend 32) (currentByte!10602 b1!101)) ((_ sign_extend 32) (currentBit!10597 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19106 () Bool)

(assert (= bs!19106 d!77998))

(assert (=> bs!19106 m!353307))

(assert (=> b!229702 d!77998))

(declare-fun d!78000 () Bool)

(declare-fun e!157697 () Bool)

(assert (=> d!78000 e!157697))

(declare-fun res!192584 () Bool)

(assert (=> d!78000 (=> (not res!192584) (not e!157697))))

(declare-fun lt!367603 () (_ BitVec 64))

(declare-fun lt!367607 () (_ BitVec 64))

(declare-fun lt!367604 () (_ BitVec 64))

(assert (=> d!78000 (= res!192584 (= lt!367604 (bvsub lt!367603 lt!367607)))))

(assert (=> d!78000 (or (= (bvand lt!367603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367607 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367603 lt!367607) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78000 (= lt!367607 (remainingBits!0 ((_ sign_extend 32) (size!5126 (buf!5667 b1!101))) ((_ sign_extend 32) (currentByte!10602 b1!101)) ((_ sign_extend 32) (currentBit!10597 b1!101))))))

(declare-fun lt!367605 () (_ BitVec 64))

(declare-fun lt!367606 () (_ BitVec 64))

(assert (=> d!78000 (= lt!367603 (bvmul lt!367605 lt!367606))))

(assert (=> d!78000 (or (= lt!367605 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367606 (bvsdiv (bvmul lt!367605 lt!367606) lt!367605)))))

(assert (=> d!78000 (= lt!367606 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78000 (= lt!367605 ((_ sign_extend 32) (size!5126 (buf!5667 b1!101))))))

(assert (=> d!78000 (= lt!367604 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10602 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10597 b1!101))))))

(assert (=> d!78000 (invariant!0 (currentBit!10597 b1!101) (currentByte!10602 b1!101) (size!5126 (buf!5667 b1!101)))))

(assert (=> d!78000 (= (bitIndex!0 (size!5126 (buf!5667 b1!101)) (currentByte!10602 b1!101) (currentBit!10597 b1!101)) lt!367604)))

(declare-fun b!229738 () Bool)

(declare-fun res!192585 () Bool)

(assert (=> b!229738 (=> (not res!192585) (not e!157697))))

(assert (=> b!229738 (= res!192585 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367604))))

(declare-fun b!229739 () Bool)

(declare-fun lt!367608 () (_ BitVec 64))

(assert (=> b!229739 (= e!157697 (bvsle lt!367604 (bvmul lt!367608 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229739 (or (= lt!367608 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367608 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367608)))))

(assert (=> b!229739 (= lt!367608 ((_ sign_extend 32) (size!5126 (buf!5667 b1!101))))))

(assert (= (and d!78000 res!192584) b!229738))

(assert (= (and b!229738 res!192585) b!229739))

(assert (=> d!78000 m!353307))

(assert (=> d!78000 m!353339))

(assert (=> b!229700 d!78000))

(check-sat (not d!77990) (not d!78000) (not d!77988) (not d!77986) (not d!77998))
(check-sat)
(get-model)

(assert (=> d!78000 d!77994))

(declare-fun d!78002 () Bool)

(assert (=> d!78002 (= (invariant!0 (currentBit!10597 b1!101) (currentByte!10602 b1!101) (size!5126 (buf!5667 b1!101))) (and (bvsge (currentBit!10597 b1!101) #b00000000000000000000000000000000) (bvslt (currentBit!10597 b1!101) #b00000000000000000000000000001000) (bvsge (currentByte!10602 b1!101) #b00000000000000000000000000000000) (or (bvslt (currentByte!10602 b1!101) (size!5126 (buf!5667 b1!101))) (and (= (currentBit!10597 b1!101) #b00000000000000000000000000000000) (= (currentByte!10602 b1!101) (size!5126 (buf!5667 b1!101)))))))))

(assert (=> d!78000 d!78002))

(assert (=> d!77988 d!78002))

(assert (=> d!77998 d!77994))

(declare-fun d!78004 () Bool)

(assert (=> d!78004 (= (remainingBits!0 ((_ sign_extend 32) (size!5126 (buf!5667 b2!99))) ((_ sign_extend 32) (currentByte!10602 b2!99)) ((_ sign_extend 32) (currentBit!10597 b2!99))) (bvsub (bvmul ((_ sign_extend 32) (size!5126 (buf!5667 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10602 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10597 b2!99)))))))

(assert (=> d!77986 d!78004))

(declare-fun d!78006 () Bool)

(assert (=> d!78006 (= (invariant!0 (currentBit!10597 b2!99) (currentByte!10602 b2!99) (size!5126 (buf!5667 b2!99))) (and (bvsge (currentBit!10597 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10597 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10602 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10602 b2!99) (size!5126 (buf!5667 b2!99))) (and (= (currentBit!10597 b2!99) #b00000000000000000000000000000000) (= (currentByte!10602 b2!99) (size!5126 (buf!5667 b2!99)))))))))

(assert (=> d!77986 d!78006))

(assert (=> d!77990 d!78006))

(check-sat)
