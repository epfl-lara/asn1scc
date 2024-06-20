; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3312 () Bool)

(assert start!3312)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((array!859 0))(
  ( (array!860 (arr!795 (Array (_ BitVec 32) (_ BitVec 8))) (size!366 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!692 0))(
  ( (BitStream!693 (buf!717 array!859) (currentByte!1863 (_ BitVec 32)) (currentBit!1858 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!692)

(assert (=> start!3312 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!366 (buf!717 thiss!1073))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1863 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1858 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!366 (buf!717 thiss!1073))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1863 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1858 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3312 true))

(declare-fun e!9170 () Bool)

(declare-fun inv!12 (BitStream!692) Bool)

(assert (=> start!3312 (and (inv!12 thiss!1073) e!9170)))

(declare-fun b!14660 () Bool)

(declare-fun array_inv!355 (array!859) Bool)

(assert (=> b!14660 (= e!9170 (array_inv!355 (buf!717 thiss!1073)))))

(assert (= start!3312 b!14660))

(declare-fun m!21097 () Bool)

(assert (=> start!3312 m!21097))

(declare-fun m!21099 () Bool)

(assert (=> b!14660 m!21099))

(push 1)

(assert (not b!14660))

(assert (not start!3312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4820 () Bool)

