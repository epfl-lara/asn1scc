; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14874 () Bool)

(assert start!14874)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((array!3166 0))(
  ( (array!3167 (arr!2076 (Array (_ BitVec 32) (_ BitVec 8))) (size!1475 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2524 0))(
  ( (BitStream!2525 (buf!1859 array!3166) (currentByte!3656 (_ BitVec 32)) (currentBit!3651 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2524)

(assert (=> start!14874 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1475 (buf!1859 thiss!1090))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3656 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3651 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1475 (buf!1859 thiss!1090))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3656 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3651 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!14874 true))

(declare-fun e!50216 () Bool)

(declare-fun inv!12 (BitStream!2524) Bool)

(assert (=> start!14874 (and (inv!12 thiss!1090) e!50216)))

(declare-fun b!76536 () Bool)

(declare-fun array_inv!1321 (array!3166) Bool)

(assert (=> b!76536 (= e!50216 (array_inv!1321 (buf!1859 thiss!1090)))))

(assert (= start!14874 b!76536))

(declare-fun m!121775 () Bool)

(assert (=> start!14874 m!121775))

(declare-fun m!121777 () Bool)

(assert (=> b!76536 m!121777))

(push 1)

(assert (not b!76536))

(assert (not start!14874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24202 () Bool)

(assert (=> d!24202 (= (array_inv!1321 (buf!1859 thiss!1090)) (bvsge (size!1475 (buf!1859 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!76536 d!24202))

(declare-fun d!24204 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24204 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3651 thiss!1090) (currentByte!3656 thiss!1090) (size!1475 (buf!1859 thiss!1090))))))

(declare-fun bs!5840 () Bool)

(assert (= bs!5840 d!24204))

(declare-fun m!121789 () Bool)

(assert (=> bs!5840 m!121789))

(assert (=> start!14874 d!24204))

(push 1)

