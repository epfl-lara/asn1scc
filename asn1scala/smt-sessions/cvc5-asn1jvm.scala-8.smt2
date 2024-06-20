; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130 () Bool)

(assert start!130)

(declare-datatypes ((array!54 0))(
  ( (array!55 (arr!409 (Array (_ BitVec 32) (_ BitVec 8))) (size!22 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!28 0))(
  ( (BitStream!29 (buf!334 array!54) (currentByte!1226 (_ BitVec 32)) (currentBit!1221 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!28)

(assert (=> start!130 (and (bvsle ((_ sign_extend 32) (size!22 (buf!334 thiss!932))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1226 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1221 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!22 (buf!334 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1226 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1221 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!130 () Bool)

(declare-fun inv!12 (BitStream!28) Bool)

(assert (=> start!130 (and (inv!12 thiss!932) e!130)))

(declare-fun b!388 () Bool)

(declare-fun array_inv!19 (array!54) Bool)

(assert (=> b!388 (= e!130 (array_inv!19 (buf!334 thiss!932)))))

(assert (= start!130 b!388))

(declare-fun m!133 () Bool)

(assert (=> start!130 m!133))

(declare-fun m!135 () Bool)

(assert (=> b!388 m!135))

(push 1)

(assert (not start!130))

(assert (not b!388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!806 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!806 (= (inv!12 thiss!932) (invariant!0 (currentBit!1221 thiss!932) (currentByte!1226 thiss!932) (size!22 (buf!334 thiss!932))))))

(declare-fun bs!367 () Bool)

(assert (= bs!367 d!806))

(declare-fun m!147 () Bool)

(assert (=> bs!367 m!147))

(assert (=> start!130 d!806))

(declare-fun d!810 () Bool)

(assert (=> d!810 (= (array_inv!19 (buf!334 thiss!932)) (bvsge (size!22 (buf!334 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!388 d!810))

(push 1)

(assert (not d!806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!816 () Bool)

