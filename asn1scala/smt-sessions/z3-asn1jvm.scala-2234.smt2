; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56788 () Bool)

(assert start!56788)

(declare-fun res!218777 () Bool)

(declare-fun e!181760 () Bool)

(assert (=> start!56788 (=> (not res!218777) (not e!181760))))

(declare-datatypes ((array!14447 0))(
  ( (array!14448 (arr!7295 (Array (_ BitVec 32) (_ BitVec 8))) (size!6308 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11538 0))(
  ( (BitStream!11539 (buf!6830 array!14447) (currentByte!12612 (_ BitVec 32)) (currentBit!12607 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11538)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56788 (= res!218777 (validate_offset_bit!0 ((_ sign_extend 32) (size!6308 (buf!6830 thiss!914))) ((_ sign_extend 32) (currentByte!12612 thiss!914)) ((_ sign_extend 32) (currentBit!12607 thiss!914))))))

(assert (=> start!56788 e!181760))

(declare-fun e!181761 () Bool)

(declare-fun inv!12 (BitStream!11538) Bool)

(assert (=> start!56788 (and (inv!12 thiss!914) e!181761)))

(assert (=> start!56788 true))

(declare-fun b!261343 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261343 (= e!181760 (and (not b!187) (or (bvslt (currentBit!12607 thiss!914) #b00000000000000000000000000000000) (bvsge (currentBit!12607 thiss!914) #b00000000000000000000000000001000))))))

(declare-fun b!261344 () Bool)

(declare-fun array_inv!6049 (array!14447) Bool)

(assert (=> b!261344 (= e!181761 (array_inv!6049 (buf!6830 thiss!914)))))

(assert (= (and start!56788 res!218777) b!261343))

(assert (= start!56788 b!261344))

(declare-fun m!391075 () Bool)

(assert (=> start!56788 m!391075))

(declare-fun m!391077 () Bool)

(assert (=> start!56788 m!391077))

(declare-fun m!391079 () Bool)

(assert (=> b!261344 m!391079))

(check-sat (not b!261344) (not start!56788))
(check-sat)
(get-model)

(declare-fun d!88000 () Bool)

(assert (=> d!88000 (= (array_inv!6049 (buf!6830 thiss!914)) (bvsge (size!6308 (buf!6830 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261344 d!88000))

(declare-fun d!88002 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88002 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6308 (buf!6830 thiss!914))) ((_ sign_extend 32) (currentByte!12612 thiss!914)) ((_ sign_extend 32) (currentBit!12607 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6308 (buf!6830 thiss!914))) ((_ sign_extend 32) (currentByte!12612 thiss!914)) ((_ sign_extend 32) (currentBit!12607 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22299 () Bool)

(assert (= bs!22299 d!88002))

(declare-fun m!391087 () Bool)

(assert (=> bs!22299 m!391087))

(assert (=> start!56788 d!88002))

(declare-fun d!88006 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88006 (= (inv!12 thiss!914) (invariant!0 (currentBit!12607 thiss!914) (currentByte!12612 thiss!914) (size!6308 (buf!6830 thiss!914))))))

(declare-fun bs!22301 () Bool)

(assert (= bs!22301 d!88006))

(declare-fun m!391091 () Bool)

(assert (=> bs!22301 m!391091))

(assert (=> start!56788 d!88006))

(check-sat (not d!88002) (not d!88006))
(check-sat)
(get-model)

(declare-fun d!88018 () Bool)

(assert (=> d!88018 (= (remainingBits!0 ((_ sign_extend 32) (size!6308 (buf!6830 thiss!914))) ((_ sign_extend 32) (currentByte!12612 thiss!914)) ((_ sign_extend 32) (currentBit!12607 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6308 (buf!6830 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12612 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12607 thiss!914)))))))

(assert (=> d!88002 d!88018))

(declare-fun d!88020 () Bool)

(assert (=> d!88020 (= (invariant!0 (currentBit!12607 thiss!914) (currentByte!12612 thiss!914) (size!6308 (buf!6830 thiss!914))) (and (bvsge (currentBit!12607 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12607 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12612 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12612 thiss!914) (size!6308 (buf!6830 thiss!914))) (and (= (currentBit!12607 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12612 thiss!914) (size!6308 (buf!6830 thiss!914)))))))))

(assert (=> d!88006 d!88020))

(check-sat)
