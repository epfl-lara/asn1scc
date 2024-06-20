; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15714 () Bool)

(assert start!15714)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((array!3397 0))(
  ( (array!3398 (arr!2169 (Array (_ BitVec 32) (_ BitVec 8))) (size!1568 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2698 0))(
  ( (BitStream!2699 (buf!1958 array!3397) (currentByte!3835 (_ BitVec 32)) (currentBit!3830 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2698)

(assert (=> start!15714 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!1568 (buf!1958 thiss!1716))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3835 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3830 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!15714 true))

(declare-fun e!52187 () Bool)

(declare-fun inv!12 (BitStream!2698) Bool)

(assert (=> start!15714 (and (inv!12 thiss!1716) e!52187)))

(declare-fun b!79491 () Bool)

(declare-fun array_inv!1414 (array!3397) Bool)

(assert (=> b!79491 (= e!52187 (array_inv!1414 (buf!1958 thiss!1716)))))

(assert (= start!15714 b!79491))

(declare-fun m!124899 () Bool)

(assert (=> start!15714 m!124899))

(declare-fun m!124901 () Bool)

(assert (=> b!79491 m!124901))

(push 1)

(assert (not start!15714))

(assert (not b!79491))

(check-sat)

(pop 1)

(push 1)

(check-sat)

