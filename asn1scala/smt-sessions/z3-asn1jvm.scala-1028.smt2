; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29532 () Bool)

(assert start!29532)

(declare-fun b!152541 () Bool)

(declare-fun e!102041 () Bool)

(declare-datatypes ((array!6814 0))(
  ( (array!6815 (arr!3903 (Array (_ BitVec 32) (_ BitVec 8))) (size!3080 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5418 0))(
  ( (BitStream!5419 (buf!3583 array!6814) (currentByte!6536 (_ BitVec 32)) (currentBit!6531 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5418)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152541 (= e!102041 (not (invariant!0 (currentBit!6531 bs1!10) (currentByte!6536 bs1!10) (size!3080 (buf!3583 bs1!10)))))))

(declare-fun res!127872 () Bool)

(assert (=> start!29532 (=> (not res!127872) (not e!102041))))

(declare-fun bs2!18 () BitStream!5418)

(assert (=> start!29532 (= res!127872 (= (size!3080 (buf!3583 bs1!10)) (size!3080 (buf!3583 bs2!18))))))

(assert (=> start!29532 e!102041))

(declare-fun e!102039 () Bool)

(declare-fun inv!12 (BitStream!5418) Bool)

(assert (=> start!29532 (and (inv!12 bs1!10) e!102039)))

(declare-fun e!102040 () Bool)

(assert (=> start!29532 (and (inv!12 bs2!18) e!102040)))

(declare-fun b!152542 () Bool)

(declare-fun array_inv!2869 (array!6814) Bool)

(assert (=> b!152542 (= e!102039 (array_inv!2869 (buf!3583 bs1!10)))))

(declare-fun b!152540 () Bool)

(declare-fun res!127871 () Bool)

(assert (=> b!152540 (=> (not res!127871) (not e!102041))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152540 (= res!127871 (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3080 (buf!3583 bs1!10)) (currentByte!6536 bs1!10) (currentBit!6531 bs1!10))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3080 (buf!3583 bs1!10))))))))

(declare-fun b!152543 () Bool)

(assert (=> b!152543 (= e!102040 (array_inv!2869 (buf!3583 bs2!18)))))

(assert (= (and start!29532 res!127872) b!152540))

(assert (= (and b!152540 res!127871) b!152541))

(assert (= start!29532 b!152542))

(assert (= start!29532 b!152543))

(declare-fun m!238405 () Bool)

(assert (=> b!152542 m!238405))

(declare-fun m!238407 () Bool)

(assert (=> b!152543 m!238407))

(declare-fun m!238409 () Bool)

(assert (=> b!152540 m!238409))

(declare-fun m!238411 () Bool)

(assert (=> b!152541 m!238411))

(declare-fun m!238413 () Bool)

(assert (=> start!29532 m!238413))

(declare-fun m!238415 () Bool)

(assert (=> start!29532 m!238415))

(check-sat (not start!29532) (not b!152543) (not b!152541) (not b!152542) (not b!152540))
(check-sat)
(get-model)

(declare-fun d!50104 () Bool)

(declare-fun e!102066 () Bool)

(assert (=> d!50104 e!102066))

(declare-fun res!127896 () Bool)

(assert (=> d!50104 (=> (not res!127896) (not e!102066))))

(declare-fun lt!239053 () (_ BitVec 64))

(declare-fun lt!239051 () (_ BitVec 64))

(declare-fun lt!239054 () (_ BitVec 64))

(assert (=> d!50104 (= res!127896 (= lt!239051 (bvsub lt!239053 lt!239054)))))

(assert (=> d!50104 (or (= (bvand lt!239053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239054 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239053 lt!239054) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50104 (= lt!239054 (remainingBits!0 ((_ sign_extend 32) (size!3080 (buf!3583 bs1!10))) ((_ sign_extend 32) (currentByte!6536 bs1!10)) ((_ sign_extend 32) (currentBit!6531 bs1!10))))))

(declare-fun lt!239056 () (_ BitVec 64))

(declare-fun lt!239052 () (_ BitVec 64))

(assert (=> d!50104 (= lt!239053 (bvmul lt!239056 lt!239052))))

(assert (=> d!50104 (or (= lt!239056 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239052 (bvsdiv (bvmul lt!239056 lt!239052) lt!239056)))))

(assert (=> d!50104 (= lt!239052 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50104 (= lt!239056 ((_ sign_extend 32) (size!3080 (buf!3583 bs1!10))))))

(assert (=> d!50104 (= lt!239051 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6536 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6531 bs1!10))))))

(assert (=> d!50104 (invariant!0 (currentBit!6531 bs1!10) (currentByte!6536 bs1!10) (size!3080 (buf!3583 bs1!10)))))

(assert (=> d!50104 (= (bitIndex!0 (size!3080 (buf!3583 bs1!10)) (currentByte!6536 bs1!10) (currentBit!6531 bs1!10)) lt!239051)))

(declare-fun b!152572 () Bool)

(declare-fun res!127895 () Bool)

(assert (=> b!152572 (=> (not res!127895) (not e!102066))))

(assert (=> b!152572 (= res!127895 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239051))))

(declare-fun b!152573 () Bool)

(declare-fun lt!239055 () (_ BitVec 64))

(assert (=> b!152573 (= e!102066 (bvsle lt!239051 (bvmul lt!239055 #b0000000000000000000000000000000000000000000000000000000000001000)))))

