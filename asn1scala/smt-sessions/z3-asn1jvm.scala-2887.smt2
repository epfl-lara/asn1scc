; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69114 () Bool)

(assert start!69114)

(declare-fun b!311269 () Bool)

(declare-fun res!255012 () Bool)

(declare-fun e!223798 () Bool)

(assert (=> b!311269 (=> (not res!255012) (not e!223798))))

(declare-datatypes ((array!19011 0))(
  ( (array!19012 (arr!9329 (Array (_ BitVec 32) (_ BitVec 8))) (size!8249 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13602 0))(
  ( (BitStream!13603 (buf!7862 array!19011) (currentByte!14481 (_ BitVec 32)) (currentBit!14476 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13602)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311269 (= res!255012 (validate_offset_bits!1 ((_ sign_extend 32) (size!8249 (buf!7862 b1!97))) ((_ sign_extend 32) (currentByte!14481 b1!97)) ((_ sign_extend 32) (currentBit!14476 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!255011 () Bool)

(assert (=> start!69114 (=> (not res!255011) (not e!223798))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13602)

(assert (=> start!69114 (= res!255011 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8249 (buf!7862 b1!97)) (size!8249 (buf!7862 b2!97)))))))

(assert (=> start!69114 e!223798))

(assert (=> start!69114 true))

(declare-fun e!223797 () Bool)

(declare-fun inv!12 (BitStream!13602) Bool)

(assert (=> start!69114 (and (inv!12 b1!97) e!223797)))

(declare-fun e!223799 () Bool)

(assert (=> start!69114 (and (inv!12 b2!97) e!223799)))

(declare-fun b!311270 () Bool)

(declare-fun array_inv!7801 (array!19011) Bool)

(assert (=> b!311270 (= e!223797 (array_inv!7801 (buf!7862 b1!97)))))

(declare-fun b!311271 () Bool)

(declare-fun res!255013 () Bool)

(assert (=> b!311271 (=> (not res!255013) (not e!223798))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311271 (= res!255013 (bvsle (bitIndex!0 (size!8249 (buf!7862 b2!97)) (currentByte!14481 b2!97) (currentBit!14476 b2!97)) (bvadd (bitIndex!0 (size!8249 (buf!7862 b1!97)) (currentByte!14481 b1!97) (currentBit!14476 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311272 () Bool)

(assert (=> b!311272 (= e!223798 (and (bvsle ((_ sign_extend 32) (size!8249 (buf!7862 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14481 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14476 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8249 (buf!7862 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14481 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14476 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!311273 () Bool)

(assert (=> b!311273 (= e!223799 (array_inv!7801 (buf!7862 b2!97)))))

(assert (= (and start!69114 res!255011) b!311269))

(assert (= (and b!311269 res!255012) b!311271))

(assert (= (and b!311271 res!255013) b!311272))

(assert (= start!69114 b!311270))

(assert (= start!69114 b!311273))

(declare-fun m!449161 () Bool)

(assert (=> b!311273 m!449161))

(declare-fun m!449163 () Bool)

(assert (=> b!311269 m!449163))

(declare-fun m!449165 () Bool)

(assert (=> b!311270 m!449165))

(declare-fun m!449167 () Bool)

(assert (=> start!69114 m!449167))

(declare-fun m!449169 () Bool)

(assert (=> start!69114 m!449169))

(declare-fun m!449171 () Bool)

(assert (=> b!311271 m!449171))

(declare-fun m!449173 () Bool)

(assert (=> b!311271 m!449173))

(check-sat (not b!311273) (not b!311269) (not b!311271) (not start!69114) (not b!311270))
(check-sat)
(get-model)

(declare-fun d!103196 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103196 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8249 (buf!7862 b1!97))) ((_ sign_extend 32) (currentByte!14481 b1!97)) ((_ sign_extend 32) (currentBit!14476 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8249 (buf!7862 b1!97))) ((_ sign_extend 32) (currentByte!14481 b1!97)) ((_ sign_extend 32) (currentBit!14476 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26711 () Bool)

(assert (= bs!26711 d!103196))

(declare-fun m!449189 () Bool)

(assert (=> bs!26711 m!449189))

(assert (=> b!311269 d!103196))

(declare-fun d!103202 () Bool)

(assert (=> d!103202 (= (array_inv!7801 (buf!7862 b2!97)) (bvsge (size!8249 (buf!7862 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311273 d!103202))

(declare-fun d!103204 () Bool)

(declare-fun e!223825 () Bool)

(assert (=> d!103204 e!223825))

(declare-fun res!255044 () Bool)

(assert (=> d!103204 (=> (not res!255044) (not e!223825))))

(declare-fun lt!441039 () (_ BitVec 64))

(declare-fun lt!441044 () (_ BitVec 64))

(declare-fun lt!441042 () (_ BitVec 64))

(assert (=> d!103204 (= res!255044 (= lt!441039 (bvsub lt!441044 lt!441042)))))

(assert (=> d!103204 (or (= (bvand lt!441044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441044 lt!441042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103204 (= lt!441042 (remainingBits!0 ((_ sign_extend 32) (size!8249 (buf!7862 b2!97))) ((_ sign_extend 32) (currentByte!14481 b2!97)) ((_ sign_extend 32) (currentBit!14476 b2!97))))))

(declare-fun lt!441040 () (_ BitVec 64))

(declare-fun lt!441041 () (_ BitVec 64))

(assert (=> d!103204 (= lt!441044 (bvmul lt!441040 lt!441041))))

(assert (=> d!103204 (or (= lt!441040 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441041 (bvsdiv (bvmul lt!441040 lt!441041) lt!441040)))))

(assert (=> d!103204 (= lt!441041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103204 (= lt!441040 ((_ sign_extend 32) (size!8249 (buf!7862 b2!97))))))

(assert (=> d!103204 (= lt!441039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14481 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14476 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103204 (invariant!0 (currentBit!14476 b2!97) (currentByte!14481 b2!97) (size!8249 (buf!7862 b2!97)))))

(assert (=> d!103204 (= (bitIndex!0 (size!8249 (buf!7862 b2!97)) (currentByte!14481 b2!97) (currentBit!14476 b2!97)) lt!441039)))

(declare-fun b!311309 () Bool)

(declare-fun res!255043 () Bool)

(assert (=> b!311309 (=> (not res!255043) (not e!223825))))

(assert (=> b!311309 (= res!255043 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441039))))

(declare-fun b!311310 () Bool)

(declare-fun lt!441043 () (_ BitVec 64))

(assert (=> b!311310 (= e!223825 (bvsle lt!441039 (bvmul lt!441043 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311310 (or (= lt!441043 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441043 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441043)))))

(assert (=> b!311310 (= lt!441043 ((_ sign_extend 32) (size!8249 (buf!7862 b2!97))))))

(assert (= (and d!103204 res!255044) b!311309))

(assert (= (and b!311309 res!255043) b!311310))

(declare-fun m!449207 () Bool)

(assert (=> d!103204 m!449207))

(declare-fun m!449209 () Bool)

(assert (=> d!103204 m!449209))

(assert (=> b!311271 d!103204))

(declare-fun d!103228 () Bool)

(declare-fun e!223826 () Bool)

(assert (=> d!103228 e!223826))

(declare-fun res!255046 () Bool)

(assert (=> d!103228 (=> (not res!255046) (not e!223826))))

(declare-fun lt!441048 () (_ BitVec 64))

(declare-fun lt!441045 () (_ BitVec 64))

(declare-fun lt!441050 () (_ BitVec 64))

(assert (=> d!103228 (= res!255046 (= lt!441045 (bvsub lt!441050 lt!441048)))))

(assert (=> d!103228 (or (= (bvand lt!441050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441050 lt!441048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103228 (= lt!441048 (remainingBits!0 ((_ sign_extend 32) (size!8249 (buf!7862 b1!97))) ((_ sign_extend 32) (currentByte!14481 b1!97)) ((_ sign_extend 32) (currentBit!14476 b1!97))))))

(declare-fun lt!441046 () (_ BitVec 64))

(declare-fun lt!441047 () (_ BitVec 64))

(assert (=> d!103228 (= lt!441050 (bvmul lt!441046 lt!441047))))

(assert (=> d!103228 (or (= lt!441046 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441047 (bvsdiv (bvmul lt!441046 lt!441047) lt!441046)))))

(assert (=> d!103228 (= lt!441047 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103228 (= lt!441046 ((_ sign_extend 32) (size!8249 (buf!7862 b1!97))))))

(assert (=> d!103228 (= lt!441045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14481 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14476 b1!97))))))

(assert (=> d!103228 (invariant!0 (currentBit!14476 b1!97) (currentByte!14481 b1!97) (size!8249 (buf!7862 b1!97)))))

(assert (=> d!103228 (= (bitIndex!0 (size!8249 (buf!7862 b1!97)) (currentByte!14481 b1!97) (currentBit!14476 b1!97)) lt!441045)))

(declare-fun b!311311 () Bool)

(declare-fun res!255045 () Bool)

(assert (=> b!311311 (=> (not res!255045) (not e!223826))))

(assert (=> b!311311 (= res!255045 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441045))))

(declare-fun b!311312 () Bool)

(declare-fun lt!441049 () (_ BitVec 64))

(assert (=> b!311312 (= e!223826 (bvsle lt!441045 (bvmul lt!441049 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311312 (or (= lt!441049 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441049 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441049)))))

(assert (=> b!311312 (= lt!441049 ((_ sign_extend 32) (size!8249 (buf!7862 b1!97))))))

(assert (= (and d!103228 res!255046) b!311311))

(assert (= (and b!311311 res!255045) b!311312))

(assert (=> d!103228 m!449189))

(declare-fun m!449211 () Bool)

(assert (=> d!103228 m!449211))

(assert (=> b!311271 d!103228))

(declare-fun d!103230 () Bool)

(assert (=> d!103230 (= (inv!12 b1!97) (invariant!0 (currentBit!14476 b1!97) (currentByte!14481 b1!97) (size!8249 (buf!7862 b1!97))))))

(declare-fun bs!26718 () Bool)

(assert (= bs!26718 d!103230))

(assert (=> bs!26718 m!449211))

(assert (=> start!69114 d!103230))

(declare-fun d!103232 () Bool)

(assert (=> d!103232 (= (inv!12 b2!97) (invariant!0 (currentBit!14476 b2!97) (currentByte!14481 b2!97) (size!8249 (buf!7862 b2!97))))))

(declare-fun bs!26719 () Bool)

(assert (= bs!26719 d!103232))

(assert (=> bs!26719 m!449209))

(assert (=> start!69114 d!103232))

(declare-fun d!103234 () Bool)

(assert (=> d!103234 (= (array_inv!7801 (buf!7862 b1!97)) (bvsge (size!8249 (buf!7862 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311270 d!103234))

(check-sat (not d!103230) (not d!103204) (not d!103196) (not d!103228) (not d!103232))
