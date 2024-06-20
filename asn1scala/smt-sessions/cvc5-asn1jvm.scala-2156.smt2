; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54792 () Bool)

(assert start!54792)

(declare-fun nBits!539 () (_ BitVec 64))

(declare-fun from!530 () (_ BitVec 64))

(declare-datatypes ((array!13852 0))(
  ( (array!13853 (arr!7066 (Array (_ BitVec 32) (_ BitVec 8))) (size!6079 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11080 0))(
  ( (BitStream!11081 (buf!6601 array!13852) (currentByte!12085 (_ BitVec 32)) (currentBit!12080 (_ BitVec 32))) )
))
(declare-fun thiss!1774 () BitStream!11080)

(assert (=> start!54792 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!539) (bvsle nBits!539 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!530) (bvsle from!530 nBits!539) (bvsle ((_ sign_extend 32) (size!6079 (buf!6601 thiss!1774))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12085 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12080 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6079 (buf!6601 thiss!1774))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12085 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12080 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54792 true))

(declare-fun e!177855 () Bool)

(declare-fun inv!12 (BitStream!11080) Bool)

(assert (=> start!54792 (and (inv!12 thiss!1774) e!177855)))

(declare-fun b!256666 () Bool)

(declare-fun array_inv!5820 (array!13852) Bool)

(assert (=> b!256666 (= e!177855 (array_inv!5820 (buf!6601 thiss!1774)))))

(assert (= start!54792 b!256666))

(declare-fun m!386259 () Bool)

(assert (=> start!54792 m!386259))

(declare-fun m!386261 () Bool)

(assert (=> b!256666 m!386261))

(push 1)

(assert (not b!256666))

(assert (not start!54792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86074 () Bool)

