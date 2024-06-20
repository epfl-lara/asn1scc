; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56790 () Bool)

(assert start!56790)

(declare-fun res!218780 () Bool)

(declare-fun e!181769 () Bool)

(assert (=> start!56790 (=> (not res!218780) (not e!181769))))

(declare-datatypes ((array!14449 0))(
  ( (array!14450 (arr!7296 (Array (_ BitVec 32) (_ BitVec 8))) (size!6309 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11540 0))(
  ( (BitStream!11541 (buf!6831 array!14449) (currentByte!12613 (_ BitVec 32)) (currentBit!12608 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11540)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56790 (= res!218780 (validate_offset_bit!0 ((_ sign_extend 32) (size!6309 (buf!6831 thiss!914))) ((_ sign_extend 32) (currentByte!12613 thiss!914)) ((_ sign_extend 32) (currentBit!12608 thiss!914))))))

(assert (=> start!56790 e!181769))

(declare-fun e!181770 () Bool)

(declare-fun inv!12 (BitStream!11540) Bool)

(assert (=> start!56790 (and (inv!12 thiss!914) e!181770)))

(assert (=> start!56790 true))

(declare-fun b!261349 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261349 (= e!181769 (and (not b!187) (or (bvslt (currentBit!12608 thiss!914) #b00000000000000000000000000000000) (bvsge (currentBit!12608 thiss!914) #b00000000000000000000000000001000))))))

(declare-fun b!261350 () Bool)

(declare-fun array_inv!6050 (array!14449) Bool)

(assert (=> b!261350 (= e!181770 (array_inv!6050 (buf!6831 thiss!914)))))

(assert (= (and start!56790 res!218780) b!261349))

(assert (= start!56790 b!261350))

(declare-fun m!391081 () Bool)

(assert (=> start!56790 m!391081))

(declare-fun m!391083 () Bool)

(assert (=> start!56790 m!391083))

(declare-fun m!391085 () Bool)

(assert (=> b!261350 m!391085))

(push 1)

(assert (not start!56790))

(assert (not b!261350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88012 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88012 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6309 (buf!6831 thiss!914))) ((_ sign_extend 32) (currentByte!12613 thiss!914)) ((_ sign_extend 32) (currentBit!12608 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6309 (buf!6831 thiss!914))) ((_ sign_extend 32) (currentByte!12613 thiss!914)) ((_ sign_extend 32) (currentBit!12608 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22303 () Bool)

(assert (= bs!22303 d!88012))

(declare-fun m!391095 () Bool)

(assert (=> bs!22303 m!391095))

(assert (=> start!56790 d!88012))

(declare-fun d!88014 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88014 (= (inv!12 thiss!914) (invariant!0 (currentBit!12608 thiss!914) (currentByte!12613 thiss!914) (size!6309 (buf!6831 thiss!914))))))

(declare-fun bs!22304 () Bool)

(assert (= bs!22304 d!88014))

(declare-fun m!391097 () Bool)

(assert (=> bs!22304 m!391097))

(assert (=> start!56790 d!88014))

(declare-fun d!88016 () Bool)

(assert (=> d!88016 (= (array_inv!6050 (buf!6831 thiss!914)) (bvsge (size!6309 (buf!6831 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261350 d!88016))

(push 1)

(assert (not d!88012))

(assert (not d!88014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

