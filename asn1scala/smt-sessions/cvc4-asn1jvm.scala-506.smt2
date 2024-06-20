; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14878 () Bool)

(assert start!14878)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((array!3170 0))(
  ( (array!3171 (arr!2078 (Array (_ BitVec 32) (_ BitVec 8))) (size!1477 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2528 0))(
  ( (BitStream!2529 (buf!1861 array!3170) (currentByte!3658 (_ BitVec 32)) (currentBit!3653 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2528)

(assert (=> start!14878 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1477 (buf!1861 thiss!1090))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3658 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3653 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1477 (buf!1861 thiss!1090))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3658 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3653 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!14878 true))

(declare-fun e!50228 () Bool)

(declare-fun inv!12 (BitStream!2528) Bool)

(assert (=> start!14878 (and (inv!12 thiss!1090) e!50228)))

(declare-fun b!76542 () Bool)

(declare-fun array_inv!1323 (array!3170) Bool)

(assert (=> b!76542 (= e!50228 (array_inv!1323 (buf!1861 thiss!1090)))))

(assert (= start!14878 b!76542))

(declare-fun m!121783 () Bool)

(assert (=> start!14878 m!121783))

(declare-fun m!121785 () Bool)

(assert (=> b!76542 m!121785))

(push 1)

(assert (not start!14878))

(assert (not b!76542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

