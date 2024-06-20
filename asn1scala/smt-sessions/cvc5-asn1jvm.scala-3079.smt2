; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70952 () Bool)

(assert start!70952)

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20223 0))(
  ( (array!20224 (arr!9907 (Array (_ BitVec 32) (_ BitVec 8))) (size!8815 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13792 0))(
  ( (BitStream!13793 (buf!7957 array!20223) (currentByte!14685 (_ BitVec 32)) (currentBit!14680 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13792)

(assert (=> start!70952 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8815 (buf!7957 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14685 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14680 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!70952 true))

(declare-fun e!230840 () Bool)

(declare-fun inv!12 (BitStream!13792) Bool)

(assert (=> start!70952 (and (inv!12 thiss!1788) e!230840)))

(declare-fun b!320701 () Bool)

(declare-fun array_inv!8367 (array!20223) Bool)

(assert (=> b!320701 (= e!230840 (array_inv!8367 (buf!7957 thiss!1788)))))

(assert (= start!70952 b!320701))

(declare-fun m!459061 () Bool)

(assert (=> start!70952 m!459061))

(declare-fun m!459063 () Bool)

(assert (=> b!320701 m!459063))

(push 1)

(assert (not start!70952))

(assert (not b!320701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

