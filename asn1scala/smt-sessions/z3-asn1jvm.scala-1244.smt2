; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35218 () Bool)

(assert start!35218)

(declare-fun res!137594 () Bool)

(declare-fun e!114307 () Bool)

(assert (=> start!35218 (=> (not res!137594) (not e!114307))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35218 (= res!137594 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35218 e!114307))

(assert (=> start!35218 true))

(declare-datatypes ((array!8385 0))(
  ( (array!8386 (arr!4667 (Array (_ BitVec 32) (_ BitVec 8))) (size!3746 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6648 0))(
  ( (BitStream!6649 (buf!4198 array!8385) (currentByte!7854 (_ BitVec 32)) (currentBit!7849 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6648)

(declare-fun e!114309 () Bool)

(declare-fun inv!12 (BitStream!6648) Bool)

(assert (=> start!35218 (and (inv!12 thiss!1577) e!114309)))

(declare-fun b!165199 () Bool)

(declare-fun res!137593 () Bool)

(assert (=> b!165199 (=> (not res!137593) (not e!114307))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165199 (= res!137593 (validate_offset_bits!1 ((_ sign_extend 32) (size!3746 (buf!4198 thiss!1577))) ((_ sign_extend 32) (currentByte!7854 thiss!1577)) ((_ sign_extend 32) (currentBit!7849 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165200 () Bool)

(assert (=> b!165200 (= e!114307 (and (bvsle (bvadd (currentBit!7849 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7854 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7854 thiss!1577) (size!3746 (buf!4198 thiss!1577))))))))

(declare-fun b!165201 () Bool)

(declare-fun array_inv!3487 (array!8385) Bool)

(assert (=> b!165201 (= e!114309 (array_inv!3487 (buf!4198 thiss!1577)))))

(assert (= (and start!35218 res!137594) b!165199))

(assert (= (and b!165199 res!137593) b!165200))

(assert (= start!35218 b!165201))

(declare-fun m!262585 () Bool)

(assert (=> start!35218 m!262585))

(declare-fun m!262587 () Bool)

(assert (=> b!165199 m!262587))

(declare-fun m!262589 () Bool)

(assert (=> b!165201 m!262589))

(check-sat (not b!165199) (not start!35218) (not b!165201))
(check-sat)
(get-model)

(declare-fun d!57191 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57191 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3746 (buf!4198 thiss!1577))) ((_ sign_extend 32) (currentByte!7854 thiss!1577)) ((_ sign_extend 32) (currentBit!7849 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3746 (buf!4198 thiss!1577))) ((_ sign_extend 32) (currentByte!7854 thiss!1577)) ((_ sign_extend 32) (currentBit!7849 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14205 () Bool)

(assert (= bs!14205 d!57191))

(declare-fun m!262597 () Bool)

(assert (=> bs!14205 m!262597))

(assert (=> b!165199 d!57191))

(declare-fun d!57193 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57193 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7849 thiss!1577) (currentByte!7854 thiss!1577) (size!3746 (buf!4198 thiss!1577))))))

(declare-fun bs!14206 () Bool)

(assert (= bs!14206 d!57193))

(declare-fun m!262599 () Bool)

(assert (=> bs!14206 m!262599))

(assert (=> start!35218 d!57193))

(declare-fun d!57195 () Bool)

(assert (=> d!57195 (= (array_inv!3487 (buf!4198 thiss!1577)) (bvsge (size!3746 (buf!4198 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165201 d!57195))

(check-sat (not d!57191) (not d!57193))
(check-sat)
(get-model)

(declare-fun d!57209 () Bool)

(assert (=> d!57209 (= (remainingBits!0 ((_ sign_extend 32) (size!3746 (buf!4198 thiss!1577))) ((_ sign_extend 32) (currentByte!7854 thiss!1577)) ((_ sign_extend 32) (currentBit!7849 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3746 (buf!4198 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7854 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7849 thiss!1577)))))))

(assert (=> d!57191 d!57209))

(declare-fun d!57211 () Bool)

(assert (=> d!57211 (= (invariant!0 (currentBit!7849 thiss!1577) (currentByte!7854 thiss!1577) (size!3746 (buf!4198 thiss!1577))) (and (bvsge (currentBit!7849 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7849 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7854 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7854 thiss!1577) (size!3746 (buf!4198 thiss!1577))) (and (= (currentBit!7849 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7854 thiss!1577) (size!3746 (buf!4198 thiss!1577)))))))))

(assert (=> d!57193 d!57211))

(check-sat)
