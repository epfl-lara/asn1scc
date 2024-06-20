; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61774 () Bool)

(assert start!61774)

(declare-fun b!277004 () Bool)

(declare-fun res!230082 () Bool)

(declare-fun e!196956 () Bool)

(assert (=> b!277004 (=> (not res!230082) (not e!196956))))

(declare-datatypes ((array!15871 0))(
  ( (array!15872 (arr!7864 (Array (_ BitVec 32) (_ BitVec 8))) (size!6868 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12550 0))(
  ( (BitStream!12551 (buf!7336 array!15871) (currentByte!13592 (_ BitVec 32)) (currentBit!13587 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12550)

(assert (=> b!277004 (= res!230082 (not (= (size!6868 (buf!7336 thiss!872)) #b00000000000000000000000000000000)))))

(declare-fun b!277005 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277005 (= e!196956 (not (invariant!0 (currentBit!13587 thiss!872) (currentByte!13592 thiss!872) (size!6868 (buf!7336 thiss!872)))))))

(declare-fun b!277006 () Bool)

(declare-fun res!230083 () Bool)

(assert (=> b!277006 (=> (not res!230083) (not e!196956))))

(declare-fun b2!124 () BitStream!12550)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!277006 (= res!230083 (bvsle (bitIndex!0 (size!6868 (buf!7336 thiss!872)) (currentByte!13592 thiss!872) (currentBit!13587 thiss!872)) (bitIndex!0 (size!6868 (buf!7336 b2!124)) (currentByte!13592 b2!124) (currentBit!13587 b2!124))))))

(declare-fun b!277007 () Bool)

(declare-fun e!196957 () Bool)

(declare-fun array_inv!6592 (array!15871) Bool)

(assert (=> b!277007 (= e!196957 (array_inv!6592 (buf!7336 b2!124)))))

(declare-fun res!230081 () Bool)

(assert (=> start!61774 (=> (not res!230081) (not e!196956))))

(assert (=> start!61774 (= res!230081 (= (size!6868 (buf!7336 thiss!872)) (size!6868 (buf!7336 b2!124))))))

(assert (=> start!61774 e!196956))

(declare-fun e!196955 () Bool)

(declare-fun inv!12 (BitStream!12550) Bool)

(assert (=> start!61774 (and (inv!12 thiss!872) e!196955)))

(assert (=> start!61774 (and (inv!12 b2!124) e!196957)))

(declare-fun b!277008 () Bool)

(assert (=> b!277008 (= e!196955 (array_inv!6592 (buf!7336 thiss!872)))))

(assert (= (and start!61774 res!230081) b!277006))

(assert (= (and b!277006 res!230083) b!277004))

(assert (= (and b!277004 res!230082) b!277005))

(assert (= start!61774 b!277008))

(assert (= start!61774 b!277007))

(declare-fun m!410213 () Bool)

(assert (=> b!277008 m!410213))

(declare-fun m!410215 () Bool)

(assert (=> start!61774 m!410215))

(declare-fun m!410217 () Bool)

(assert (=> start!61774 m!410217))

(declare-fun m!410219 () Bool)

(assert (=> b!277005 m!410219))

(declare-fun m!410221 () Bool)

(assert (=> b!277006 m!410221))

(declare-fun m!410223 () Bool)

(assert (=> b!277006 m!410223))

(declare-fun m!410225 () Bool)

(assert (=> b!277007 m!410225))

(push 1)

(assert (not b!277005))

(assert (not b!277006))

(assert (not start!61774))

(assert (not b!277008))

(assert (not b!277007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95586 () Bool)

(assert (=> d!95586 (= (invariant!0 (currentBit!13587 thiss!872) (currentByte!13592 thiss!872) (size!6868 (buf!7336 thiss!872))) (and (bvsge (currentBit!13587 thiss!872) #b00000000000000000000000000000000) (bvslt (currentBit!13587 thiss!872) #b00000000000000000000000000001000) (bvsge (currentByte!13592 thiss!872) #b00000000000000000000000000000000) (or (bvslt (currentByte!13592 thiss!872) (size!6868 (buf!7336 thiss!872))) (and (= (currentBit!13587 thiss!872) #b00000000000000000000000000000000) (= (currentByte!13592 thiss!872) (size!6868 (buf!7336 thiss!872)))))))))

(assert (=> b!277005 d!95586))

(declare-fun d!95588 () Bool)

(declare-fun e!196997 () Bool)

(assert (=> d!95588 e!196997))

(declare-fun res!230118 () Bool)

(assert (=> d!95588 (=> (not res!230118) (not e!196997))))

(declare-fun lt!415201 () (_ BitVec 64))

(declare-fun lt!415202 () (_ BitVec 64))

(declare-fun lt!415199 () (_ BitVec 64))

(assert (=> d!95588 (= res!230118 (= lt!415201 (bvsub lt!415202 lt!415199)))))

(assert (=> d!95588 (or (= (bvand lt!415202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415199 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415202 lt!415199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95588 (= lt!415199 (remainingBits!0 ((_ sign_extend 32) (size!6868 (buf!7336 thiss!872))) ((_ sign_extend 32) (currentByte!13592 thiss!872)) ((_ sign_extend 32) (currentBit!13587 thiss!872))))))

(declare-fun lt!415200 () (_ BitVec 64))

(declare-fun lt!415203 () (_ BitVec 64))

(assert (=> d!95588 (= lt!415202 (bvmul lt!415200 lt!415203))))

(assert (=> d!95588 (or (= lt!415200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415203 (bvsdiv (bvmul lt!415200 lt!415203) lt!415200)))))

(assert (=> d!95588 (= lt!415203 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95588 (= lt!415200 ((_ sign_extend 32) (size!6868 (buf!7336 thiss!872))))))

(assert (=> d!95588 (= lt!415201 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13592 thiss!872)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13587 thiss!872))))))

(assert (=> d!95588 (invariant!0 (currentBit!13587 thiss!872) (currentByte!13592 thiss!872) (size!6868 (buf!7336 thiss!872)))))

(assert (=> d!95588 (= (bitIndex!0 (size!6868 (buf!7336 thiss!872)) (currentByte!13592 thiss!872) (currentBit!13587 thiss!872)) lt!415201)))

(declare-fun b!277055 () Bool)

(declare-fun res!230119 () Bool)

(assert (=> b!277055 (=> (not res!230119) (not e!196997))))

(assert (=> b!277055 (= res!230119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415201))))

(declare-fun b!277056 () Bool)

(declare-fun lt!415198 () (_ BitVec 64))

(assert (=> b!277056 (= e!196997 (bvsle lt!415201 (bvmul lt!415198 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277056 (or (= lt!415198 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415198 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415198)))))

(assert (=> b!277056 (= lt!415198 ((_ sign_extend 32) (size!6868 (buf!7336 thiss!872))))))

(assert (= (and d!95588 res!230118) b!277055))

(assert (= (and b!277055 res!230119) b!277056))

(declare-fun m!410261 () Bool)

(assert (=> d!95588 m!410261))

(assert (=> d!95588 m!410219))

(assert (=> b!277006 d!95588))

(declare-fun d!95598 () Bool)

(declare-fun e!196998 () Bool)

(assert (=> d!95598 e!196998))

(declare-fun res!230120 () Bool)

(assert (=> d!95598 (=> (not res!230120) (not e!196998))))

(declare-fun lt!415205 () (_ BitVec 64))

(declare-fun lt!415208 () (_ BitVec 64))

(declare-fun lt!415207 () (_ BitVec 64))

(assert (=> d!95598 (= res!230120 (= lt!415207 (bvsub lt!415208 lt!415205)))))

(assert (=> d!95598 (or (= (bvand lt!415208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415205 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415208 lt!415205) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95598 (= lt!415205 (remainingBits!0 ((_ sign_extend 32) (size!6868 (buf!7336 b2!124))) ((_ sign_extend 32) (currentByte!13592 b2!124)) ((_ sign_extend 32) (currentBit!13587 b2!124))))))

(declare-fun lt!415206 () (_ BitVec 64))

(declare-fun lt!415209 () (_ BitVec 64))

(assert (=> d!95598 (= lt!415208 (bvmul lt!415206 lt!415209))))

(assert (=> d!95598 (or (= lt!415206 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415209 (bvsdiv (bvmul lt!415206 lt!415209) lt!415206)))))

(assert (=> d!95598 (= lt!415209 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95598 (= lt!415206 ((_ sign_extend 32) (size!6868 (buf!7336 b2!124))))))

(assert (=> d!95598 (= lt!415207 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13592 b2!124)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13587 b2!124))))))

(assert (=> d!95598 (invariant!0 (currentBit!13587 b2!124) (currentByte!13592 b2!124) (size!6868 (buf!7336 b2!124)))))

(assert (=> d!95598 (= (bitIndex!0 (size!6868 (buf!7336 b2!124)) (currentByte!13592 b2!124) (currentBit!13587 b2!124)) lt!415207)))

(declare-fun b!277057 () Bool)

(declare-fun res!230121 () Bool)

(assert (=> b!277057 (=> (not res!230121) (not e!196998))))

(assert (=> b!277057 (= res!230121 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415207))))

(declare-fun b!277058 () Bool)

(declare-fun lt!415204 () (_ BitVec 64))

(assert (=> b!277058 (= e!196998 (bvsle lt!415207 (bvmul lt!415204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277058 (or (= lt!415204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415204)))))

(assert (=> b!277058 (= lt!415204 ((_ sign_extend 32) (size!6868 (buf!7336 b2!124))))))

(assert (= (and d!95598 res!230120) b!277057))

(assert (= (and b!277057 res!230121) b!277058))

(declare-fun m!410263 () Bool)

(assert (=> d!95598 m!410263))

(declare-fun m!410265 () Bool)

(assert (=> d!95598 m!410265))

(assert (=> b!277006 d!95598))

(declare-fun d!95600 () Bool)

(assert (=> d!95600 (= (inv!12 thiss!872) (invariant!0 (currentBit!13587 thiss!872) (currentByte!13592 thiss!872) (size!6868 (buf!7336 thiss!872))))))

(declare-fun bs!24107 () Bool)

(assert (= bs!24107 d!95600))

(assert (=> bs!24107 m!410219))

(assert (=> start!61774 d!95600))

(declare-fun d!95604 () Bool)

(assert (=> d!95604 (= (inv!12 b2!124) (invariant!0 (currentBit!13587 b2!124) (currentByte!13592 b2!124) (size!6868 (buf!7336 b2!124))))))

(declare-fun bs!24108 () Bool)

(assert (= bs!24108 d!95604))

(assert (=> bs!24108 m!410265))

(assert (=> start!61774 d!95604))

(declare-fun d!95606 () Bool)

(assert (=> d!95606 (= (array_inv!6592 (buf!7336 b2!124)) (bvsge (size!6868 (buf!7336 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!277007 d!95606))

(declare-fun d!95612 () Bool)

(assert (=> d!95612 (= (array_inv!6592 (buf!7336 thiss!872)) (bvsge (size!6868 (buf!7336 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!277008 d!95612))

(push 1)

(assert (not d!95604))

(assert (not d!95600))

(assert (not d!95588))

(assert (not d!95598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

