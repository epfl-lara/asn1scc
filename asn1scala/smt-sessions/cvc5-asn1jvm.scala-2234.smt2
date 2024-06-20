; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56786 () Bool)

(assert start!56786)

(declare-fun res!218774 () Bool)

(declare-fun e!181751 () Bool)

(assert (=> start!56786 (=> (not res!218774) (not e!181751))))

(declare-datatypes ((array!14445 0))(
  ( (array!14446 (arr!7294 (Array (_ BitVec 32) (_ BitVec 8))) (size!6307 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11536 0))(
  ( (BitStream!11537 (buf!6829 array!14445) (currentByte!12611 (_ BitVec 32)) (currentBit!12606 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11536)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56786 (= res!218774 (validate_offset_bit!0 ((_ sign_extend 32) (size!6307 (buf!6829 thiss!914))) ((_ sign_extend 32) (currentByte!12611 thiss!914)) ((_ sign_extend 32) (currentBit!12606 thiss!914))))))

(assert (=> start!56786 e!181751))

(declare-fun e!181752 () Bool)

(declare-fun inv!12 (BitStream!11536) Bool)

(assert (=> start!56786 (and (inv!12 thiss!914) e!181752)))

(assert (=> start!56786 true))

(declare-fun b!261337 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261337 (= e!181751 (and (not b!187) (or (bvslt (currentBit!12606 thiss!914) #b00000000000000000000000000000000) (bvsge (currentBit!12606 thiss!914) #b00000000000000000000000000001000))))))

(declare-fun b!261338 () Bool)

(declare-fun array_inv!6048 (array!14445) Bool)

(assert (=> b!261338 (= e!181752 (array_inv!6048 (buf!6829 thiss!914)))))

(assert (= (and start!56786 res!218774) b!261337))

(assert (= start!56786 b!261338))

(declare-fun m!391069 () Bool)

(assert (=> start!56786 m!391069))

(declare-fun m!391071 () Bool)

(assert (=> start!56786 m!391071))

(declare-fun m!391073 () Bool)

(assert (=> b!261338 m!391073))

(push 1)

(assert (not start!56786))

(assert (not b!261338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88004 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88004 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6307 (buf!6829 thiss!914))) ((_ sign_extend 32) (currentByte!12611 thiss!914)) ((_ sign_extend 32) (currentBit!12606 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6307 (buf!6829 thiss!914))) ((_ sign_extend 32) (currentByte!12611 thiss!914)) ((_ sign_extend 32) (currentBit!12606 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22300 () Bool)

(assert (= bs!22300 d!88004))

(declare-fun m!391089 () Bool)

(assert (=> bs!22300 m!391089))

(assert (=> start!56786 d!88004))

(declare-fun d!88008 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88008 (= (inv!12 thiss!914) (invariant!0 (currentBit!12606 thiss!914) (currentByte!12611 thiss!914) (size!6307 (buf!6829 thiss!914))))))

(declare-fun bs!22302 () Bool)

(assert (= bs!22302 d!88008))

(declare-fun m!391093 () Bool)

(assert (=> bs!22302 m!391093))

(assert (=> start!56786 d!88008))

(declare-fun d!88010 () Bool)

(assert (=> d!88010 (= (array_inv!6048 (buf!6829 thiss!914)) (bvsge (size!6307 (buf!6829 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261338 d!88010))

(push 1)

(assert (not d!88008))

(assert (not d!88004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88022 () Bool)

(assert (=> d!88022 (= (invariant!0 (currentBit!12606 thiss!914) (currentByte!12611 thiss!914) (size!6307 (buf!6829 thiss!914))) (and (bvsge (currentBit!12606 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12606 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12611 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12611 thiss!914) (size!6307 (buf!6829 thiss!914))) (and (= (currentBit!12606 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12611 thiss!914) (size!6307 (buf!6829 thiss!914)))))))))

(assert (=> d!88008 d!88022))

(declare-fun d!88024 () Bool)

(assert (=> d!88024 (= (remainingBits!0 ((_ sign_extend 32) (size!6307 (buf!6829 thiss!914))) ((_ sign_extend 32) (currentByte!12611 thiss!914)) ((_ sign_extend 32) (currentBit!12606 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6307 (buf!6829 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12611 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12606 thiss!914)))))))

(assert (=> d!88004 d!88024))

(push 1)

(check-sat)

(pop 1)

