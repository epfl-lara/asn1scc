; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3302 () Bool)

(assert start!3302)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((array!849 0))(
  ( (array!850 (arr!790 (Array (_ BitVec 32) (_ BitVec 8))) (size!361 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!682 0))(
  ( (BitStream!683 (buf!712 array!849) (currentByte!1858 (_ BitVec 32)) (currentBit!1853 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!682)

(assert (=> start!3302 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!361 (buf!712 thiss!1073))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1858 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1853 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!3302 true))

(declare-fun e!9140 () Bool)

(declare-fun inv!12 (BitStream!682) Bool)

(assert (=> start!3302 (and (inv!12 thiss!1073) e!9140)))

(declare-fun b!14645 () Bool)

(declare-fun array_inv!350 (array!849) Bool)

(assert (=> b!14645 (= e!9140 (array_inv!350 (buf!712 thiss!1073)))))

(assert (= start!3302 b!14645))

(declare-fun m!21077 () Bool)

(assert (=> start!3302 m!21077))

(declare-fun m!21079 () Bool)

(assert (=> b!14645 m!21079))

(push 1)

(assert (not start!3302))

(assert (not b!14645))

(check-sat)

(pop 1)

(push 1)

(check-sat)

