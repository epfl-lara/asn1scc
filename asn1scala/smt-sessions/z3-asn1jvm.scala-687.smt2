; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19360 () Bool)

(assert start!19360)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4508 0))(
  ( (array!4509 (arr!2656 (Array (_ BitVec 32) (_ BitVec 8))) (size!2063 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3600 0))(
  ( (BitStream!3601 (buf!2409 array!4508) (currentByte!4812 (_ BitVec 32)) (currentBit!4807 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3600)

(assert (=> start!19360 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2063 (buf!2409 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4812 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4807 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2063 (buf!2409 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4812 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4807 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19360 true))

(declare-fun e!63443 () Bool)

(declare-fun inv!12 (BitStream!3600) Bool)

(assert (=> start!19360 (and (inv!12 thiss!1288) e!63443)))

(declare-fun b!96831 () Bool)

(declare-fun array_inv!1865 (array!4508) Bool)

(assert (=> b!96831 (= e!63443 (array_inv!1865 (buf!2409 thiss!1288)))))

(assert (= start!19360 b!96831))

(declare-fun m!140477 () Bool)

(assert (=> start!19360 m!140477))

(declare-fun m!140479 () Bool)

(assert (=> b!96831 m!140479))

(check-sat (not start!19360) (not b!96831))
(check-sat)
(get-model)

(declare-fun d!30382 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30382 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4807 thiss!1288) (currentByte!4812 thiss!1288) (size!2063 (buf!2409 thiss!1288))))))

(declare-fun bs!7423 () Bool)

(assert (= bs!7423 d!30382))

(declare-fun m!140487 () Bool)

(assert (=> bs!7423 m!140487))

(assert (=> start!19360 d!30382))

(declare-fun d!30388 () Bool)

(assert (=> d!30388 (= (array_inv!1865 (buf!2409 thiss!1288)) (bvsge (size!2063 (buf!2409 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!96831 d!30388))

(check-sat (not d!30382))
(check-sat)
(get-model)

(declare-fun d!30394 () Bool)

(assert (=> d!30394 (= (invariant!0 (currentBit!4807 thiss!1288) (currentByte!4812 thiss!1288) (size!2063 (buf!2409 thiss!1288))) (and (bvsge (currentBit!4807 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4807 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4812 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4812 thiss!1288) (size!2063 (buf!2409 thiss!1288))) (and (= (currentBit!4807 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4812 thiss!1288) (size!2063 (buf!2409 thiss!1288)))))))))

(assert (=> d!30382 d!30394))

(check-sat)
