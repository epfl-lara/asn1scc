; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56690 () Bool)

(assert start!56690)

(declare-fun res!218738 () Bool)

(declare-fun e!181670 () Bool)

(assert (=> start!56690 (=> (not res!218738) (not e!181670))))

(declare-datatypes ((array!14418 0))(
  ( (array!14419 (arr!7285 (Array (_ BitVec 32) (_ BitVec 8))) (size!6298 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11518 0))(
  ( (BitStream!11519 (buf!6820 array!14418) (currentByte!12581 (_ BitVec 32)) (currentBit!12576 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11518)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56690 (= res!218738 (validate_offset_bit!0 ((_ sign_extend 32) (size!6298 (buf!6820 thiss!914))) ((_ sign_extend 32) (currentByte!12581 thiss!914)) ((_ sign_extend 32) (currentBit!12576 thiss!914))))))

(assert (=> start!56690 e!181670))

(declare-fun e!181671 () Bool)

(declare-fun inv!12 (BitStream!11518) Bool)

(assert (=> start!56690 (and (inv!12 thiss!914) e!181671)))

(assert (=> start!56690 true))

(declare-fun b!261274 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261274 (= e!181670 (and b!187 (or (bvslt (currentByte!12581 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12581 thiss!914) (size!6298 (buf!6820 thiss!914))))))))

(declare-fun b!261275 () Bool)

(declare-fun array_inv!6039 (array!14418) Bool)

(assert (=> b!261275 (= e!181671 (array_inv!6039 (buf!6820 thiss!914)))))

(assert (= (and start!56690 res!218738) b!261274))

(assert (= start!56690 b!261275))

(declare-fun m!390949 () Bool)

(assert (=> start!56690 m!390949))

(declare-fun m!390951 () Bool)

(assert (=> start!56690 m!390951))

(declare-fun m!390953 () Bool)

(assert (=> b!261275 m!390953))

(push 1)

(assert (not start!56690))

(assert (not b!261275))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87914 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87914 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6298 (buf!6820 thiss!914))) ((_ sign_extend 32) (currentByte!12581 thiss!914)) ((_ sign_extend 32) (currentBit!12576 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6298 (buf!6820 thiss!914))) ((_ sign_extend 32) (currentByte!12581 thiss!914)) ((_ sign_extend 32) (currentBit!12576 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22271 () Bool)

(assert (= bs!22271 d!87914))

(declare-fun m!390971 () Bool)

(assert (=> bs!22271 m!390971))

(assert (=> start!56690 d!87914))

(declare-fun d!87918 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87918 (= (inv!12 thiss!914) (invariant!0 (currentBit!12576 thiss!914) (currentByte!12581 thiss!914) (size!6298 (buf!6820 thiss!914))))))

(declare-fun bs!22272 () Bool)

(assert (= bs!22272 d!87918))

(declare-fun m!390973 () Bool)

(assert (=> bs!22272 m!390973))

(assert (=> start!56690 d!87918))

(declare-fun d!87924 () Bool)

(assert (=> d!87924 (= (array_inv!6039 (buf!6820 thiss!914)) (bvsge (size!6298 (buf!6820 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261275 d!87924))

(push 1)

(assert (not d!87918))

(assert (not d!87914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87932 () Bool)

(assert (=> d!87932 (= (invariant!0 (currentBit!12576 thiss!914) (currentByte!12581 thiss!914) (size!6298 (buf!6820 thiss!914))) (and (bvsge (currentBit!12576 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12576 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12581 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12581 thiss!914) (size!6298 (buf!6820 thiss!914))) (and (= (currentBit!12576 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12581 thiss!914) (size!6298 (buf!6820 thiss!914)))))))))

(assert (=> d!87918 d!87932))

(declare-fun d!87934 () Bool)

(assert (=> d!87934 (= (remainingBits!0 ((_ sign_extend 32) (size!6298 (buf!6820 thiss!914))) ((_ sign_extend 32) (currentByte!12581 thiss!914)) ((_ sign_extend 32) (currentBit!12576 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6298 (buf!6820 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12581 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12576 thiss!914)))))))

(assert (=> d!87914 d!87934))

(push 1)

(check-sat)

(pop 1)

