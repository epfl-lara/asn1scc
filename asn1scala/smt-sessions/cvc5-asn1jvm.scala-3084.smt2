; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71008 () Bool)

(assert start!71008)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20258 0))(
  ( (array!20259 (arr!9922 (Array (_ BitVec 32) (_ BitVec 8))) (size!8830 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13822 0))(
  ( (BitStream!13823 (buf!7972 array!20258) (currentByte!14703 (_ BitVec 32)) (currentBit!14698 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13822)

(assert (=> start!71008 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8830 (buf!7972 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14703 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14698 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8830 (buf!7972 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14703 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14698 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71008 true))

(declare-fun e!230948 () Bool)

(declare-fun inv!12 (BitStream!13822) Bool)

(assert (=> start!71008 (and (inv!12 thiss!1780) e!230948)))

(declare-fun b!320773 () Bool)

(declare-fun array_inv!8382 (array!20258) Bool)

(assert (=> b!320773 (= e!230948 (array_inv!8382 (buf!7972 thiss!1780)))))

(assert (= start!71008 b!320773))

(declare-fun m!459141 () Bool)

(assert (=> start!71008 m!459141))

(declare-fun m!459143 () Bool)

(assert (=> b!320773 m!459143))

(push 1)

(assert (not b!320773))

(assert (not start!71008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105040 () Bool)

(assert (=> d!105040 (= (array_inv!8382 (buf!7972 thiss!1780)) (bvsge (size!8830 (buf!7972 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!320773 d!105040))

(declare-fun d!105042 () Bool)

