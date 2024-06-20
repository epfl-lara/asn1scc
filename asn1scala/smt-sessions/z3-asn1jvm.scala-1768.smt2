; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48332 () Bool)

(assert start!48332)

(declare-fun b!229261 () Bool)

(declare-fun res!192208 () Bool)

(declare-fun e!157336 () Bool)

(assert (=> b!229261 (=> (not res!192208) (not e!157336))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367212 () (_ BitVec 64))

(declare-datatypes ((array!11650 0))(
  ( (array!11651 (arr!6098 (Array (_ BitVec 32) (_ BitVec 8))) (size!5111 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9318 0))(
  ( (BitStream!9319 (buf!5652 array!11650) (currentByte!10546 (_ BitVec 32)) (currentBit!10541 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9318)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229261 (= res!192208 (= lt!367212 (bvadd (bitIndex!0 (size!5111 (buf!5652 b1!101)) (currentByte!10546 b1!101) (currentBit!10541 b1!101)) bits!86)))))

(declare-fun b!229262 () Bool)

(assert (=> b!229262 (= e!157336 (and (bvsle ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10546 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10541 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10546 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10541 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229263 () Bool)

(declare-fun res!192206 () Bool)

(assert (=> b!229263 (=> (not res!192206) (not e!157336))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229263 (= res!192206 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))) ((_ sign_extend 32) (currentByte!10546 b1!101)) ((_ sign_extend 32) (currentBit!10541 b1!101)) bytes!19))))

(declare-fun b!229264 () Bool)

(declare-fun e!157337 () Bool)

(assert (=> b!229264 (= e!157337 e!157336)))

(declare-fun res!192205 () Bool)

(assert (=> b!229264 (=> (not res!192205) (not e!157336))))

(assert (=> b!229264 (= res!192205 (and (bvsle bits!86 lt!367212) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9318)

(assert (=> b!229264 (= lt!367212 (bitIndex!0 (size!5111 (buf!5652 b2!99)) (currentByte!10546 b2!99) (currentBit!10541 b2!99)))))

(declare-fun b!229265 () Bool)

(declare-fun e!157334 () Bool)

(declare-fun array_inv!4852 (array!11650) Bool)

(assert (=> b!229265 (= e!157334 (array_inv!4852 (buf!5652 b2!99)))))

(declare-fun res!192207 () Bool)

(assert (=> start!48332 (=> (not res!192207) (not e!157337))))

(assert (=> start!48332 (= res!192207 (and (= (size!5111 (buf!5652 b1!101)) (size!5111 (buf!5652 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48332 e!157337))

(declare-fun e!157335 () Bool)

(declare-fun inv!12 (BitStream!9318) Bool)

(assert (=> start!48332 (and (inv!12 b1!101) e!157335)))

(assert (=> start!48332 (and (inv!12 b2!99) e!157334)))

(assert (=> start!48332 true))

(declare-fun b!229266 () Bool)

(assert (=> b!229266 (= e!157335 (array_inv!4852 (buf!5652 b1!101)))))

(assert (= (and start!48332 res!192207) b!229264))

(assert (= (and b!229264 res!192205) b!229263))

(assert (= (and b!229263 res!192206) b!229261))

(assert (= (and b!229261 res!192208) b!229262))

(assert (= start!48332 b!229266))

(assert (= start!48332 b!229265))

(declare-fun m!352983 () Bool)

(assert (=> b!229266 m!352983))

(declare-fun m!352985 () Bool)

(assert (=> start!48332 m!352985))

(declare-fun m!352987 () Bool)

(assert (=> start!48332 m!352987))

(declare-fun m!352989 () Bool)

(assert (=> b!229264 m!352989))

(declare-fun m!352991 () Bool)

(assert (=> b!229261 m!352991))

(declare-fun m!352993 () Bool)

(assert (=> b!229265 m!352993))

(declare-fun m!352995 () Bool)

(assert (=> b!229263 m!352995))

(check-sat (not b!229265) (not b!229266) (not b!229263) (not b!229261) (not start!48332) (not b!229264))
(check-sat)
(get-model)

(declare-fun d!77770 () Bool)

(declare-fun e!157360 () Bool)

(assert (=> d!77770 e!157360))

(declare-fun res!192225 () Bool)

(assert (=> d!77770 (=> (not res!192225) (not e!157360))))

(declare-fun lt!367230 () (_ BitVec 64))

(declare-fun lt!367233 () (_ BitVec 64))

(declare-fun lt!367231 () (_ BitVec 64))

(assert (=> d!77770 (= res!192225 (= lt!367231 (bvsub lt!367233 lt!367230)))))

(assert (=> d!77770 (or (= (bvand lt!367233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367233 lt!367230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77770 (= lt!367230 (remainingBits!0 ((_ sign_extend 32) (size!5111 (buf!5652 b2!99))) ((_ sign_extend 32) (currentByte!10546 b2!99)) ((_ sign_extend 32) (currentBit!10541 b2!99))))))

(declare-fun lt!367228 () (_ BitVec 64))

(declare-fun lt!367229 () (_ BitVec 64))

(assert (=> d!77770 (= lt!367233 (bvmul lt!367228 lt!367229))))

(assert (=> d!77770 (or (= lt!367228 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367229 (bvsdiv (bvmul lt!367228 lt!367229) lt!367228)))))

(assert (=> d!77770 (= lt!367229 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77770 (= lt!367228 ((_ sign_extend 32) (size!5111 (buf!5652 b2!99))))))

(assert (=> d!77770 (= lt!367231 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10546 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10541 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77770 (invariant!0 (currentBit!10541 b2!99) (currentByte!10546 b2!99) (size!5111 (buf!5652 b2!99)))))

(assert (=> d!77770 (= (bitIndex!0 (size!5111 (buf!5652 b2!99)) (currentByte!10546 b2!99) (currentBit!10541 b2!99)) lt!367231)))

(declare-fun b!229289 () Bool)

(declare-fun res!192226 () Bool)

(assert (=> b!229289 (=> (not res!192226) (not e!157360))))

(assert (=> b!229289 (= res!192226 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367231))))

(declare-fun b!229290 () Bool)

(declare-fun lt!367232 () (_ BitVec 64))

(assert (=> b!229290 (= e!157360 (bvsle lt!367231 (bvmul lt!367232 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229290 (or (= lt!367232 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367232 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367232)))))

(assert (=> b!229290 (= lt!367232 ((_ sign_extend 32) (size!5111 (buf!5652 b2!99))))))

(assert (= (and d!77770 res!192225) b!229289))

(assert (= (and b!229289 res!192226) b!229290))

(declare-fun m!353013 () Bool)

(assert (=> d!77770 m!353013))

(declare-fun m!353015 () Bool)

(assert (=> d!77770 m!353015))

(assert (=> b!229264 d!77770))

(declare-fun d!77782 () Bool)

(assert (=> d!77782 (= (inv!12 b1!101) (invariant!0 (currentBit!10541 b1!101) (currentByte!10546 b1!101) (size!5111 (buf!5652 b1!101))))))

(declare-fun bs!19055 () Bool)

(assert (= bs!19055 d!77782))

(declare-fun m!353019 () Bool)

(assert (=> bs!19055 m!353019))

(assert (=> start!48332 d!77782))

(declare-fun d!77786 () Bool)

(assert (=> d!77786 (= (inv!12 b2!99) (invariant!0 (currentBit!10541 b2!99) (currentByte!10546 b2!99) (size!5111 (buf!5652 b2!99))))))

(declare-fun bs!19056 () Bool)

(assert (= bs!19056 d!77786))

(assert (=> bs!19056 m!353015))

(assert (=> start!48332 d!77786))

(declare-fun d!77788 () Bool)

(assert (=> d!77788 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))) ((_ sign_extend 32) (currentByte!10546 b1!101)) ((_ sign_extend 32) (currentBit!10541 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))) ((_ sign_extend 32) (currentByte!10546 b1!101)) ((_ sign_extend 32) (currentBit!10541 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19057 () Bool)

(assert (= bs!19057 d!77788))

(declare-fun m!353021 () Bool)

(assert (=> bs!19057 m!353021))

(assert (=> b!229263 d!77788))

(declare-fun d!77792 () Bool)

(declare-fun e!157361 () Bool)

(assert (=> d!77792 e!157361))

(declare-fun res!192227 () Bool)

(assert (=> d!77792 (=> (not res!192227) (not e!157361))))

(declare-fun lt!367239 () (_ BitVec 64))

(declare-fun lt!367238 () (_ BitVec 64))

(declare-fun lt!367241 () (_ BitVec 64))

(assert (=> d!77792 (= res!192227 (= lt!367239 (bvsub lt!367241 lt!367238)))))

(assert (=> d!77792 (or (= (bvand lt!367241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367238 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367241 lt!367238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77792 (= lt!367238 (remainingBits!0 ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))) ((_ sign_extend 32) (currentByte!10546 b1!101)) ((_ sign_extend 32) (currentBit!10541 b1!101))))))

(declare-fun lt!367236 () (_ BitVec 64))

(declare-fun lt!367237 () (_ BitVec 64))

(assert (=> d!77792 (= lt!367241 (bvmul lt!367236 lt!367237))))

(assert (=> d!77792 (or (= lt!367236 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367237 (bvsdiv (bvmul lt!367236 lt!367237) lt!367236)))))

(assert (=> d!77792 (= lt!367237 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77792 (= lt!367236 ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))))))

(assert (=> d!77792 (= lt!367239 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10546 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10541 b1!101))))))

(assert (=> d!77792 (invariant!0 (currentBit!10541 b1!101) (currentByte!10546 b1!101) (size!5111 (buf!5652 b1!101)))))

(assert (=> d!77792 (= (bitIndex!0 (size!5111 (buf!5652 b1!101)) (currentByte!10546 b1!101) (currentBit!10541 b1!101)) lt!367239)))

(declare-fun b!229291 () Bool)

(declare-fun res!192228 () Bool)

(assert (=> b!229291 (=> (not res!192228) (not e!157361))))

(assert (=> b!229291 (= res!192228 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367239))))

(declare-fun b!229292 () Bool)

(declare-fun lt!367240 () (_ BitVec 64))

(assert (=> b!229292 (= e!157361 (bvsle lt!367239 (bvmul lt!367240 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229292 (or (= lt!367240 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367240 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367240)))))

(assert (=> b!229292 (= lt!367240 ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))))))

(assert (= (and d!77792 res!192227) b!229291))

(assert (= (and b!229291 res!192228) b!229292))

(assert (=> d!77792 m!353021))

(assert (=> d!77792 m!353019))

(assert (=> b!229261 d!77792))

(declare-fun d!77794 () Bool)

(assert (=> d!77794 (= (array_inv!4852 (buf!5652 b1!101)) (bvsge (size!5111 (buf!5652 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229266 d!77794))

(declare-fun d!77796 () Bool)

(assert (=> d!77796 (= (array_inv!4852 (buf!5652 b2!99)) (bvsge (size!5111 (buf!5652 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229265 d!77796))

(check-sat (not d!77792) (not d!77782) (not d!77786) (not d!77788) (not d!77770))
(check-sat)
(get-model)

(declare-fun d!77812 () Bool)

(assert (=> d!77812 (= (invariant!0 (currentBit!10541 b1!101) (currentByte!10546 b1!101) (size!5111 (buf!5652 b1!101))) (and (bvsge (currentBit!10541 b1!101) #b00000000000000000000000000000000) (bvslt (currentBit!10541 b1!101) #b00000000000000000000000000001000) (bvsge (currentByte!10546 b1!101) #b00000000000000000000000000000000) (or (bvslt (currentByte!10546 b1!101) (size!5111 (buf!5652 b1!101))) (and (= (currentBit!10541 b1!101) #b00000000000000000000000000000000) (= (currentByte!10546 b1!101) (size!5111 (buf!5652 b1!101)))))))))

(assert (=> d!77782 d!77812))

(declare-fun d!77814 () Bool)

(assert (=> d!77814 (= (remainingBits!0 ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))) ((_ sign_extend 32) (currentByte!10546 b1!101)) ((_ sign_extend 32) (currentBit!10541 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5111 (buf!5652 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10546 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10541 b1!101)))))))

(assert (=> d!77788 d!77814))

(declare-fun d!77816 () Bool)

(assert (=> d!77816 (= (remainingBits!0 ((_ sign_extend 32) (size!5111 (buf!5652 b2!99))) ((_ sign_extend 32) (currentByte!10546 b2!99)) ((_ sign_extend 32) (currentBit!10541 b2!99))) (bvsub (bvmul ((_ sign_extend 32) (size!5111 (buf!5652 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10546 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10541 b2!99)))))))

(assert (=> d!77770 d!77816))

(declare-fun d!77818 () Bool)

(assert (=> d!77818 (= (invariant!0 (currentBit!10541 b2!99) (currentByte!10546 b2!99) (size!5111 (buf!5652 b2!99))) (and (bvsge (currentBit!10541 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10541 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10546 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10546 b2!99) (size!5111 (buf!5652 b2!99))) (and (= (currentBit!10541 b2!99) #b00000000000000000000000000000000) (= (currentByte!10546 b2!99) (size!5111 (buf!5652 b2!99)))))))))

(assert (=> d!77770 d!77818))

(assert (=> d!77786 d!77818))

(assert (=> d!77792 d!77814))

(assert (=> d!77792 d!77812))

(check-sat)
