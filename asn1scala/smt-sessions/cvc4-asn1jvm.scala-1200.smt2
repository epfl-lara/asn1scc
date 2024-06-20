; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34152 () Bool)

(assert start!34152)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8062 0))(
  ( (array!8063 (arr!4536 (Array (_ BitVec 32) (_ BitVec 8))) (size!3615 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6386 0))(
  ( (BitStream!6387 (buf!4067 array!8062) (currentByte!7582 (_ BitVec 32)) (currentBit!7577 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6386)

(assert (=> start!34152 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3615 (buf!4067 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7582 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7577 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3615 (buf!4067 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7582 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7577 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!34152 true))

(declare-fun e!112408 () Bool)

(declare-fun inv!12 (BitStream!6386) Bool)

(assert (=> start!34152 (and (inv!12 thiss!1577) e!112408)))

(declare-fun b!162872 () Bool)

(declare-fun array_inv!3356 (array!8062) Bool)

(assert (=> b!162872 (= e!112408 (array_inv!3356 (buf!4067 thiss!1577)))))

(assert (= start!34152 b!162872))

(declare-fun m!258643 () Bool)

(assert (=> start!34152 m!258643))

(declare-fun m!258645 () Bool)

(assert (=> b!162872 m!258645))

(push 1)

(assert (not b!162872))

(assert (not start!34152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

