; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56754 () Bool)

(assert start!56754)

(declare-fun res!218771 () Bool)

(declare-fun e!181742 () Bool)

(assert (=> start!56754 (=> (not res!218771) (not e!181742))))

(declare-datatypes ((array!14440 0))(
  ( (array!14441 (arr!7293 (Array (_ BitVec 32) (_ BitVec 8))) (size!6306 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11534 0))(
  ( (BitStream!11535 (buf!6828 array!14440) (currentByte!12601 (_ BitVec 32)) (currentBit!12596 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11534)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56754 (= res!218771 (validate_offset_bit!0 ((_ sign_extend 32) (size!6306 (buf!6828 thiss!914))) ((_ sign_extend 32) (currentByte!12601 thiss!914)) ((_ sign_extend 32) (currentBit!12596 thiss!914))))))

(assert (=> start!56754 e!181742))

(declare-fun e!181743 () Bool)

(declare-fun inv!12 (BitStream!11534) Bool)

(assert (=> start!56754 (and (inv!12 thiss!914) e!181743)))

(assert (=> start!56754 true))

(declare-fun b!261331 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261331 (= e!181742 (and (not b!187) (or (bvslt (currentByte!12601 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12601 thiss!914) (size!6306 (buf!6828 thiss!914))))))))

(declare-fun b!261332 () Bool)

(declare-fun array_inv!6047 (array!14440) Bool)

(assert (=> b!261332 (= e!181743 (array_inv!6047 (buf!6828 thiss!914)))))

(assert (= (and start!56754 res!218771) b!261331))

(assert (= start!56754 b!261332))

(declare-fun m!391051 () Bool)

(assert (=> start!56754 m!391051))

(declare-fun m!391053 () Bool)

(assert (=> start!56754 m!391053))

(declare-fun m!391055 () Bool)

(assert (=> b!261332 m!391055))

(push 1)

(assert (not b!261332))

(assert (not start!56754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87978 () Bool)

(assert (=> d!87978 (= (array_inv!6047 (buf!6828 thiss!914)) (bvsge (size!6306 (buf!6828 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261332 d!87978))

(declare-fun d!87982 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87982 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6306 (buf!6828 thiss!914))) ((_ sign_extend 32) (currentByte!12601 thiss!914)) ((_ sign_extend 32) (currentBit!12596 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6306 (buf!6828 thiss!914))) ((_ sign_extend 32) (currentByte!12601 thiss!914)) ((_ sign_extend 32) (currentBit!12596 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22294 () Bool)

(assert (= bs!22294 d!87982))

(declare-fun m!391065 () Bool)

(assert (=> bs!22294 m!391065))

(assert (=> start!56754 d!87982))

(declare-fun d!87984 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87984 (= (inv!12 thiss!914) (invariant!0 (currentBit!12596 thiss!914) (currentByte!12601 thiss!914) (size!6306 (buf!6828 thiss!914))))))

(declare-fun bs!22295 () Bool)

(assert (= bs!22295 d!87984))

(declare-fun m!391067 () Bool)

(assert (=> bs!22295 m!391067))

(assert (=> start!56754 d!87984))

(push 1)

(assert (not d!87982))

(assert (not d!87984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87994 () Bool)

(assert (=> d!87994 (= (remainingBits!0 ((_ sign_extend 32) (size!6306 (buf!6828 thiss!914))) ((_ sign_extend 32) (currentByte!12601 thiss!914)) ((_ sign_extend 32) (currentBit!12596 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6306 (buf!6828 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12601 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12596 thiss!914)))))))

(assert (=> d!87982 d!87994))

(declare-fun d!87996 () Bool)

(assert (=> d!87996 (= (invariant!0 (currentBit!12596 thiss!914) (currentByte!12601 thiss!914) (size!6306 (buf!6828 thiss!914))) (and (bvsge (currentBit!12596 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12596 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12601 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12601 thiss!914) (size!6306 (buf!6828 thiss!914))) (and (= (currentBit!12596 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12601 thiss!914) (size!6306 (buf!6828 thiss!914)))))))))

(assert (=> d!87984 d!87996))

(push 1)

(check-sat)

