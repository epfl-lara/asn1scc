; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18576 () Bool)

(assert start!18576)

(declare-fun b!92181 () Bool)

(declare-fun res!76100 () Bool)

(declare-fun e!60600 () Bool)

(assert (=> b!92181 (=> (not res!76100) (not e!60600))))

(declare-datatypes ((array!4316 0))(
  ( (array!4317 (arr!2578 (Array (_ BitVec 32) (_ BitVec 8))) (size!1950 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3444 0))(
  ( (BitStream!3445 (buf!2331 array!4316) (currentByte!4645 (_ BitVec 32)) (currentBit!4640 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3444)

(declare-fun bitStream2!8 () BitStream!3444)

(declare-fun isPrefixOf!0 (BitStream!3444 BitStream!3444) Bool)

(assert (=> b!92181 (= res!76100 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92182 () Bool)

(declare-fun e!60605 () Bool)

(declare-fun array_inv!1787 (array!4316) Bool)

(assert (=> b!92182 (= e!60605 (array_inv!1787 (buf!2331 bitStream2!8)))))

(declare-fun res!76101 () Bool)

(assert (=> start!18576 (=> (not res!76101) (not e!60600))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18576 (= res!76101 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18576 e!60600))

(assert (=> start!18576 true))

(declare-fun e!60602 () Bool)

(declare-fun inv!12 (BitStream!3444) Bool)

(assert (=> start!18576 (and (inv!12 bitStream1!8) e!60602)))

(assert (=> start!18576 (and (inv!12 bitStream2!8) e!60605)))

(declare-fun base!8 () BitStream!3444)

(declare-fun e!60603 () Bool)

(assert (=> start!18576 (and (inv!12 base!8) e!60603)))

(declare-fun b!92183 () Bool)

(declare-fun res!76097 () Bool)

(assert (=> b!92183 (=> (not res!76097) (not e!60600))))

(assert (=> b!92183 (= res!76097 (and (= (buf!2331 bitStream1!8) (buf!2331 bitStream2!8)) (= (buf!2331 bitStream1!8) (buf!2331 base!8))))))

(declare-fun b!92184 () Bool)

(declare-fun res!76102 () Bool)

(assert (=> b!92184 (=> (not res!76102) (not e!60600))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92184 (= res!76102 (bvslt (bitIndex!0 (size!1950 (buf!2331 base!8)) (currentByte!4645 base!8) (currentBit!4640 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92185 () Bool)

(declare-fun res!76099 () Bool)

(assert (=> b!92185 (=> (not res!76099) (not e!60600))))

(assert (=> b!92185 (= res!76099 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92186 () Bool)

(declare-fun res!76098 () Bool)

(assert (=> b!92186 (=> (not res!76098) (not e!60600))))

(assert (=> b!92186 (= res!76098 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8))) (bitIndex!0 (size!1950 (buf!2331 bitStream2!8)) (currentByte!4645 bitStream2!8) (currentBit!4640 bitStream2!8))))))

(declare-fun b!92187 () Bool)

(assert (=> b!92187 (= e!60602 (array_inv!1787 (buf!2331 bitStream1!8)))))

(declare-fun b!92188 () Bool)

(assert (=> b!92188 (= e!60603 (array_inv!1787 (buf!2331 base!8)))))

(declare-fun b!92189 () Bool)

(declare-fun res!76095 () Bool)

(assert (=> b!92189 (=> (not res!76095) (not e!60600))))

(assert (=> b!92189 (= res!76095 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92190 () Bool)

(declare-fun res!76096 () Bool)

(assert (=> b!92190 (=> (not res!76096) (not e!60600))))

(declare-datatypes ((List!828 0))(
  ( (Nil!825) (Cons!824 (h!943 Bool) (t!1578 List!828)) )
))
(declare-fun listBits!13 () List!828)

(declare-fun length!419 (List!828) Int)

(assert (=> b!92190 (= res!76096 (> (length!419 listBits!13) 0))))

(declare-fun b!92191 () Bool)

(assert (=> b!92191 (= e!60600 (and (bvsle ((_ sign_extend 32) (size!1950 (buf!2331 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4645 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4640 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1950 (buf!2331 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4645 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4640 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!18576 res!76101) b!92190))

(assert (= (and b!92190 res!76096) b!92185))

(assert (= (and b!92185 res!76099) b!92189))

(assert (= (and b!92189 res!76095) b!92181))

(assert (= (and b!92181 res!76100) b!92183))

(assert (= (and b!92183 res!76097) b!92184))

(assert (= (and b!92184 res!76102) b!92186))

(assert (= (and b!92186 res!76098) b!92191))

(assert (= start!18576 b!92187))

(assert (= start!18576 b!92182))

(assert (= start!18576 b!92188))

(declare-fun m!136201 () Bool)

(assert (=> start!18576 m!136201))

(declare-fun m!136203 () Bool)

(assert (=> start!18576 m!136203))

(declare-fun m!136205 () Bool)

(assert (=> start!18576 m!136205))

(declare-fun m!136207 () Bool)

(assert (=> b!92190 m!136207))

(declare-fun m!136209 () Bool)

(assert (=> b!92182 m!136209))

(declare-fun m!136211 () Bool)

(assert (=> b!92185 m!136211))

(declare-fun m!136213 () Bool)

(assert (=> b!92184 m!136213))

(declare-fun m!136215 () Bool)

(assert (=> b!92188 m!136215))

(declare-fun m!136217 () Bool)

(assert (=> b!92187 m!136217))

(declare-fun m!136219 () Bool)

(assert (=> b!92189 m!136219))

(declare-fun m!136221 () Bool)

(assert (=> b!92181 m!136221))

(declare-fun m!136223 () Bool)

(assert (=> b!92186 m!136223))

(declare-fun m!136225 () Bool)

(assert (=> b!92186 m!136225))

(check-sat (not b!92189) (not b!92190) (not b!92182) (not b!92181) (not b!92188) (not b!92184) (not b!92187) (not b!92185) (not b!92186) (not start!18576))
(check-sat)
(get-model)

(declare-fun d!28700 () Bool)

(declare-fun res!76133 () Bool)

(declare-fun e!60632 () Bool)

(assert (=> d!28700 (=> (not res!76133) (not e!60632))))

(assert (=> d!28700 (= res!76133 (= (size!1950 (buf!2331 bitStream1!8)) (size!1950 (buf!2331 base!8))))))

(assert (=> d!28700 (= (isPrefixOf!0 bitStream1!8 base!8) e!60632)))

(declare-fun b!92231 () Bool)

(declare-fun res!76135 () Bool)

(assert (=> b!92231 (=> (not res!76135) (not e!60632))))

(assert (=> b!92231 (= res!76135 (bvsle (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8)) (bitIndex!0 (size!1950 (buf!2331 base!8)) (currentByte!4645 base!8) (currentBit!4640 base!8))))))

(declare-fun b!92232 () Bool)

(declare-fun e!60633 () Bool)

(assert (=> b!92232 (= e!60632 e!60633)))

(declare-fun res!76134 () Bool)

(assert (=> b!92232 (=> res!76134 e!60633)))

(assert (=> b!92232 (= res!76134 (= (size!1950 (buf!2331 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92233 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4316 array!4316 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92233 (= e!60633 (arrayBitRangesEq!0 (buf!2331 bitStream1!8) (buf!2331 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8))))))

(assert (= (and d!28700 res!76133) b!92231))

(assert (= (and b!92231 res!76135) b!92232))

(assert (= (and b!92232 (not res!76134)) b!92233))

(assert (=> b!92231 m!136223))

(assert (=> b!92231 m!136213))

(assert (=> b!92233 m!136223))

(assert (=> b!92233 m!136223))

(declare-fun m!136253 () Bool)

(assert (=> b!92233 m!136253))

(assert (=> b!92185 d!28700))

(declare-fun d!28702 () Bool)

(declare-fun size!1952 (List!828) Int)

(assert (=> d!28702 (= (length!419 listBits!13) (size!1952 listBits!13))))

(declare-fun bs!7079 () Bool)

(assert (= bs!7079 d!28702))

(declare-fun m!136255 () Bool)

(assert (=> bs!7079 m!136255))

(assert (=> b!92190 d!28702))

(declare-fun d!28704 () Bool)

(declare-fun e!60638 () Bool)

(assert (=> d!28704 e!60638))

(declare-fun res!76143 () Bool)

(assert (=> d!28704 (=> (not res!76143) (not e!60638))))

(declare-fun lt!138053 () (_ BitVec 64))

(declare-fun lt!138052 () (_ BitVec 64))

(declare-fun lt!138056 () (_ BitVec 64))

(assert (=> d!28704 (= res!76143 (= lt!138053 (bvsub lt!138052 lt!138056)))))

(assert (=> d!28704 (or (= (bvand lt!138052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138056 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138052 lt!138056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28704 (= lt!138056 (remainingBits!0 ((_ sign_extend 32) (size!1950 (buf!2331 base!8))) ((_ sign_extend 32) (currentByte!4645 base!8)) ((_ sign_extend 32) (currentBit!4640 base!8))))))

(declare-fun lt!138051 () (_ BitVec 64))

(declare-fun lt!138054 () (_ BitVec 64))

(assert (=> d!28704 (= lt!138052 (bvmul lt!138051 lt!138054))))

(assert (=> d!28704 (or (= lt!138051 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138054 (bvsdiv (bvmul lt!138051 lt!138054) lt!138051)))))

(assert (=> d!28704 (= lt!138054 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28704 (= lt!138051 ((_ sign_extend 32) (size!1950 (buf!2331 base!8))))))

(assert (=> d!28704 (= lt!138053 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4645 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4640 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!28704 (invariant!0 (currentBit!4640 base!8) (currentByte!4645 base!8) (size!1950 (buf!2331 base!8)))))

(assert (=> d!28704 (= (bitIndex!0 (size!1950 (buf!2331 base!8)) (currentByte!4645 base!8) (currentBit!4640 base!8)) lt!138053)))

(declare-fun b!92238 () Bool)

(declare-fun res!76142 () Bool)

(assert (=> b!92238 (=> (not res!76142) (not e!60638))))

(assert (=> b!92238 (= res!76142 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138053))))

(declare-fun b!92239 () Bool)

(declare-fun lt!138055 () (_ BitVec 64))

(assert (=> b!92239 (= e!60638 (bvsle lt!138053 (bvmul lt!138055 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92239 (or (= lt!138055 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138055 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138055)))))

(assert (=> b!92239 (= lt!138055 ((_ sign_extend 32) (size!1950 (buf!2331 base!8))))))

(assert (= (and d!28704 res!76143) b!92238))

(assert (= (and b!92238 res!76142) b!92239))

(declare-fun m!136257 () Bool)

(assert (=> d!28704 m!136257))

(declare-fun m!136259 () Bool)

(assert (=> d!28704 m!136259))

(assert (=> b!92184 d!28704))

(declare-fun d!28708 () Bool)

(declare-fun res!76146 () Bool)

(declare-fun e!60639 () Bool)

(assert (=> d!28708 (=> (not res!76146) (not e!60639))))

(assert (=> d!28708 (= res!76146 (= (size!1950 (buf!2331 bitStream2!8)) (size!1950 (buf!2331 base!8))))))

(assert (=> d!28708 (= (isPrefixOf!0 bitStream2!8 base!8) e!60639)))

(declare-fun b!92244 () Bool)

(declare-fun res!76148 () Bool)

(assert (=> b!92244 (=> (not res!76148) (not e!60639))))

(assert (=> b!92244 (= res!76148 (bvsle (bitIndex!0 (size!1950 (buf!2331 bitStream2!8)) (currentByte!4645 bitStream2!8) (currentBit!4640 bitStream2!8)) (bitIndex!0 (size!1950 (buf!2331 base!8)) (currentByte!4645 base!8) (currentBit!4640 base!8))))))

(declare-fun b!92245 () Bool)

(declare-fun e!60640 () Bool)

(assert (=> b!92245 (= e!60639 e!60640)))

(declare-fun res!76147 () Bool)

(assert (=> b!92245 (=> res!76147 e!60640)))

(assert (=> b!92245 (= res!76147 (= (size!1950 (buf!2331 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!92246 () Bool)

(assert (=> b!92246 (= e!60640 (arrayBitRangesEq!0 (buf!2331 bitStream2!8) (buf!2331 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream2!8)) (currentByte!4645 bitStream2!8) (currentBit!4640 bitStream2!8))))))

(assert (= (and d!28708 res!76146) b!92244))

(assert (= (and b!92244 res!76148) b!92245))

(assert (= (and b!92245 (not res!76147)) b!92246))

(assert (=> b!92244 m!136225))

(assert (=> b!92244 m!136213))

(assert (=> b!92246 m!136225))

(assert (=> b!92246 m!136225))

(declare-fun m!136261 () Bool)

(assert (=> b!92246 m!136261))

(assert (=> b!92189 d!28708))

(declare-fun d!28710 () Bool)

(assert (=> d!28710 (= (array_inv!1787 (buf!2331 base!8)) (bvsge (size!1950 (buf!2331 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!92188 d!28710))

(declare-fun d!28712 () Bool)

(assert (=> d!28712 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4640 bitStream1!8) (currentByte!4645 bitStream1!8) (size!1950 (buf!2331 bitStream1!8))))))

(declare-fun bs!7080 () Bool)

(assert (= bs!7080 d!28712))

(declare-fun m!136267 () Bool)

(assert (=> bs!7080 m!136267))

(assert (=> start!18576 d!28712))

(declare-fun d!28716 () Bool)

(assert (=> d!28716 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4640 bitStream2!8) (currentByte!4645 bitStream2!8) (size!1950 (buf!2331 bitStream2!8))))))

(declare-fun bs!7081 () Bool)

(assert (= bs!7081 d!28716))

(declare-fun m!136269 () Bool)

(assert (=> bs!7081 m!136269))

(assert (=> start!18576 d!28716))

(declare-fun d!28718 () Bool)

(assert (=> d!28718 (= (inv!12 base!8) (invariant!0 (currentBit!4640 base!8) (currentByte!4645 base!8) (size!1950 (buf!2331 base!8))))))

(declare-fun bs!7082 () Bool)

(assert (= bs!7082 d!28718))

(assert (=> bs!7082 m!136259))

(assert (=> start!18576 d!28718))

(declare-fun d!28720 () Bool)

(assert (=> d!28720 (= (array_inv!1787 (buf!2331 bitStream2!8)) (bvsge (size!1950 (buf!2331 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!92182 d!28720))

(declare-fun d!28722 () Bool)

(assert (=> d!28722 (= (array_inv!1787 (buf!2331 bitStream1!8)) (bvsge (size!1950 (buf!2331 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!92187 d!28722))

(declare-fun d!28724 () Bool)

(declare-fun res!76151 () Bool)

(declare-fun e!60642 () Bool)

(assert (=> d!28724 (=> (not res!76151) (not e!60642))))

(assert (=> d!28724 (= res!76151 (= (size!1950 (buf!2331 bitStream1!8)) (size!1950 (buf!2331 bitStream2!8))))))

(assert (=> d!28724 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60642)))

(declare-fun b!92249 () Bool)

(declare-fun res!76153 () Bool)

(assert (=> b!92249 (=> (not res!76153) (not e!60642))))

(assert (=> b!92249 (= res!76153 (bvsle (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8)) (bitIndex!0 (size!1950 (buf!2331 bitStream2!8)) (currentByte!4645 bitStream2!8) (currentBit!4640 bitStream2!8))))))

(declare-fun b!92250 () Bool)

(declare-fun e!60643 () Bool)

(assert (=> b!92250 (= e!60642 e!60643)))

(declare-fun res!76152 () Bool)

(assert (=> b!92250 (=> res!76152 e!60643)))

(assert (=> b!92250 (= res!76152 (= (size!1950 (buf!2331 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92251 () Bool)

(assert (=> b!92251 (= e!60643 (arrayBitRangesEq!0 (buf!2331 bitStream1!8) (buf!2331 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8))))))

(assert (= (and d!28724 res!76151) b!92249))

(assert (= (and b!92249 res!76153) b!92250))

(assert (= (and b!92250 (not res!76152)) b!92251))

(assert (=> b!92249 m!136223))

(assert (=> b!92249 m!136225))

(assert (=> b!92251 m!136223))

(assert (=> b!92251 m!136223))

(declare-fun m!136271 () Bool)

(assert (=> b!92251 m!136271))

(assert (=> b!92181 d!28724))

(declare-fun d!28726 () Bool)

(declare-fun e!60644 () Bool)

(assert (=> d!28726 e!60644))

(declare-fun res!76155 () Bool)

(assert (=> d!28726 (=> (not res!76155) (not e!60644))))

(declare-fun lt!138069 () (_ BitVec 64))

(declare-fun lt!138072 () (_ BitVec 64))

(declare-fun lt!138068 () (_ BitVec 64))

(assert (=> d!28726 (= res!76155 (= lt!138069 (bvsub lt!138068 lt!138072)))))

(assert (=> d!28726 (or (= (bvand lt!138068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138072 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138068 lt!138072) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28726 (= lt!138072 (remainingBits!0 ((_ sign_extend 32) (size!1950 (buf!2331 bitStream1!8))) ((_ sign_extend 32) (currentByte!4645 bitStream1!8)) ((_ sign_extend 32) (currentBit!4640 bitStream1!8))))))

(declare-fun lt!138067 () (_ BitVec 64))

(declare-fun lt!138070 () (_ BitVec 64))

(assert (=> d!28726 (= lt!138068 (bvmul lt!138067 lt!138070))))

(assert (=> d!28726 (or (= lt!138067 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138070 (bvsdiv (bvmul lt!138067 lt!138070) lt!138067)))))

(assert (=> d!28726 (= lt!138070 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28726 (= lt!138067 ((_ sign_extend 32) (size!1950 (buf!2331 bitStream1!8))))))

(assert (=> d!28726 (= lt!138069 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4645 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4640 bitStream1!8))))))

(assert (=> d!28726 (invariant!0 (currentBit!4640 bitStream1!8) (currentByte!4645 bitStream1!8) (size!1950 (buf!2331 bitStream1!8)))))

(assert (=> d!28726 (= (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8)) lt!138069)))

(declare-fun b!92252 () Bool)

(declare-fun res!76154 () Bool)

(assert (=> b!92252 (=> (not res!76154) (not e!60644))))

(assert (=> b!92252 (= res!76154 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138069))))

(declare-fun b!92253 () Bool)

(declare-fun lt!138071 () (_ BitVec 64))

(assert (=> b!92253 (= e!60644 (bvsle lt!138069 (bvmul lt!138071 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92253 (or (= lt!138071 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138071 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138071)))))

(assert (=> b!92253 (= lt!138071 ((_ sign_extend 32) (size!1950 (buf!2331 bitStream1!8))))))

(assert (= (and d!28726 res!76155) b!92252))

(assert (= (and b!92252 res!76154) b!92253))

(declare-fun m!136273 () Bool)

(assert (=> d!28726 m!136273))

(assert (=> d!28726 m!136267))

(assert (=> b!92186 d!28726))

(declare-fun d!28728 () Bool)

(declare-fun e!60645 () Bool)

(assert (=> d!28728 e!60645))

(declare-fun res!76157 () Bool)

(assert (=> d!28728 (=> (not res!76157) (not e!60645))))

(declare-fun lt!138075 () (_ BitVec 64))

(declare-fun lt!138074 () (_ BitVec 64))

(declare-fun lt!138078 () (_ BitVec 64))

(assert (=> d!28728 (= res!76157 (= lt!138075 (bvsub lt!138074 lt!138078)))))

(assert (=> d!28728 (or (= (bvand lt!138074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138074 lt!138078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28728 (= lt!138078 (remainingBits!0 ((_ sign_extend 32) (size!1950 (buf!2331 bitStream2!8))) ((_ sign_extend 32) (currentByte!4645 bitStream2!8)) ((_ sign_extend 32) (currentBit!4640 bitStream2!8))))))

(declare-fun lt!138073 () (_ BitVec 64))

(declare-fun lt!138076 () (_ BitVec 64))

(assert (=> d!28728 (= lt!138074 (bvmul lt!138073 lt!138076))))

(assert (=> d!28728 (or (= lt!138073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138076 (bvsdiv (bvmul lt!138073 lt!138076) lt!138073)))))

(assert (=> d!28728 (= lt!138076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28728 (= lt!138073 ((_ sign_extend 32) (size!1950 (buf!2331 bitStream2!8))))))

(assert (=> d!28728 (= lt!138075 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4645 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4640 bitStream2!8))))))

(assert (=> d!28728 (invariant!0 (currentBit!4640 bitStream2!8) (currentByte!4645 bitStream2!8) (size!1950 (buf!2331 bitStream2!8)))))

(assert (=> d!28728 (= (bitIndex!0 (size!1950 (buf!2331 bitStream2!8)) (currentByte!4645 bitStream2!8) (currentBit!4640 bitStream2!8)) lt!138075)))

(declare-fun b!92254 () Bool)

(declare-fun res!76156 () Bool)

(assert (=> b!92254 (=> (not res!76156) (not e!60645))))

(assert (=> b!92254 (= res!76156 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138075))))

(declare-fun b!92255 () Bool)

(declare-fun lt!138077 () (_ BitVec 64))

(assert (=> b!92255 (= e!60645 (bvsle lt!138075 (bvmul lt!138077 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92255 (or (= lt!138077 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138077 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138077)))))

(assert (=> b!92255 (= lt!138077 ((_ sign_extend 32) (size!1950 (buf!2331 bitStream2!8))))))

(assert (= (and d!28728 res!76157) b!92254))

(assert (= (and b!92254 res!76156) b!92255))

(declare-fun m!136275 () Bool)

(assert (=> d!28728 m!136275))

(assert (=> d!28728 m!136269))

(assert (=> b!92186 d!28728))

(check-sat (not b!92233) (not d!28728) (not d!28702) (not b!92249) (not b!92251) (not d!28718) (not b!92231) (not d!28726) (not b!92244) (not d!28716) (not d!28704) (not d!28712) (not b!92246))
(check-sat)
(get-model)

(declare-fun d!28778 () Bool)

(assert (=> d!28778 (= (remainingBits!0 ((_ sign_extend 32) (size!1950 (buf!2331 base!8))) ((_ sign_extend 32) (currentByte!4645 base!8)) ((_ sign_extend 32) (currentBit!4640 base!8))) (bvsub (bvmul ((_ sign_extend 32) (size!1950 (buf!2331 base!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4645 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4640 base!8)))))))

(assert (=> d!28704 d!28778))

(declare-fun d!28780 () Bool)

(assert (=> d!28780 (= (invariant!0 (currentBit!4640 base!8) (currentByte!4645 base!8) (size!1950 (buf!2331 base!8))) (and (bvsge (currentBit!4640 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4640 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4645 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4645 base!8) (size!1950 (buf!2331 base!8))) (and (= (currentBit!4640 base!8) #b00000000000000000000000000000000) (= (currentByte!4645 base!8) (size!1950 (buf!2331 base!8)))))))))

(assert (=> d!28704 d!28780))

(declare-fun d!28782 () Bool)

(assert (=> d!28782 (= (remainingBits!0 ((_ sign_extend 32) (size!1950 (buf!2331 bitStream1!8))) ((_ sign_extend 32) (currentByte!4645 bitStream1!8)) ((_ sign_extend 32) (currentBit!4640 bitStream1!8))) (bvsub (bvmul ((_ sign_extend 32) (size!1950 (buf!2331 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4645 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4640 bitStream1!8)))))))

(assert (=> d!28726 d!28782))

(declare-fun d!28784 () Bool)

(assert (=> d!28784 (= (invariant!0 (currentBit!4640 bitStream1!8) (currentByte!4645 bitStream1!8) (size!1950 (buf!2331 bitStream1!8))) (and (bvsge (currentBit!4640 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4640 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4645 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4645 bitStream1!8) (size!1950 (buf!2331 bitStream1!8))) (and (= (currentBit!4640 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4645 bitStream1!8) (size!1950 (buf!2331 bitStream1!8)))))))))

(assert (=> d!28726 d!28784))

(declare-fun d!28786 () Bool)

(declare-fun res!76212 () Bool)

(declare-fun e!60688 () Bool)

(assert (=> d!28786 (=> res!76212 e!60688)))

(assert (=> d!28786 (= res!76212 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8))))))

(assert (=> d!28786 (= (arrayBitRangesEq!0 (buf!2331 bitStream1!8) (buf!2331 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8))) e!60688)))

(declare-fun b!92314 () Bool)

(declare-fun e!60689 () Bool)

(assert (=> b!92314 (= e!60688 e!60689)))

(declare-fun res!76213 () Bool)

(assert (=> b!92314 (=> (not res!76213) (not e!60689))))

(declare-fun e!60686 () Bool)

(assert (=> b!92314 (= res!76213 e!60686)))

(declare-fun res!76214 () Bool)

(assert (=> b!92314 (=> res!76214 e!60686)))

(declare-datatypes ((tuple4!48 0))(
  ( (tuple4!49 (_1!4054 (_ BitVec 32)) (_2!4054 (_ BitVec 32)) (_3!245 (_ BitVec 32)) (_4!24 (_ BitVec 32))) )
))
(declare-fun lt!138128 () tuple4!48)

(assert (=> b!92314 (= res!76214 (bvsge (_1!4054 lt!138128) (_2!4054 lt!138128)))))

(declare-fun lt!138127 () (_ BitVec 32))

(assert (=> b!92314 (= lt!138127 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!138129 () (_ BitVec 32))

(assert (=> b!92314 (= lt!138129 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!48)

(assert (=> b!92314 (= lt!138128 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8))))))

(declare-fun b!92315 () Bool)

(declare-fun e!60685 () Bool)

(assert (=> b!92315 (= e!60689 e!60685)))

(declare-fun c!5888 () Bool)

(assert (=> b!92315 (= c!5888 (= (_3!245 lt!138128) (_4!24 lt!138128)))))

(declare-fun b!92316 () Bool)

(declare-fun arrayRangesEq!25 (array!4316 array!4316 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92316 (= e!60686 (arrayRangesEq!25 (buf!2331 bitStream1!8) (buf!2331 base!8) (_1!4054 lt!138128) (_2!4054 lt!138128)))))

(declare-fun call!1152 () Bool)

(declare-fun bm!1149 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1149 (= call!1152 (byteRangesEq!0 (select (arr!2578 (buf!2331 bitStream1!8)) (_3!245 lt!138128)) (select (arr!2578 (buf!2331 base!8)) (_3!245 lt!138128)) lt!138129 (ite c!5888 lt!138127 #b00000000000000000000000000001000)))))

(declare-fun b!92317 () Bool)

(declare-fun res!76215 () Bool)

(assert (=> b!92317 (= res!76215 (= lt!138127 #b00000000000000000000000000000000))))

(declare-fun e!60690 () Bool)

(assert (=> b!92317 (=> res!76215 e!60690)))

(declare-fun e!60687 () Bool)

(assert (=> b!92317 (= e!60687 e!60690)))

(declare-fun b!92318 () Bool)

(assert (=> b!92318 (= e!60690 (byteRangesEq!0 (select (arr!2578 (buf!2331 bitStream1!8)) (_4!24 lt!138128)) (select (arr!2578 (buf!2331 base!8)) (_4!24 lt!138128)) #b00000000000000000000000000000000 lt!138127))))

(declare-fun b!92319 () Bool)

(assert (=> b!92319 (= e!60685 e!60687)))

(declare-fun res!76216 () Bool)

(assert (=> b!92319 (= res!76216 call!1152)))

(assert (=> b!92319 (=> (not res!76216) (not e!60687))))

(declare-fun b!92320 () Bool)

(assert (=> b!92320 (= e!60685 call!1152)))

(assert (= (and d!28786 (not res!76212)) b!92314))

(assert (= (and b!92314 (not res!76214)) b!92316))

(assert (= (and b!92314 res!76213) b!92315))

(assert (= (and b!92315 c!5888) b!92320))

(assert (= (and b!92315 (not c!5888)) b!92319))

(assert (= (and b!92319 res!76216) b!92317))

(assert (= (and b!92317 (not res!76215)) b!92318))

(assert (= (or b!92320 b!92319) bm!1149))

(assert (=> b!92314 m!136223))

(declare-fun m!136313 () Bool)

(assert (=> b!92314 m!136313))

(declare-fun m!136315 () Bool)

(assert (=> b!92316 m!136315))

(declare-fun m!136317 () Bool)

(assert (=> bm!1149 m!136317))

(declare-fun m!136319 () Bool)

(assert (=> bm!1149 m!136319))

(assert (=> bm!1149 m!136317))

(assert (=> bm!1149 m!136319))

(declare-fun m!136321 () Bool)

(assert (=> bm!1149 m!136321))

(declare-fun m!136323 () Bool)

(assert (=> b!92318 m!136323))

(declare-fun m!136325 () Bool)

(assert (=> b!92318 m!136325))

(assert (=> b!92318 m!136323))

(assert (=> b!92318 m!136325))

(declare-fun m!136327 () Bool)

(assert (=> b!92318 m!136327))

(assert (=> b!92233 d!28786))

(assert (=> b!92233 d!28726))

(declare-fun d!28788 () Bool)

(assert (=> d!28788 (= (invariant!0 (currentBit!4640 bitStream2!8) (currentByte!4645 bitStream2!8) (size!1950 (buf!2331 bitStream2!8))) (and (bvsge (currentBit!4640 bitStream2!8) #b00000000000000000000000000000000) (bvslt (currentBit!4640 bitStream2!8) #b00000000000000000000000000001000) (bvsge (currentByte!4645 bitStream2!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4645 bitStream2!8) (size!1950 (buf!2331 bitStream2!8))) (and (= (currentBit!4640 bitStream2!8) #b00000000000000000000000000000000) (= (currentByte!4645 bitStream2!8) (size!1950 (buf!2331 bitStream2!8)))))))))

(assert (=> d!28716 d!28788))

(assert (=> b!92231 d!28726))

(assert (=> b!92231 d!28704))

(declare-fun d!28790 () Bool)

(declare-fun res!76217 () Bool)

(declare-fun e!60694 () Bool)

(assert (=> d!28790 (=> res!76217 e!60694)))

(assert (=> d!28790 (= res!76217 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8))))))

(assert (=> d!28790 (= (arrayBitRangesEq!0 (buf!2331 bitStream1!8) (buf!2331 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8))) e!60694)))

(declare-fun b!92321 () Bool)

(declare-fun e!60695 () Bool)

(assert (=> b!92321 (= e!60694 e!60695)))

(declare-fun res!76218 () Bool)

(assert (=> b!92321 (=> (not res!76218) (not e!60695))))

(declare-fun e!60692 () Bool)

(assert (=> b!92321 (= res!76218 e!60692)))

(declare-fun res!76219 () Bool)

(assert (=> b!92321 (=> res!76219 e!60692)))

(declare-fun lt!138131 () tuple4!48)

(assert (=> b!92321 (= res!76219 (bvsge (_1!4054 lt!138131) (_2!4054 lt!138131)))))

(declare-fun lt!138130 () (_ BitVec 32))

(assert (=> b!92321 (= lt!138130 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!138132 () (_ BitVec 32))

(assert (=> b!92321 (= lt!138132 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92321 (= lt!138131 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream1!8)) (currentByte!4645 bitStream1!8) (currentBit!4640 bitStream1!8))))))

(declare-fun b!92322 () Bool)

(declare-fun e!60691 () Bool)

(assert (=> b!92322 (= e!60695 e!60691)))

(declare-fun c!5889 () Bool)

(assert (=> b!92322 (= c!5889 (= (_3!245 lt!138131) (_4!24 lt!138131)))))

(declare-fun b!92323 () Bool)

(assert (=> b!92323 (= e!60692 (arrayRangesEq!25 (buf!2331 bitStream1!8) (buf!2331 bitStream2!8) (_1!4054 lt!138131) (_2!4054 lt!138131)))))

(declare-fun bm!1150 () Bool)

(declare-fun call!1153 () Bool)

(assert (=> bm!1150 (= call!1153 (byteRangesEq!0 (select (arr!2578 (buf!2331 bitStream1!8)) (_3!245 lt!138131)) (select (arr!2578 (buf!2331 bitStream2!8)) (_3!245 lt!138131)) lt!138132 (ite c!5889 lt!138130 #b00000000000000000000000000001000)))))

(declare-fun b!92324 () Bool)

(declare-fun res!76220 () Bool)

(assert (=> b!92324 (= res!76220 (= lt!138130 #b00000000000000000000000000000000))))

(declare-fun e!60696 () Bool)

(assert (=> b!92324 (=> res!76220 e!60696)))

(declare-fun e!60693 () Bool)

(assert (=> b!92324 (= e!60693 e!60696)))

(declare-fun b!92325 () Bool)

(assert (=> b!92325 (= e!60696 (byteRangesEq!0 (select (arr!2578 (buf!2331 bitStream1!8)) (_4!24 lt!138131)) (select (arr!2578 (buf!2331 bitStream2!8)) (_4!24 lt!138131)) #b00000000000000000000000000000000 lt!138130))))

(declare-fun b!92326 () Bool)

(assert (=> b!92326 (= e!60691 e!60693)))

(declare-fun res!76221 () Bool)

(assert (=> b!92326 (= res!76221 call!1153)))

(assert (=> b!92326 (=> (not res!76221) (not e!60693))))

(declare-fun b!92327 () Bool)

(assert (=> b!92327 (= e!60691 call!1153)))

(assert (= (and d!28790 (not res!76217)) b!92321))

(assert (= (and b!92321 (not res!76219)) b!92323))

(assert (= (and b!92321 res!76218) b!92322))

(assert (= (and b!92322 c!5889) b!92327))

(assert (= (and b!92322 (not c!5889)) b!92326))

(assert (= (and b!92326 res!76221) b!92324))

(assert (= (and b!92324 (not res!76220)) b!92325))

(assert (= (or b!92327 b!92326) bm!1150))

(assert (=> b!92321 m!136223))

(assert (=> b!92321 m!136313))

(declare-fun m!136329 () Bool)

(assert (=> b!92323 m!136329))

(declare-fun m!136331 () Bool)

(assert (=> bm!1150 m!136331))

(declare-fun m!136333 () Bool)

(assert (=> bm!1150 m!136333))

(assert (=> bm!1150 m!136331))

(assert (=> bm!1150 m!136333))

(declare-fun m!136335 () Bool)

(assert (=> bm!1150 m!136335))

(declare-fun m!136337 () Bool)

(assert (=> b!92325 m!136337))

(declare-fun m!136339 () Bool)

(assert (=> b!92325 m!136339))

(assert (=> b!92325 m!136337))

(assert (=> b!92325 m!136339))

(declare-fun m!136341 () Bool)

(assert (=> b!92325 m!136341))

(assert (=> b!92251 d!28790))

(assert (=> b!92251 d!28726))

(declare-fun d!28792 () Bool)

(declare-fun res!76222 () Bool)

(declare-fun e!60700 () Bool)

(assert (=> d!28792 (=> res!76222 e!60700)))

(assert (=> d!28792 (= res!76222 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream2!8)) (currentByte!4645 bitStream2!8) (currentBit!4640 bitStream2!8))))))

(assert (=> d!28792 (= (arrayBitRangesEq!0 (buf!2331 bitStream2!8) (buf!2331 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream2!8)) (currentByte!4645 bitStream2!8) (currentBit!4640 bitStream2!8))) e!60700)))

(declare-fun b!92328 () Bool)

(declare-fun e!60701 () Bool)

(assert (=> b!92328 (= e!60700 e!60701)))

(declare-fun res!76223 () Bool)

(assert (=> b!92328 (=> (not res!76223) (not e!60701))))

(declare-fun e!60698 () Bool)

(assert (=> b!92328 (= res!76223 e!60698)))

(declare-fun res!76224 () Bool)

(assert (=> b!92328 (=> res!76224 e!60698)))

(declare-fun lt!138134 () tuple4!48)

(assert (=> b!92328 (= res!76224 (bvsge (_1!4054 lt!138134) (_2!4054 lt!138134)))))

(declare-fun lt!138133 () (_ BitVec 32))

(assert (=> b!92328 (= lt!138133 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1950 (buf!2331 bitStream2!8)) (currentByte!4645 bitStream2!8) (currentBit!4640 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!138135 () (_ BitVec 32))

(assert (=> b!92328 (= lt!138135 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92328 (= lt!138134 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1950 (buf!2331 bitStream2!8)) (currentByte!4645 bitStream2!8) (currentBit!4640 bitStream2!8))))))

(declare-fun b!92329 () Bool)

(declare-fun e!60697 () Bool)

(assert (=> b!92329 (= e!60701 e!60697)))

(declare-fun c!5890 () Bool)

(assert (=> b!92329 (= c!5890 (= (_3!245 lt!138134) (_4!24 lt!138134)))))

(declare-fun b!92330 () Bool)

(assert (=> b!92330 (= e!60698 (arrayRangesEq!25 (buf!2331 bitStream2!8) (buf!2331 base!8) (_1!4054 lt!138134) (_2!4054 lt!138134)))))

(declare-fun call!1154 () Bool)

(declare-fun bm!1151 () Bool)

(assert (=> bm!1151 (= call!1154 (byteRangesEq!0 (select (arr!2578 (buf!2331 bitStream2!8)) (_3!245 lt!138134)) (select (arr!2578 (buf!2331 base!8)) (_3!245 lt!138134)) lt!138135 (ite c!5890 lt!138133 #b00000000000000000000000000001000)))))

(declare-fun b!92331 () Bool)

(declare-fun res!76225 () Bool)

(assert (=> b!92331 (= res!76225 (= lt!138133 #b00000000000000000000000000000000))))

(declare-fun e!60702 () Bool)

(assert (=> b!92331 (=> res!76225 e!60702)))

(declare-fun e!60699 () Bool)

(assert (=> b!92331 (= e!60699 e!60702)))

(declare-fun b!92332 () Bool)

(assert (=> b!92332 (= e!60702 (byteRangesEq!0 (select (arr!2578 (buf!2331 bitStream2!8)) (_4!24 lt!138134)) (select (arr!2578 (buf!2331 base!8)) (_4!24 lt!138134)) #b00000000000000000000000000000000 lt!138133))))

(declare-fun b!92333 () Bool)

(assert (=> b!92333 (= e!60697 e!60699)))

(declare-fun res!76226 () Bool)

(assert (=> b!92333 (= res!76226 call!1154)))

(assert (=> b!92333 (=> (not res!76226) (not e!60699))))

(declare-fun b!92334 () Bool)

(assert (=> b!92334 (= e!60697 call!1154)))

(assert (= (and d!28792 (not res!76222)) b!92328))

(assert (= (and b!92328 (not res!76224)) b!92330))

(assert (= (and b!92328 res!76223) b!92329))

(assert (= (and b!92329 c!5890) b!92334))

(assert (= (and b!92329 (not c!5890)) b!92333))

(assert (= (and b!92333 res!76226) b!92331))

(assert (= (and b!92331 (not res!76225)) b!92332))

(assert (= (or b!92334 b!92333) bm!1151))

(assert (=> b!92328 m!136225))

(declare-fun m!136343 () Bool)

(assert (=> b!92328 m!136343))

(declare-fun m!136345 () Bool)

(assert (=> b!92330 m!136345))

(declare-fun m!136347 () Bool)

(assert (=> bm!1151 m!136347))

(declare-fun m!136349 () Bool)

(assert (=> bm!1151 m!136349))

(assert (=> bm!1151 m!136347))

(assert (=> bm!1151 m!136349))

(declare-fun m!136351 () Bool)

(assert (=> bm!1151 m!136351))

(declare-fun m!136353 () Bool)

(assert (=> b!92332 m!136353))

(declare-fun m!136355 () Bool)

(assert (=> b!92332 m!136355))

(assert (=> b!92332 m!136353))

(assert (=> b!92332 m!136355))

(declare-fun m!136357 () Bool)

(assert (=> b!92332 m!136357))

(assert (=> b!92246 d!28792))

(assert (=> b!92246 d!28728))

(assert (=> d!28712 d!28784))

(declare-fun d!28794 () Bool)

(assert (=> d!28794 (= (remainingBits!0 ((_ sign_extend 32) (size!1950 (buf!2331 bitStream2!8))) ((_ sign_extend 32) (currentByte!4645 bitStream2!8)) ((_ sign_extend 32) (currentBit!4640 bitStream2!8))) (bvsub (bvmul ((_ sign_extend 32) (size!1950 (buf!2331 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4645 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4640 bitStream2!8)))))))

(assert (=> d!28728 d!28794))

(assert (=> d!28728 d!28788))

(assert (=> b!92249 d!28726))

(assert (=> b!92249 d!28728))

(assert (=> b!92244 d!28728))

(assert (=> b!92244 d!28704))

(declare-fun d!28796 () Bool)

(declare-fun lt!138138 () Int)

(assert (=> d!28796 (>= lt!138138 0)))

(declare-fun e!60705 () Int)

(assert (=> d!28796 (= lt!138138 e!60705)))

(declare-fun c!5893 () Bool)

(get-info :version)

(assert (=> d!28796 (= c!5893 ((_ is Nil!825) listBits!13))))

(assert (=> d!28796 (= (size!1952 listBits!13) lt!138138)))

(declare-fun b!92339 () Bool)

(assert (=> b!92339 (= e!60705 0)))

(declare-fun b!92340 () Bool)

(assert (=> b!92340 (= e!60705 (+ 1 (size!1952 (t!1578 listBits!13))))))

(assert (= (and d!28796 c!5893) b!92339))

(assert (= (and d!28796 (not c!5893)) b!92340))

(declare-fun m!136359 () Bool)

(assert (=> b!92340 m!136359))

(assert (=> d!28702 d!28796))

(assert (=> d!28718 d!28780))

(check-sat (not b!92340) (not b!92328) (not bm!1151) (not b!92314) (not b!92318) (not b!92330) (not b!92323) (not bm!1150) (not bm!1149) (not b!92316) (not b!92325) (not b!92332) (not b!92321))
(check-sat)
