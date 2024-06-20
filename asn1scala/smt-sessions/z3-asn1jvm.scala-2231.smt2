; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56692 () Bool)

(assert start!56692)

(declare-fun res!218741 () Bool)

(declare-fun e!181679 () Bool)

(assert (=> start!56692 (=> (not res!218741) (not e!181679))))

(declare-datatypes ((array!14420 0))(
  ( (array!14421 (arr!7286 (Array (_ BitVec 32) (_ BitVec 8))) (size!6299 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11520 0))(
  ( (BitStream!11521 (buf!6821 array!14420) (currentByte!12582 (_ BitVec 32)) (currentBit!12577 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11520)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56692 (= res!218741 (validate_offset_bit!0 ((_ sign_extend 32) (size!6299 (buf!6821 thiss!914))) ((_ sign_extend 32) (currentByte!12582 thiss!914)) ((_ sign_extend 32) (currentBit!12577 thiss!914))))))

(assert (=> start!56692 e!181679))

(declare-fun e!181680 () Bool)

(declare-fun inv!12 (BitStream!11520) Bool)

(assert (=> start!56692 (and (inv!12 thiss!914) e!181680)))

(assert (=> start!56692 true))

(declare-fun b!261280 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261280 (= e!181679 (and b!187 (or (bvslt (currentByte!12582 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12582 thiss!914) (size!6299 (buf!6821 thiss!914))))))))

(declare-fun b!261281 () Bool)

(declare-fun array_inv!6040 (array!14420) Bool)

(assert (=> b!261281 (= e!181680 (array_inv!6040 (buf!6821 thiss!914)))))

(assert (= (and start!56692 res!218741) b!261280))

(assert (= start!56692 b!261281))

(declare-fun m!390955 () Bool)

(assert (=> start!56692 m!390955))

(declare-fun m!390957 () Bool)

(assert (=> start!56692 m!390957))

(declare-fun m!390959 () Bool)

(assert (=> b!261281 m!390959))

(check-sat (not start!56692) (not b!261281))
(check-sat)
(get-model)

(declare-fun d!87910 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87910 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6299 (buf!6821 thiss!914))) ((_ sign_extend 32) (currentByte!12582 thiss!914)) ((_ sign_extend 32) (currentBit!12577 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6299 (buf!6821 thiss!914))) ((_ sign_extend 32) (currentByte!12582 thiss!914)) ((_ sign_extend 32) (currentBit!12577 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22269 () Bool)

(assert (= bs!22269 d!87910))

(declare-fun m!390967 () Bool)

(assert (=> bs!22269 m!390967))

(assert (=> start!56692 d!87910))

(declare-fun d!87912 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87912 (= (inv!12 thiss!914) (invariant!0 (currentBit!12577 thiss!914) (currentByte!12582 thiss!914) (size!6299 (buf!6821 thiss!914))))))

(declare-fun bs!22270 () Bool)

(assert (= bs!22270 d!87912))

(declare-fun m!390969 () Bool)

(assert (=> bs!22270 m!390969))

(assert (=> start!56692 d!87912))

(declare-fun d!87916 () Bool)

(assert (=> d!87916 (= (array_inv!6040 (buf!6821 thiss!914)) (bvsge (size!6299 (buf!6821 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261281 d!87916))

(check-sat (not d!87912) (not d!87910))
(check-sat)
(get-model)

(declare-fun d!87928 () Bool)

(assert (=> d!87928 (= (invariant!0 (currentBit!12577 thiss!914) (currentByte!12582 thiss!914) (size!6299 (buf!6821 thiss!914))) (and (bvsge (currentBit!12577 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12577 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12582 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12582 thiss!914) (size!6299 (buf!6821 thiss!914))) (and (= (currentBit!12577 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12582 thiss!914) (size!6299 (buf!6821 thiss!914)))))))))

(assert (=> d!87912 d!87928))

(declare-fun d!87930 () Bool)

(assert (=> d!87930 (= (remainingBits!0 ((_ sign_extend 32) (size!6299 (buf!6821 thiss!914))) ((_ sign_extend 32) (currentByte!12582 thiss!914)) ((_ sign_extend 32) (currentBit!12577 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6299 (buf!6821 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12582 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12577 thiss!914)))))))

(assert (=> d!87910 d!87930))

(check-sat)
