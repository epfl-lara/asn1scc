; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63520 () Bool)

(assert start!63520)

(declare-datatypes ((array!16543 0))(
  ( (array!16544 (arr!8140 (Array (_ BitVec 32) (_ BitVec 8))) (size!7144 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12658 0))(
  ( (BitStream!12659 (buf!7390 array!16543) (currentByte!13691 (_ BitVec 32)) (currentBit!13686 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12658)

(assert (=> start!63520 (and (bvsle ((_ sign_extend 32) (size!7144 (buf!7390 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13691 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13686 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!7144 (buf!7390 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13691 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13686 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!202802 () Bool)

(declare-fun inv!12 (BitStream!12658) Bool)

(assert (=> start!63520 (and (inv!12 thiss!1929) e!202802)))

(declare-fun b!283842 () Bool)

(declare-fun array_inv!6837 (array!16543) Bool)

(assert (=> b!283842 (= e!202802 (array_inv!6837 (buf!7390 thiss!1929)))))

(assert (= start!63520 b!283842))

(declare-fun m!416959 () Bool)

(assert (=> start!63520 m!416959))

(declare-fun m!416961 () Bool)

(assert (=> b!283842 m!416961))

(push 1)

(assert (not start!63520))

(assert (not b!283842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97508 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97508 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13686 thiss!1929) (currentByte!13691 thiss!1929) (size!7144 (buf!7390 thiss!1929))))))

(declare-fun bs!24628 () Bool)

(assert (= bs!24628 d!97508))

(declare-fun m!416973 () Bool)

(assert (=> bs!24628 m!416973))

(assert (=> start!63520 d!97508))

(declare-fun d!97510 () Bool)

(assert (=> d!97510 (= (array_inv!6837 (buf!7390 thiss!1929)) (bvsge (size!7144 (buf!7390 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283842 d!97510))

(push 1)

(assert (not d!97508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97514 () Bool)

(assert (=> d!97514 (= (invariant!0 (currentBit!13686 thiss!1929) (currentByte!13691 thiss!1929) (size!7144 (buf!7390 thiss!1929))) (and (bvsge (currentBit!13686 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13686 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13691 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13691 thiss!1929) (size!7144 (buf!7390 thiss!1929))) (and (= (currentBit!13686 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13691 thiss!1929) (size!7144 (buf!7390 thiss!1929)))))))))

(assert (=> d!97508 d!97514))

