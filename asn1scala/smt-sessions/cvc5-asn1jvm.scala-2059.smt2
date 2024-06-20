; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52406 () Bool)

(assert start!52406)

(declare-fun res!201312 () Bool)

(declare-fun e!167130 () Bool)

(assert (=> start!52406 (=> (not res!201312) (not e!167130))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13222 0))(
  ( (array!13223 (arr!6778 (Array (_ BitVec 32) (_ BitVec 8))) (size!5791 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10504 0))(
  ( (BitStream!10505 (buf!6257 array!13222) (currentByte!11619 (_ BitVec 32)) (currentBit!11614 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10504)

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> start!52406 (= res!201312 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297) (bvsle ((_ sign_extend 32) (size!5791 (buf!6257 thiss!1005))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11619 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11614 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5791 (buf!6257 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11619 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11614 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52406 e!167130))

(assert (=> start!52406 true))

(declare-fun e!167131 () Bool)

(declare-fun inv!12 (BitStream!10504) Bool)

(assert (=> start!52406 (and (inv!12 thiss!1005) e!167131)))

(declare-fun b!241165 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241165 (= e!167130 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11614 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11619 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (size!5791 (buf!6257 thiss!1005)))))))))

(declare-fun b!241166 () Bool)

(declare-fun array_inv!5532 (array!13222) Bool)

(assert (=> b!241166 (= e!167131 (array_inv!5532 (buf!6257 thiss!1005)))))

(assert (= (and start!52406 res!201312) b!241165))

(assert (= start!52406 b!241166))

(declare-fun m!363891 () Bool)

(assert (=> start!52406 m!363891))

(declare-fun m!363893 () Bool)

(assert (=> b!241165 m!363893))

(declare-fun m!363895 () Bool)

(assert (=> b!241166 m!363895))

(push 1)

(assert (not start!52406))

(assert (not b!241166))

(assert (not b!241165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

