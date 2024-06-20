; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72656 () Bool)

(assert start!72656)

(declare-datatypes ((array!20818 0))(
  ( (array!20819 (arr!10144 (Array (_ BitVec 32) (_ BitVec 8))) (size!9052 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14266 0))(
  ( (BitStream!14267 (buf!8194 array!20818) (currentByte!15146 (_ BitVec 32)) (currentBit!15141 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14266)

(assert (=> start!72656 (and (bvsle ((_ sign_extend 32) (size!9052 (buf!8194 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15146 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15141 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9052 (buf!8194 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15146 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15141 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!233780 () Bool)

(declare-fun inv!12 (BitStream!14266) Bool)

(assert (=> start!72656 (and (inv!12 thiss!877) e!233780)))

(declare-fun b!324349 () Bool)

(declare-fun array_inv!8604 (array!20818) Bool)

(assert (=> b!324349 (= e!233780 (array_inv!8604 (buf!8194 thiss!877)))))

(assert (= start!72656 b!324349))

(declare-fun m!462467 () Bool)

(assert (=> start!72656 m!462467))

(declare-fun m!462469 () Bool)

(assert (=> b!324349 m!462469))

(push 1)

(assert (not b!324349))

(assert (not start!72656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106590 () Bool)

(assert (=> d!106590 (= (array_inv!8604 (buf!8194 thiss!877)) (bvsge (size!9052 (buf!8194 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324349 d!106590))

(declare-fun d!106592 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106592 (= (inv!12 thiss!877) (invariant!0 (currentBit!15141 thiss!877) (currentByte!15146 thiss!877) (size!9052 (buf!8194 thiss!877))))))

(declare-fun bs!28079 () Bool)

(assert (= bs!28079 d!106592))

(declare-fun m!462481 () Bool)

(assert (=> bs!28079 m!462481))

(assert (=> start!72656 d!106592))

(push 1)

(assert (not d!106592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

