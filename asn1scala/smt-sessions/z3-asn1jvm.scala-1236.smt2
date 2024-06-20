; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35014 () Bool)

(assert start!35014)

(declare-fun res!137440 () Bool)

(declare-fun e!114092 () Bool)

(assert (=> start!35014 (=> (not res!137440) (not e!114092))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35014 (= res!137440 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35014 e!114092))

(assert (=> start!35014 true))

(declare-datatypes ((array!8321 0))(
  ( (array!8322 (arr!4643 (Array (_ BitVec 32) (_ BitVec 8))) (size!3722 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6600 0))(
  ( (BitStream!6601 (buf!4174 array!8321) (currentByte!7784 (_ BitVec 32)) (currentBit!7779 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6600)

(declare-fun e!114093 () Bool)

(declare-fun inv!12 (BitStream!6600) Bool)

(assert (=> start!35014 (and (inv!12 thiss!1577) e!114093)))

(declare-fun b!164974 () Bool)

(declare-fun res!137441 () Bool)

(assert (=> b!164974 (=> (not res!137441) (not e!114092))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164974 (= res!137441 (validate_offset_bits!1 ((_ sign_extend 32) (size!3722 (buf!4174 thiss!1577))) ((_ sign_extend 32) (currentByte!7784 thiss!1577)) ((_ sign_extend 32) (currentBit!7779 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164975 () Bool)

(assert (=> b!164975 (= e!114092 (and (bvsle (bvadd (currentBit!7779 thiss!1577) nBits!511) #b00000000000000000000000000001000) (not (= #b00000000000000000000000000000000 (bvand (bvadd (currentBit!7779 thiss!1577) nBits!511) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7779 thiss!1577) nBits!511)) #b10000000000000000000000000000000)))))))

(declare-fun b!164976 () Bool)

(declare-fun array_inv!3463 (array!8321) Bool)

(assert (=> b!164976 (= e!114093 (array_inv!3463 (buf!4174 thiss!1577)))))

(assert (= (and start!35014 res!137440) b!164974))

(assert (= (and b!164974 res!137441) b!164975))

(assert (= start!35014 b!164976))

(declare-fun m!262315 () Bool)

(assert (=> start!35014 m!262315))

(declare-fun m!262317 () Bool)

(assert (=> b!164974 m!262317))

(declare-fun m!262319 () Bool)

(assert (=> b!164976 m!262319))

(check-sat (not start!35014) (not b!164976) (not b!164974))
(check-sat)
(get-model)

(declare-fun d!57017 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57017 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7779 thiss!1577) (currentByte!7784 thiss!1577) (size!3722 (buf!4174 thiss!1577))))))

(declare-fun bs!14148 () Bool)

(assert (= bs!14148 d!57017))

(declare-fun m!262327 () Bool)

(assert (=> bs!14148 m!262327))

(assert (=> start!35014 d!57017))

(declare-fun d!57019 () Bool)

(assert (=> d!57019 (= (array_inv!3463 (buf!4174 thiss!1577)) (bvsge (size!3722 (buf!4174 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164976 d!57019))

(declare-fun d!57021 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57021 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3722 (buf!4174 thiss!1577))) ((_ sign_extend 32) (currentByte!7784 thiss!1577)) ((_ sign_extend 32) (currentBit!7779 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3722 (buf!4174 thiss!1577))) ((_ sign_extend 32) (currentByte!7784 thiss!1577)) ((_ sign_extend 32) (currentBit!7779 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14149 () Bool)

(assert (= bs!14149 d!57021))

(declare-fun m!262329 () Bool)

(assert (=> bs!14149 m!262329))

(assert (=> b!164974 d!57021))

(check-sat (not d!57017) (not d!57021))
(check-sat)
(get-model)

(declare-fun d!57035 () Bool)

(assert (=> d!57035 (= (invariant!0 (currentBit!7779 thiss!1577) (currentByte!7784 thiss!1577) (size!3722 (buf!4174 thiss!1577))) (and (bvsge (currentBit!7779 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7779 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7784 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7784 thiss!1577) (size!3722 (buf!4174 thiss!1577))) (and (= (currentBit!7779 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7784 thiss!1577) (size!3722 (buf!4174 thiss!1577)))))))))

(assert (=> d!57017 d!57035))

(declare-fun d!57037 () Bool)

(assert (=> d!57037 (= (remainingBits!0 ((_ sign_extend 32) (size!3722 (buf!4174 thiss!1577))) ((_ sign_extend 32) (currentByte!7784 thiss!1577)) ((_ sign_extend 32) (currentBit!7779 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3722 (buf!4174 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7784 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7779 thiss!1577)))))))

(assert (=> d!57021 d!57037))

(check-sat)
