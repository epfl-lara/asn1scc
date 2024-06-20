; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29592 () Bool)

(assert start!29592)

(declare-fun b!152653 () Bool)

(declare-fun e!102155 () Bool)

(declare-datatypes ((array!6832 0))(
  ( (array!6833 (arr!3909 (Array (_ BitVec 32) (_ BitVec 8))) (size!3086 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5430 0))(
  ( (BitStream!5431 (buf!3589 array!6832) (currentByte!6554 (_ BitVec 32)) (currentBit!6549 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5430)

(declare-fun array_inv!2875 (array!6832) Bool)

(assert (=> b!152653 (= e!102155 (array_inv!2875 (buf!3589 bs2!18)))))

(declare-fun b!152654 () Bool)

(declare-fun e!102154 () Bool)

(declare-fun bs1!10 () BitStream!5430)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152654 (= e!102154 (not (invariant!0 (currentBit!6549 bs1!10) (currentByte!6554 bs1!10) (size!3086 (buf!3589 bs1!10)))))))

(declare-fun b!152655 () Bool)

(declare-fun res!127950 () Bool)

(assert (=> b!152655 (=> (not res!127950) (not e!102154))))

(declare-fun lt!239116 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152655 (= res!127950 (bvsle lt!239116 (bitIndex!0 (size!3086 (buf!3589 bs2!18)) (currentByte!6554 bs2!18) (currentBit!6549 bs2!18))))))

(declare-fun b!152657 () Bool)

(declare-fun e!102151 () Bool)

(assert (=> b!152657 (= e!102151 e!102154)))

(declare-fun res!127949 () Bool)

(assert (=> b!152657 (=> (not res!127949) (not e!102154))))

(assert (=> b!152657 (= res!127949 (bvsle lt!239116 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3086 (buf!3589 bs1!10))))))))

(assert (=> b!152657 (= lt!239116 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3086 (buf!3589 bs1!10)) (currentByte!6554 bs1!10) (currentBit!6549 bs1!10))))))

(declare-fun res!127948 () Bool)

(assert (=> start!29592 (=> (not res!127948) (not e!102151))))

(assert (=> start!29592 (= res!127948 (= (size!3086 (buf!3589 bs1!10)) (size!3086 (buf!3589 bs2!18))))))

(assert (=> start!29592 e!102151))

(declare-fun e!102156 () Bool)

(declare-fun inv!12 (BitStream!5430) Bool)

(assert (=> start!29592 (and (inv!12 bs1!10) e!102156)))

(assert (=> start!29592 (and (inv!12 bs2!18) e!102155)))

(declare-fun b!152656 () Bool)

(assert (=> b!152656 (= e!102156 (array_inv!2875 (buf!3589 bs1!10)))))

(assert (= (and start!29592 res!127948) b!152657))

(assert (= (and b!152657 res!127949) b!152655))

(assert (= (and b!152655 res!127950) b!152654))

(assert (= start!29592 b!152656))

(assert (= start!29592 b!152653))

(declare-fun m!238503 () Bool)

(assert (=> b!152656 m!238503))

(declare-fun m!238505 () Bool)

(assert (=> start!29592 m!238505))

(declare-fun m!238507 () Bool)

(assert (=> start!29592 m!238507))

(declare-fun m!238509 () Bool)

(assert (=> b!152655 m!238509))

(declare-fun m!238511 () Bool)

(assert (=> b!152654 m!238511))

(declare-fun m!238513 () Bool)

(assert (=> b!152657 m!238513))

(declare-fun m!238515 () Bool)

(assert (=> b!152653 m!238515))

(check-sat (not b!152655) (not b!152654) (not b!152656) (not b!152657) (not b!152653) (not start!29592))
(check-sat)
(get-model)

(declare-fun d!50176 () Bool)

(declare-fun e!102177 () Bool)

(assert (=> d!50176 e!102177))

(declare-fun res!127964 () Bool)

(assert (=> d!50176 (=> (not res!127964) (not e!102177))))

(declare-fun lt!239133 () (_ BitVec 64))

(declare-fun lt!239137 () (_ BitVec 64))

(declare-fun lt!239135 () (_ BitVec 64))

(assert (=> d!50176 (= res!127964 (= lt!239133 (bvsub lt!239135 lt!239137)))))

(assert (=> d!50176 (or (= (bvand lt!239135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239135 lt!239137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50176 (= lt!239137 (remainingBits!0 ((_ sign_extend 32) (size!3086 (buf!3589 bs1!10))) ((_ sign_extend 32) (currentByte!6554 bs1!10)) ((_ sign_extend 32) (currentBit!6549 bs1!10))))))

(declare-fun lt!239134 () (_ BitVec 64))

(declare-fun lt!239132 () (_ BitVec 64))

(assert (=> d!50176 (= lt!239135 (bvmul lt!239134 lt!239132))))

(assert (=> d!50176 (or (= lt!239134 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239132 (bvsdiv (bvmul lt!239134 lt!239132) lt!239134)))))

(assert (=> d!50176 (= lt!239132 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50176 (= lt!239134 ((_ sign_extend 32) (size!3086 (buf!3589 bs1!10))))))

(assert (=> d!50176 (= lt!239133 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6554 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6549 bs1!10))))))

(assert (=> d!50176 (invariant!0 (currentBit!6549 bs1!10) (currentByte!6554 bs1!10) (size!3086 (buf!3589 bs1!10)))))

(assert (=> d!50176 (= (bitIndex!0 (size!3086 (buf!3589 bs1!10)) (currentByte!6554 bs1!10) (currentBit!6549 bs1!10)) lt!239133)))

(declare-fun b!152677 () Bool)

(declare-fun res!127965 () Bool)

(assert (=> b!152677 (=> (not res!127965) (not e!102177))))

(assert (=> b!152677 (= res!127965 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239133))))

