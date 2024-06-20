; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14868 () Bool)

(assert start!14868)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((array!3160 0))(
  ( (array!3161 (arr!2073 (Array (_ BitVec 32) (_ BitVec 8))) (size!1472 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2518 0))(
  ( (BitStream!2519 (buf!1856 array!3160) (currentByte!3653 (_ BitVec 32)) (currentBit!3648 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2518)

(assert (=> start!14868 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!1472 (buf!1856 thiss!1090))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3653 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3648 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!14868 true))

(declare-fun e!50198 () Bool)

(declare-fun inv!12 (BitStream!2518) Bool)

(assert (=> start!14868 (and (inv!12 thiss!1090) e!50198)))

(declare-fun b!76527 () Bool)

(declare-fun array_inv!1318 (array!3160) Bool)

(assert (=> b!76527 (= e!50198 (array_inv!1318 (buf!1856 thiss!1090)))))

(assert (= start!14868 b!76527))

(declare-fun m!121763 () Bool)

(assert (=> start!14868 m!121763))

(declare-fun m!121765 () Bool)

(assert (=> b!76527 m!121765))

(push 1)

(assert (not b!76527))

(assert (not start!14868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

