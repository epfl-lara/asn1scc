; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69150 () Bool)

(assert start!69150)

(declare-fun b!311361 () Bool)

(declare-fun e!223870 () Bool)

(declare-datatypes ((array!19022 0))(
  ( (array!19023 (arr!9333 (Array (_ BitVec 32) (_ BitVec 8))) (size!8253 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13610 0))(
  ( (BitStream!13611 (buf!7866 array!19022) (currentByte!14493 (_ BitVec 32)) (currentBit!14488 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13610)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311361 (= e!223870 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14488 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14493 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8253 (buf!7866 b1!97)))))))))

(declare-fun res!255079 () Bool)

(assert (=> start!69150 (=> (not res!255079) (not e!223870))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13610)

(assert (=> start!69150 (= res!255079 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8253 (buf!7866 b1!97)) (size!8253 (buf!7866 b2!97)))))))

(assert (=> start!69150 e!223870))

(assert (=> start!69150 true))

(declare-fun e!223869 () Bool)

(declare-fun inv!12 (BitStream!13610) Bool)

(assert (=> start!69150 (and (inv!12 b1!97) e!223869)))

(declare-fun e!223868 () Bool)

(assert (=> start!69150 (and (inv!12 b2!97) e!223868)))

(declare-fun b!311362 () Bool)

(declare-fun array_inv!7805 (array!19022) Bool)

(assert (=> b!311362 (= e!223869 (array_inv!7805 (buf!7866 b1!97)))))

(declare-fun b!311363 () Bool)

(assert (=> b!311363 (= e!223868 (array_inv!7805 (buf!7866 b2!97)))))

(declare-fun b!311364 () Bool)

(declare-fun res!255081 () Bool)

(assert (=> b!311364 (=> (not res!255081) (not e!223870))))

