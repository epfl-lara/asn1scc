; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35638 () Bool)

(assert start!35638)

(declare-fun res!138509 () Bool)

(declare-fun e!115190 () Bool)

(assert (=> start!35638 (=> (not res!138509) (not e!115190))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35638 (= res!138509 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35638 e!115190))

(assert (=> start!35638 true))

(declare-datatypes ((array!8476 0))(
  ( (array!8477 (arr!4701 (Array (_ BitVec 32) (_ BitVec 8))) (size!3780 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6716 0))(
  ( (BitStream!6717 (buf!4232 array!8476) (currentByte!7945 (_ BitVec 32)) (currentBit!7940 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6716)

(declare-fun e!115191 () Bool)

(declare-fun inv!12 (BitStream!6716) Bool)

(assert (=> start!35638 (and (inv!12 thiss!1577) e!115191)))

(declare-fun b!166321 () Bool)

(declare-fun res!138508 () Bool)

(assert (=> b!166321 (=> (not res!138508) (not e!115190))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166321 (= res!138508 (validate_offset_bits!1 ((_ sign_extend 32) (size!3780 (buf!4232 thiss!1577))) ((_ sign_extend 32) (currentByte!7945 thiss!1577)) ((_ sign_extend 32) (currentBit!7940 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166322 () Bool)

(assert (=> b!166322 (= e!115190 (and (bvsgt (bvadd (currentBit!7940 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7945 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7945 thiss!1577) (size!3780 (buf!4232 thiss!1577))))))))

(declare-fun b!166323 () Bool)

(declare-fun array_inv!3521 (array!8476) Bool)

(assert (=> b!166323 (= e!115191 (array_inv!3521 (buf!4232 thiss!1577)))))

(assert (= (and start!35638 res!138509) b!166321))

(assert (= (and b!166321 res!138508) b!166322))

(assert (= start!35638 b!166323))

(declare-fun m!264259 () Bool)

(assert (=> start!35638 m!264259))

(declare-fun m!264261 () Bool)

(assert (=> b!166321 m!264261))

(declare-fun m!264263 () Bool)

(assert (=> b!166323 m!264263))

(push 1)

(assert (not start!35638))

(assert (not b!166321))

(assert (not b!166323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57901 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57901 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7940 thiss!1577) (currentByte!7945 thiss!1577) (size!3780 (buf!4232 thiss!1577))))))

(declare-fun bs!14357 () Bool)

(assert (= bs!14357 d!57901))

(declare-fun m!264273 () Bool)

(assert (=> bs!14357 m!264273))

(assert (=> start!35638 d!57901))

(declare-fun d!57903 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57903 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3780 (buf!4232 thiss!1577))) ((_ sign_extend 32) (currentByte!7945 thiss!1577)) ((_ sign_extend 32) (currentBit!7940 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3780 (buf!4232 thiss!1577))) ((_ sign_extend 32) (currentByte!7945 thiss!1577)) ((_ sign_extend 32) (currentBit!7940 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14358 () Bool)

(assert (= bs!14358 d!57903))

(declare-fun m!264275 () Bool)

(assert (=> bs!14358 m!264275))

(assert (=> b!166321 d!57903))

(declare-fun d!57905 () Bool)

(assert (=> d!57905 (= (array_inv!3521 (buf!4232 thiss!1577)) (bvsge (size!3780 (buf!4232 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166323 d!57905))

(push 1)

(assert (not d!57901))

(assert (not d!57903))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

