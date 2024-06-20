; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69630 () Bool)

(assert start!69630)

(declare-fun res!256506 () Bool)

(declare-fun e!225440 () Bool)

(assert (=> start!69630 (=> (not res!256506) (not e!225440))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19230 0))(
  ( (array!19231 (arr!9422 (Array (_ BitVec 32) (_ BitVec 8))) (size!8342 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13788 0))(
  ( (BitStream!13789 (buf!7955 array!19230) (currentByte!14674 (_ BitVec 32)) (currentBit!14669 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13788)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13788)

(assert (=> start!69630 (= res!256506 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8342 (buf!7955 b1!97)) (size!8342 (buf!7955 b2!97)))))))

(assert (=> start!69630 e!225440))

(assert (=> start!69630 true))

(declare-fun e!225437 () Bool)

(declare-fun inv!12 (BitStream!13788) Bool)

(assert (=> start!69630 (and (inv!12 b1!97) e!225437)))

(declare-fun e!225438 () Bool)

(assert (=> start!69630 (and (inv!12 b2!97) e!225438)))

(declare-fun b!313318 () Bool)

(declare-fun e!225436 () Bool)

(declare-fun e!225439 () Bool)

(assert (=> b!313318 (= e!225436 e!225439)))

(declare-fun res!256502 () Bool)

(assert (=> b!313318 (=> (not res!256502) (not e!225439))))

(declare-fun lt!442186 () (_ BitVec 64))

(declare-fun lt!442185 () (_ BitVec 64))

(declare-fun lt!442187 () (_ BitVec 64))

(assert (=> b!313318 (= res!256502 (and (bvsle lt!442186 (bvadd lt!442187 advancedAtMostBits!9)) (bvsge (bvsub lt!442185 lt!442186) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!313318 (= lt!442186 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14674 b2!97))) ((_ sign_extend 32) (currentBit!14669 b2!97))))))

(declare-fun b!313319 () Bool)

(declare-fun res!256505 () Bool)