(assert (=> b!311364 (= res!255081 (and (bvsle ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14493 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14488 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14493 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14488 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!311365 () Bool)

(declare-fun res!255080 () Bool)

(assert (=> b!311365 (=> (not res!255080) (not e!223870))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311365 (= res!255080 (bvsle (bitIndex!0 (size!8253 (buf!7866 b2!97)) (currentByte!14493 b2!97) (currentBit!14488 b2!97)) (bvadd (bitIndex!0 (size!8253 (buf!7866 b1!97)) (currentByte!14493 b1!97) (currentBit!14488 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311366 () Bool)

(declare-fun res!255082 () Bool)

(assert (=> b!311366 (=> (not res!255082) (not e!223870))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311366 (= res!255082 (validate_offset_bits!1 ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))) ((_ sign_extend 32) (currentByte!14493 b1!97)) ((_ sign_extend 32) (currentBit!14488 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69150 res!255079) b!311366))

(assert (= (and b!311366 res!255082) b!311365))

(assert (= (and b!311365 res!255080) b!311364))

(assert (= (and b!311364 res!255081) b!311361))

(assert (= start!69150 b!311362))

(assert (= start!69150 b!311363))

(declare-fun m!449245 () Bool)

(assert (=> b!311363 m!449245))

(declare-fun m!449247 () Bool)

(assert (=> b!311361 m!449247))

(declare-fun m!449249 () Bool)

(assert (=> b!311365 m!449249))

(declare-fun m!449251 () Bool)

(assert (=> b!311365 m!449251))

(declare-fun m!449253 () Bool)

(assert (=> b!311362 m!449253))

(declare-fun m!449255 () Bool)

(assert (=> b!311366 m!449255))

(declare-fun m!449257 () Bool)

(assert (=> start!69150 m!449257))

(declare-fun m!449259 () Bool)

(assert (=> start!69150 m!449259))

(push 1)

(assert (not b!311366))

(assert (not start!69150))

(assert (not b!311361))

(assert (not b!311363))

(assert (not b!311365))

(assert (not b!311362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103260 () Bool)

(declare-fun e!223877 () Bool)

(assert (=> d!103260 e!223877))

(declare-fun res!255094 () Bool)

(assert (=> d!103260 (=> (not res!255094) (not e!223877))))

(declare-fun lt!441083 () (_ BitVec 64))

(declare-fun lt!441085 () (_ BitVec 64))

(declare-fun lt!441081 () (_ BitVec 64))

(assert (=> d!103260 (= res!255094 (= lt!441081 (bvsub lt!441083 lt!441085)))))

(assert (=> d!103260 (or (= (bvand lt!441083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441085 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441083 lt!441085) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103260 (= lt!441085 (remainingBits!0 ((_ sign_extend 32) (size!8253 (buf!7866 b2!97))) ((_ sign_extend 32) (currentByte!14493 b2!97)) ((_ sign_extend 32) (currentBit!14488 b2!97))))))

(declare-fun lt!441078 () (_ BitVec 64))

(declare-fun lt!441080 () (_ BitVec 64))

(assert (=> d!103260 (= lt!441083 (bvmul lt!441078 lt!441080))))

(assert (=> d!103260 (or (= lt!441078 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441080 (bvsdiv (bvmul lt!441078 lt!441080) lt!441078)))))

(assert (=> d!103260 (= lt!441080 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103260 (= lt!441078 ((_ sign_extend 32) (size!8253 (buf!7866 b2!97))))))

(assert (=> d!103260 (= lt!441081 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14493 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14488 b2!97))))))

(assert (=> d!103260 (invariant!0 (currentBit!14488 b2!97) (currentByte!14493 b2!97) (size!8253 (buf!7866 b2!97)))))

(assert (=> d!103260 (= (bitIndex!0 (size!8253 (buf!7866 b2!97)) (currentByte!14493 b2!97) (currentBit!14488 b2!97)) lt!441081)))

(declare-fun b!311376 () Bool)

(declare-fun res!255091 () Bool)

(assert (=> b!311376 (=> (not res!255091) (not e!223877))))

(assert (=> b!311376 (= res!255091 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441081))))

(declare-fun b!311378 () Bool)

(declare-fun lt!441076 () (_ BitVec 64))

(assert (=> b!311378 (= e!223877 (bvsle lt!441081 (bvmul lt!441076 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311378 (or (= lt!441076 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441076 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441076)))))

(assert (=> b!311378 (= lt!441076 ((_ sign_extend 32) (size!8253 (buf!7866 b2!97))))))

(assert (= (and d!103260 res!255094) b!311376))

(assert (= (and b!311376 res!255091) b!311378))

(declare-fun m!449268 () Bool)

(assert (=> d!103260 m!449268))

(declare-fun m!449271 () Bool)

(assert (=> d!103260 m!449271))

(assert (=> b!311365 d!103260))

(declare-fun d!103264 () Bool)

(declare-fun e!223878 () Bool)

(assert (=> d!103264 e!223878))

(declare-fun res!255098 () Bool)

(assert (=> d!103264 (=> (not res!255098) (not e!223878))))

(declare-fun lt!441092 () (_ BitVec 64))

(declare-fun lt!441093 () (_ BitVec 64))

(declare-fun lt!441095 () (_ BitVec 64))

(assert (=> d!103264 (= res!255098 (= lt!441092 (bvsub lt!441093 lt!441095)))))

(assert (=> d!103264 (or (= (bvand lt!441093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441093 lt!441095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103264 (= lt!441095 (remainingBits!0 ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))) ((_ sign_extend 32) (currentByte!14493 b1!97)) ((_ sign_extend 32) (currentBit!14488 b1!97))))))

(declare-fun lt!441088 () (_ BitVec 64))

(declare-fun lt!441090 () (_ BitVec 64))

(assert (=> d!103264 (= lt!441093 (bvmul lt!441088 lt!441090))))

(assert (=> d!103264 (or (= lt!441088 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441090 (bvsdiv (bvmul lt!441088 lt!441090) lt!441088)))))

(assert (=> d!103264 (= lt!441090 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103264 (= lt!441088 ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))))))

(assert (=> d!103264 (= lt!441092 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14493 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14488 b1!97))))))

(assert (=> d!103264 (invariant!0 (currentBit!14488 b1!97) (currentByte!14493 b1!97) (size!8253 (buf!7866 b1!97)))))

(assert (=> d!103264 (= (bitIndex!0 (size!8253 (buf!7866 b1!97)) (currentByte!14493 b1!97) (currentBit!14488 b1!97)) lt!441092)))

(declare-fun b!311379 () Bool)

(declare-fun res!255095 () Bool)

(assert (=> b!311379 (=> (not res!255095) (not e!223878))))

(assert (=> b!311379 (= res!255095 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441092))))

(declare-fun b!311380 () Bool)

(declare-fun lt!441087 () (_ BitVec 64))

(assert (=> b!311380 (= e!223878 (bvsle lt!441092 (bvmul lt!441087 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311380 (or (= lt!441087 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441087 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441087)))))

(assert (=> b!311380 (= lt!441087 ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))))))

(assert (= (and d!103264 res!255098) b!311379))

(assert (= (and b!311379 res!255095) b!311380))

(declare-fun m!449273 () Bool)

(assert (=> d!103264 m!449273))

(declare-fun m!449275 () Bool)

(assert (=> d!103264 m!449275))

(assert (=> b!311365 d!103264))

(declare-fun d!103270 () Bool)

(assert (=> d!103270 (= (array_inv!7805 (buf!7866 b2!97)) (bvsge (size!8253 (buf!7866 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311363 d!103270))

(declare-fun d!103272 () Bool)

(assert (=> d!103272 (= (inv!12 b1!97) (invariant!0 (currentBit!14488 b1!97) (currentByte!14493 b1!97) (size!8253 (buf!7866 b1!97))))))

(declare-fun bs!26726 () Bool)

(assert (= bs!26726 d!103272))

(assert (=> bs!26726 m!449275))

(assert (=> start!69150 d!103272))

(declare-fun d!103274 () Bool)

(assert (=> d!103274 (= (inv!12 b2!97) (invariant!0 (currentBit!14488 b2!97) (currentByte!14493 b2!97) (size!8253 (buf!7866 b2!97))))))

(declare-fun bs!26727 () Bool)

(assert (= bs!26727 d!103274))

(assert (=> bs!26727 m!449271))

(assert (=> start!69150 d!103274))

(declare-fun d!103276 () Bool)

(assert (=> d!103276 (= (array_inv!7805 (buf!7866 b1!97)) (bvsge (size!8253 (buf!7866 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311362 d!103276))

(declare-fun d!103278 () Bool)

(assert (=> d!103278 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14488 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14493 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14488 b1!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14488 b1!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14493 b1!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14493 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14488 b1!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14493 b1!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8253 (buf!7866 b1!97)))))))))))

(assert (=> b!311361 d!103278))

(declare-fun d!103280 () Bool)

(assert (=> d!103280 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))) ((_ sign_extend 32) (currentByte!14493 b1!97)) ((_ sign_extend 32) (currentBit!14488 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8253 (buf!7866 b1!97))) ((_ sign_extend 32) (currentByte!14493 b1!97)) ((_ sign_extend 32) (currentBit!14488 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26728 () Bool)

(assert (= bs!26728 d!103280))

(assert (=> bs!26728 m!449273))

(assert (=> b!311366 d!103280))

(push 1)

