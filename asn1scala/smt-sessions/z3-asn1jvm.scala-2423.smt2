; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61812 () Bool)

(assert start!61812)

(declare-fun b!277110 () Bool)

(declare-fun e!197078 () Bool)

(declare-fun e!197079 () Bool)

(assert (=> b!277110 (= e!197078 e!197079)))

(declare-fun res!230146 () Bool)

(assert (=> b!277110 (=> (not res!230146) (not e!197079))))

(declare-fun lt!415245 () (_ BitVec 64))

(declare-datatypes ((array!15888 0))(
  ( (array!15889 (arr!7871 (Array (_ BitVec 32) (_ BitVec 8))) (size!6875 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12564 0))(
  ( (BitStream!12565 (buf!7343 array!15888) (currentByte!13605 (_ BitVec 32)) (currentBit!13600 (_ BitVec 32))) )
))
(declare-fun b2!124 () BitStream!12564)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!277110 (= res!230146 (bvsle lt!415245 (bitIndex!0 (size!6875 (buf!7343 b2!124)) (currentByte!13605 b2!124) (currentBit!13600 b2!124))))))

(declare-fun thiss!872 () BitStream!12564)

(assert (=> b!277110 (= lt!415245 (bitIndex!0 (size!6875 (buf!7343 thiss!872)) (currentByte!13605 thiss!872) (currentBit!13600 thiss!872)))))

(declare-fun b!277113 () Bool)

(declare-fun e!197076 () Bool)

(declare-fun array_inv!6599 (array!15888) Bool)

(assert (=> b!277113 (= e!197076 (array_inv!6599 (buf!7343 b2!124)))))

(declare-fun res!230145 () Bool)

(assert (=> start!61812 (=> (not res!230145) (not e!197078))))

(assert (=> start!61812 (= res!230145 (= (size!6875 (buf!7343 thiss!872)) (size!6875 (buf!7343 b2!124))))))

(assert (=> start!61812 e!197078))

(declare-fun e!197081 () Bool)

(declare-fun inv!12 (BitStream!12564) Bool)

(assert (=> start!61812 (and (inv!12 thiss!872) e!197081)))

(assert (=> start!61812 (and (inv!12 b2!124) e!197076)))

(declare-fun b!277111 () Bool)

