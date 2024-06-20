; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34148 () Bool)

(assert start!34148)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8058 0))(
  ( (array!8059 (arr!4534 (Array (_ BitVec 32) (_ BitVec 8))) (size!3613 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6382 0))(
  ( (BitStream!6383 (buf!4065 array!8058) (currentByte!7580 (_ BitVec 32)) (currentBit!7575 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6382)

(assert (=> start!34148 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3613 (buf!4065 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7580 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7575 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3613 (buf!4065 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7580 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7575 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!34148 true))

(declare-fun e!112396 () Bool)

(declare-fun inv!12 (BitStream!6382) Bool)

(assert (=> start!34148 (and (inv!12 thiss!1577) e!112396)))

(declare-fun b!162866 () Bool)

(declare-fun array_inv!3354 (array!8058) Bool)

(assert (=> b!162866 (= e!112396 (array_inv!3354 (buf!4065 thiss!1577)))))

(assert (= start!34148 b!162866))

(declare-fun m!258635 () Bool)

(assert (=> start!34148 m!258635))

(declare-fun m!258637 () Bool)

(assert (=> b!162866 m!258637))

(push 1)

(assert (not start!34148))

(assert (not b!162866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56131 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56131 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7575 thiss!1577) (currentByte!7580 thiss!1577) (size!3613 (buf!4065 thiss!1577))))))

(declare-fun bs!13901 () Bool)

(assert (= bs!13901 d!56131))

(declare-fun m!258649 () Bool)