(declare-fun b!152678 () Bool)

(declare-fun lt!239136 () (_ BitVec 64))

(assert (=> b!152678 (= e!102177 (bvsle lt!239133 (bvmul lt!239136 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152678 (or (= lt!239136 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239136 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239136)))))

(assert (=> b!152678 (= lt!239136 ((_ sign_extend 32) (size!3086 (buf!3589 bs1!10))))))

(assert (= (and d!50176 res!127964) b!152677))

(assert (= (and b!152677 res!127965) b!152678))

(declare-fun m!238533 () Bool)

(assert (=> d!50176 m!238533))

(assert (=> d!50176 m!238511))

(assert (=> b!152657 d!50176))

(declare-fun d!50188 () Bool)

(assert (=> d!50188 (= (array_inv!2875 (buf!3589 bs2!18)) (bvsge (size!3086 (buf!3589 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152653 d!50188))

(declare-fun d!50192 () Bool)

(assert (=> d!50192 (= (invariant!0 (currentBit!6549 bs1!10) (currentByte!6554 bs1!10) (size!3086 (buf!3589 bs1!10))) (and (bvsge (currentBit!6549 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6549 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6554 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6554 bs1!10) (size!3086 (buf!3589 bs1!10))) (and (= (currentBit!6549 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6554 bs1!10) (size!3086 (buf!3589 bs1!10)))))))))

(assert (=> b!152654 d!50192))

(declare-fun d!50194 () Bool)

(assert (=> d!50194 (= (inv!12 bs1!10) (invariant!0 (currentBit!6549 bs1!10) (currentByte!6554 bs1!10) (size!3086 (buf!3589 bs1!10))))))

(declare-fun bs!12271 () Bool)

(assert (= bs!12271 d!50194))

(assert (=> bs!12271 m!238511))

(assert (=> start!29592 d!50194))

(declare-fun d!50196 () Bool)

(assert (=> d!50196 (= (inv!12 bs2!18) (invariant!0 (currentBit!6549 bs2!18) (currentByte!6554 bs2!18) (size!3086 (buf!3589 bs2!18))))))

(declare-fun bs!12272 () Bool)

(assert (= bs!12272 d!50196))

(declare-fun m!238535 () Bool)

(assert (=> bs!12272 m!238535))

(assert (=> start!29592 d!50196))

(declare-fun d!50198 () Bool)

(declare-fun e!102178 () Bool)

(assert (=> d!50198 e!102178))

(declare-fun res!127966 () Bool)

(assert (=> d!50198 (=> (not res!127966) (not e!102178))))

(declare-fun lt!239139 () (_ BitVec 64))

(declare-fun lt!239141 () (_ BitVec 64))

(declare-fun lt!239143 () (_ BitVec 64))

(assert (=> d!50198 (= res!127966 (= lt!239139 (bvsub lt!239141 lt!239143)))))

(assert (=> d!50198 (or (= (bvand lt!239141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239143 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239141 lt!239143) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50198 (= lt!239143 (remainingBits!0 ((_ sign_extend 32) (size!3086 (buf!3589 bs2!18))) ((_ sign_extend 32) (currentByte!6554 bs2!18)) ((_ sign_extend 32) (currentBit!6549 bs2!18))))))

(declare-fun lt!239140 () (_ BitVec 64))

(declare-fun lt!239138 () (_ BitVec 64))

(assert (=> d!50198 (= lt!239141 (bvmul lt!239140 lt!239138))))

(assert (=> d!50198 (or (= lt!239140 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239138 (bvsdiv (bvmul lt!239140 lt!239138) lt!239140)))))

(assert (=> d!50198 (= lt!239138 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50198 (= lt!239140 ((_ sign_extend 32) (size!3086 (buf!3589 bs2!18))))))

(assert (=> d!50198 (= lt!239139 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6554 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6549 bs2!18))))))

(assert (=> d!50198 (invariant!0 (currentBit!6549 bs2!18) (currentByte!6554 bs2!18) (size!3086 (buf!3589 bs2!18)))))

(assert (=> d!50198 (= (bitIndex!0 (size!3086 (buf!3589 bs2!18)) (currentByte!6554 bs2!18) (currentBit!6549 bs2!18)) lt!239139)))

(declare-fun b!152679 () Bool)

(declare-fun res!127967 () Bool)

(assert (=> b!152679 (=> (not res!127967) (not e!102178))))

(assert (=> b!152679 (= res!127967 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239139))))

(declare-fun b!152680 () Bool)

(declare-fun lt!239142 () (_ BitVec 64))

(assert (=> b!152680 (= e!102178 (bvsle lt!239139 (bvmul lt!239142 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152680 (or (= lt!239142 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239142 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239142)))))

(assert (=> b!152680 (= lt!239142 ((_ sign_extend 32) (size!3086 (buf!3589 bs2!18))))))

(assert (= (and d!50198 res!127966) b!152679))

(assert (= (and b!152679 res!127967) b!152680))

(declare-fun m!238537 () Bool)

(assert (=> d!50198 m!238537))

(assert (=> d!50198 m!238535))

(assert (=> b!152655 d!50198))

(declare-fun d!50200 () Bool)

(assert (=> d!50200 (= (array_inv!2875 (buf!3589 bs1!10)) (bvsge (size!3086 (buf!3589 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152656 d!50200))

(check-sat (not d!50176) (not d!50194) (not d!50198) (not d!50196))
