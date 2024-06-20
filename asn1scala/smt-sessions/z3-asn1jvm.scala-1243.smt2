; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35182 () Bool)

(assert start!35182)

(declare-fun res!137575 () Bool)

(declare-fun e!114280 () Bool)

(assert (=> start!35182 (=> (not res!137575) (not e!114280))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35182 (= res!137575 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35182 e!114280))

(assert (=> start!35182 true))

(declare-datatypes ((array!8376 0))(
  ( (array!8377 (arr!4664 (Array (_ BitVec 32) (_ BitVec 8))) (size!3743 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6642 0))(
  ( (BitStream!6643 (buf!4195 array!8376) (currentByte!7842 (_ BitVec 32)) (currentBit!7837 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6642)

(declare-fun e!114282 () Bool)

(declare-fun inv!12 (BitStream!6642) Bool)

(assert (=> start!35182 (and (inv!12 thiss!1577) e!114282)))

(declare-fun b!165172 () Bool)

(declare-fun res!137576 () Bool)

(assert (=> b!165172 (=> (not res!137576) (not e!114280))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165172 (= res!137576 (validate_offset_bits!1 ((_ sign_extend 32) (size!3743 (buf!4195 thiss!1577))) ((_ sign_extend 32) (currentByte!7842 thiss!1577)) ((_ sign_extend 32) (currentBit!7837 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165173 () Bool)

(assert (=> b!165173 (= e!114280 (and (bvsle (bvadd (currentBit!7837 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7842 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7842 thiss!1577) (size!3743 (buf!4195 thiss!1577))))))))

(declare-fun b!165174 () Bool)

(declare-fun array_inv!3484 (array!8376) Bool)

(assert (=> b!165174 (= e!114282 (array_inv!3484 (buf!4195 thiss!1577)))))

(assert (= (and start!35182 res!137575) b!165172))

(assert (= (and b!165172 res!137576) b!165173))

(assert (= start!35182 b!165174))

(declare-fun m!262555 () Bool)

(assert (=> start!35182 m!262555))

(declare-fun m!262557 () Bool)

(assert (=> b!165172 m!262557))

(declare-fun m!262559 () Bool)

(assert (=> b!165174 m!262559))

(check-sat (not start!35182) (not b!165172) (not b!165174))
(check-sat)
(get-model)

(declare-fun d!57159 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57159 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7837 thiss!1577) (currentByte!7842 thiss!1577) (size!3743 (buf!4195 thiss!1577))))))

(declare-fun bs!14196 () Bool)

(assert (= bs!14196 d!57159))

(declare-fun m!262567 () Bool)

(assert (=> bs!14196 m!262567))

(assert (=> start!35182 d!57159))

(declare-fun d!57161 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57161 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3743 (buf!4195 thiss!1577))) ((_ sign_extend 32) (currentByte!7842 thiss!1577)) ((_ sign_extend 32) (currentBit!7837 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3743 (buf!4195 thiss!1577))) ((_ sign_extend 32) (currentByte!7842 thiss!1577)) ((_ sign_extend 32) (currentBit!7837 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14197 () Bool)

(assert (= bs!14197 d!57161))

(declare-fun m!262569 () Bool)

(assert (=> bs!14197 m!262569))

(assert (=> b!165172 d!57161))

(declare-fun d!57163 () Bool)

(assert (=> d!57163 (= (array_inv!3484 (buf!4195 thiss!1577)) (bvsge (size!3743 (buf!4195 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165174 d!57163))

(check-sat (not d!57161) (not d!57159))
(check-sat)
(get-model)

(declare-fun d!57177 () Bool)

(assert (=> d!57177 (= (remainingBits!0 ((_ sign_extend 32) (size!3743 (buf!4195 thiss!1577))) ((_ sign_extend 32) (currentByte!7842 thiss!1577)) ((_ sign_extend 32) (currentBit!7837 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3743 (buf!4195 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7842 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7837 thiss!1577)))))))

(assert (=> d!57161 d!57177))

(declare-fun d!57179 () Bool)

(assert (=> d!57179 (= (invariant!0 (currentBit!7837 thiss!1577) (currentByte!7842 thiss!1577) (size!3743 (buf!4195 thiss!1577))) (and (bvsge (currentBit!7837 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7837 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7842 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7842 thiss!1577) (size!3743 (buf!4195 thiss!1577))) (and (= (currentBit!7837 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7842 thiss!1577) (size!3743 (buf!4195 thiss!1577)))))))))

(assert (=> d!57159 d!57179))

(check-sat)
