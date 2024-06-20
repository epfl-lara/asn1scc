; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35752 () Bool)

(assert start!35752)

(declare-fun res!138590 () Bool)

(declare-fun e!115299 () Bool)

(assert (=> start!35752 (=> (not res!138590) (not e!115299))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35752 (= res!138590 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35752 e!115299))

(assert (=> start!35752 true))

(declare-datatypes ((array!8509 0))(
  ( (array!8510 (arr!4713 (Array (_ BitVec 32) (_ BitVec 8))) (size!3792 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6740 0))(
  ( (BitStream!6741 (buf!4244 array!8509) (currentByte!7984 (_ BitVec 32)) (currentBit!7979 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6740)

(declare-fun e!115297 () Bool)

(declare-fun inv!12 (BitStream!6740) Bool)

(assert (=> start!35752 (and (inv!12 thiss!1577) e!115297)))

(declare-fun b!166438 () Bool)

(declare-fun res!138589 () Bool)

(assert (=> b!166438 (=> (not res!138589) (not e!115299))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166438 (= res!138589 (validate_offset_bits!1 ((_ sign_extend 32) (size!3792 (buf!4244 thiss!1577))) ((_ sign_extend 32) (currentByte!7984 thiss!1577)) ((_ sign_extend 32) (currentBit!7979 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166439 () Bool)

(assert (=> b!166439 (= e!115299 (and (bvsgt (bvadd (currentBit!7979 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10015 (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!7979 thiss!1577) nBits!511) #b00000000000000000000000000001000)))) (or (bvslt bdg!10015 #b00000000000000000000000000000000) (bvsge bdg!10015 #b00000000000000000000000000001001)))))))

(declare-fun b!166440 () Bool)

(declare-fun array_inv!3533 (array!8509) Bool)

(assert (=> b!166440 (= e!115297 (array_inv!3533 (buf!4244 thiss!1577)))))

(assert (= (and start!35752 res!138590) b!166438))

(assert (= (and b!166438 res!138589) b!166439))

(assert (= start!35752 b!166440))

(declare-fun m!264403 () Bool)

(assert (=> start!35752 m!264403))

(declare-fun m!264405 () Bool)

(assert (=> b!166438 m!264405))

(declare-fun m!264407 () Bool)

(assert (=> b!166440 m!264407))

(push 1)

(assert (not b!166440))

(assert (not start!35752))

(assert (not b!166438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58013 () Bool)

(assert (=> d!58013 (= (array_inv!3533 (buf!4244 thiss!1577)) (bvsge (size!3792 (buf!4244 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166440 d!58013))

(declare-fun d!58015 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58015 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7979 thiss!1577) (currentByte!7984 thiss!1577) (size!3792 (buf!4244 thiss!1577))))))

(declare-fun bs!14390 () Bool)

(assert (= bs!14390 d!58015))

(declare-fun m!264417 () Bool)

(assert (=> bs!14390 m!264417))

(assert (=> start!35752 d!58015))

(declare-fun d!58019 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58019 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3792 (buf!4244 thiss!1577))) ((_ sign_extend 32) (currentByte!7984 thiss!1577)) ((_ sign_extend 32) (currentBit!7979 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3792 (buf!4244 thiss!1577))) ((_ sign_extend 32) (currentByte!7984 thiss!1577)) ((_ sign_extend 32) (currentBit!7979 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14391 () Bool)

(assert (= bs!14391 d!58019))

(declare-fun m!264419 () Bool)

(assert (=> bs!14391 m!264419))

(assert (=> b!166438 d!58019))

(push 1)

(assert (not d!58019))

(assert (not d!58015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

