; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56648 () Bool)

(assert start!56648)

(declare-fun res!218717 () Bool)

(declare-fun e!181607 () Bool)

(assert (=> start!56648 (=> (not res!218717) (not e!181607))))

(declare-datatypes ((array!14401 0))(
  ( (array!14402 (arr!7278 (Array (_ BitVec 32) (_ BitVec 8))) (size!6291 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11504 0))(
  ( (BitStream!11505 (buf!6813 array!14401) (currentByte!12566 (_ BitVec 32)) (currentBit!12561 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11504)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56648 (= res!218717 (validate_offset_bit!0 ((_ sign_extend 32) (size!6291 (buf!6813 thiss!914))) ((_ sign_extend 32) (currentByte!12566 thiss!914)) ((_ sign_extend 32) (currentBit!12561 thiss!914))))))

(assert (=> start!56648 e!181607))

(declare-fun e!181608 () Bool)

(declare-fun inv!12 (BitStream!11504) Bool)

(assert (=> start!56648 (and (inv!12 thiss!914) e!181608)))

(assert (=> start!56648 true))

(declare-fun b!261232 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261232 (= e!181607 (and b!187 (or (bvslt (currentBit!12561 thiss!914) #b00000000000000000000000000000000) (bvsge (currentBit!12561 thiss!914) #b00000000000000000000000000001000))))))

(declare-fun b!261233 () Bool)

(declare-fun array_inv!6032 (array!14401) Bool)

(assert (=> b!261233 (= e!181608 (array_inv!6032 (buf!6813 thiss!914)))))

(assert (= (and start!56648 res!218717) b!261232))

(assert (= start!56648 b!261233))

(declare-fun m!390871 () Bool)

(assert (=> start!56648 m!390871))

(declare-fun m!390873 () Bool)

(assert (=> start!56648 m!390873))

(declare-fun m!390875 () Bool)

(assert (=> b!261233 m!390875))

(push 1)

(assert (not start!56648))

(assert (not b!261233))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87886 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87886 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6291 (buf!6813 thiss!914))) ((_ sign_extend 32) (currentByte!12566 thiss!914)) ((_ sign_extend 32) (currentBit!12561 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6291 (buf!6813 thiss!914))) ((_ sign_extend 32) (currentByte!12566 thiss!914)) ((_ sign_extend 32) (currentBit!12561 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22258 () Bool)

(assert (= bs!22258 d!87886))

(declare-fun m!390885 () Bool)

(assert (=> bs!22258 m!390885))

(assert (=> start!56648 d!87886))

(declare-fun d!87890 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87890 (= (inv!12 thiss!914) (invariant!0 (currentBit!12561 thiss!914) (currentByte!12566 thiss!914) (size!6291 (buf!6813 thiss!914))))))

(declare-fun bs!22259 () Bool)

(assert (= bs!22259 d!87890))

(declare-fun m!390887 () Bool)

(assert (=> bs!22259 m!390887))

(assert (=> start!56648 d!87890))

(declare-fun d!87892 () Bool)

(assert (=> d!87892 (= (array_inv!6032 (buf!6813 thiss!914)) (bvsge (size!6291 (buf!6813 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261233 d!87892))

(push 1)

(assert (not d!87886))

(assert (not d!87890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

