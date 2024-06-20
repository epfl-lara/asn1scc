; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48330 () Bool)

(assert start!48330)

(declare-fun b!229243 () Bool)

(declare-fun e!157317 () Bool)

(declare-datatypes ((array!11648 0))(
  ( (array!11649 (arr!6097 (Array (_ BitVec 32) (_ BitVec 8))) (size!5110 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9316 0))(
  ( (BitStream!9317 (buf!5651 array!11648) (currentByte!10545 (_ BitVec 32)) (currentBit!10540 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9316)

(assert (=> b!229243 (= e!157317 (and (bvsle ((_ sign_extend 32) (size!5110 (buf!5651 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10545 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10540 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5110 (buf!5651 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10545 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10540 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229244 () Bool)

(declare-fun res!192195 () Bool)

(assert (=> b!229244 (=> (not res!192195) (not e!157317))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367209 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229244 (= res!192195 (= lt!367209 (bvadd (bitIndex!0 (size!5110 (buf!5651 b1!101)) (currentByte!10545 b1!101) (currentBit!10540 b1!101)) bits!86)))))

(declare-fun b!229245 () Bool)

(declare-fun e!157320 () Bool)

(assert (=> b!229245 (= e!157320 e!157317)))

(declare-fun res!192193 () Bool)

(assert (=> b!229245 (=> (not res!192193) (not e!157317))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229245 (= res!192193 (and (bvsle bits!86 lt!367209) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9316)

(assert (=> b!229245 (= lt!367209 (bitIndex!0 (size!5110 (buf!5651 b2!99)) (currentByte!10545 b2!99) (currentBit!10540 b2!99)))))

(declare-fun res!192194 () Bool)

(assert (=> start!48330 (=> (not res!192194) (not e!157320))))

(assert (=> start!48330 (= res!192194 (and (= (size!5110 (buf!5651 b1!101)) (size!5110 (buf!5651 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48330 e!157320))

(declare-fun e!157318 () Bool)

(declare-fun inv!12 (BitStream!9316) Bool)

(assert (=> start!48330 (and (inv!12 b1!101) e!157318)))

(declare-fun e!157316 () Bool)

(assert (=> start!48330 (and (inv!12 b2!99) e!157316)))

(assert (=> start!48330 true))

(declare-fun b!229246 () Bool)

(declare-fun array_inv!4851 (array!11648) Bool)

(assert (=> b!229246 (= e!157316 (array_inv!4851 (buf!5651 b2!99)))))

(declare-fun b!229247 () Bool)

(assert (=> b!229247 (= e!157318 (array_inv!4851 (buf!5651 b1!101)))))

(declare-fun b!229248 () Bool)

(declare-fun res!192196 () Bool)

(assert (=> b!229248 (=> (not res!192196) (not e!157317))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229248 (= res!192196 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5110 (buf!5651 b1!101))) ((_ sign_extend 32) (currentByte!10545 b1!101)) ((_ sign_extend 32) (currentBit!10540 b1!101)) bytes!19))))

(assert (= (and start!48330 res!192194) b!229245))

(assert (= (and b!229245 res!192193) b!229248))

(assert (= (and b!229248 res!192196) b!229244))

(assert (= (and b!229244 res!192195) b!229243))

(assert (= start!48330 b!229247))

(assert (= start!48330 b!229246))

(declare-fun m!352969 () Bool)

(assert (=> b!229247 m!352969))

(declare-fun m!352971 () Bool)

(assert (=> b!229246 m!352971))

(declare-fun m!352973 () Bool)

(assert (=> start!48330 m!352973))

(declare-fun m!352975 () Bool)

(assert (=> start!48330 m!352975))

(declare-fun m!352977 () Bool)

(assert (=> b!229248 m!352977))

(declare-fun m!352979 () Bool)

(assert (=> b!229244 m!352979))

(declare-fun m!352981 () Bool)

(assert (=> b!229245 m!352981))

(push 1)

(assert (not b!229244))

(assert (not b!229247))

(assert (not start!48330))

(assert (not b!229246))

(assert (not b!229248))

(assert (not b!229245))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77772 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77772 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5110 (buf!5651 b1!101))) ((_ sign_extend 32) (currentByte!10545 b1!101)) ((_ sign_extend 32) (currentBit!10540 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5110 (buf!5651 b1!101))) ((_ sign_extend 32) (currentByte!10545 b1!101)) ((_ sign_extend 32) (currentBit!10540 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19053 () Bool)

(assert (= bs!19053 d!77772))

(declare-fun m!353011 () Bool)

(assert (=> bs!19053 m!353011))

(assert (=> b!229248 d!77772))

(declare-fun d!77774 () Bool)

(assert (=> d!77774 (= (array_inv!4851 (buf!5651 b1!101)) (bvsge (size!5110 (buf!5651 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229247 d!77774))

(declare-fun d!77776 () Bool)

(assert (=> d!77776 (= (array_inv!4851 (buf!5651 b2!99)) (bvsge (size!5110 (buf!5651 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229246 d!77776))

(declare-fun d!77778 () Bool)

(declare-fun e!157364 () Bool)

(assert (=> d!77778 e!157364))

(declare-fun res!192233 () Bool)

(assert (=> d!77778 (=> (not res!192233) (not e!157364))))

(declare-fun lt!367255 () (_ BitVec 64))

(declare-fun lt!367257 () (_ BitVec 64))

(declare-fun lt!367253 () (_ BitVec 64))

(assert (=> d!77778 (= res!192233 (= lt!367253 (bvsub lt!367255 lt!367257)))))

(assert (=> d!77778 (or (= (bvand lt!367255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367257 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367255 lt!367257) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77778 (= lt!367257 (remainingBits!0 ((_ sign_extend 32) (size!5110 (buf!5651 b2!99))) ((_ sign_extend 32) (currentByte!10545 b2!99)) ((_ sign_extend 32) (currentBit!10540 b2!99))))))

(declare-fun lt!367252 () (_ BitVec 64))

(declare-fun lt!367256 () (_ BitVec 64))

(assert (=> d!77778 (= lt!367255 (bvmul lt!367252 lt!367256))))

(assert (=> d!77778 (or (= lt!367252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367256 (bvsdiv (bvmul lt!367252 lt!367256) lt!367252)))))

(assert (=> d!77778 (= lt!367256 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77778 (= lt!367252 ((_ sign_extend 32) (size!5110 (buf!5651 b2!99))))))

(assert (=> d!77778 (= lt!367253 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10545 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10540 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77778 (invariant!0 (currentBit!10540 b2!99) (currentByte!10545 b2!99) (size!5110 (buf!5651 b2!99)))))

(assert (=> d!77778 (= (bitIndex!0 (size!5110 (buf!5651 b2!99)) (currentByte!10545 b2!99) (currentBit!10540 b2!99)) lt!367253)))

(declare-fun b!229297 () Bool)

(declare-fun res!192234 () Bool)

(assert (=> b!229297 (=> (not res!192234) (not e!157364))))

(assert (=> b!229297 (= res!192234 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367253))))

(declare-fun b!229298 () Bool)

(declare-fun lt!367254 () (_ BitVec 64))

(assert (=> b!229298 (= e!157364 (bvsle lt!367253 (bvmul lt!367254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229298 (or (= lt!367254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367254)))))

(assert (=> b!229298 (= lt!367254 ((_ sign_extend 32) (size!5110 (buf!5651 b2!99))))))

(assert (= (and d!77778 res!192233) b!229297))

(assert (= (and b!229297 res!192234) b!229298))

(declare-fun m!353023 () Bool)

(assert (=> d!77778 m!353023))

(declare-fun m!353025 () Bool)

(assert (=> d!77778 m!353025))

(assert (=> b!229245 d!77778))

(declare-fun d!77798 () Bool)

(assert (=> d!77798 (= (inv!12 b1!101) (invariant!0 (currentBit!10540 b1!101) (currentByte!10545 b1!101) (size!5110 (buf!5651 b1!101))))))

(declare-fun bs!19058 () Bool)

(assert (= bs!19058 d!77798))

(declare-fun m!353027 () Bool)

(assert (=> bs!19058 m!353027))

(assert (=> start!48330 d!77798))

(declare-fun d!77800 () Bool)

(assert (=> d!77800 (= (inv!12 b2!99) (invariant!0 (currentBit!10540 b2!99) (currentByte!10545 b2!99) (size!5110 (buf!5651 b2!99))))))

(declare-fun bs!19059 () Bool)

(assert (= bs!19059 d!77800))

(assert (=> bs!19059 m!353025))

(assert (=> start!48330 d!77800))

(declare-fun d!77802 () Bool)

(declare-fun e!157365 () Bool)

(assert (=> d!77802 e!157365))

(declare-fun res!192235 () Bool)

(assert (=> d!77802 (=> (not res!192235) (not e!157365))))

(declare-fun lt!367261 () (_ BitVec 64))

(declare-fun lt!367263 () (_ BitVec 64))

(declare-fun lt!367259 () (_ BitVec 64))

(assert (=> d!77802 (= res!192235 (= lt!367259 (bvsub lt!367261 lt!367263)))))

(assert (=> d!77802 (or (= (bvand lt!367261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367261 lt!367263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77802 (= lt!367263 (remainingBits!0 ((_ sign_extend 32) (size!5110 (buf!5651 b1!101))) ((_ sign_extend 32) (currentByte!10545 b1!101)) ((_ sign_extend 32) (currentBit!10540 b1!101))))))

(declare-fun lt!367258 () (_ BitVec 64))

(declare-fun lt!367262 () (_ BitVec 64))

(assert (=> d!77802 (= lt!367261 (bvmul lt!367258 lt!367262))))

(assert (=> d!77802 (or (= lt!367258 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367262 (bvsdiv (bvmul lt!367258 lt!367262) lt!367258)))))

(assert (=> d!77802 (= lt!367262 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77802 (= lt!367258 ((_ sign_extend 32) (size!5110 (buf!5651 b1!101))))))

(assert (=> d!77802 (= lt!367259 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10545 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10540 b1!101))))))

(assert (=> d!77802 (invariant!0 (currentBit!10540 b1!101) (currentByte!10545 b1!101) (size!5110 (buf!5651 b1!101)))))

(assert (=> d!77802 (= (bitIndex!0 (size!5110 (buf!5651 b1!101)) (currentByte!10545 b1!101) (currentBit!10540 b1!101)) lt!367259)))

(declare-fun b!229299 () Bool)

(declare-fun res!192236 () Bool)

(assert (=> b!229299 (=> (not res!192236) (not e!157365))))

(assert (=> b!229299 (= res!192236 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367259))))

(declare-fun b!229300 () Bool)

(declare-fun lt!367260 () (_ BitVec 64))

(assert (=> b!229300 (= e!157365 (bvsle lt!367259 (bvmul lt!367260 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229300 (or (= lt!367260 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367260 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367260)))))

(assert (=> b!229300 (= lt!367260 ((_ sign_extend 32) (size!5110 (buf!5651 b1!101))))))

(assert (= (and d!77802 res!192235) b!229299))

(assert (= (and b!229299 res!192236) b!229300))

(assert (=> d!77802 m!353011))

(assert (=> d!77802 m!353027))

(assert (=> b!229244 d!77802))

(push 1)

(assert (not d!77772))

(assert (not d!77798))

(assert (not d!77778))

(assert (not d!77802))

(assert (not d!77800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

