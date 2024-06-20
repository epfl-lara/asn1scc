; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56610 () Bool)

(assert start!56610)

(declare-fun res!218705 () Bool)

(declare-fun e!181571 () Bool)

(assert (=> start!56610 (=> (not res!218705) (not e!181571))))

(declare-datatypes ((array!14390 0))(
  ( (array!14391 (arr!7274 (Array (_ BitVec 32) (_ BitVec 8))) (size!6287 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11496 0))(
  ( (BitStream!11497 (buf!6809 array!14390) (currentByte!12553 (_ BitVec 32)) (currentBit!12548 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11496)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56610 (= res!218705 (validate_offset_bit!0 ((_ sign_extend 32) (size!6287 (buf!6809 thiss!914))) ((_ sign_extend 32) (currentByte!12553 thiss!914)) ((_ sign_extend 32) (currentBit!12548 thiss!914))))))

(assert (=> start!56610 e!181571))

(declare-fun e!181572 () Bool)

(declare-fun inv!12 (BitStream!11496) Bool)

(assert (=> start!56610 (and (inv!12 thiss!914) e!181572)))

(assert (=> start!56610 true))

(declare-fun b!261208 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261208 (= e!181571 (and b!187 (or (bvslt (currentByte!12553 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12553 thiss!914) (size!6287 (buf!6809 thiss!914))))))))

(declare-fun b!261209 () Bool)

(declare-fun array_inv!6028 (array!14390) Bool)

(assert (=> b!261209 (= e!181572 (array_inv!6028 (buf!6809 thiss!914)))))

(assert (= (and start!56610 res!218705) b!261208))

(assert (= start!56610 b!261209))

(declare-fun m!390835 () Bool)

(assert (=> start!56610 m!390835))

(declare-fun m!390837 () Bool)

(assert (=> start!56610 m!390837))

(declare-fun m!390839 () Bool)

(assert (=> b!261209 m!390839))

(check-sat (not b!261209) (not start!56610))
(check-sat)
(get-model)

(declare-fun d!87844 () Bool)

(assert (=> d!87844 (= (array_inv!6028 (buf!6809 thiss!914)) (bvsge (size!6287 (buf!6809 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261209 d!87844))

(declare-fun d!87846 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87846 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6287 (buf!6809 thiss!914))) ((_ sign_extend 32) (currentByte!12553 thiss!914)) ((_ sign_extend 32) (currentBit!12548 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6287 (buf!6809 thiss!914))) ((_ sign_extend 32) (currentByte!12553 thiss!914)) ((_ sign_extend 32) (currentBit!12548 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22245 () Bool)

(assert (= bs!22245 d!87846))

(declare-fun m!390847 () Bool)

(assert (=> bs!22245 m!390847))

(assert (=> start!56610 d!87846))

(declare-fun d!87852 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87852 (= (inv!12 thiss!914) (invariant!0 (currentBit!12548 thiss!914) (currentByte!12553 thiss!914) (size!6287 (buf!6809 thiss!914))))))

(declare-fun bs!22247 () Bool)

(assert (= bs!22247 d!87852))

(declare-fun m!390851 () Bool)

(assert (=> bs!22247 m!390851))

(assert (=> start!56610 d!87852))

(check-sat (not d!87852) (not d!87846))
(check-sat)
(get-model)

(declare-fun d!87862 () Bool)

(assert (=> d!87862 (= (invariant!0 (currentBit!12548 thiss!914) (currentByte!12553 thiss!914) (size!6287 (buf!6809 thiss!914))) (and (bvsge (currentBit!12548 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12548 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12553 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12553 thiss!914) (size!6287 (buf!6809 thiss!914))) (and (= (currentBit!12548 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12553 thiss!914) (size!6287 (buf!6809 thiss!914)))))))))

(assert (=> d!87852 d!87862))

(declare-fun d!87866 () Bool)

(assert (=> d!87866 (= (remainingBits!0 ((_ sign_extend 32) (size!6287 (buf!6809 thiss!914))) ((_ sign_extend 32) (currentByte!12553 thiss!914)) ((_ sign_extend 32) (currentBit!12548 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6287 (buf!6809 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12553 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12548 thiss!914)))))))

(assert (=> d!87846 d!87866))

(check-sat)
