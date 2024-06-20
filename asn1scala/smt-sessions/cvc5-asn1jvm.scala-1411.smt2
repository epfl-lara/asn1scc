; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38872 () Bool)

(assert start!38872)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9400 0))(
  ( (array!9401 (arr!5077 (Array (_ BitVec 32) (_ BitVec 8))) (size!4147 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7402 0))(
  ( (BitStream!7403 (buf!4584 array!9400) (currentByte!8704 (_ BitVec 32)) (currentBit!8699 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7402)

(assert (=> start!38872 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle ((_ sign_extend 32) (size!4147 (buf!4584 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8704 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8699 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4147 (buf!4584 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8704 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8699 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38872 true))

(declare-fun e!122019 () Bool)

(declare-fun inv!12 (BitStream!7402) Bool)

(assert (=> start!38872 (and (inv!12 thiss!1204) e!122019)))

(declare-fun b!175029 () Bool)

(declare-fun array_inv!3888 (array!9400) Bool)

(assert (=> b!175029 (= e!122019 (array_inv!3888 (buf!4584 thiss!1204)))))

(assert (= start!38872 b!175029))

(declare-fun m!275273 () Bool)

(assert (=> start!38872 m!275273))

(declare-fun m!275275 () Bool)

(assert (=> b!175029 m!275275))

(push 1)

(assert (not b!175029))

(assert (not start!38872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61883 () Bool)

(assert (=> d!61883 (= (array_inv!3888 (buf!4584 thiss!1204)) (bvsge (size!4147 (buf!4584 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175029 d!61883))

(declare-fun d!61885 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61885 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8699 thiss!1204) (currentByte!8704 thiss!1204) (size!4147 (buf!4584 thiss!1204))))))

(declare-fun bs!15412 () Bool)

(assert (= bs!15412 d!61885))

(declare-fun m!275287 () Bool)

(assert (=> bs!15412 m!275287))

(assert (=> start!38872 d!61885))

(push 1)

(assert (not d!61885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

