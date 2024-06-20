; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61810 () Bool)

(assert start!61810)

(declare-fun b!277100 () Bool)

(declare-fun e!197058 () Bool)

(declare-datatypes ((array!15886 0))(
  ( (array!15887 (arr!7870 (Array (_ BitVec 32) (_ BitVec 8))) (size!6874 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12562 0))(
  ( (BitStream!12563 (buf!7342 array!15886) (currentByte!13604 (_ BitVec 32)) (currentBit!13599 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12562)

(declare-fun array_inv!6598 (array!15886) Bool)

(assert (=> b!277100 (= e!197058 (array_inv!6598 (buf!7342 thiss!872)))))

(declare-fun b!277098 () Bool)

(declare-fun e!197059 () Bool)

(declare-fun e!197060 () Bool)

(assert (=> b!277098 (= e!197059 e!197060)))

(declare-fun res!230139 () Bool)

(assert (=> b!277098 (=> (not res!230139) (not e!197060))))

(declare-fun lt!415242 () (_ BitVec 64))

(declare-fun b2!124 () BitStream!12562)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!277098 (= res!230139 (bvsle lt!415242 (bitIndex!0 (size!6874 (buf!7342 b2!124)) (currentByte!13604 b2!124) (currentBit!13599 b2!124))))))

(assert (=> b!277098 (= lt!415242 (bitIndex!0 (size!6874 (buf!7342 thiss!872)) (currentByte!13604 thiss!872) (currentBit!13599 thiss!872)))))

(declare-fun b!277099 () Bool)

(assert (=> b!277099 (= e!197060 (and (not (= (size!6874 (buf!7342 thiss!872)) #b00000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!415242) (bvsgt lt!415242 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6874 (buf!7342 thiss!872))))))))))

(declare-fun res!230140 () Bool)

(assert (=> start!61810 (=> (not res!230140) (not e!197059))))

(assert (=> start!61810 (= res!230140 (= (size!6874 (buf!7342 thiss!872)) (size!6874 (buf!7342 b2!124))))))

(assert (=> start!61810 e!197059))

(declare-fun inv!12 (BitStream!12562) Bool)

(assert (=> start!61810 (and (inv!12 thiss!872) e!197058)))

(declare-fun e!197063 () Bool)

(assert (=> start!61810 (and (inv!12 b2!124) e!197063)))

(declare-fun b!277101 () Bool)

(assert (=> b!277101 (= e!197063 (array_inv!6598 (buf!7342 b2!124)))))

(assert (= (and start!61810 res!230140) b!277098))

(assert (= (and b!277098 res!230139) b!277099))

(assert (= start!61810 b!277100))

(assert (= start!61810 b!277101))

(declare-fun m!410309 () Bool)

(assert (=> b!277100 m!410309))

(declare-fun m!410311 () Bool)

(assert (=> b!277098 m!410311))

(declare-fun m!410313 () Bool)

(assert (=> b!277098 m!410313))

(declare-fun m!410315 () Bool)

(assert (=> start!61810 m!410315))

(declare-fun m!410317 () Bool)

(assert (=> start!61810 m!410317))

(declare-fun m!410319 () Bool)

(assert (=> b!277101 m!410319))

(push 1)

(assert (not b!277098))

(assert (not b!277100))

(assert (not start!61810))

(assert (not b!277101))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95624 () Bool)

(declare-fun e!197106 () Bool)

(assert (=> d!95624 e!197106))

(declare-fun res!230166 () Bool)

(assert (=> d!95624 (=> (not res!230166) (not e!197106))))

(declare-fun lt!415288 () (_ BitVec 64))

(declare-fun lt!415285 () (_ BitVec 64))

(declare-fun lt!415289 () (_ BitVec 64))

(assert (=> d!95624 (= res!230166 (= lt!415288 (bvsub lt!415289 lt!415285)))))

(assert (=> d!95624 (or (= (bvand lt!415289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415285 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415289 lt!415285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95624 (= lt!415285 (remainingBits!0 ((_ sign_extend 32) (size!6874 (buf!7342 b2!124))) ((_ sign_extend 32) (currentByte!13604 b2!124)) ((_ sign_extend 32) (currentBit!13599 b2!124))))))

(declare-fun lt!415290 () (_ BitVec 64))

(declare-fun lt!415287 () (_ BitVec 64))

(assert (=> d!95624 (= lt!415289 (bvmul lt!415290 lt!415287))))

(assert (=> d!95624 (or (= lt!415290 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415287 (bvsdiv (bvmul lt!415290 lt!415287) lt!415290)))))

(assert (=> d!95624 (= lt!415287 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95624 (= lt!415290 ((_ sign_extend 32) (size!6874 (buf!7342 b2!124))))))

(assert (=> d!95624 (= lt!415288 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13604 b2!124)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13599 b2!124))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!95624 (invariant!0 (currentBit!13599 b2!124) (currentByte!13604 b2!124) (size!6874 (buf!7342 b2!124)))))

(assert (=> d!95624 (= (bitIndex!0 (size!6874 (buf!7342 b2!124)) (currentByte!13604 b2!124) (currentBit!13599 b2!124)) lt!415288)))

(declare-fun b!277138 () Bool)

(declare-fun res!230165 () Bool)

(assert (=> b!277138 (=> (not res!230165) (not e!197106))))

(assert (=> b!277138 (= res!230165 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415288))))

(declare-fun b!277139 () Bool)

(declare-fun lt!415286 () (_ BitVec 64))

(assert (=> b!277139 (= e!197106 (bvsle lt!415288 (bvmul lt!415286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277139 (or (= lt!415286 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415286 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415286)))))

(assert (=> b!277139 (= lt!415286 ((_ sign_extend 32) (size!6874 (buf!7342 b2!124))))))

(assert (= (and d!95624 res!230166) b!277138))

(assert (= (and b!277138 res!230165) b!277139))

(declare-fun m!410357 () Bool)

(assert (=> d!95624 m!410357))

(declare-fun m!410359 () Bool)

(assert (=> d!95624 m!410359))

(assert (=> b!277098 d!95624))

(declare-fun d!95646 () Bool)

(declare-fun e!197107 () Bool)

(assert (=> d!95646 e!197107))

(declare-fun res!230168 () Bool)

(assert (=> d!95646 (=> (not res!230168) (not e!197107))))

(declare-fun lt!415295 () (_ BitVec 64))

(declare-fun lt!415294 () (_ BitVec 64))

(declare-fun lt!415291 () (_ BitVec 64))

(assert (=> d!95646 (= res!230168 (= lt!415294 (bvsub lt!415295 lt!415291)))))

(assert (=> d!95646 (or (= (bvand lt!415295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415291 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415295 lt!415291) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95646 (= lt!415291 (remainingBits!0 ((_ sign_extend 32) (size!6874 (buf!7342 thiss!872))) ((_ sign_extend 32) (currentByte!13604 thiss!872)) ((_ sign_extend 32) (currentBit!13599 thiss!872))))))

(declare-fun lt!415296 () (_ BitVec 64))

(declare-fun lt!415293 () (_ BitVec 64))

(assert (=> d!95646 (= lt!415295 (bvmul lt!415296 lt!415293))))

(assert (=> d!95646 (or (= lt!415296 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415293 (bvsdiv (bvmul lt!415296 lt!415293) lt!415296)))))

(assert (=> d!95646 (= lt!415293 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95646 (= lt!415296 ((_ sign_extend 32) (size!6874 (buf!7342 thiss!872))))))

(assert (=> d!95646 (= lt!415294 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13604 thiss!872)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13599 thiss!872))))))

(assert (=> d!95646 (invariant!0 (currentBit!13599 thiss!872) (currentByte!13604 thiss!872) (size!6874 (buf!7342 thiss!872)))))

(assert (=> d!95646 (= (bitIndex!0 (size!6874 (buf!7342 thiss!872)) (currentByte!13604 thiss!872) (currentBit!13599 thiss!872)) lt!415294)))

(declare-fun b!277140 () Bool)

(declare-fun res!230167 () Bool)

(assert (=> b!277140 (=> (not res!230167) (not e!197107))))

(assert (=> b!277140 (= res!230167 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415294))))

(declare-fun b!277141 () Bool)

(declare-fun lt!415292 () (_ BitVec 64))

(assert (=> b!277141 (= e!197107 (bvsle lt!415294 (bvmul lt!415292 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277141 (or (= lt!415292 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415292 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415292)))))

(assert (=> b!277141 (= lt!415292 ((_ sign_extend 32) (size!6874 (buf!7342 thiss!872))))))

(assert (= (and d!95646 res!230168) b!277140))

(assert (= (and b!277140 res!230167) b!277141))

(declare-fun m!410361 () Bool)

(assert (=> d!95646 m!410361))

(declare-fun m!410363 () Bool)

(assert (=> d!95646 m!410363))

(assert (=> b!277098 d!95646))

(declare-fun d!95648 () Bool)

(assert (=> d!95648 (= (array_inv!6598 (buf!7342 thiss!872)) (bvsge (size!6874 (buf!7342 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!277100 d!95648))

(declare-fun d!95650 () Bool)

(assert (=> d!95650 (= (inv!12 thiss!872) (invariant!0 (currentBit!13599 thiss!872) (currentByte!13604 thiss!872) (size!6874 (buf!7342 thiss!872))))))

(declare-fun bs!24121 () Bool)

(assert (= bs!24121 d!95650))

(assert (=> bs!24121 m!410363))

(assert (=> start!61810 d!95650))

(declare-fun d!95652 () Bool)

(assert (=> d!95652 (= (inv!12 b2!124) (invariant!0 (currentBit!13599 b2!124) (currentByte!13604 b2!124) (size!6874 (buf!7342 b2!124))))))

(declare-fun bs!24122 () Bool)

(assert (= bs!24122 d!95652))

(assert (=> bs!24122 m!410359))

(assert (=> start!61810 d!95652))

(declare-fun d!95654 () Bool)

(assert (=> d!95654 (= (array_inv!6598 (buf!7342 b2!124)) (bvsge (size!6874 (buf!7342 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!277101 d!95654))

(push 1)

(assert (not d!95652))

(assert (not d!95624))

(assert (not d!95646))

(assert (not d!95650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

