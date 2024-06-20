; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52378 () Bool)

(assert start!52378)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13207 0))(
  ( (array!13208 (arr!6772 (Array (_ BitVec 32) (_ BitVec 8))) (size!5785 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10492 0))(
  ( (BitStream!10493 (buf!6251 array!13207) (currentByte!11611 (_ BitVec 32)) (currentBit!11606 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10492)

(assert (=> start!52378 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297) (or (bvsgt ((_ sign_extend 32) (size!5785 (buf!6251 thiss!1005))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11611 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11606 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!52378 true))

(declare-fun e!167092 () Bool)

(declare-fun inv!12 (BitStream!10492) Bool)

(assert (=> start!52378 (and (inv!12 thiss!1005) e!167092)))

(declare-fun b!241145 () Bool)

(declare-fun array_inv!5526 (array!13207) Bool)

(assert (=> b!241145 (= e!167092 (array_inv!5526 (buf!6251 thiss!1005)))))

(assert (= start!52378 b!241145))

(declare-fun m!363861 () Bool)

(assert (=> start!52378 m!363861))

(declare-fun m!363863 () Bool)

(assert (=> b!241145 m!363863))

(push 1)

(assert (not b!241145))

(assert (not start!52378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

