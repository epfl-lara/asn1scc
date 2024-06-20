; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35926 () Bool)

(assert start!35926)

(declare-fun res!138694 () Bool)

(declare-fun e!115443 () Bool)

(assert (=> start!35926 (=> (not res!138694) (not e!115443))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35926 (= res!138694 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35926 e!115443))

(assert (=> start!35926 true))

(declare-datatypes ((array!8556 0))(
  ( (array!8557 (arr!4729 (Array (_ BitVec 32) (_ BitVec 8))) (size!3808 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6772 0))(
  ( (BitStream!6773 (buf!4260 array!8556) (currentByte!8041 (_ BitVec 32)) (currentBit!8036 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6772)

(declare-fun e!115441 () Bool)

(declare-fun inv!12 (BitStream!6772) Bool)

(assert (=> start!35926 (and (inv!12 thiss!1577) e!115441)))

(declare-fun b!166591 () Bool)

(declare-fun res!138695 () Bool)

(assert (=> b!166591 (=> (not res!138695) (not e!115443))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166591 (= res!138695 (validate_offset_bits!1 ((_ sign_extend 32) (size!3808 (buf!4260 thiss!1577))) ((_ sign_extend 32) (currentByte!8041 thiss!1577)) ((_ sign_extend 32) (currentBit!8036 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166592 () Bool)

(assert (=> b!166592 (= e!115443 (and (bvsgt (bvadd (currentBit!8036 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10022 (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8041 thiss!1577)) #b10000000000000000000000000000000))) (and (not (= bdg!10022 #b00000000000000000000000000000000)) (not (= bdg!10022 (bvand (currentByte!8041 thiss!1577) #b10000000000000000000000000000000)))))))))

(declare-fun b!166593 () Bool)

(declare-fun array_inv!3549 (array!8556) Bool)

(assert (=> b!166593 (= e!115441 (array_inv!3549 (buf!4260 thiss!1577)))))

(assert (= (and start!35926 res!138694) b!166591))

(assert (= (and b!166591 res!138695) b!166592))

(assert (= start!35926 b!166593))

(declare-fun m!264613 () Bool)

(assert (=> start!35926 m!264613))

(declare-fun m!264615 () Bool)

(assert (=> b!166591 m!264615))

(declare-fun m!264617 () Bool)

(assert (=> b!166593 m!264617))

(push 1)

(assert (not b!166593))

(assert (not b!166591))

(assert (not start!35926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58171 () Bool)

(assert (=> d!58171 (= (array_inv!3549 (buf!4260 thiss!1577)) (bvsge (size!3808 (buf!4260 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166593 d!58171))

(declare-fun d!58173 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58173 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3808 (buf!4260 thiss!1577))) ((_ sign_extend 32) (currentByte!8041 thiss!1577)) ((_ sign_extend 32) (currentBit!8036 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3808 (buf!4260 thiss!1577))) ((_ sign_extend 32) (currentByte!8041 thiss!1577)) ((_ sign_extend 32) (currentBit!8036 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14439 () Bool)

(assert (= bs!14439 d!58173))

(declare-fun m!264635 () Bool)

(assert (=> bs!14439 m!264635))

(assert (=> b!166591 d!58173))

(declare-fun d!58175 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58175 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8036 thiss!1577) (currentByte!8041 thiss!1577) (size!3808 (buf!4260 thiss!1577))))))

(declare-fun bs!14440 () Bool)

(assert (= bs!14440 d!58175))

(declare-fun m!264637 () Bool)

(assert (=> bs!14440 m!264637))

(assert (=> start!35926 d!58175))

(push 1)

(assert (not d!58175))

(assert (not d!58173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58187 () Bool)

(assert (=> d!58187 (= (invariant!0 (currentBit!8036 thiss!1577) (currentByte!8041 thiss!1577) (size!3808 (buf!4260 thiss!1577))) (and (bvsge (currentBit!8036 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8036 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8041 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8041 thiss!1577) (size!3808 (buf!4260 thiss!1577))) (and (= (currentBit!8036 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8041 thiss!1577) (size!3808 (buf!4260 thiss!1577)))))))))

(assert (=> d!58175 d!58187))

(declare-fun d!58189 () Bool)

(assert (=> d!58189 (= (remainingBits!0 ((_ sign_extend 32) (size!3808 (buf!4260 thiss!1577))) ((_ sign_extend 32) (currentByte!8041 thiss!1577)) ((_ sign_extend 32) (currentBit!8036 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3808 (buf!4260 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8041 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8036 thiss!1577)))))))

(assert (=> d!58173 d!58189))

(push 1)

(check-sat)

