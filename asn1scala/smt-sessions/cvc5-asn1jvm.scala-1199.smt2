; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34142 () Bool)

(assert start!34142)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8052 0))(
  ( (array!8053 (arr!4531 (Array (_ BitVec 32) (_ BitVec 8))) (size!3610 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6376 0))(
  ( (BitStream!6377 (buf!4062 array!8052) (currentByte!7577 (_ BitVec 32)) (currentBit!7572 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6376)

(assert (=> start!34142 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!3610 (buf!4062 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7577 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7572 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!34142 true))

(declare-fun e!112378 () Bool)

(declare-fun inv!12 (BitStream!6376) Bool)

(assert (=> start!34142 (and (inv!12 thiss!1577) e!112378)))

(declare-fun b!162857 () Bool)

(declare-fun array_inv!3351 (array!8052) Bool)

(assert (=> b!162857 (= e!112378 (array_inv!3351 (buf!4062 thiss!1577)))))

(assert (= start!34142 b!162857))

(declare-fun m!258623 () Bool)

(assert (=> start!34142 m!258623))

(declare-fun m!258625 () Bool)

(assert (=> b!162857 m!258625))

(push 1)

(assert (not start!34142))

(assert (not b!162857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