(assert (=> b!313319 (=> (not res!256505) (not e!225439))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313319 (= res!256505 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8342 (buf!7955 b2!97))) ((_ sign_extend 32) (currentByte!14674 b2!97)) ((_ sign_extend 32) (currentBit!14669 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!313320 () Bool)

(declare-fun res!256503 () Bool)

(assert (=> b!313320 (=> (not res!256503) (not e!225440))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313320 (= res!256503 (validate_offset_bits!1 ((_ sign_extend 32) (size!8342 (buf!7955 b1!97))) ((_ sign_extend 32) (currentByte!14674 b1!97)) ((_ sign_extend 32) (currentBit!14669 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313321 () Bool)

(declare-fun res!256504 () Bool)

(assert (=> b!313321 (=> (not res!256504) (not e!225440))))

(assert (=> b!313321 (= res!256504 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8342 (buf!7955 b1!97))) ((_ sign_extend 32) (currentByte!14674 b1!97)) ((_ sign_extend 32) (currentBit!14669 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313322 () Bool)

(declare-fun array_inv!7894 (array!19230) Bool)

(assert (=> b!313322 (= e!225438 (array_inv!7894 (buf!7955 b2!97)))))

(declare-fun b!313323 () Bool)

(declare-fun res!256508 () Bool)

(assert (=> b!313323 (=> (not res!256508) (not e!225440))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313323 (= res!256508 (bvsle (bitIndex!0 (size!8342 (buf!7955 b2!97)) (currentByte!14674 b2!97) (currentBit!14669 b2!97)) (bvadd (bitIndex!0 (size!8342 (buf!7955 b1!97)) (currentByte!14674 b1!97) (currentBit!14669 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313324 () Bool)

(assert (=> b!313324 (= e!225439 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8342 (buf!7955 b2!97))) ((_ sign_extend 32) (currentByte!14674 b2!97)) ((_ sign_extend 32) (currentBit!14669 b2!97)) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(declare-fun b!313325 () Bool)

(assert (=> b!313325 (= e!225440 e!225436)))

(declare-fun res!256507 () Bool)

(assert (=> b!313325 (=> (not res!256507) (not e!225436))))

(assert (=> b!313325 (= res!256507 (bvsge (bvsub lt!442185 lt!442187) b1ValidateOffsetBits!10))))

(assert (=> b!313325 (= lt!442187 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14674 b1!97))) ((_ sign_extend 32) (currentBit!14669 b1!97))))))

(assert (=> b!313325 (= lt!442185 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8342 (buf!7955 b1!97)))))))

(declare-fun b!313326 () Bool)

(assert (=> b!313326 (= e!225437 (array_inv!7894 (buf!7955 b1!97)))))

(assert (= (and start!69630 res!256506) b!313320))

(assert (= (and b!313320 res!256503) b!313323))

(assert (= (and b!313323 res!256508) b!313321))

(assert (= (and b!313321 res!256504) b!313325))

(assert (= (and b!313325 res!256507) b!313318))

(assert (= (and b!313318 res!256502) b!313319))

(assert (= (and b!313319 res!256505) b!313324))

(assert (= start!69630 b!313326))

(assert (= start!69630 b!313322))

(declare-fun m!450859 () Bool)

(assert (=> b!313324 m!450859))

(declare-fun m!450861 () Bool)

(assert (=> start!69630 m!450861))

(declare-fun m!450863 () Bool)

(assert (=> start!69630 m!450863))

(declare-fun m!450865 () Bool)

(assert (=> b!313326 m!450865))

(declare-fun m!450867 () Bool)

(assert (=> b!313321 m!450867))

(declare-fun m!450869 () Bool)

(assert (=> b!313320 m!450869))

(declare-fun m!450871 () Bool)

(assert (=> b!313319 m!450871))

(declare-fun m!450873 () Bool)

(assert (=> b!313323 m!450873))

(declare-fun m!450875 () Bool)

(assert (=> b!313323 m!450875))

(declare-fun m!450877 () Bool)

(assert (=> b!313322 m!450877))

(check-sat (not b!313323) (not b!313320) (not b!313326) (not b!313321) (not b!313319) (not b!313322) (not start!69630) (not b!313324))
(check-sat)
(get-model)

(declare-fun d!103800 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103800 (= (inv!12 b1!97) (invariant!0 (currentBit!14669 b1!97) (currentByte!14674 b1!97) (size!8342 (buf!7955 b1!97))))))

(declare-fun bs!26900 () Bool)

(assert (= bs!26900 d!103800))

(declare-fun m!450899 () Bool)

(assert (=> bs!26900 m!450899))

(assert (=> start!69630 d!103800))

(declare-fun d!103802 () Bool)

(assert (=> d!103802 (= (inv!12 b2!97) (invariant!0 (currentBit!14669 b2!97) (currentByte!14674 b2!97) (size!8342 (buf!7955 b2!97))))))

(declare-fun bs!26901 () Bool)

(assert (= bs!26901 d!103802))

(declare-fun m!450901 () Bool)

(assert (=> bs!26901 m!450901))

(assert (=> start!69630 d!103802))

(declare-fun d!103804 () Bool)

(declare-fun e!225466 () Bool)

(assert (=> d!103804 e!225466))

(declare-fun res!256534 () Bool)

(assert (=> d!103804 (=> (not res!256534) (not e!225466))))

(declare-fun lt!442212 () (_ BitVec 64))

(declare-fun lt!442210 () (_ BitVec 64))

(declare-fun lt!442211 () (_ BitVec 64))

(assert (=> d!103804 (= res!256534 (= lt!442211 (bvsub lt!442212 lt!442210)))))

(assert (=> d!103804 (or (= (bvand lt!442212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!442210 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!442212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!442212 lt!442210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103804 (= lt!442210 (remainingBits!0 ((_ sign_extend 32) (size!8342 (buf!7955 b2!97))) ((_ sign_extend 32) (currentByte!14674 b2!97)) ((_ sign_extend 32) (currentBit!14669 b2!97))))))

(declare-fun lt!442213 () (_ BitVec 64))

(declare-fun lt!442209 () (_ BitVec 64))

(assert (=> d!103804 (= lt!442212 (bvmul lt!442213 lt!442209))))

(assert (=> d!103804 (or (= lt!442213 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!442209 (bvsdiv (bvmul lt!442213 lt!442209) lt!442213)))))

(assert (=> d!103804 (= lt!442209 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103804 (= lt!442213 ((_ sign_extend 32) (size!8342 (buf!7955 b2!97))))))

(assert (=> d!103804 (= lt!442211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14674 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14669 b2!97))))))

(assert (=> d!103804 (invariant!0 (currentBit!14669 b2!97) (currentByte!14674 b2!97) (size!8342 (buf!7955 b2!97)))))

(assert (=> d!103804 (= (bitIndex!0 (size!8342 (buf!7955 b2!97)) (currentByte!14674 b2!97) (currentBit!14669 b2!97)) lt!442211)))

(declare-fun b!313358 () Bool)

(declare-fun res!256535 () Bool)

(assert (=> b!313358 (=> (not res!256535) (not e!225466))))

(assert (=> b!313358 (= res!256535 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!442211))))

(declare-fun b!313359 () Bool)

(declare-fun lt!442214 () (_ BitVec 64))

(assert (=> b!313359 (= e!225466 (bvsle lt!442211 (bvmul lt!442214 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313359 (or (= lt!442214 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!442214 #b0000000000000000000000000000000000000000000000000000000000001000) lt!442214)))))

(assert (=> b!313359 (= lt!442214 ((_ sign_extend 32) (size!8342 (buf!7955 b2!97))))))

(assert (= (and d!103804 res!256534) b!313358))

(assert (= (and b!313358 res!256535) b!313359))

(assert (=> d!103804 m!450871))

(assert (=> d!103804 m!450901))

(assert (=> b!313323 d!103804))

(declare-fun d!103806 () Bool)

(declare-fun e!225467 () Bool)

(assert (=> d!103806 e!225467))

(declare-fun res!256536 () Bool)

(assert (=> d!103806 (=> (not res!256536) (not e!225467))))

(declare-fun lt!442216 () (_ BitVec 64))

(declare-fun lt!442218 () (_ BitVec 64))

(declare-fun lt!442217 () (_ BitVec 64))

(assert (=> d!103806 (= res!256536 (= lt!442217 (bvsub lt!442218 lt!442216)))))

(assert (=> d!103806 (or (= (bvand lt!442218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!442216 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!442218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!442218 lt!442216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103806 (= lt!442216 (remainingBits!0 ((_ sign_extend 32) (size!8342 (buf!7955 b1!97))) ((_ sign_extend 32) (currentByte!14674 b1!97)) ((_ sign_extend 32) (currentBit!14669 b1!97))))))

(declare-fun lt!442219 () (_ BitVec 64))

(declare-fun lt!442215 () (_ BitVec 64))

(assert (=> d!103806 (= lt!442218 (bvmul lt!442219 lt!442215))))

(assert (=> d!103806 (or (= lt!442219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!442215 (bvsdiv (bvmul lt!442219 lt!442215) lt!442219)))))

(assert (=> d!103806 (= lt!442215 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103806 (= lt!442219 ((_ sign_extend 32) (size!8342 (buf!7955 b1!97))))))

(assert (=> d!103806 (= lt!442217 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14674 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14669 b1!97))))))

(assert (=> d!103806 (invariant!0 (currentBit!14669 b1!97) (currentByte!14674 b1!97) (size!8342 (buf!7955 b1!97)))))

(assert (=> d!103806 (= (bitIndex!0 (size!8342 (buf!7955 b1!97)) (currentByte!14674 b1!97) (currentBit!14669 b1!97)) lt!442217)))

(declare-fun b!313360 () Bool)

(declare-fun res!256537 () Bool)

(assert (=> b!313360 (=> (not res!256537) (not e!225467))))

(assert (=> b!313360 (= res!256537 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!442217))))

(declare-fun b!313361 () Bool)

(declare-fun lt!442220 () (_ BitVec 64))

(assert (=> b!313361 (= e!225467 (bvsle lt!442217 (bvmul lt!442220 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313361 (or (= lt!442220 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!442220 #b0000000000000000000000000000000000000000000000000000000000001000) lt!442220)))))

(assert (=> b!313361 (= lt!442220 ((_ sign_extend 32) (size!8342 (buf!7955 b1!97))))))

(assert (= (and d!103806 res!256536) b!313360))

(assert (= (and b!313360 res!256537) b!313361))

(assert (=> d!103806 m!450867))

(assert (=> d!103806 m!450899))

(assert (=> b!313323 d!103806))

(declare-fun d!103808 () Bool)

(assert (=> d!103808 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8342 (buf!7955 b2!97))) ((_ sign_extend 32) (currentByte!14674 b2!97)) ((_ sign_extend 32) (currentBit!14669 b2!97)) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8342 (buf!7955 b2!97))) ((_ sign_extend 32) (currentByte!14674 b2!97)) ((_ sign_extend 32) (currentBit!14669 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun bs!26902 () Bool)

(assert (= bs!26902 d!103808))

(assert (=> bs!26902 m!450871))

(assert (=> b!313324 d!103808))

(declare-fun d!103810 () Bool)

(assert (=> d!103810 (= (remainingBits!0 ((_ sign_extend 32) (size!8342 (buf!7955 b2!97))) ((_ sign_extend 32) (currentByte!14674 b2!97)) ((_ sign_extend 32) (currentBit!14669 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8342 (buf!7955 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14674 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14669 b2!97)))))))

(assert (=> b!313319 d!103810))

(declare-fun d!103812 () Bool)

(assert (=> d!103812 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8342 (buf!7955 b1!97))) ((_ sign_extend 32) (currentByte!14674 b1!97)) ((_ sign_extend 32) (currentBit!14669 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8342 (buf!7955 b1!97))) ((_ sign_extend 32) (currentByte!14674 b1!97)) ((_ sign_extend 32) (currentBit!14669 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26903 () Bool)

(assert (= bs!26903 d!103812))

(assert (=> bs!26903 m!450867))

(assert (=> b!313320 d!103812))

(declare-fun d!103814 () Bool)

(assert (=> d!103814 (= (array_inv!7894 (buf!7955 b1!97)) (bvsge (size!8342 (buf!7955 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!313326 d!103814))

(declare-fun d!103816 () Bool)

(assert (=> d!103816 (= (remainingBits!0 ((_ sign_extend 32) (size!8342 (buf!7955 b1!97))) ((_ sign_extend 32) (currentByte!14674 b1!97)) ((_ sign_extend 32) (currentBit!14669 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8342 (buf!7955 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14674 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14669 b1!97)))))))

(assert (=> b!313321 d!103816))

(declare-fun d!103818 () Bool)

(assert (=> d!103818 (= (array_inv!7894 (buf!7955 b2!97)) (bvsge (size!8342 (buf!7955 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!313322 d!103818))

(check-sat (not d!103806) (not d!103804) (not d!103808) (not d!103800) (not d!103802) (not d!103812))
