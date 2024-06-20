; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3306 () Bool)

(assert start!3306)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((array!853 0))(
  ( (array!854 (arr!792 (Array (_ BitVec 32) (_ BitVec 8))) (size!363 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!686 0))(
  ( (BitStream!687 (buf!714 array!853) (currentByte!1860 (_ BitVec 32)) (currentBit!1855 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!686)

(assert (=> start!3306 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!363 (buf!714 thiss!1073))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1860 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1855 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!3306 true))

(declare-fun e!9152 () Bool)

(declare-fun inv!12 (BitStream!686) Bool)

(assert (=> start!3306 (and (inv!12 thiss!1073) e!9152)))

(declare-fun b!14651 () Bool)

(declare-fun array_inv!352 (array!853) Bool)

(assert (=> b!14651 (= e!9152 (array_inv!352 (buf!714 thiss!1073)))))

(assert (= start!3306 b!14651))

(declare-fun m!21085 () Bool)

(assert (=> start!3306 m!21085))

(declare-fun m!21087 () Bool)

(assert (=> b!14651 m!21087))

(push 1)

(assert (not b!14651))

(assert (not start!3306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

