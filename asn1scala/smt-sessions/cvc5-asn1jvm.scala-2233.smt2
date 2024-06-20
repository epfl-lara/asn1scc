; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56750 () Bool)

(assert start!56750)

(declare-fun res!218765 () Bool)

(declare-fun e!181724 () Bool)

(assert (=> start!56750 (=> (not res!218765) (not e!181724))))

(declare-datatypes ((array!14436 0))(
  ( (array!14437 (arr!7291 (Array (_ BitVec 32) (_ BitVec 8))) (size!6304 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11530 0))(
  ( (BitStream!11531 (buf!6826 array!14436) (currentByte!12599 (_ BitVec 32)) (currentBit!12594 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11530)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56750 (= res!218765 (validate_offset_bit!0 ((_ sign_extend 32) (size!6304 (buf!6826 thiss!914))) ((_ sign_extend 32) (currentByte!12599 thiss!914)) ((_ sign_extend 32) (currentBit!12594 thiss!914))))))

(assert (=> start!56750 e!181724))

(declare-fun e!181725 () Bool)

(declare-fun inv!12 (BitStream!11530) Bool)

(assert (=> start!56750 (and (inv!12 thiss!914) e!181725)))

(assert (=> start!56750 true))

(declare-fun b!261319 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261319 (= e!181724 (and (not b!187) (or (bvslt (currentByte!12599 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12599 thiss!914) (size!6304 (buf!6826 thiss!914))))))))

(declare-fun b!261320 () Bool)

(declare-fun array_inv!6045 (array!14436) Bool)

(assert (=> b!261320 (= e!181725 (array_inv!6045 (buf!6826 thiss!914)))))

(assert (= (and start!56750 res!218765) b!261319))

(assert (= start!56750 b!261320))

(declare-fun m!391039 () Bool)

(assert (=> start!56750 m!391039))

(declare-fun m!391041 () Bool)

(assert (=> start!56750 m!391041))

(declare-fun m!391043 () Bool)

(assert (=> b!261320 m!391043))

(push 1)

(assert (not start!56750))

(assert (not b!261320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87974 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87974 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6304 (buf!6826 thiss!914))) ((_ sign_extend 32) (currentByte!12599 thiss!914)) ((_ sign_extend 32) (currentBit!12594 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6304 (buf!6826 thiss!914))) ((_ sign_extend 32) (currentByte!12599 thiss!914)) ((_ sign_extend 32) (currentBit!12594 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22292 () Bool)

(assert (= bs!22292 d!87974))

(declare-fun m!391061 () Bool)

(assert (=> bs!22292 m!391061))

(assert (=> start!56750 d!87974))

(declare-fun d!87976 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87976 (= (inv!12 thiss!914) (invariant!0 (currentBit!12594 thiss!914) (currentByte!12599 thiss!914) (size!6304 (buf!6826 thiss!914))))))

(declare-fun bs!22293 () Bool)

(assert (= bs!22293 d!87976))

(declare-fun m!391063 () Bool)

(assert (=> bs!22293 m!391063))

(assert (=> start!56750 d!87976))

(declare-fun d!87980 () Bool)

(assert (=> d!87980 (= (array_inv!6045 (buf!6826 thiss!914)) (bvsge (size!6304 (buf!6826 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261320 d!87980))

(push 1)

(assert (not d!87974))

(assert (not d!87976))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87990 () Bool)

(assert (=> d!87990 (= (remainingBits!0 ((_ sign_extend 32) (size!6304 (buf!6826 thiss!914))) ((_ sign_extend 32) (currentByte!12599 thiss!914)) ((_ sign_extend 32) (currentBit!12594 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6304 (buf!6826 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12599 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12594 thiss!914)))))))

(assert (=> d!87974 d!87990))

(declare-fun d!87992 () Bool)

(assert (=> d!87992 (= (invariant!0 (currentBit!12594 thiss!914) (currentByte!12599 thiss!914) (size!6304 (buf!6826 thiss!914))) (and (bvsge (currentBit!12594 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12594 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12599 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12599 thiss!914) (size!6304 (buf!6826 thiss!914))) (and (= (currentBit!12594 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12599 thiss!914) (size!6304 (buf!6826 thiss!914)))))))))

(assert (=> d!87976 d!87992))

(push 1)

(check-sat)

(pop 1)

