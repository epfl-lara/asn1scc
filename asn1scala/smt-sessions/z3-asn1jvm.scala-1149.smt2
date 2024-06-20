; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32532 () Bool)

(assert start!32532)

(declare-fun res!133742 () Bool)

(declare-fun e!109657 () Bool)

(assert (=> start!32532 (=> (not res!133742) (not e!109657))))

(declare-datatypes ((array!7650 0))(
  ( (array!7651 (arr!4382 (Array (_ BitVec 32) (_ BitVec 8))) (size!3461 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6090 0))(
  ( (BitStream!6091 (buf!3919 array!7650) (currentByte!7174 (_ BitVec 32)) (currentBit!7169 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6090)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32532 (= res!133742 (validate_offset_byte!0 ((_ sign_extend 32) (size!3461 (buf!3919 thiss!1602))) ((_ sign_extend 32) (currentByte!7174 thiss!1602)) ((_ sign_extend 32) (currentBit!7169 thiss!1602))))))

(assert (=> start!32532 e!109657))

(declare-fun e!109658 () Bool)

(declare-fun inv!12 (BitStream!6090) Bool)

(assert (=> start!32532 (and (inv!12 thiss!1602) e!109658)))

(declare-fun b!160259 () Bool)

(assert (=> b!160259 (= e!109657 (bvsge (currentBit!7169 thiss!1602) #b00000000000000000000000010000000))))

(declare-fun b!160260 () Bool)

(declare-fun array_inv!3208 (array!7650) Bool)

(assert (=> b!160260 (= e!109658 (array_inv!3208 (buf!3919 thiss!1602)))))

(assert (= (and start!32532 res!133742) b!160259))

(assert (= start!32532 b!160260))

(declare-fun m!253009 () Bool)

(assert (=> start!32532 m!253009))

(declare-fun m!253011 () Bool)

(assert (=> start!32532 m!253011))

(declare-fun m!253013 () Bool)

(assert (=> b!160260 m!253013))

(check-sat (not start!32532) (not b!160260))
(check-sat)
(get-model)

(declare-fun d!54029 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54029 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3461 (buf!3919 thiss!1602))) ((_ sign_extend 32) (currentByte!7174 thiss!1602)) ((_ sign_extend 32) (currentBit!7169 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3461 (buf!3919 thiss!1602))) ((_ sign_extend 32) (currentByte!7174 thiss!1602)) ((_ sign_extend 32) (currentBit!7169 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13375 () Bool)

(assert (= bs!13375 d!54029))

(declare-fun m!253021 () Bool)

(assert (=> bs!13375 m!253021))

(assert (=> start!32532 d!54029))

(declare-fun d!54033 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54033 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7169 thiss!1602) (currentByte!7174 thiss!1602) (size!3461 (buf!3919 thiss!1602))))))

(declare-fun bs!13377 () Bool)

(assert (= bs!13377 d!54033))

(declare-fun m!253025 () Bool)

(assert (=> bs!13377 m!253025))

(assert (=> start!32532 d!54033))

(declare-fun d!54037 () Bool)

(assert (=> d!54037 (= (array_inv!3208 (buf!3919 thiss!1602)) (bvsge (size!3461 (buf!3919 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160260 d!54037))

(check-sat (not d!54033) (not d!54029))
(check-sat)
(get-model)

(declare-fun d!54047 () Bool)

(assert (=> d!54047 (= (invariant!0 (currentBit!7169 thiss!1602) (currentByte!7174 thiss!1602) (size!3461 (buf!3919 thiss!1602))) (and (bvsge (currentBit!7169 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7169 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7174 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7174 thiss!1602) (size!3461 (buf!3919 thiss!1602))) (and (= (currentBit!7169 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7174 thiss!1602) (size!3461 (buf!3919 thiss!1602)))))))))

(assert (=> d!54033 d!54047))

(declare-fun d!54049 () Bool)

(assert (=> d!54049 (= (remainingBits!0 ((_ sign_extend 32) (size!3461 (buf!3919 thiss!1602))) ((_ sign_extend 32) (currentByte!7174 thiss!1602)) ((_ sign_extend 32) (currentBit!7169 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3461 (buf!3919 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7174 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7169 thiss!1602)))))))

(assert (=> d!54029 d!54049))

(check-sat)
