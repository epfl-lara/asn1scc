; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35818 () Bool)

(assert start!35818)

(declare-fun res!138628 () Bool)

(declare-fun e!115343 () Bool)

(assert (=> start!35818 (=> (not res!138628) (not e!115343))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35818 (= res!138628 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35818 e!115343))

(assert (=> start!35818 true))

(declare-datatypes ((array!8525 0))(
  ( (array!8526 (arr!4718 (Array (_ BitVec 32) (_ BitVec 8))) (size!3797 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6750 0))(
  ( (BitStream!6751 (buf!4249 array!8525) (currentByte!8005 (_ BitVec 32)) (currentBit!8000 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6750)

(declare-fun e!115342 () Bool)

(declare-fun inv!12 (BitStream!6750) Bool)

(assert (=> start!35818 (and (inv!12 thiss!1577) e!115342)))

(declare-fun b!166492 () Bool)

(declare-fun res!138629 () Bool)

(assert (=> b!166492 (=> (not res!138629) (not e!115343))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166492 (= res!138629 (validate_offset_bits!1 ((_ sign_extend 32) (size!3797 (buf!4249 thiss!1577))) ((_ sign_extend 32) (currentByte!8005 thiss!1577)) ((_ sign_extend 32) (currentBit!8000 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166493 () Bool)

(assert (=> b!166493 (= e!115343 (and (bvsgt (bvadd (currentBit!8000 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8005 thiss!1577)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8005 thiss!1577)) (size!3797 (buf!4249 thiss!1577))))))))

(declare-fun b!166494 () Bool)

(declare-fun array_inv!3538 (array!8525) Bool)

(assert (=> b!166494 (= e!115342 (array_inv!3538 (buf!4249 thiss!1577)))))

(assert (= (and start!35818 res!138628) b!166492))

(assert (= (and b!166492 res!138629) b!166493))

(assert (= start!35818 b!166494))

(declare-fun m!264511 () Bool)

(assert (=> start!35818 m!264511))

(declare-fun m!264513 () Bool)

(assert (=> b!166492 m!264513))

(declare-fun m!264515 () Bool)

(assert (=> b!166494 m!264515))

(check-sat (not b!166494) (not b!166492) (not start!35818))
(check-sat)
(get-model)

(declare-fun d!58071 () Bool)

(assert (=> d!58071 (= (array_inv!3538 (buf!4249 thiss!1577)) (bvsge (size!3797 (buf!4249 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166494 d!58071))

(declare-fun d!58073 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58073 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3797 (buf!4249 thiss!1577))) ((_ sign_extend 32) (currentByte!8005 thiss!1577)) ((_ sign_extend 32) (currentBit!8000 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3797 (buf!4249 thiss!1577))) ((_ sign_extend 32) (currentByte!8005 thiss!1577)) ((_ sign_extend 32) (currentBit!8000 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14407 () Bool)

(assert (= bs!14407 d!58073))

(declare-fun m!264523 () Bool)

(assert (=> bs!14407 m!264523))

(assert (=> b!166492 d!58073))

(declare-fun d!58075 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58075 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8000 thiss!1577) (currentByte!8005 thiss!1577) (size!3797 (buf!4249 thiss!1577))))))

(declare-fun bs!14408 () Bool)

(assert (= bs!14408 d!58075))

(declare-fun m!264525 () Bool)

(assert (=> bs!14408 m!264525))

(assert (=> start!35818 d!58075))

(check-sat (not d!58075) (not d!58073))
(check-sat)
(get-model)

(declare-fun d!58083 () Bool)

(assert (=> d!58083 (= (invariant!0 (currentBit!8000 thiss!1577) (currentByte!8005 thiss!1577) (size!3797 (buf!4249 thiss!1577))) (and (bvsge (currentBit!8000 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8000 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8005 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8005 thiss!1577) (size!3797 (buf!4249 thiss!1577))) (and (= (currentBit!8000 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8005 thiss!1577) (size!3797 (buf!4249 thiss!1577)))))))))

(assert (=> d!58075 d!58083))

(declare-fun d!58085 () Bool)

(assert (=> d!58085 (= (remainingBits!0 ((_ sign_extend 32) (size!3797 (buf!4249 thiss!1577))) ((_ sign_extend 32) (currentByte!8005 thiss!1577)) ((_ sign_extend 32) (currentBit!8000 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3797 (buf!4249 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8005 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8000 thiss!1577)))))))

(assert (=> d!58073 d!58085))

(check-sat)
