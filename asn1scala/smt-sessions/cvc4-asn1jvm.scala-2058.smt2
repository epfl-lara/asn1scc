; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52388 () Bool)

(assert start!52388)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13217 0))(
  ( (array!13218 (arr!6777 (Array (_ BitVec 32) (_ BitVec 8))) (size!5790 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10502 0))(
  ( (BitStream!10503 (buf!6256 array!13217) (currentByte!11616 (_ BitVec 32)) (currentBit!11611 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10502)

(assert (=> start!52388 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297) (bvsle ((_ sign_extend 32) (size!5790 (buf!6256 thiss!1005))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11616 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11611 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5790 (buf!6256 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11616 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11611 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52388 true))

(declare-fun e!167122 () Bool)

(declare-fun inv!12 (BitStream!10502) Bool)

(assert (=> start!52388 (and (inv!12 thiss!1005) e!167122)))

(declare-fun b!241160 () Bool)

(declare-fun array_inv!5531 (array!13217) Bool)

(assert (=> b!241160 (= e!167122 (array_inv!5531 (buf!6256 thiss!1005)))))

(assert (= start!52388 b!241160))

(declare-fun m!363881 () Bool)

(assert (=> start!52388 m!363881))

(declare-fun m!363883 () Bool)

(assert (=> b!241160 m!363883))

(push 1)

(assert (not start!52388))

(assert (not b!241160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81478 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81478 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11611 thiss!1005) (currentByte!11616 thiss!1005) (size!5790 (buf!6256 thiss!1005))))))

(declare-fun bs!20572 () Bool)

(assert (= bs!20572 d!81478))

(declare-fun m!363889 () Bool)

(assert (=> bs!20572 m!363889))

(assert (=> start!52388 d!81478))

