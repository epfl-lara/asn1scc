; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16374 () Bool)

(assert start!16374)

(declare-fun b!81914 () Bool)

(declare-fun res!67545 () Bool)

(declare-fun e!53979 () Bool)

(assert (=> b!81914 (=> (not res!67545) (not e!53979))))

(declare-datatypes ((array!3659 0))(
  ( (array!3660 (arr!2316 (Array (_ BitVec 32) (_ BitVec 8))) (size!1679 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2920 0))(
  ( (BitStream!2921 (buf!2069 array!3659) (currentByte!4015 (_ BitVec 32)) (currentBit!4010 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2920)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81914 (= res!67545 (validate_offset_bits!1 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) ((_ sign_extend 32) (currentByte!4015 b1!98)) ((_ sign_extend 32) (currentBit!4010 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!67546 () Bool)

(assert (=> start!16374 (=> (not res!67546) (not e!53979))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!2920)

(assert (=> start!16374 (= res!67546 (and (= (size!1679 (buf!2069 b1!98)) (size!1679 (buf!2069 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16374 e!53979))

(declare-fun e!53978 () Bool)

(declare-fun inv!12 (BitStream!2920) Bool)

(assert (=> start!16374 (and (inv!12 b1!98) e!53978)))

(declare-fun e!53977 () Bool)

(assert (=> start!16374 (and (inv!12 b2!98) e!53977)))

(assert (=> start!16374 true))

(declare-fun b!81915 () Bool)

(declare-fun array_inv!1525 (array!3659) Bool)

(assert (=> b!81915 (= e!53977 (array_inv!1525 (buf!2069 b2!98)))))

(declare-fun b!81916 () Bool)

(assert (=> b!81916 (= e!53978 (array_inv!1525 (buf!2069 b1!98)))))

(declare-fun b!81917 () Bool)

(declare-fun e!53974 () Bool)

(assert (=> b!81917 (= e!53974 (not (or (bvsgt ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4015 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4010 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4015 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4010 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!130229 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!81917 (= (remainingBits!0 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) ((_ sign_extend 32) (currentByte!4015 b1!98)) ((_ sign_extend 32) (currentBit!4010 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98)))) lt!130229))))

(declare-datatypes ((Unit!5467 0))(
  ( (Unit!5468) )
))
(declare-fun lt!130230 () Unit!5467)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2920) Unit!5467)

(assert (=> b!81917 (= lt!130230 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!81918 () Bool)

(assert (=> b!81918 (= e!53979 e!53974)))

(declare-fun res!67544 () Bool)

(assert (=> b!81918 (=> (not res!67544) (not e!53974))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81918 (= res!67544 (= (bvadd lt!130229 b1b2Diff!1) (bitIndex!0 (size!1679 (buf!2069 b2!98)) (currentByte!4015 b2!98) (currentBit!4010 b2!98))))))

(assert (=> b!81918 (= lt!130229 (bitIndex!0 (size!1679 (buf!2069 b1!98)) (currentByte!4015 b1!98) (currentBit!4010 b1!98)))))

(assert (= (and start!16374 res!67546) b!81914))

(assert (= (and b!81914 res!67545) b!81918))

(assert (= (and b!81918 res!67544) b!81917))

(assert (= start!16374 b!81916))

(assert (= start!16374 b!81915))

(declare-fun m!128325 () Bool)

(assert (=> b!81916 m!128325))

(declare-fun m!128327 () Bool)

(assert (=> b!81914 m!128327))

(declare-fun m!128329 () Bool)

(assert (=> b!81915 m!128329))

(declare-fun m!128331 () Bool)

(assert (=> b!81918 m!128331))

(declare-fun m!128333 () Bool)

(assert (=> b!81918 m!128333))

(declare-fun m!128335 () Bool)

(assert (=> b!81917 m!128335))

(declare-fun m!128337 () Bool)

(assert (=> b!81917 m!128337))

(declare-fun m!128339 () Bool)

(assert (=> start!16374 m!128339))

(declare-fun m!128341 () Bool)

(assert (=> start!16374 m!128341))

(push 1)

(assert (not b!81914))

(assert (not start!16374))

(assert (not b!81917))

(assert (not b!81916))

(assert (not b!81915))

(assert (not b!81918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25700 () Bool)

(declare-fun e!54022 () Bool)

(assert (=> d!25700 e!54022))

(declare-fun res!67577 () Bool)

(assert (=> d!25700 (=> (not res!67577) (not e!54022))))

(declare-fun lt!130297 () (_ BitVec 64))

(declare-fun lt!130296 () (_ BitVec 64))

(declare-fun lt!130294 () (_ BitVec 64))

(assert (=> d!25700 (= res!67577 (= lt!130296 (bvsub lt!130294 lt!130297)))))

(assert (=> d!25700 (or (= (bvand lt!130294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130297 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130294 lt!130297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25700 (= lt!130297 (remainingBits!0 ((_ sign_extend 32) (size!1679 (buf!2069 b2!98))) ((_ sign_extend 32) (currentByte!4015 b2!98)) ((_ sign_extend 32) (currentBit!4010 b2!98))))))

(declare-fun lt!130298 () (_ BitVec 64))

(declare-fun lt!130299 () (_ BitVec 64))

(assert (=> d!25700 (= lt!130294 (bvmul lt!130298 lt!130299))))

(assert (=> d!25700 (or (= lt!130298 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130299 (bvsdiv (bvmul lt!130298 lt!130299) lt!130298)))))

(assert (=> d!25700 (= lt!130299 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25700 (= lt!130298 ((_ sign_extend 32) (size!1679 (buf!2069 b2!98))))))

(assert (=> d!25700 (= lt!130296 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4015 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4010 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25700 (invariant!0 (currentBit!4010 b2!98) (currentByte!4015 b2!98) (size!1679 (buf!2069 b2!98)))))

(assert (=> d!25700 (= (bitIndex!0 (size!1679 (buf!2069 b2!98)) (currentByte!4015 b2!98) (currentBit!4010 b2!98)) lt!130296)))

(declare-fun b!81962 () Bool)

(declare-fun res!67578 () Bool)

(assert (=> b!81962 (=> (not res!67578) (not e!54022))))

(assert (=> b!81962 (= res!67578 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130296))))

(declare-fun b!81963 () Bool)

(declare-fun lt!130295 () (_ BitVec 64))

(assert (=> b!81963 (= e!54022 (bvsle lt!130296 (bvmul lt!130295 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81963 (or (= lt!130295 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130295 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130295)))))

(assert (=> b!81963 (= lt!130295 ((_ sign_extend 32) (size!1679 (buf!2069 b2!98))))))

(assert (= (and d!25700 res!67577) b!81962))

(assert (= (and b!81962 res!67578) b!81963))

(declare-fun m!128391 () Bool)

(assert (=> d!25700 m!128391))

(declare-fun m!128393 () Bool)

(assert (=> d!25700 m!128393))

(assert (=> b!81918 d!25700))

(declare-fun d!25714 () Bool)

(declare-fun e!54023 () Bool)

(assert (=> d!25714 e!54023))

(declare-fun res!67579 () Bool)

(assert (=> d!25714 (=> (not res!67579) (not e!54023))))

(declare-fun lt!130302 () (_ BitVec 64))

(declare-fun lt!130300 () (_ BitVec 64))

(declare-fun lt!130303 () (_ BitVec 64))

(assert (=> d!25714 (= res!67579 (= lt!130302 (bvsub lt!130300 lt!130303)))))

(assert (=> d!25714 (or (= (bvand lt!130300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130300 lt!130303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25714 (= lt!130303 (remainingBits!0 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) ((_ sign_extend 32) (currentByte!4015 b1!98)) ((_ sign_extend 32) (currentBit!4010 b1!98))))))

(declare-fun lt!130304 () (_ BitVec 64))

(declare-fun lt!130305 () (_ BitVec 64))

(assert (=> d!25714 (= lt!130300 (bvmul lt!130304 lt!130305))))

(assert (=> d!25714 (or (= lt!130304 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130305 (bvsdiv (bvmul lt!130304 lt!130305) lt!130304)))))

(assert (=> d!25714 (= lt!130305 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25714 (= lt!130304 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))))))

(assert (=> d!25714 (= lt!130302 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4015 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4010 b1!98))))))

(assert (=> d!25714 (invariant!0 (currentBit!4010 b1!98) (currentByte!4015 b1!98) (size!1679 (buf!2069 b1!98)))))

(assert (=> d!25714 (= (bitIndex!0 (size!1679 (buf!2069 b1!98)) (currentByte!4015 b1!98) (currentBit!4010 b1!98)) lt!130302)))

(declare-fun b!81964 () Bool)

(declare-fun res!67580 () Bool)

(assert (=> b!81964 (=> (not res!67580) (not e!54023))))

(assert (=> b!81964 (= res!67580 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130302))))

(declare-fun b!81965 () Bool)

(declare-fun lt!130301 () (_ BitVec 64))

(assert (=> b!81965 (= e!54023 (bvsle lt!130302 (bvmul lt!130301 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81965 (or (= lt!130301 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130301 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130301)))))

(assert (=> b!81965 (= lt!130301 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))))))

(assert (= (and d!25714 res!67579) b!81964))

(assert (= (and b!81964 res!67580) b!81965))

(assert (=> d!25714 m!128335))

(declare-fun m!128395 () Bool)

(assert (=> d!25714 m!128395))

(assert (=> b!81918 d!25714))

(declare-fun d!25716 () Bool)

(assert (=> d!25716 (= (inv!12 b1!98) (invariant!0 (currentBit!4010 b1!98) (currentByte!4015 b1!98) (size!1679 (buf!2069 b1!98))))))

(declare-fun bs!6301 () Bool)

(assert (= bs!6301 d!25716))

(assert (=> bs!6301 m!128395))

(assert (=> start!16374 d!25716))

(declare-fun d!25718 () Bool)

(assert (=> d!25718 (= (inv!12 b2!98) (invariant!0 (currentBit!4010 b2!98) (currentByte!4015 b2!98) (size!1679 (buf!2069 b2!98))))))

(declare-fun bs!6302 () Bool)

(assert (= bs!6302 d!25718))

(assert (=> bs!6302 m!128393))

(assert (=> start!16374 d!25718))

(declare-fun d!25720 () Bool)

(assert (=> d!25720 (= (remainingBits!0 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) ((_ sign_extend 32) (currentByte!4015 b1!98)) ((_ sign_extend 32) (currentBit!4010 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4015 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4010 b1!98)))))))

(assert (=> b!81917 d!25720))

(declare-fun d!25724 () Bool)

(declare-fun lt!130354 () (_ BitVec 64))

(declare-fun lt!130350 () (_ BitVec 64))

(assert (=> d!25724 (= (remainingBits!0 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) ((_ sign_extend 32) (currentByte!4015 b1!98)) ((_ sign_extend 32) (currentBit!4010 b1!98))) (bvsub lt!130354 lt!130350))))

(assert (=> d!25724 (or (= (bvand lt!130354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130354 lt!130350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25724 (= lt!130350 (bitIndex!0 (size!1679 (buf!2069 b1!98)) (currentByte!4015 b1!98) (currentBit!4010 b1!98)))))

(declare-fun lt!130351 () (_ BitVec 64))

(declare-fun lt!130353 () (_ BitVec 64))

(assert (=> d!25724 (= lt!130354 (bvmul lt!130351 lt!130353))))

(assert (=> d!25724 (or (= lt!130351 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130353 (bvsdiv (bvmul lt!130351 lt!130353) lt!130351)))))

(assert (=> d!25724 (= lt!130353 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25724 (= lt!130351 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))))))

(declare-fun lt!130352 () Unit!5467)

(declare-fun choose!23 (BitStream!2920) Unit!5467)

(assert (=> d!25724 (= lt!130352 (choose!23 b1!98))))

(assert (=> d!25724 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130352)))

(declare-fun bs!6303 () Bool)

(assert (= bs!6303 d!25724))

(assert (=> bs!6303 m!128335))

(assert (=> bs!6303 m!128333))

(declare-fun m!128399 () Bool)

(assert (=> bs!6303 m!128399))

(assert (=> b!81917 d!25724))

(declare-fun d!25730 () Bool)

(assert (=> d!25730 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) ((_ sign_extend 32) (currentByte!4015 b1!98)) ((_ sign_extend 32) (currentBit!4010 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) ((_ sign_extend 32) (currentByte!4015 b1!98)) ((_ sign_extend 32) (currentBit!4010 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6305 () Bool)

(assert (= bs!6305 d!25730))

(assert (=> bs!6305 m!128335))

(assert (=> b!81914 d!25730))

(declare-fun d!25736 () Bool)

(assert (=> d!25736 (= (array_inv!1525 (buf!2069 b2!98)) (bvsge (size!1679 (buf!2069 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81915 d!25736))

(declare-fun d!25738 () Bool)

(assert (=> d!25738 (= (array_inv!1525 (buf!2069 b1!98)) (bvsge (size!1679 (buf!2069 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81916 d!25738))

(push 1)

(assert (not d!25714))

(assert (not d!25700))

(assert (not d!25724))

(assert (not d!25716))

(assert (not d!25718))

(assert (not d!25730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25740 () Bool)

(assert (=> d!25740 (= (invariant!0 (currentBit!4010 b1!98) (currentByte!4015 b1!98) (size!1679 (buf!2069 b1!98))) (and (bvsge (currentBit!4010 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4010 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4015 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4015 b1!98) (size!1679 (buf!2069 b1!98))) (and (= (currentBit!4010 b1!98) #b00000000000000000000000000000000) (= (currentByte!4015 b1!98) (size!1679 (buf!2069 b1!98)))))))))

(assert (=> d!25716 d!25740))

(assert (=> d!25724 d!25720))

(assert (=> d!25724 d!25714))

(declare-fun d!25742 () Bool)

(assert (=> d!25742 (= (remainingBits!0 ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) ((_ sign_extend 32) (currentByte!4015 b1!98)) ((_ sign_extend 32) (currentBit!4010 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1679 (buf!2069 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bitIndex!0 (size!1679 (buf!2069 b1!98)) (currentByte!4015 b1!98) (currentBit!4010 b1!98))))))

(assert (=> d!25742 true))

(declare-fun _$4!27 () Unit!5467)

(assert (=> d!25742 (= (choose!23 b1!98) _$4!27)))

(declare-fun bs!6306 () Bool)

(assert (= bs!6306 d!25742))

(assert (=> bs!6306 m!128335))

(assert (=> bs!6306 m!128333))

(assert (=> d!25724 d!25742))

(assert (=> d!25730 d!25720))

(declare-fun d!25744 () Bool)

(assert (=> d!25744 (= (invariant!0 (currentBit!4010 b2!98) (currentByte!4015 b2!98) (size!1679 (buf!2069 b2!98))) (and (bvsge (currentBit!4010 b2!98) #b00000000000000000000000000000000) (bvslt (currentBit!4010 b2!98) #b00000000000000000000000000001000) (bvsge (currentByte!4015 b2!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4015 b2!98) (size!1679 (buf!2069 b2!98))) (and (= (currentBit!4010 b2!98) #b00000000000000000000000000000000) (= (currentByte!4015 b2!98) (size!1679 (buf!2069 b2!98)))))))))

(assert (=> d!25718 d!25744))

(assert (=> d!25714 d!25720))

(assert (=> d!25714 d!25740))

(declare-fun d!25746 () Bool)

(assert (=> d!25746 (= (remainingBits!0 ((_ sign_extend 32) (size!1679 (buf!2069 b2!98))) ((_ sign_extend 32) (currentByte!4015 b2!98)) ((_ sign_extend 32) (currentBit!4010 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1679 (buf!2069 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4015 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4010 b2!98)))))))

(assert (=> d!25700 d!25746))

(assert (=> d!25700 d!25744))

(push 1)

(assert (not d!25742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

