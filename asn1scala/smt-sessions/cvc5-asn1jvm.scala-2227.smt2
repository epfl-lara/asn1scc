; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56608 () Bool)

(assert start!56608)

(declare-fun res!218702 () Bool)

(declare-fun e!181562 () Bool)

(assert (=> start!56608 (=> (not res!218702) (not e!181562))))

(declare-datatypes ((array!14388 0))(
  ( (array!14389 (arr!7273 (Array (_ BitVec 32) (_ BitVec 8))) (size!6286 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11494 0))(
  ( (BitStream!11495 (buf!6808 array!14388) (currentByte!12552 (_ BitVec 32)) (currentBit!12547 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11494)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56608 (= res!218702 (validate_offset_bit!0 ((_ sign_extend 32) (size!6286 (buf!6808 thiss!914))) ((_ sign_extend 32) (currentByte!12552 thiss!914)) ((_ sign_extend 32) (currentBit!12547 thiss!914))))))

(assert (=> start!56608 e!181562))

(declare-fun e!181563 () Bool)

(declare-fun inv!12 (BitStream!11494) Bool)

(assert (=> start!56608 (and (inv!12 thiss!914) e!181563)))

(assert (=> start!56608 true))

(declare-fun b!261202 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261202 (= e!181562 (and b!187 (or (bvslt (currentByte!12552 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12552 thiss!914) (size!6286 (buf!6808 thiss!914))))))))

(declare-fun b!261203 () Bool)

(declare-fun array_inv!6027 (array!14388) Bool)

(assert (=> b!261203 (= e!181563 (array_inv!6027 (buf!6808 thiss!914)))))

(assert (= (and start!56608 res!218702) b!261202))

(assert (= start!56608 b!261203))

(declare-fun m!390829 () Bool)

(assert (=> start!56608 m!390829))

(declare-fun m!390831 () Bool)

(assert (=> start!56608 m!390831))

(declare-fun m!390833 () Bool)

(assert (=> b!261203 m!390833))

(push 1)

(assert (not b!261203))

(assert (not start!56608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87848 () Bool)

(assert (=> d!87848 (= (array_inv!6027 (buf!6808 thiss!914)) (bvsge (size!6286 (buf!6808 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261203 d!87848))

(declare-fun d!87850 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87850 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6286 (buf!6808 thiss!914))) ((_ sign_extend 32) (currentByte!12552 thiss!914)) ((_ sign_extend 32) (currentBit!12547 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6286 (buf!6808 thiss!914))) ((_ sign_extend 32) (currentByte!12552 thiss!914)) ((_ sign_extend 32) (currentBit!12547 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22246 () Bool)

(assert (= bs!22246 d!87850))

(declare-fun m!390849 () Bool)

(assert (=> bs!22246 m!390849))

(assert (=> start!56608 d!87850))

(declare-fun d!87854 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87854 (= (inv!12 thiss!914) (invariant!0 (currentBit!12547 thiss!914) (currentByte!12552 thiss!914) (size!6286 (buf!6808 thiss!914))))))

(declare-fun bs!22248 () Bool)

(assert (= bs!22248 d!87854))

(declare-fun m!390853 () Bool)

(assert (=> bs!22248 m!390853))

(assert (=> start!56608 d!87854))

(push 1)

(assert (not d!87850))

(assert (not d!87854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87864 () Bool)

(assert (=> d!87864 (= (remainingBits!0 ((_ sign_extend 32) (size!6286 (buf!6808 thiss!914))) ((_ sign_extend 32) (currentByte!12552 thiss!914)) ((_ sign_extend 32) (currentBit!12547 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6286 (buf!6808 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12552 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12547 thiss!914)))))))

(assert (=> d!87850 d!87864))

(declare-fun d!87868 () Bool)

(assert (=> d!87868 (= (invariant!0 (currentBit!12547 thiss!914) (currentByte!12552 thiss!914) (size!6286 (buf!6808 thiss!914))) (and (bvsge (currentBit!12547 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12547 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12552 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12552 thiss!914) (size!6286 (buf!6808 thiss!914))) (and (= (currentBit!12547 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12552 thiss!914) (size!6286 (buf!6808 thiss!914)))))))))

(assert (=> d!87854 d!87868))

(push 1)

(check-sat)

(pop 1)

