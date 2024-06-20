; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34150 () Bool)

(assert start!34150)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8060 0))(
  ( (array!8061 (arr!4535 (Array (_ BitVec 32) (_ BitVec 8))) (size!3614 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6384 0))(
  ( (BitStream!6385 (buf!4066 array!8060) (currentByte!7581 (_ BitVec 32)) (currentBit!7576 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6384)

(assert (=> start!34150 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3614 (buf!4066 thiss!1577))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7581 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7576 thiss!1577)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3614 (buf!4066 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7581 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7576 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!34150 true))

(declare-fun e!112402 () Bool)

(declare-fun inv!12 (BitStream!6384) Bool)

(assert (=> start!34150 (and (inv!12 thiss!1577) e!112402)))

(declare-fun b!162869 () Bool)

(declare-fun array_inv!3355 (array!8060) Bool)

(assert (=> b!162869 (= e!112402 (array_inv!3355 (buf!4066 thiss!1577)))))

(assert (= start!34150 b!162869))

(declare-fun m!258639 () Bool)

(assert (=> start!34150 m!258639))

(declare-fun m!258641 () Bool)

(assert (=> b!162869 m!258641))

(check-sat (not b!162869) (not start!34150))
(check-sat)
(get-model)

(declare-fun d!56125 () Bool)

(assert (=> d!56125 (= (array_inv!3355 (buf!4066 thiss!1577)) (bvsge (size!3614 (buf!4066 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!162869 d!56125))

(declare-fun d!56127 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56127 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7576 thiss!1577) (currentByte!7581 thiss!1577) (size!3614 (buf!4066 thiss!1577))))))

(declare-fun bs!13900 () Bool)

(assert (= bs!13900 d!56127))

(declare-fun m!258647 () Bool)

(assert (=> bs!13900 m!258647))

(assert (=> start!34150 d!56127))

(check-sat (not d!56127))
(check-sat)
(get-model)

(declare-fun d!56129 () Bool)

(assert (=> d!56129 (= (invariant!0 (currentBit!7576 thiss!1577) (currentByte!7581 thiss!1577) (size!3614 (buf!4066 thiss!1577))) (and (bvsge (currentBit!7576 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7576 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7581 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7581 thiss!1577) (size!3614 (buf!4066 thiss!1577))) (and (= (currentBit!7576 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7581 thiss!1577) (size!3614 (buf!4066 thiss!1577)))))))))

(assert (=> d!56127 d!56129))

(check-sat)
