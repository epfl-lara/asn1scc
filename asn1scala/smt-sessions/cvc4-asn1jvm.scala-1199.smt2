; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34146 () Bool)

(assert start!34146)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8056 0))(
  ( (array!8057 (arr!4533 (Array (_ BitVec 32) (_ BitVec 8))) (size!3612 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6380 0))(
  ( (BitStream!6381 (buf!4064 array!8056) (currentByte!7579 (_ BitVec 32)) (currentBit!7574 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6380)

(assert (=> start!34146 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!3612 (buf!4064 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7579 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7574 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!34146 true))

(declare-fun e!112390 () Bool)

(declare-fun inv!12 (BitStream!6380) Bool)

(assert (=> start!34146 (and (inv!12 thiss!1577) e!112390)))

(declare-fun b!162863 () Bool)

(declare-fun array_inv!3353 (array!8056) Bool)

(assert (=> b!162863 (= e!112390 (array_inv!3353 (buf!4064 thiss!1577)))))

(assert (= start!34146 b!162863))

(declare-fun m!258631 () Bool)

(assert (=> start!34146 m!258631))

(declare-fun m!258633 () Bool)

(assert (=> b!162863 m!258633))

(push 1)

(assert (not b!162863))

(assert (not start!34146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

