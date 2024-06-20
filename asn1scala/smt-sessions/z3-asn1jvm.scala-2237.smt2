; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56832 () Bool)

(assert start!56832)

(declare-fun res!218804 () Bool)

(declare-fun e!181841 () Bool)

(assert (=> start!56832 (=> (not res!218804) (not e!181841))))

(declare-datatypes ((array!14468 0))(
  ( (array!14469 (arr!7304 (Array (_ BitVec 32) (_ BitVec 8))) (size!6317 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11556 0))(
  ( (BitStream!11557 (buf!6839 array!14468) (currentByte!12628 (_ BitVec 32)) (currentBit!12623 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11556)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56832 (= res!218804 (validate_offset_bit!0 ((_ sign_extend 32) (size!6317 (buf!6839 thiss!914))) ((_ sign_extend 32) (currentByte!12628 thiss!914)) ((_ sign_extend 32) (currentBit!12623 thiss!914))))))

(assert (=> start!56832 e!181841))

(declare-fun e!181842 () Bool)

(declare-fun inv!12 (BitStream!11556) Bool)

(assert (=> start!56832 (and (inv!12 thiss!914) e!181842)))

(assert (=> start!56832 true))

(declare-fun b!261397 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261397 (= e!181841 (and (not b!187) (or (bvslt (currentByte!12628 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12628 thiss!914) (size!6317 (buf!6839 thiss!914))))))))

(declare-fun b!261398 () Bool)

(declare-fun array_inv!6058 (array!14468) Bool)

(assert (=> b!261398 (= e!181842 (array_inv!6058 (buf!6839 thiss!914)))))

(assert (= (and start!56832 res!218804) b!261397))

(assert (= start!56832 b!261398))

(declare-fun m!391165 () Bool)

(assert (=> start!56832 m!391165))

(declare-fun m!391167 () Bool)

(assert (=> start!56832 m!391167))

(declare-fun m!391169 () Bool)

(assert (=> b!261398 m!391169))

(check-sat (not start!56832) (not b!261398))
(check-sat)
(get-model)

(declare-fun d!88032 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88032 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6317 (buf!6839 thiss!914))) ((_ sign_extend 32) (currentByte!12628 thiss!914)) ((_ sign_extend 32) (currentBit!12623 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6317 (buf!6839 thiss!914))) ((_ sign_extend 32) (currentByte!12628 thiss!914)) ((_ sign_extend 32) (currentBit!12623 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22314 () Bool)

(assert (= bs!22314 d!88032))

(declare-fun m!391177 () Bool)

(assert (=> bs!22314 m!391177))

(assert (=> start!56832 d!88032))

(declare-fun d!88034 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88034 (= (inv!12 thiss!914) (invariant!0 (currentBit!12623 thiss!914) (currentByte!12628 thiss!914) (size!6317 (buf!6839 thiss!914))))))

(declare-fun bs!22315 () Bool)

(assert (= bs!22315 d!88034))

(declare-fun m!391179 () Bool)

(assert (=> bs!22315 m!391179))

(assert (=> start!56832 d!88034))

(declare-fun d!88038 () Bool)

(assert (=> d!88038 (= (array_inv!6058 (buf!6839 thiss!914)) (bvsge (size!6317 (buf!6839 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261398 d!88038))

(check-sat (not d!88034) (not d!88032))
(check-sat)
(get-model)

(declare-fun d!88050 () Bool)

(assert (=> d!88050 (= (invariant!0 (currentBit!12623 thiss!914) (currentByte!12628 thiss!914) (size!6317 (buf!6839 thiss!914))) (and (bvsge (currentBit!12623 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12623 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12628 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12628 thiss!914) (size!6317 (buf!6839 thiss!914))) (and (= (currentBit!12623 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12628 thiss!914) (size!6317 (buf!6839 thiss!914)))))))))

(assert (=> d!88034 d!88050))

(declare-fun d!88052 () Bool)

(assert (=> d!88052 (= (remainingBits!0 ((_ sign_extend 32) (size!6317 (buf!6839 thiss!914))) ((_ sign_extend 32) (currentByte!12628 thiss!914)) ((_ sign_extend 32) (currentBit!12623 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6317 (buf!6839 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12628 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12623 thiss!914)))))))

(assert (=> d!88032 d!88052))

(check-sat)
