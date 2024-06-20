; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35568 () Bool)

(assert start!35568)

(declare-fun res!138467 () Bool)

(declare-fun e!115128 () Bool)

(assert (=> start!35568 (=> (not res!138467) (not e!115128))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35568 (= res!138467 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35568 e!115128))

(assert (=> start!35568 true))

(declare-datatypes ((array!8456 0))(
  ( (array!8457 (arr!4694 (Array (_ BitVec 32) (_ BitVec 8))) (size!3773 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6702 0))(
  ( (BitStream!6703 (buf!4225 array!8456) (currentByte!7922 (_ BitVec 32)) (currentBit!7917 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6702)

(declare-fun e!115126 () Bool)

(declare-fun inv!12 (BitStream!6702) Bool)

(assert (=> start!35568 (and (inv!12 thiss!1577) e!115126)))

(declare-fun b!166258 () Bool)

(declare-fun res!138466 () Bool)

(assert (=> b!166258 (=> (not res!138466) (not e!115128))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166258 (= res!138466 (validate_offset_bits!1 ((_ sign_extend 32) (size!3773 (buf!4225 thiss!1577))) ((_ sign_extend 32) (currentByte!7922 thiss!1577)) ((_ sign_extend 32) (currentBit!7917 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166259 () Bool)

(assert (=> b!166259 (= e!115128 (and (bvsgt (bvadd (currentBit!7917 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7922 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7922 thiss!1577) (size!3773 (buf!4225 thiss!1577))))))))

(declare-fun b!166260 () Bool)

(declare-fun array_inv!3514 (array!8456) Bool)

(assert (=> b!166260 (= e!115126 (array_inv!3514 (buf!4225 thiss!1577)))))

(assert (= (and start!35568 res!138467) b!166258))

(assert (= (and b!166258 res!138466) b!166259))

(assert (= start!35568 b!166260))

(declare-fun m!264193 () Bool)

(assert (=> start!35568 m!264193))

(declare-fun m!264195 () Bool)

(assert (=> b!166258 m!264195))

(declare-fun m!264197 () Bool)

(assert (=> b!166260 m!264197))

(check-sat (not start!35568) (not b!166258) (not b!166260))
(check-sat)
(get-model)

(declare-fun d!57829 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57829 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7917 thiss!1577) (currentByte!7922 thiss!1577) (size!3773 (buf!4225 thiss!1577))))))

(declare-fun bs!14335 () Bool)

(assert (= bs!14335 d!57829))

(declare-fun m!264205 () Bool)

(assert (=> bs!14335 m!264205))

(assert (=> start!35568 d!57829))

(declare-fun d!57831 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57831 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3773 (buf!4225 thiss!1577))) ((_ sign_extend 32) (currentByte!7922 thiss!1577)) ((_ sign_extend 32) (currentBit!7917 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3773 (buf!4225 thiss!1577))) ((_ sign_extend 32) (currentByte!7922 thiss!1577)) ((_ sign_extend 32) (currentBit!7917 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14336 () Bool)

(assert (= bs!14336 d!57831))

(declare-fun m!264207 () Bool)

(assert (=> bs!14336 m!264207))

(assert (=> b!166258 d!57831))

(declare-fun d!57833 () Bool)

(assert (=> d!57833 (= (array_inv!3514 (buf!4225 thiss!1577)) (bvsge (size!3773 (buf!4225 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166260 d!57833))

(check-sat (not d!57831) (not d!57829))
(check-sat)
(get-model)

(declare-fun d!57841 () Bool)

(assert (=> d!57841 (= (remainingBits!0 ((_ sign_extend 32) (size!3773 (buf!4225 thiss!1577))) ((_ sign_extend 32) (currentByte!7922 thiss!1577)) ((_ sign_extend 32) (currentBit!7917 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3773 (buf!4225 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7922 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7917 thiss!1577)))))))

(assert (=> d!57831 d!57841))

(declare-fun d!57843 () Bool)

(assert (=> d!57843 (= (invariant!0 (currentBit!7917 thiss!1577) (currentByte!7922 thiss!1577) (size!3773 (buf!4225 thiss!1577))) (and (bvsge (currentBit!7917 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7917 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7922 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7922 thiss!1577) (size!3773 (buf!4225 thiss!1577))) (and (= (currentBit!7917 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7922 thiss!1577) (size!3773 (buf!4225 thiss!1577)))))))))

(assert (=> d!57829 d!57843))

(check-sat)
