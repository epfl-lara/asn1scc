; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56646 () Bool)

(assert start!56646)

(declare-fun res!218714 () Bool)

(declare-fun e!181598 () Bool)

(assert (=> start!56646 (=> (not res!218714) (not e!181598))))

(declare-datatypes ((array!14399 0))(
  ( (array!14400 (arr!7277 (Array (_ BitVec 32) (_ BitVec 8))) (size!6290 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11502 0))(
  ( (BitStream!11503 (buf!6812 array!14399) (currentByte!12565 (_ BitVec 32)) (currentBit!12560 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11502)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56646 (= res!218714 (validate_offset_bit!0 ((_ sign_extend 32) (size!6290 (buf!6812 thiss!914))) ((_ sign_extend 32) (currentByte!12565 thiss!914)) ((_ sign_extend 32) (currentBit!12560 thiss!914))))))

(assert (=> start!56646 e!181598))

(declare-fun e!181599 () Bool)

(declare-fun inv!12 (BitStream!11502) Bool)

(assert (=> start!56646 (and (inv!12 thiss!914) e!181599)))

(assert (=> start!56646 true))

(declare-fun b!261226 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261226 (= e!181598 (and b!187 (or (bvslt (currentBit!12560 thiss!914) #b00000000000000000000000000000000) (bvsge (currentBit!12560 thiss!914) #b00000000000000000000000000001000))))))

(declare-fun b!261227 () Bool)

(declare-fun array_inv!6031 (array!14399) Bool)

(assert (=> b!261227 (= e!181599 (array_inv!6031 (buf!6812 thiss!914)))))

(assert (= (and start!56646 res!218714) b!261226))

(assert (= start!56646 b!261227))

(declare-fun m!390865 () Bool)

(assert (=> start!56646 m!390865))

(declare-fun m!390867 () Bool)

(assert (=> start!56646 m!390867))

(declare-fun m!390869 () Bool)

(assert (=> b!261227 m!390869))

(check-sat (not b!261227) (not start!56646))
(check-sat)
(get-model)

(declare-fun d!87876 () Bool)

(assert (=> d!87876 (= (array_inv!6031 (buf!6812 thiss!914)) (bvsge (size!6290 (buf!6812 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261227 d!87876))

(declare-fun d!87878 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87878 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6290 (buf!6812 thiss!914))) ((_ sign_extend 32) (currentByte!12565 thiss!914)) ((_ sign_extend 32) (currentBit!12560 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6290 (buf!6812 thiss!914))) ((_ sign_extend 32) (currentByte!12565 thiss!914)) ((_ sign_extend 32) (currentBit!12560 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22254 () Bool)

(assert (= bs!22254 d!87878))

(declare-fun m!390877 () Bool)

(assert (=> bs!22254 m!390877))

(assert (=> start!56646 d!87878))

(declare-fun d!87880 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87880 (= (inv!12 thiss!914) (invariant!0 (currentBit!12560 thiss!914) (currentByte!12565 thiss!914) (size!6290 (buf!6812 thiss!914))))))

(declare-fun bs!22255 () Bool)

(assert (= bs!22255 d!87880))

(declare-fun m!390879 () Bool)

(assert (=> bs!22255 m!390879))

(assert (=> start!56646 d!87880))

(check-sat (not d!87878) (not d!87880))
(check-sat)
(get-model)

(declare-fun d!87894 () Bool)

(assert (=> d!87894 (= (remainingBits!0 ((_ sign_extend 32) (size!6290 (buf!6812 thiss!914))) ((_ sign_extend 32) (currentByte!12565 thiss!914)) ((_ sign_extend 32) (currentBit!12560 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6290 (buf!6812 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12565 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12560 thiss!914)))))))

(assert (=> d!87878 d!87894))

(declare-fun d!87896 () Bool)

(assert (=> d!87896 (= (invariant!0 (currentBit!12560 thiss!914) (currentByte!12565 thiss!914) (size!6290 (buf!6812 thiss!914))) (and (bvsge (currentBit!12560 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12560 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12565 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12565 thiss!914) (size!6290 (buf!6812 thiss!914))) (and (= (currentBit!12560 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12565 thiss!914) (size!6290 (buf!6812 thiss!914)))))))))

(assert (=> d!87880 d!87896))

(check-sat)
