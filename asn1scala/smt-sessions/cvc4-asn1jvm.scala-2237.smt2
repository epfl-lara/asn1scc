; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56834 () Bool)

(assert start!56834)

(declare-fun res!218807 () Bool)

(declare-fun e!181850 () Bool)

(assert (=> start!56834 (=> (not res!218807) (not e!181850))))

(declare-datatypes ((array!14470 0))(
  ( (array!14471 (arr!7305 (Array (_ BitVec 32) (_ BitVec 8))) (size!6318 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11558 0))(
  ( (BitStream!11559 (buf!6840 array!14470) (currentByte!12629 (_ BitVec 32)) (currentBit!12624 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11558)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56834 (= res!218807 (validate_offset_bit!0 ((_ sign_extend 32) (size!6318 (buf!6840 thiss!914))) ((_ sign_extend 32) (currentByte!12629 thiss!914)) ((_ sign_extend 32) (currentBit!12624 thiss!914))))))

(assert (=> start!56834 e!181850))

(declare-fun e!181851 () Bool)

(declare-fun inv!12 (BitStream!11558) Bool)

(assert (=> start!56834 (and (inv!12 thiss!914) e!181851)))

(assert (=> start!56834 true))

(declare-fun b!261403 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261403 (= e!181850 (and (not b!187) (or (bvslt (currentByte!12629 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12629 thiss!914) (size!6318 (buf!6840 thiss!914))))))))

(declare-fun b!261404 () Bool)

(declare-fun array_inv!6059 (array!14470) Bool)

(assert (=> b!261404 (= e!181851 (array_inv!6059 (buf!6840 thiss!914)))))

(assert (= (and start!56834 res!218807) b!261403))

(assert (= start!56834 b!261404))

(declare-fun m!391171 () Bool)

(assert (=> start!56834 m!391171))

(declare-fun m!391173 () Bool)

(assert (=> start!56834 m!391173))

(declare-fun m!391175 () Bool)

(assert (=> b!261404 m!391175))

(push 1)

(assert (not b!261404))

(assert (not start!56834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88042 () Bool)

(assert (=> d!88042 (= (array_inv!6059 (buf!6840 thiss!914)) (bvsge (size!6318 (buf!6840 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261404 d!88042))

(declare-fun d!88046 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88046 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6318 (buf!6840 thiss!914))) ((_ sign_extend 32) (currentByte!12629 thiss!914)) ((_ sign_extend 32) (currentBit!12624 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6318 (buf!6840 thiss!914))) ((_ sign_extend 32) (currentByte!12629 thiss!914)) ((_ sign_extend 32) (currentBit!12624 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22318 () Bool)

(assert (= bs!22318 d!88046))

(declare-fun m!391185 () Bool)

(assert (=> bs!22318 m!391185))

(assert (=> start!56834 d!88046))

(declare-fun d!88048 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88048 (= (inv!12 thiss!914) (invariant!0 (currentBit!12624 thiss!914) (currentByte!12629 thiss!914) (size!6318 (buf!6840 thiss!914))))))

(declare-fun bs!22319 () Bool)

(assert (= bs!22319 d!88048))

(declare-fun m!391187 () Bool)

(assert (=> bs!22319 m!391187))

(assert (=> start!56834 d!88048))

(push 1)

(assert (not d!88046))

(assert (not d!88048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88058 () Bool)

(assert (=> d!88058 (= (remainingBits!0 ((_ sign_extend 32) (size!6318 (buf!6840 thiss!914))) ((_ sign_extend 32) (currentByte!12629 thiss!914)) ((_ sign_extend 32) (currentBit!12624 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6318 (buf!6840 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12629 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12624 thiss!914)))))))

(assert (=> d!88046 d!88058))

(declare-fun d!88060 () Bool)

(assert (=> d!88060 (= (invariant!0 (currentBit!12624 thiss!914) (currentByte!12629 thiss!914) (size!6318 (buf!6840 thiss!914))) (and (bvsge (currentBit!12624 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12624 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12629 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12629 thiss!914) (size!6318 (buf!6840 thiss!914))) (and (= (currentBit!12624 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12629 thiss!914) (size!6318 (buf!6840 thiss!914)))))))))

(assert (=> d!88048 d!88060))

(push 1)

(check-sat)

