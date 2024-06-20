; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35962 () Bool)

(assert start!35962)

(declare-fun res!138713 () Bool)

(declare-fun e!115469 () Bool)

(assert (=> start!35962 (=> (not res!138713) (not e!115469))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35962 (= res!138713 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35962 e!115469))

(assert (=> start!35962 true))

(declare-datatypes ((array!8565 0))(
  ( (array!8566 (arr!4732 (Array (_ BitVec 32) (_ BitVec 8))) (size!3811 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6778 0))(
  ( (BitStream!6779 (buf!4263 array!8565) (currentByte!8053 (_ BitVec 32)) (currentBit!8048 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6778)

(declare-fun e!115468 () Bool)

(declare-fun inv!12 (BitStream!6778) Bool)

(assert (=> start!35962 (and (inv!12 thiss!1577) e!115468)))

(declare-fun b!166618 () Bool)

(declare-fun res!138712 () Bool)

(assert (=> b!166618 (=> (not res!138712) (not e!115469))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166618 (= res!138712 (validate_offset_bits!1 ((_ sign_extend 32) (size!3811 (buf!4263 thiss!1577))) ((_ sign_extend 32) (currentByte!8053 thiss!1577)) ((_ sign_extend 32) (currentBit!8048 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166619 () Bool)

(assert (=> b!166619 (= e!115469 (and (bvsgt (bvadd (currentBit!8048 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!8053 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!8053 thiss!1577) (size!3811 (buf!4263 thiss!1577))))))))

(declare-fun b!166620 () Bool)

(declare-fun array_inv!3552 (array!8565) Bool)

(assert (=> b!166620 (= e!115468 (array_inv!3552 (buf!4263 thiss!1577)))))

(assert (= (and start!35962 res!138713) b!166618))

(assert (= (and b!166618 res!138712) b!166619))

(assert (= start!35962 b!166620))

(declare-fun m!264643 () Bool)

(assert (=> start!35962 m!264643))

(declare-fun m!264645 () Bool)

(assert (=> b!166618 m!264645))

(declare-fun m!264647 () Bool)

(assert (=> b!166620 m!264647))

(push 1)

(assert (not b!166620))

(assert (not start!35962))

(assert (not b!166618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58203 () Bool)

(assert (=> d!58203 (= (array_inv!3552 (buf!4263 thiss!1577)) (bvsge (size!3811 (buf!4263 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166620 d!58203))

(declare-fun d!58205 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58205 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8048 thiss!1577) (currentByte!8053 thiss!1577) (size!3811 (buf!4263 thiss!1577))))))

(declare-fun bs!14448 () Bool)

(assert (= bs!14448 d!58205))

(declare-fun m!264665 () Bool)

(assert (=> bs!14448 m!264665))

(assert (=> start!35962 d!58205))

(declare-fun d!58207 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58207 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3811 (buf!4263 thiss!1577))) ((_ sign_extend 32) (currentByte!8053 thiss!1577)) ((_ sign_extend 32) (currentBit!8048 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3811 (buf!4263 thiss!1577))) ((_ sign_extend 32) (currentByte!8053 thiss!1577)) ((_ sign_extend 32) (currentBit!8048 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14449 () Bool)

(assert (= bs!14449 d!58207))

(declare-fun m!264667 () Bool)

(assert (=> bs!14449 m!264667))

(assert (=> b!166618 d!58207))

(push 1)

(assert (not d!58207))

(assert (not d!58205))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58219 () Bool)

(assert (=> d!58219 (= (remainingBits!0 ((_ sign_extend 32) (size!3811 (buf!4263 thiss!1577))) ((_ sign_extend 32) (currentByte!8053 thiss!1577)) ((_ sign_extend 32) (currentBit!8048 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3811 (buf!4263 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8053 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8048 thiss!1577)))))))

(assert (=> d!58207 d!58219))

(declare-fun d!58221 () Bool)

(assert (=> d!58221 (= (invariant!0 (currentBit!8048 thiss!1577) (currentByte!8053 thiss!1577) (size!3811 (buf!4263 thiss!1577))) (and (bvsge (currentBit!8048 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8048 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8053 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8053 thiss!1577) (size!3811 (buf!4263 thiss!1577))) (and (= (currentBit!8048 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8053 thiss!1577) (size!3811 (buf!4263 thiss!1577)))))))))

(assert (=> d!58205 d!58221))

(push 1)

(check-sat)

