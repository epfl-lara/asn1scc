; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35220 () Bool)

(assert start!35220)

(declare-fun res!137599 () Bool)

(declare-fun e!114318 () Bool)

(assert (=> start!35220 (=> (not res!137599) (not e!114318))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35220 (= res!137599 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35220 e!114318))

(assert (=> start!35220 true))

(declare-datatypes ((array!8387 0))(
  ( (array!8388 (arr!4668 (Array (_ BitVec 32) (_ BitVec 8))) (size!3747 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6650 0))(
  ( (BitStream!6651 (buf!4199 array!8387) (currentByte!7855 (_ BitVec 32)) (currentBit!7850 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6650)

(declare-fun e!114317 () Bool)

(declare-fun inv!12 (BitStream!6650) Bool)

(assert (=> start!35220 (and (inv!12 thiss!1577) e!114317)))

(declare-fun b!165208 () Bool)

(declare-fun res!137600 () Bool)

(assert (=> b!165208 (=> (not res!137600) (not e!114318))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165208 (= res!137600 (validate_offset_bits!1 ((_ sign_extend 32) (size!3747 (buf!4199 thiss!1577))) ((_ sign_extend 32) (currentByte!7855 thiss!1577)) ((_ sign_extend 32) (currentBit!7850 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165209 () Bool)

(assert (=> b!165209 (= e!114318 (and (bvsle (bvadd (currentBit!7850 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7855 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7855 thiss!1577) (size!3747 (buf!4199 thiss!1577))))))))

(declare-fun b!165210 () Bool)

(declare-fun array_inv!3488 (array!8387) Bool)

(assert (=> b!165210 (= e!114317 (array_inv!3488 (buf!4199 thiss!1577)))))

(assert (= (and start!35220 res!137599) b!165208))

(assert (= (and b!165208 res!137600) b!165209))

(assert (= start!35220 b!165210))

(declare-fun m!262591 () Bool)

(assert (=> start!35220 m!262591))

(declare-fun m!262593 () Bool)

(assert (=> b!165208 m!262593))

(declare-fun m!262595 () Bool)

(assert (=> b!165210 m!262595))

(push 1)

(assert (not b!165208))

(assert (not b!165210))

(assert (not start!35220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57201 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57201 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3747 (buf!4199 thiss!1577))) ((_ sign_extend 32) (currentByte!7855 thiss!1577)) ((_ sign_extend 32) (currentBit!7850 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3747 (buf!4199 thiss!1577))) ((_ sign_extend 32) (currentByte!7855 thiss!1577)) ((_ sign_extend 32) (currentBit!7850 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14209 () Bool)

(assert (= bs!14209 d!57201))

(declare-fun m!262605 () Bool)

(assert (=> bs!14209 m!262605))

(assert (=> b!165208 d!57201))

(declare-fun d!57205 () Bool)

(assert (=> d!57205 (= (array_inv!3488 (buf!4199 thiss!1577)) (bvsge (size!3747 (buf!4199 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165210 d!57205))

(declare-fun d!57207 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57207 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7850 thiss!1577) (currentByte!7855 thiss!1577) (size!3747 (buf!4199 thiss!1577))))))

(declare-fun bs!14210 () Bool)

(assert (= bs!14210 d!57207))

(declare-fun m!262607 () Bool)

(assert (=> bs!14210 m!262607))

(assert (=> start!35220 d!57207))

(push 1)

(assert (not d!57201))

(assert (not d!57207))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57217 () Bool)

(assert (=> d!57217 (= (remainingBits!0 ((_ sign_extend 32) (size!3747 (buf!4199 thiss!1577))) ((_ sign_extend 32) (currentByte!7855 thiss!1577)) ((_ sign_extend 32) (currentBit!7850 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3747 (buf!4199 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7855 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7850 thiss!1577)))))))

(assert (=> d!57201 d!57217))

(declare-fun d!57219 () Bool)

(assert (=> d!57219 (= (invariant!0 (currentBit!7850 thiss!1577) (currentByte!7855 thiss!1577) (size!3747 (buf!4199 thiss!1577))) (and (bvsge (currentBit!7850 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7850 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7855 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7855 thiss!1577) (size!3747 (buf!4199 thiss!1577))) (and (= (currentBit!7850 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7855 thiss!1577) (size!3747 (buf!4199 thiss!1577)))))))))

(assert (=> d!57207 d!57219))

(push 1)

(check-sat)

