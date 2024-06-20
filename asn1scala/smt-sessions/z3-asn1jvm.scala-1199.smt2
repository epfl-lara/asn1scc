; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34144 () Bool)

(assert start!34144)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8054 0))(
  ( (array!8055 (arr!4532 (Array (_ BitVec 32) (_ BitVec 8))) (size!3611 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6378 0))(
  ( (BitStream!6379 (buf!4063 array!8054) (currentByte!7578 (_ BitVec 32)) (currentBit!7573 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6378)

(assert (=> start!34144 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!3611 (buf!4063 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7578 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7573 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!34144 true))

(declare-fun e!112384 () Bool)

(declare-fun inv!12 (BitStream!6378) Bool)

(assert (=> start!34144 (and (inv!12 thiss!1577) e!112384)))

(declare-fun b!162860 () Bool)

(declare-fun array_inv!3352 (array!8054) Bool)

(assert (=> b!162860 (= e!112384 (array_inv!3352 (buf!4063 thiss!1577)))))

(assert (= start!34144 b!162860))

(declare-fun m!258627 () Bool)

(assert (=> start!34144 m!258627))

(declare-fun m!258629 () Bool)

(assert (=> b!162860 m!258629))

(check-sat (not b!162860) (not start!34144))
(check-sat)
