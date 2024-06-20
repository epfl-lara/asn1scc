; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35184 () Bool)

(assert start!35184)

(declare-fun res!137581 () Bool)

(declare-fun e!114291 () Bool)

(assert (=> start!35184 (=> (not res!137581) (not e!114291))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35184 (= res!137581 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35184 e!114291))

(assert (=> start!35184 true))

(declare-datatypes ((array!8378 0))(
  ( (array!8379 (arr!4665 (Array (_ BitVec 32) (_ BitVec 8))) (size!3744 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6644 0))(
  ( (BitStream!6645 (buf!4196 array!8378) (currentByte!7843 (_ BitVec 32)) (currentBit!7838 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6644)

(declare-fun e!114289 () Bool)

(declare-fun inv!12 (BitStream!6644) Bool)

(assert (=> start!35184 (and (inv!12 thiss!1577) e!114289)))

(declare-fun b!165181 () Bool)

(declare-fun res!137582 () Bool)

(assert (=> b!165181 (=> (not res!137582) (not e!114291))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165181 (= res!137582 (validate_offset_bits!1 ((_ sign_extend 32) (size!3744 (buf!4196 thiss!1577))) ((_ sign_extend 32) (currentByte!7843 thiss!1577)) ((_ sign_extend 32) (currentBit!7838 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165182 () Bool)

(assert (=> b!165182 (= e!114291 (and (bvsle (bvadd (currentBit!7838 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7843 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7843 thiss!1577) (size!3744 (buf!4196 thiss!1577))))))))

(declare-fun b!165183 () Bool)

(declare-fun array_inv!3485 (array!8378) Bool)

(assert (=> b!165183 (= e!114289 (array_inv!3485 (buf!4196 thiss!1577)))))

(assert (= (and start!35184 res!137581) b!165181))

(assert (= (and b!165181 res!137582) b!165182))

(assert (= start!35184 b!165183))

(declare-fun m!262561 () Bool)

(assert (=> start!35184 m!262561))

(declare-fun m!262563 () Bool)

(assert (=> b!165181 m!262563))

(declare-fun m!262565 () Bool)

(assert (=> b!165183 m!262565))

(push 1)

(assert (not b!165181))

(assert (not start!35184))

(assert (not b!165183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57171 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57171 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3744 (buf!4196 thiss!1577))) ((_ sign_extend 32) (currentByte!7843 thiss!1577)) ((_ sign_extend 32) (currentBit!7838 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3744 (buf!4196 thiss!1577))) ((_ sign_extend 32) (currentByte!7843 thiss!1577)) ((_ sign_extend 32) (currentBit!7838 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14200 () Bool)

(assert (= bs!14200 d!57171))

(declare-fun m!262575 () Bool)

(assert (=> bs!14200 m!262575))

(assert (=> b!165181 d!57171))

(declare-fun d!57173 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57173 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7838 thiss!1577) (currentByte!7843 thiss!1577) (size!3744 (buf!4196 thiss!1577))))))

(declare-fun bs!14201 () Bool)

(assert (= bs!14201 d!57173))

(declare-fun m!262577 () Bool)

(assert (=> bs!14201 m!262577))

(assert (=> start!35184 d!57173))

(declare-fun d!57175 () Bool)

(assert (=> d!57175 (= (array_inv!3485 (buf!4196 thiss!1577)) (bvsge (size!3744 (buf!4196 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165183 d!57175))

(push 1)

(assert (not d!57171))

(assert (not d!57173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57185 () Bool)

(assert (=> d!57185 (= (remainingBits!0 ((_ sign_extend 32) (size!3744 (buf!4196 thiss!1577))) ((_ sign_extend 32) (currentByte!7843 thiss!1577)) ((_ sign_extend 32) (currentBit!7838 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3744 (buf!4196 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7843 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7838 thiss!1577)))))))

(assert (=> d!57171 d!57185))

(declare-fun d!57187 () Bool)

(assert (=> d!57187 (= (invariant!0 (currentBit!7838 thiss!1577) (currentByte!7843 thiss!1577) (size!3744 (buf!4196 thiss!1577))) (and (bvsge (currentBit!7838 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7838 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7843 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7843 thiss!1577) (size!3744 (buf!4196 thiss!1577))) (and (= (currentBit!7838 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7843 thiss!1577) (size!3744 (buf!4196 thiss!1577)))))))))

(assert (=> d!57173 d!57187))

(push 1)

(check-sat)

