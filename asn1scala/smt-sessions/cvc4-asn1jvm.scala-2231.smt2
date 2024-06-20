; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56694 () Bool)

(assert start!56694)

(declare-fun res!218744 () Bool)

(declare-fun e!181688 () Bool)

(assert (=> start!56694 (=> (not res!218744) (not e!181688))))

(declare-datatypes ((array!14422 0))(
  ( (array!14423 (arr!7287 (Array (_ BitVec 32) (_ BitVec 8))) (size!6300 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11522 0))(
  ( (BitStream!11523 (buf!6822 array!14422) (currentByte!12583 (_ BitVec 32)) (currentBit!12578 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11522)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56694 (= res!218744 (validate_offset_bit!0 ((_ sign_extend 32) (size!6300 (buf!6822 thiss!914))) ((_ sign_extend 32) (currentByte!12583 thiss!914)) ((_ sign_extend 32) (currentBit!12578 thiss!914))))))

(assert (=> start!56694 e!181688))

(declare-fun e!181689 () Bool)

(declare-fun inv!12 (BitStream!11522) Bool)

(assert (=> start!56694 (and (inv!12 thiss!914) e!181689)))

(assert (=> start!56694 true))

(declare-fun b!261286 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261286 (= e!181688 (and b!187 (or (bvslt (currentByte!12583 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12583 thiss!914) (size!6300 (buf!6822 thiss!914))))))))

(declare-fun b!261287 () Bool)

(declare-fun array_inv!6041 (array!14422) Bool)

(assert (=> b!261287 (= e!181689 (array_inv!6041 (buf!6822 thiss!914)))))

(assert (= (and start!56694 res!218744) b!261286))

(assert (= start!56694 b!261287))

(declare-fun m!390961 () Bool)

(assert (=> start!56694 m!390961))

(declare-fun m!390963 () Bool)

(assert (=> start!56694 m!390963))

(declare-fun m!390965 () Bool)

(assert (=> b!261287 m!390965))

(push 1)

(assert (not b!261287))

(assert (not start!56694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87920 () Bool)

(assert (=> d!87920 (= (array_inv!6041 (buf!6822 thiss!914)) (bvsge (size!6300 (buf!6822 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261287 d!87920))

(declare-fun d!87922 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87922 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6300 (buf!6822 thiss!914))) ((_ sign_extend 32) (currentByte!12583 thiss!914)) ((_ sign_extend 32) (currentBit!12578 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6300 (buf!6822 thiss!914))) ((_ sign_extend 32) (currentByte!12583 thiss!914)) ((_ sign_extend 32) (currentBit!12578 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22273 () Bool)

(assert (= bs!22273 d!87922))

(declare-fun m!390975 () Bool)

(assert (=> bs!22273 m!390975))

(assert (=> start!56694 d!87922))

(declare-fun d!87926 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87926 (= (inv!12 thiss!914) (invariant!0 (currentBit!12578 thiss!914) (currentByte!12583 thiss!914) (size!6300 (buf!6822 thiss!914))))))

(declare-fun bs!22274 () Bool)

(assert (= bs!22274 d!87926))

(declare-fun m!390977 () Bool)

(assert (=> bs!22274 m!390977))

(assert (=> start!56694 d!87926))

(push 1)

(assert (not d!87926))

(assert (not d!87922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87936 () Bool)

(assert (=> d!87936 (= (invariant!0 (currentBit!12578 thiss!914) (currentByte!12583 thiss!914) (size!6300 (buf!6822 thiss!914))) (and (bvsge (currentBit!12578 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12578 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12583 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12583 thiss!914) (size!6300 (buf!6822 thiss!914))) (and (= (currentBit!12578 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12583 thiss!914) (size!6300 (buf!6822 thiss!914)))))))))

(assert (=> d!87926 d!87936))

(declare-fun d!87938 () Bool)

(assert (=> d!87938 (= (remainingBits!0 ((_ sign_extend 32) (size!6300 (buf!6822 thiss!914))) ((_ sign_extend 32) (currentByte!12583 thiss!914)) ((_ sign_extend 32) (currentBit!12578 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6300 (buf!6822 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12583 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12578 thiss!914)))))))

(assert (=> d!87922 d!87938))

(push 1)

(check-sat)

(pop 1)