(assert (=> b!277111 (= e!197079 (and (not (= (size!6875 (buf!7343 thiss!872)) #b00000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!415245) (bvsgt lt!415245 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6875 (buf!7343 thiss!872))))))))))

(declare-fun b!277112 () Bool)

(assert (=> b!277112 (= e!197081 (array_inv!6599 (buf!7343 thiss!872)))))

(assert (= (and start!61812 res!230145) b!277110))

(assert (= (and b!277110 res!230146) b!277111))

(assert (= start!61812 b!277112))

(assert (= start!61812 b!277113))

(declare-fun m!410321 () Bool)

(assert (=> b!277110 m!410321))

(declare-fun m!410323 () Bool)

(assert (=> b!277110 m!410323))

(declare-fun m!410325 () Bool)

(assert (=> b!277113 m!410325))

(declare-fun m!410327 () Bool)

(assert (=> start!61812 m!410327))

(declare-fun m!410329 () Bool)

(assert (=> start!61812 m!410329))

(declare-fun m!410331 () Bool)

(assert (=> b!277112 m!410331))

(check-sat (not b!277110) (not start!61812) (not b!277112) (not b!277113))
(check-sat)
(get-model)

(declare-fun d!95622 () Bool)

(declare-fun e!197102 () Bool)

(assert (=> d!95622 e!197102))

(declare-fun res!230158 () Bool)

(assert (=> d!95622 (=> (not res!230158) (not e!197102))))

(declare-fun lt!415262 () (_ BitVec 64))

(declare-fun lt!415266 () (_ BitVec 64))

(declare-fun lt!415264 () (_ BitVec 64))

(assert (=> d!95622 (= res!230158 (= lt!415262 (bvsub lt!415264 lt!415266)))))

(assert (=> d!95622 (or (= (bvand lt!415264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415266 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415264 lt!415266) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95622 (= lt!415266 (remainingBits!0 ((_ sign_extend 32) (size!6875 (buf!7343 b2!124))) ((_ sign_extend 32) (currentByte!13605 b2!124)) ((_ sign_extend 32) (currentBit!13600 b2!124))))))

(declare-fun lt!415261 () (_ BitVec 64))

(declare-fun lt!415263 () (_ BitVec 64))

(assert (=> d!95622 (= lt!415264 (bvmul lt!415261 lt!415263))))

(assert (=> d!95622 (or (= lt!415261 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415263 (bvsdiv (bvmul lt!415261 lt!415263) lt!415261)))))

(assert (=> d!95622 (= lt!415263 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95622 (= lt!415261 ((_ sign_extend 32) (size!6875 (buf!7343 b2!124))))))

(assert (=> d!95622 (= lt!415262 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13605 b2!124)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13600 b2!124))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!95622 (invariant!0 (currentBit!13600 b2!124) (currentByte!13605 b2!124) (size!6875 (buf!7343 b2!124)))))

(assert (=> d!95622 (= (bitIndex!0 (size!6875 (buf!7343 b2!124)) (currentByte!13605 b2!124) (currentBit!13600 b2!124)) lt!415262)))

(declare-fun b!277130 () Bool)

(declare-fun res!230157 () Bool)

(assert (=> b!277130 (=> (not res!230157) (not e!197102))))

(assert (=> b!277130 (= res!230157 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415262))))

(declare-fun b!277131 () Bool)

(declare-fun lt!415265 () (_ BitVec 64))

(assert (=> b!277131 (= e!197102 (bvsle lt!415262 (bvmul lt!415265 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277131 (or (= lt!415265 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415265 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415265)))))

(assert (=> b!277131 (= lt!415265 ((_ sign_extend 32) (size!6875 (buf!7343 b2!124))))))

(assert (= (and d!95622 res!230158) b!277130))

(assert (= (and b!277130 res!230157) b!277131))

(declare-fun m!410345 () Bool)

(assert (=> d!95622 m!410345))

(declare-fun m!410347 () Bool)

(assert (=> d!95622 m!410347))

(assert (=> b!277110 d!95622))

(declare-fun d!95626 () Bool)

(declare-fun e!197103 () Bool)

(assert (=> d!95626 e!197103))

(declare-fun res!230160 () Bool)

(assert (=> d!95626 (=> (not res!230160) (not e!197103))))

(declare-fun lt!415270 () (_ BitVec 64))

(declare-fun lt!415272 () (_ BitVec 64))

(declare-fun lt!415268 () (_ BitVec 64))

(assert (=> d!95626 (= res!230160 (= lt!415268 (bvsub lt!415270 lt!415272)))))

(assert (=> d!95626 (or (= (bvand lt!415270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415272 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415270 lt!415272) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95626 (= lt!415272 (remainingBits!0 ((_ sign_extend 32) (size!6875 (buf!7343 thiss!872))) ((_ sign_extend 32) (currentByte!13605 thiss!872)) ((_ sign_extend 32) (currentBit!13600 thiss!872))))))

(declare-fun lt!415267 () (_ BitVec 64))

(declare-fun lt!415269 () (_ BitVec 64))

(assert (=> d!95626 (= lt!415270 (bvmul lt!415267 lt!415269))))

(assert (=> d!95626 (or (= lt!415267 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415269 (bvsdiv (bvmul lt!415267 lt!415269) lt!415267)))))

(assert (=> d!95626 (= lt!415269 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95626 (= lt!415267 ((_ sign_extend 32) (size!6875 (buf!7343 thiss!872))))))

(assert (=> d!95626 (= lt!415268 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13605 thiss!872)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13600 thiss!872))))))

(assert (=> d!95626 (invariant!0 (currentBit!13600 thiss!872) (currentByte!13605 thiss!872) (size!6875 (buf!7343 thiss!872)))))

(assert (=> d!95626 (= (bitIndex!0 (size!6875 (buf!7343 thiss!872)) (currentByte!13605 thiss!872) (currentBit!13600 thiss!872)) lt!415268)))

(declare-fun b!277132 () Bool)

(declare-fun res!230159 () Bool)

(assert (=> b!277132 (=> (not res!230159) (not e!197103))))

(assert (=> b!277132 (= res!230159 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415268))))

(declare-fun b!277133 () Bool)

(declare-fun lt!415271 () (_ BitVec 64))

(assert (=> b!277133 (= e!197103 (bvsle lt!415268 (bvmul lt!415271 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277133 (or (= lt!415271 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415271 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415271)))))

(assert (=> b!277133 (= lt!415271 ((_ sign_extend 32) (size!6875 (buf!7343 thiss!872))))))

(assert (= (and d!95626 res!230160) b!277132))

(assert (= (and b!277132 res!230159) b!277133))

(declare-fun m!410349 () Bool)

(assert (=> d!95626 m!410349))

(declare-fun m!410351 () Bool)

(assert (=> d!95626 m!410351))

(assert (=> b!277110 d!95626))

(declare-fun d!95628 () Bool)

(assert (=> d!95628 (= (inv!12 thiss!872) (invariant!0 (currentBit!13600 thiss!872) (currentByte!13605 thiss!872) (size!6875 (buf!7343 thiss!872))))))

(declare-fun bs!24117 () Bool)

(assert (= bs!24117 d!95628))

(assert (=> bs!24117 m!410351))

(assert (=> start!61812 d!95628))

(declare-fun d!95630 () Bool)

(assert (=> d!95630 (= (inv!12 b2!124) (invariant!0 (currentBit!13600 b2!124) (currentByte!13605 b2!124) (size!6875 (buf!7343 b2!124))))))

(declare-fun bs!24118 () Bool)

(assert (= bs!24118 d!95630))

(assert (=> bs!24118 m!410347))

(assert (=> start!61812 d!95630))

(declare-fun d!95632 () Bool)

(assert (=> d!95632 (= (array_inv!6599 (buf!7343 thiss!872)) (bvsge (size!6875 (buf!7343 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!277112 d!95632))

(declare-fun d!95636 () Bool)

(assert (=> d!95636 (= (array_inv!6599 (buf!7343 b2!124)) (bvsge (size!6875 (buf!7343 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!277113 d!95636))

(check-sat (not d!95626) (not d!95628) (not d!95622) (not d!95630))
(check-sat)
