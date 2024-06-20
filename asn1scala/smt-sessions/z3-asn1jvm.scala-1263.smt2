; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35860 () Bool)

(assert start!35860)

(declare-fun res!138665 () Bool)

(declare-fun e!115396 () Bool)

(assert (=> start!35860 (=> (not res!138665) (not e!115396))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35860 (= res!138665 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35860 e!115396))

(assert (=> start!35860 true))

(declare-datatypes ((array!8540 0))(
  ( (array!8541 (arr!4724 (Array (_ BitVec 32) (_ BitVec 8))) (size!3803 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6762 0))(
  ( (BitStream!6763 (buf!4255 array!8540) (currentByte!8020 (_ BitVec 32)) (currentBit!8015 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6762)

(declare-fun e!115397 () Bool)

(declare-fun inv!12 (BitStream!6762) Bool)

(assert (=> start!35860 (and (inv!12 thiss!1577) e!115397)))

(declare-fun b!166546 () Bool)

(declare-fun res!138664 () Bool)

(assert (=> b!166546 (=> (not res!138664) (not e!115396))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166546 (= res!138664 (validate_offset_bits!1 ((_ sign_extend 32) (size!3803 (buf!4255 thiss!1577))) ((_ sign_extend 32) (currentByte!8020 thiss!1577)) ((_ sign_extend 32) (currentBit!8015 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166547 () Bool)

(assert (=> b!166547 (= e!115396 (and (bvsgt (bvadd (currentBit!8015 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8020 thiss!1577)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8020 thiss!1577)) (size!3803 (buf!4255 thiss!1577))))))))

(declare-fun b!166548 () Bool)

(declare-fun array_inv!3544 (array!8540) Bool)

(assert (=> b!166548 (= e!115397 (array_inv!3544 (buf!4255 thiss!1577)))))

(assert (= (and start!35860 res!138665) b!166546))

(assert (= (and b!166546 res!138664) b!166547))

(assert (= start!35860 b!166548))

(declare-fun m!264559 () Bool)

(assert (=> start!35860 m!264559))

(declare-fun m!264561 () Bool)

(assert (=> b!166546 m!264561))

(declare-fun m!264563 () Bool)

(assert (=> b!166548 m!264563))

(check-sat (not b!166546) (not start!35860) (not b!166548))
(check-sat)
(get-model)

(declare-fun d!58105 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58105 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3803 (buf!4255 thiss!1577))) ((_ sign_extend 32) (currentByte!8020 thiss!1577)) ((_ sign_extend 32) (currentBit!8015 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3803 (buf!4255 thiss!1577))) ((_ sign_extend 32) (currentByte!8020 thiss!1577)) ((_ sign_extend 32) (currentBit!8015 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14420 () Bool)

(assert (= bs!14420 d!58105))

(declare-fun m!264573 () Bool)

(assert (=> bs!14420 m!264573))

(assert (=> b!166546 d!58105))

(declare-fun d!58111 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58111 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8015 thiss!1577) (currentByte!8020 thiss!1577) (size!3803 (buf!4255 thiss!1577))))))

(declare-fun bs!14422 () Bool)

(assert (= bs!14422 d!58111))

(declare-fun m!264577 () Bool)

(assert (=> bs!14422 m!264577))

(assert (=> start!35860 d!58111))

(declare-fun d!58115 () Bool)

(assert (=> d!58115 (= (array_inv!3544 (buf!4255 thiss!1577)) (bvsge (size!3803 (buf!4255 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166548 d!58115))

(check-sat (not d!58105) (not d!58111))
(check-sat)
(get-model)

(declare-fun d!58121 () Bool)

(assert (=> d!58121 (= (remainingBits!0 ((_ sign_extend 32) (size!3803 (buf!4255 thiss!1577))) ((_ sign_extend 32) (currentByte!8020 thiss!1577)) ((_ sign_extend 32) (currentBit!8015 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3803 (buf!4255 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8020 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8015 thiss!1577)))))))

(assert (=> d!58105 d!58121))

(declare-fun d!58127 () Bool)

(assert (=> d!58127 (= (invariant!0 (currentBit!8015 thiss!1577) (currentByte!8020 thiss!1577) (size!3803 (buf!4255 thiss!1577))) (and (bvsge (currentBit!8015 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8015 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8020 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8020 thiss!1577) (size!3803 (buf!4255 thiss!1577))) (and (= (currentBit!8015 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8020 thiss!1577) (size!3803 (buf!4255 thiss!1577)))))))))

(assert (=> d!58111 d!58127))

(check-sat)
