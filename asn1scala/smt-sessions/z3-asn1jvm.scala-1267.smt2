; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35996 () Bool)

(assert start!35996)

(declare-fun res!138736 () Bool)

(declare-fun e!115506 () Bool)

(assert (=> start!35996 (=> (not res!138736) (not e!115506))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35996 (= res!138736 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35996 e!115506))

(assert (=> start!35996 true))

(declare-datatypes ((array!8576 0))(
  ( (array!8577 (arr!4736 (Array (_ BitVec 32) (_ BitVec 8))) (size!3815 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6786 0))(
  ( (BitStream!6787 (buf!4267 array!8576) (currentByte!8064 (_ BitVec 32)) (currentBit!8059 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6786)

(declare-fun e!115505 () Bool)

(declare-fun inv!12 (BitStream!6786) Bool)

(assert (=> start!35996 (and (inv!12 thiss!1577) e!115505)))

(declare-fun b!166654 () Bool)

(declare-fun res!138737 () Bool)

(assert (=> b!166654 (=> (not res!138737) (not e!115506))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166654 (= res!138737 (validate_offset_bits!1 ((_ sign_extend 32) (size!3815 (buf!4267 thiss!1577))) ((_ sign_extend 32) (currentByte!8064 thiss!1577)) ((_ sign_extend 32) (currentBit!8059 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166655 () Bool)

(assert (=> b!166655 (= e!115506 (and (bvsgt (bvadd (currentBit!8059 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvsgt #b00000000000000000000000000000000 (currentByte!8064 thiss!1577)) (bvsge (currentByte!8064 thiss!1577) (size!3815 (buf!4267 thiss!1577))))))))

(declare-fun b!166656 () Bool)

(declare-fun array_inv!3556 (array!8576) Bool)

(assert (=> b!166656 (= e!115505 (array_inv!3556 (buf!4267 thiss!1577)))))

(assert (= (and start!35996 res!138736) b!166654))

(assert (= (and b!166654 res!138737) b!166655))

(assert (= start!35996 b!166656))

(declare-fun m!264679 () Bool)

(assert (=> start!35996 m!264679))

(declare-fun m!264681 () Bool)

(assert (=> b!166654 m!264681))

(declare-fun m!264683 () Bool)

(assert (=> b!166656 m!264683))

(check-sat (not b!166656) (not b!166654) (not start!35996))
(check-sat)
(get-model)

(declare-fun d!58225 () Bool)

(assert (=> d!58225 (= (array_inv!3556 (buf!4267 thiss!1577)) (bvsge (size!3815 (buf!4267 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166656 d!58225))

(declare-fun d!58227 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58227 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3815 (buf!4267 thiss!1577))) ((_ sign_extend 32) (currentByte!8064 thiss!1577)) ((_ sign_extend 32) (currentBit!8059 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3815 (buf!4267 thiss!1577))) ((_ sign_extend 32) (currentByte!8064 thiss!1577)) ((_ sign_extend 32) (currentBit!8059 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14455 () Bool)

(assert (= bs!14455 d!58227))

(declare-fun m!264691 () Bool)

(assert (=> bs!14455 m!264691))

(assert (=> b!166654 d!58227))

(declare-fun d!58229 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58229 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8059 thiss!1577) (currentByte!8064 thiss!1577) (size!3815 (buf!4267 thiss!1577))))))

(declare-fun bs!14456 () Bool)

(assert (= bs!14456 d!58229))

(declare-fun m!264693 () Bool)

(assert (=> bs!14456 m!264693))

(assert (=> start!35996 d!58229))

(check-sat (not d!58227) (not d!58229))
(check-sat)
(get-model)

(declare-fun d!58237 () Bool)

(assert (=> d!58237 (= (remainingBits!0 ((_ sign_extend 32) (size!3815 (buf!4267 thiss!1577))) ((_ sign_extend 32) (currentByte!8064 thiss!1577)) ((_ sign_extend 32) (currentBit!8059 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3815 (buf!4267 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8064 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8059 thiss!1577)))))))

(assert (=> d!58227 d!58237))

(declare-fun d!58241 () Bool)

(assert (=> d!58241 (= (invariant!0 (currentBit!8059 thiss!1577) (currentByte!8064 thiss!1577) (size!3815 (buf!4267 thiss!1577))) (and (bvsge (currentBit!8059 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8059 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8064 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8064 thiss!1577) (size!3815 (buf!4267 thiss!1577))) (and (= (currentBit!8059 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8064 thiss!1577) (size!3815 (buf!4267 thiss!1577)))))))))

(assert (=> d!58229 d!58241))

(check-sat)
