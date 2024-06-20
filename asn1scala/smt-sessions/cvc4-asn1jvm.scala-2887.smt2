; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69116 () Bool)

(assert start!69116)

(declare-fun b!311284 () Bool)

(declare-fun res!255021 () Bool)

(declare-fun e!223810 () Bool)

(assert (=> b!311284 (=> (not res!255021) (not e!223810))))

(declare-datatypes ((array!19013 0))(
  ( (array!19014 (arr!9330 (Array (_ BitVec 32) (_ BitVec 8))) (size!8250 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13604 0))(
  ( (BitStream!13605 (buf!7863 array!19013) (currentByte!14482 (_ BitVec 32)) (currentBit!14477 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13604)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311284 (= res!255021 (validate_offset_bits!1 ((_ sign_extend 32) (size!8250 (buf!7863 b1!97))) ((_ sign_extend 32) (currentByte!14482 b1!97)) ((_ sign_extend 32) (currentBit!14477 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311285 () Bool)

(declare-fun e!223813 () Bool)

(declare-fun array_inv!7802 (array!19013) Bool)

(assert (=> b!311285 (= e!223813 (array_inv!7802 (buf!7863 b1!97)))))

(declare-fun b!311286 () Bool)

(assert (=> b!311286 (= e!223810 (and (bvsle ((_ sign_extend 32) (size!8250 (buf!7863 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14482 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14477 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8250 (buf!7863 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14482 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14477 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!311287 () Bool)

(declare-fun e!223814 () Bool)

(declare-fun b2!97 () BitStream!13604)

(assert (=> b!311287 (= e!223814 (array_inv!7802 (buf!7863 b2!97)))))

(declare-fun b!311288 () Bool)

(declare-fun res!255022 () Bool)

(assert (=> b!311288 (=> (not res!255022) (not e!223810))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311288 (= res!255022 (bvsle (bitIndex!0 (size!8250 (buf!7863 b2!97)) (currentByte!14482 b2!97) (currentBit!14477 b2!97)) (bvadd (bitIndex!0 (size!8250 (buf!7863 b1!97)) (currentByte!14482 b1!97) (currentBit!14477 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!255020 () Bool)

(assert (=> start!69116 (=> (not res!255020) (not e!223810))))

(assert (=> start!69116 (= res!255020 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8250 (buf!7863 b1!97)) (size!8250 (buf!7863 b2!97)))))))

(assert (=> start!69116 e!223810))

(assert (=> start!69116 true))

(declare-fun inv!12 (BitStream!13604) Bool)

(assert (=> start!69116 (and (inv!12 b1!97) e!223813)))

(assert (=> start!69116 (and (inv!12 b2!97) e!223814)))

(assert (= (and start!69116 res!255020) b!311284))

(assert (= (and b!311284 res!255021) b!311288))

(assert (= (and b!311288 res!255022) b!311286))

(assert (= start!69116 b!311285))

(assert (= start!69116 b!311287))

(declare-fun m!449175 () Bool)

(assert (=> b!311285 m!449175))

(declare-fun m!449177 () Bool)

(assert (=> start!69116 m!449177))

(declare-fun m!449179 () Bool)

(assert (=> start!69116 m!449179))

(declare-fun m!449181 () Bool)

(assert (=> b!311287 m!449181))

(declare-fun m!449183 () Bool)

(assert (=> b!311288 m!449183))

(declare-fun m!449185 () Bool)

(assert (=> b!311288 m!449185))

(declare-fun m!449187 () Bool)

(assert (=> b!311284 m!449187))

(push 1)

(assert (not b!311285))

(assert (not b!311288))

(assert (not start!69116))

(assert (not b!311287))

(assert (not b!311284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103206 () Bool)

(declare-fun e!223821 () Bool)

(assert (=> d!103206 e!223821))

(declare-fun res!255035 () Bool)

(assert (=> d!103206 (=> (not res!255035) (not e!223821))))

(declare-fun lt!441020 () (_ BitVec 64))

(declare-fun lt!441018 () (_ BitVec 64))

(declare-fun lt!441016 () (_ BitVec 64))

(assert (=> d!103206 (= res!255035 (= lt!441018 (bvsub lt!441016 lt!441020)))))

(assert (=> d!103206 (or (= (bvand lt!441016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441020 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441016 lt!441020) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103206 (= lt!441020 (remainingBits!0 ((_ sign_extend 32) (size!8250 (buf!7863 b2!97))) ((_ sign_extend 32) (currentByte!14482 b2!97)) ((_ sign_extend 32) (currentBit!14477 b2!97))))))

(declare-fun lt!441015 () (_ BitVec 64))

(declare-fun lt!441017 () (_ BitVec 64))

(assert (=> d!103206 (= lt!441016 (bvmul lt!441015 lt!441017))))

(assert (=> d!103206 (or (= lt!441015 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441017 (bvsdiv (bvmul lt!441015 lt!441017) lt!441015)))))

(assert (=> d!103206 (= lt!441017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103206 (= lt!441015 ((_ sign_extend 32) (size!8250 (buf!7863 b2!97))))))

(assert (=> d!103206 (= lt!441018 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14482 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14477 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103206 (invariant!0 (currentBit!14477 b2!97) (currentByte!14482 b2!97) (size!8250 (buf!7863 b2!97)))))

(assert (=> d!103206 (= (bitIndex!0 (size!8250 (buf!7863 b2!97)) (currentByte!14482 b2!97) (currentBit!14477 b2!97)) lt!441018)))

(declare-fun b!311301 () Bool)

(declare-fun res!255036 () Bool)

(assert (=> b!311301 (=> (not res!255036) (not e!223821))))

(assert (=> b!311301 (= res!255036 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441018))))

(declare-fun b!311302 () Bool)

(declare-fun lt!441019 () (_ BitVec 64))

(assert (=> b!311302 (= e!223821 (bvsle lt!441018 (bvmul lt!441019 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311302 (or (= lt!441019 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441019 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441019)))))

(assert (=> b!311302 (= lt!441019 ((_ sign_extend 32) (size!8250 (buf!7863 b2!97))))))

(assert (= (and d!103206 res!255035) b!311301))

(assert (= (and b!311301 res!255036) b!311302))

(declare-fun m!449199 () Bool)

(assert (=> d!103206 m!449199))

(declare-fun m!449201 () Bool)

(assert (=> d!103206 m!449201))

(assert (=> b!311288 d!103206))

(declare-fun d!103216 () Bool)

(declare-fun e!223822 () Bool)

(assert (=> d!103216 e!223822))

(declare-fun res!255037 () Bool)

(assert (=> d!103216 (=> (not res!255037) (not e!223822))))

(declare-fun lt!441022 () (_ BitVec 64))

(declare-fun lt!441026 () (_ BitVec 64))

(declare-fun lt!441024 () (_ BitVec 64))

(assert (=> d!103216 (= res!255037 (= lt!441024 (bvsub lt!441022 lt!441026)))))

(assert (=> d!103216 (or (= (bvand lt!441022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441026 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441022 lt!441026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103216 (= lt!441026 (remainingBits!0 ((_ sign_extend 32) (size!8250 (buf!7863 b1!97))) ((_ sign_extend 32) (currentByte!14482 b1!97)) ((_ sign_extend 32) (currentBit!14477 b1!97))))))

(declare-fun lt!441021 () (_ BitVec 64))

(declare-fun lt!441023 () (_ BitVec 64))

(assert (=> d!103216 (= lt!441022 (bvmul lt!441021 lt!441023))))

(assert (=> d!103216 (or (= lt!441021 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441023 (bvsdiv (bvmul lt!441021 lt!441023) lt!441021)))))

(assert (=> d!103216 (= lt!441023 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103216 (= lt!441021 ((_ sign_extend 32) (size!8250 (buf!7863 b1!97))))))

(assert (=> d!103216 (= lt!441024 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14482 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14477 b1!97))))))

(assert (=> d!103216 (invariant!0 (currentBit!14477 b1!97) (currentByte!14482 b1!97) (size!8250 (buf!7863 b1!97)))))

(assert (=> d!103216 (= (bitIndex!0 (size!8250 (buf!7863 b1!97)) (currentByte!14482 b1!97) (currentBit!14477 b1!97)) lt!441024)))

(declare-fun b!311303 () Bool)

(declare-fun res!255038 () Bool)

(assert (=> b!311303 (=> (not res!255038) (not e!223822))))

(assert (=> b!311303 (= res!255038 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441024))))

(declare-fun b!311304 () Bool)

(declare-fun lt!441025 () (_ BitVec 64))

(assert (=> b!311304 (= e!223822 (bvsle lt!441024 (bvmul lt!441025 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311304 (or (= lt!441025 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441025 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441025)))))

(assert (=> b!311304 (= lt!441025 ((_ sign_extend 32) (size!8250 (buf!7863 b1!97))))))

(assert (= (and d!103216 res!255037) b!311303))

(assert (= (and b!311303 res!255038) b!311304))

(declare-fun m!449203 () Bool)

(assert (=> d!103216 m!449203))

(declare-fun m!449205 () Bool)

(assert (=> d!103216 m!449205))

(assert (=> b!311288 d!103216))

(declare-fun d!103218 () Bool)

(assert (=> d!103218 (= (array_inv!7802 (buf!7863 b2!97)) (bvsge (size!8250 (buf!7863 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311287 d!103218))

(declare-fun d!103220 () Bool)

(assert (=> d!103220 (= (inv!12 b1!97) (invariant!0 (currentBit!14477 b1!97) (currentByte!14482 b1!97) (size!8250 (buf!7863 b1!97))))))

(declare-fun bs!26715 () Bool)

(assert (= bs!26715 d!103220))

(assert (=> bs!26715 m!449205))

(assert (=> start!69116 d!103220))

(declare-fun d!103222 () Bool)

(assert (=> d!103222 (= (inv!12 b2!97) (invariant!0 (currentBit!14477 b2!97) (currentByte!14482 b2!97) (size!8250 (buf!7863 b2!97))))))

(declare-fun bs!26716 () Bool)

(assert (= bs!26716 d!103222))

(assert (=> bs!26716 m!449201))

(assert (=> start!69116 d!103222))

(declare-fun d!103224 () Bool)

(assert (=> d!103224 (= (array_inv!7802 (buf!7863 b1!97)) (bvsge (size!8250 (buf!7863 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311285 d!103224))

(declare-fun d!103226 () Bool)

(assert (=> d!103226 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8250 (buf!7863 b1!97))) ((_ sign_extend 32) (currentByte!14482 b1!97)) ((_ sign_extend 32) (currentBit!14477 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8250 (buf!7863 b1!97))) ((_ sign_extend 32) (currentByte!14482 b1!97)) ((_ sign_extend 32) (currentBit!14477 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26717 () Bool)

(assert (= bs!26717 d!103226))

(assert (=> bs!26717 m!449203))

(assert (=> b!311284 d!103226))

(push 1)

(assert (not d!103216))

(assert (not d!103226))

(assert (not d!103220))

(assert (not d!103206))

(assert (not d!103222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

