; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56830 () Bool)

(assert start!56830)

(declare-fun res!218801 () Bool)

(declare-fun e!181832 () Bool)

(assert (=> start!56830 (=> (not res!218801) (not e!181832))))

(declare-datatypes ((array!14466 0))(
  ( (array!14467 (arr!7303 (Array (_ BitVec 32) (_ BitVec 8))) (size!6316 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11554 0))(
  ( (BitStream!11555 (buf!6838 array!14466) (currentByte!12627 (_ BitVec 32)) (currentBit!12622 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11554)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56830 (= res!218801 (validate_offset_bit!0 ((_ sign_extend 32) (size!6316 (buf!6838 thiss!914))) ((_ sign_extend 32) (currentByte!12627 thiss!914)) ((_ sign_extend 32) (currentBit!12622 thiss!914))))))

(assert (=> start!56830 e!181832))

(declare-fun e!181833 () Bool)

(declare-fun inv!12 (BitStream!11554) Bool)

(assert (=> start!56830 (and (inv!12 thiss!914) e!181833)))

(assert (=> start!56830 true))

(declare-fun b!261391 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261391 (= e!181832 (and (not b!187) (or (bvslt (currentByte!12627 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12627 thiss!914) (size!6316 (buf!6838 thiss!914))))))))

(declare-fun b!261392 () Bool)

(declare-fun array_inv!6057 (array!14466) Bool)

(assert (=> b!261392 (= e!181833 (array_inv!6057 (buf!6838 thiss!914)))))

(assert (= (and start!56830 res!218801) b!261391))

(assert (= start!56830 b!261392))

(declare-fun m!391159 () Bool)

(assert (=> start!56830 m!391159))

(declare-fun m!391161 () Bool)

(assert (=> start!56830 m!391161))

(declare-fun m!391163 () Bool)

(assert (=> b!261392 m!391163))

(push 1)

(assert (not start!56830))

(assert (not b!261392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88036 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88036 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6316 (buf!6838 thiss!914))) ((_ sign_extend 32) (currentByte!12627 thiss!914)) ((_ sign_extend 32) (currentBit!12622 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6316 (buf!6838 thiss!914))) ((_ sign_extend 32) (currentByte!12627 thiss!914)) ((_ sign_extend 32) (currentBit!12622 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22316 () Bool)

(assert (= bs!22316 d!88036))

(declare-fun m!391181 () Bool)

(assert (=> bs!22316 m!391181))

(assert (=> start!56830 d!88036))

(declare-fun d!88040 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88040 (= (inv!12 thiss!914) (invariant!0 (currentBit!12622 thiss!914) (currentByte!12627 thiss!914) (size!6316 (buf!6838 thiss!914))))))

(declare-fun bs!22317 () Bool)

(assert (= bs!22317 d!88040))

(declare-fun m!391183 () Bool)

(assert (=> bs!22317 m!391183))

(assert (=> start!56830 d!88040))

(declare-fun d!88044 () Bool)

(assert (=> d!88044 (= (array_inv!6057 (buf!6838 thiss!914)) (bvsge (size!6316 (buf!6838 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261392 d!88044))

(push 1)

(assert (not d!88036))

(assert (not d!88040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88054 () Bool)

(assert (=> d!88054 (= (remainingBits!0 ((_ sign_extend 32) (size!6316 (buf!6838 thiss!914))) ((_ sign_extend 32) (currentByte!12627 thiss!914)) ((_ sign_extend 32) (currentBit!12622 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6316 (buf!6838 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12627 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12622 thiss!914)))))))

(assert (=> d!88036 d!88054))

(declare-fun d!88056 () Bool)

(assert (=> d!88056 (= (invariant!0 (currentBit!12622 thiss!914) (currentByte!12627 thiss!914) (size!6316 (buf!6838 thiss!914))) (and (bvsge (currentBit!12622 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12622 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12627 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12627 thiss!914) (size!6316 (buf!6838 thiss!914))) (and (= (currentBit!12622 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12627 thiss!914) (size!6316 (buf!6838 thiss!914)))))))))

(assert (=> d!88040 d!88056))

(push 1)

(check-sat)

(pop 1)

