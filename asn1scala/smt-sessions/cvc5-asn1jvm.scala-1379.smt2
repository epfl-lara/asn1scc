; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38108 () Bool)

(assert start!38108)

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9165 0))(
  ( (array!9166 (arr!4981 (Array (_ BitVec 32) (_ BitVec 8))) (size!4051 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7210 0))(
  ( (BitStream!7211 (buf!4479 array!9165) (currentByte!8511 (_ BitVec 32)) (currentBit!8506 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7210)

(assert (=> start!38108 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4051 (buf!4479 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8511 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8506 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4051 (buf!4479 thiss!1817))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8511 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8506 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38108 true))

(declare-fun e!119976 () Bool)

(declare-fun inv!12 (BitStream!7210) Bool)

(assert (=> start!38108 (and (inv!12 thiss!1817) e!119976)))

(declare-fun b!171732 () Bool)

(declare-fun array_inv!3792 (array!9165) Bool)

(assert (=> b!171732 (= e!119976 (array_inv!3792 (buf!4479 thiss!1817)))))

(assert (= start!38108 b!171732))

(declare-fun m!270979 () Bool)

(assert (=> start!38108 m!270979))

(declare-fun m!270981 () Bool)

(assert (=> b!171732 m!270981))

(push 1)

(assert (not start!38108))

(assert (not b!171732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60853 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60853 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8506 thiss!1817) (currentByte!8511 thiss!1817) (size!4051 (buf!4479 thiss!1817))))))

(declare-fun bs!15134 () Bool)

(assert (= bs!15134 d!60853))

(declare-fun m!270993 () Bool)

(assert (=> bs!15134 m!270993))

(assert (=> start!38108 d!60853))

(declare-fun d!60855 () Bool)

(assert (=> d!60855 (= (array_inv!3792 (buf!4479 thiss!1817)) (bvsge (size!4051 (buf!4479 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!171732 d!60855))

(push 1)

(assert (not d!60853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

