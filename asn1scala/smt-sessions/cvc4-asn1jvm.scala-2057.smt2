; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52382 () Bool)

(assert start!52382)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13211 0))(
  ( (array!13212 (arr!6774 (Array (_ BitVec 32) (_ BitVec 8))) (size!5787 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10496 0))(
  ( (BitStream!10497 (buf!6253 array!13211) (currentByte!11613 (_ BitVec 32)) (currentBit!11608 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10496)

(assert (=> start!52382 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297) (or (bvsgt ((_ sign_extend 32) (size!5787 (buf!6253 thiss!1005))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11613 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11608 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!52382 true))

(declare-fun e!167104 () Bool)

(declare-fun inv!12 (BitStream!10496) Bool)

(assert (=> start!52382 (and (inv!12 thiss!1005) e!167104)))

(declare-fun b!241151 () Bool)

(declare-fun array_inv!5528 (array!13211) Bool)

(assert (=> b!241151 (= e!167104 (array_inv!5528 (buf!6253 thiss!1005)))))

(assert (= start!52382 b!241151))

(declare-fun m!363869 () Bool)

(assert (=> start!52382 m!363869))

(declare-fun m!363871 () Bool)

(assert (=> b!241151 m!363871))

(push 1)

(assert (not start!52382))

(assert (not b!241151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

