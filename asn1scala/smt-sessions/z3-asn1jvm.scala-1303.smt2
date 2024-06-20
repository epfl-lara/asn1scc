; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37080 () Bool)

(assert start!37080)

(declare-fun res!140452 () Bool)

(declare-fun e!117391 () Bool)

(assert (=> start!37080 (=> (not res!140452) (not e!117391))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37080 (= res!140452 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37080 e!117391))

(assert (=> start!37080 true))

(declare-datatypes ((array!8858 0))(
  ( (array!8859 (arr!4844 (Array (_ BitVec 32) (_ BitVec 8))) (size!3923 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7002 0))(
  ( (BitStream!7003 (buf!4375 array!8858) (currentByte!8329 (_ BitVec 32)) (currentBit!8324 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7002)

(declare-fun e!117392 () Bool)

(declare-fun inv!12 (BitStream!7002) Bool)

(assert (=> start!37080 (and (inv!12 thiss!1894) e!117392)))

(declare-fun b!168841 () Bool)

(declare-fun res!140453 () Bool)

(assert (=> b!168841 (=> (not res!140453) (not e!117391))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168841 (= res!140453 (validate_offset_bits!1 ((_ sign_extend 32) (size!3923 (buf!4375 thiss!1894))) ((_ sign_extend 32) (currentByte!8329 thiss!1894)) ((_ sign_extend 32) (currentBit!8324 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168842 () Bool)

(assert (=> b!168842 (= e!117391 (and (bvsgt (bvadd (currentBit!8324 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsle (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!8324 thiss!1894) nBits!600) #b00000000000000000000000000001000)) #b00000000000000000000000000100000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8329 thiss!1894)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8329 thiss!1894)) (size!3923 (buf!4375 thiss!1894))))))))

(declare-fun b!168843 () Bool)

(declare-fun array_inv!3664 (array!8858) Bool)

(assert (=> b!168843 (= e!117392 (array_inv!3664 (buf!4375 thiss!1894)))))

(assert (= (and start!37080 res!140452) b!168841))

(assert (= (and b!168841 res!140453) b!168842))

(assert (= start!37080 b!168843))

(declare-fun m!268425 () Bool)

(assert (=> start!37080 m!268425))

(declare-fun m!268427 () Bool)

(assert (=> b!168841 m!268427))

(declare-fun m!268429 () Bool)

(assert (=> b!168843 m!268429))

(check-sat (not b!168843) (not start!37080) (not b!168841))
(check-sat)
(get-model)

(declare-fun d!59641 () Bool)

(assert (=> d!59641 (= (array_inv!3664 (buf!4375 thiss!1894)) (bvsge (size!3923 (buf!4375 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168843 d!59641))

(declare-fun d!59645 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59645 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8324 thiss!1894) (currentByte!8329 thiss!1894) (size!3923 (buf!4375 thiss!1894))))))

(declare-fun bs!14788 () Bool)

(assert (= bs!14788 d!59645))

(declare-fun m!268439 () Bool)

(assert (=> bs!14788 m!268439))

(assert (=> start!37080 d!59645))

(declare-fun d!59651 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59651 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3923 (buf!4375 thiss!1894))) ((_ sign_extend 32) (currentByte!8329 thiss!1894)) ((_ sign_extend 32) (currentBit!8324 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3923 (buf!4375 thiss!1894))) ((_ sign_extend 32) (currentByte!8329 thiss!1894)) ((_ sign_extend 32) (currentBit!8324 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14790 () Bool)

(assert (= bs!14790 d!59651))

(declare-fun m!268443 () Bool)

(assert (=> bs!14790 m!268443))

(assert (=> b!168841 d!59651))

(check-sat (not d!59651) (not d!59645))
(check-sat)
(get-model)

(declare-fun d!59659 () Bool)

(assert (=> d!59659 (= (remainingBits!0 ((_ sign_extend 32) (size!3923 (buf!4375 thiss!1894))) ((_ sign_extend 32) (currentByte!8329 thiss!1894)) ((_ sign_extend 32) (currentBit!8324 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3923 (buf!4375 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8329 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8324 thiss!1894)))))))

(assert (=> d!59651 d!59659))

(declare-fun d!59663 () Bool)

(assert (=> d!59663 (= (invariant!0 (currentBit!8324 thiss!1894) (currentByte!8329 thiss!1894) (size!3923 (buf!4375 thiss!1894))) (and (bvsge (currentBit!8324 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8324 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8329 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8329 thiss!1894) (size!3923 (buf!4375 thiss!1894))) (and (= (currentBit!8324 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8329 thiss!1894) (size!3923 (buf!4375 thiss!1894)))))))))

(assert (=> d!59645 d!59663))

(check-sat)
