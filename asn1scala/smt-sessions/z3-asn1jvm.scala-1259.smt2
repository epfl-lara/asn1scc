; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35750 () Bool)

(assert start!35750)

(declare-fun res!138584 () Bool)

(declare-fun e!115288 () Bool)

(assert (=> start!35750 (=> (not res!138584) (not e!115288))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35750 (= res!138584 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35750 e!115288))

(assert (=> start!35750 true))

(declare-datatypes ((array!8507 0))(
  ( (array!8508 (arr!4712 (Array (_ BitVec 32) (_ BitVec 8))) (size!3791 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6738 0))(
  ( (BitStream!6739 (buf!4243 array!8507) (currentByte!7983 (_ BitVec 32)) (currentBit!7978 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6738)

(declare-fun e!115290 () Bool)

(declare-fun inv!12 (BitStream!6738) Bool)

(assert (=> start!35750 (and (inv!12 thiss!1577) e!115290)))

(declare-fun b!166429 () Bool)

(declare-fun res!138583 () Bool)

(assert (=> b!166429 (=> (not res!138583) (not e!115288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166429 (= res!138583 (validate_offset_bits!1 ((_ sign_extend 32) (size!3791 (buf!4243 thiss!1577))) ((_ sign_extend 32) (currentByte!7983 thiss!1577)) ((_ sign_extend 32) (currentBit!7978 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166430 () Bool)

(assert (=> b!166430 (= e!115288 (and (bvsgt (bvadd (currentBit!7978 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10015 (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!7978 thiss!1577) nBits!511) #b00000000000000000000000000001000)))) (or (bvslt bdg!10015 #b00000000000000000000000000000000) (bvsge bdg!10015 #b00000000000000000000000000001001)))))))

(declare-fun b!166431 () Bool)

(declare-fun array_inv!3532 (array!8507) Bool)

(assert (=> b!166431 (= e!115290 (array_inv!3532 (buf!4243 thiss!1577)))))

(assert (= (and start!35750 res!138584) b!166429))

(assert (= (and b!166429 res!138583) b!166430))

(assert (= start!35750 b!166431))

(declare-fun m!264397 () Bool)

(assert (=> start!35750 m!264397))

(declare-fun m!264399 () Bool)

(assert (=> b!166429 m!264399))

(declare-fun m!264401 () Bool)

(assert (=> b!166431 m!264401))

(check-sat (not b!166429) (not b!166431) (not start!35750))
(check-sat)
(get-model)

(declare-fun d!57999 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57999 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3791 (buf!4243 thiss!1577))) ((_ sign_extend 32) (currentByte!7983 thiss!1577)) ((_ sign_extend 32) (currentBit!7978 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3791 (buf!4243 thiss!1577))) ((_ sign_extend 32) (currentByte!7983 thiss!1577)) ((_ sign_extend 32) (currentBit!7978 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14386 () Bool)

(assert (= bs!14386 d!57999))

(declare-fun m!264409 () Bool)

(assert (=> bs!14386 m!264409))

(assert (=> b!166429 d!57999))

(declare-fun d!58001 () Bool)

(assert (=> d!58001 (= (array_inv!3532 (buf!4243 thiss!1577)) (bvsge (size!3791 (buf!4243 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166431 d!58001))

(declare-fun d!58003 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58003 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7978 thiss!1577) (currentByte!7983 thiss!1577) (size!3791 (buf!4243 thiss!1577))))))

(declare-fun bs!14387 () Bool)

(assert (= bs!14387 d!58003))

(declare-fun m!264411 () Bool)

(assert (=> bs!14387 m!264411))

(assert (=> start!35750 d!58003))

(check-sat (not d!58003) (not d!57999))
(check-sat)
(get-model)

(declare-fun d!58011 () Bool)

(assert (=> d!58011 (= (invariant!0 (currentBit!7978 thiss!1577) (currentByte!7983 thiss!1577) (size!3791 (buf!4243 thiss!1577))) (and (bvsge (currentBit!7978 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7978 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7983 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7983 thiss!1577) (size!3791 (buf!4243 thiss!1577))) (and (= (currentBit!7978 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7983 thiss!1577) (size!3791 (buf!4243 thiss!1577)))))))))

(assert (=> d!58003 d!58011))

(declare-fun d!58017 () Bool)

(assert (=> d!58017 (= (remainingBits!0 ((_ sign_extend 32) (size!3791 (buf!4243 thiss!1577))) ((_ sign_extend 32) (currentByte!7983 thiss!1577)) ((_ sign_extend 32) (currentBit!7978 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3791 (buf!4243 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7983 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7978 thiss!1577)))))))

(assert (=> d!57999 d!58017))

(check-sat)
