; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71002 () Bool)

(assert start!71002)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20252 0))(
  ( (array!20253 (arr!9919 (Array (_ BitVec 32) (_ BitVec 8))) (size!8827 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13816 0))(
  ( (BitStream!13817 (buf!7969 array!20252) (currentByte!14700 (_ BitVec 32)) (currentBit!14695 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13816)

(assert (=> start!71002 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8827 (buf!7969 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14700 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14695 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!71002 true))

(declare-fun e!230930 () Bool)

(declare-fun inv!12 (BitStream!13816) Bool)

(assert (=> start!71002 (and (inv!12 thiss!1780) e!230930)))

(declare-fun b!320764 () Bool)

(declare-fun array_inv!8379 (array!20252) Bool)

(assert (=> b!320764 (= e!230930 (array_inv!8379 (buf!7969 thiss!1780)))))

(assert (= start!71002 b!320764))

(declare-fun m!459129 () Bool)

(assert (=> start!71002 m!459129))

(declare-fun m!459131 () Bool)

(assert (=> b!320764 m!459131))

(push 1)

(assert (not b!320764))

(assert (not start!71002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

