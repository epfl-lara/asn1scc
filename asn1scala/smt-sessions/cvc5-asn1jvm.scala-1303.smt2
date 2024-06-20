; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37078 () Bool)

(assert start!37078)

(declare-fun res!140447 () Bool)

(declare-fun e!117382 () Bool)

(assert (=> start!37078 (=> (not res!140447) (not e!117382))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37078 (= res!140447 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37078 e!117382))

(assert (=> start!37078 true))

(declare-datatypes ((array!8856 0))(
  ( (array!8857 (arr!4843 (Array (_ BitVec 32) (_ BitVec 8))) (size!3922 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7000 0))(
  ( (BitStream!7001 (buf!4374 array!8856) (currentByte!8328 (_ BitVec 32)) (currentBit!8323 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7000)

(declare-fun e!117383 () Bool)

(declare-fun inv!12 (BitStream!7000) Bool)

(assert (=> start!37078 (and (inv!12 thiss!1894) e!117383)))

(declare-fun b!168832 () Bool)

(declare-fun res!140446 () Bool)

(assert (=> b!168832 (=> (not res!140446) (not e!117382))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168832 (= res!140446 (validate_offset_bits!1 ((_ sign_extend 32) (size!3922 (buf!4374 thiss!1894))) ((_ sign_extend 32) (currentByte!8328 thiss!1894)) ((_ sign_extend 32) (currentBit!8323 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168833 () Bool)

(assert (=> b!168833 (= e!117382 (and (bvsgt (bvadd (currentBit!8323 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsle (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!8323 thiss!1894) nBits!600) #b00000000000000000000000000001000)) #b00000000000000000000000000100000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8328 thiss!1894)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8328 thiss!1894)) (size!3922 (buf!4374 thiss!1894))))))))

(declare-fun b!168834 () Bool)

(declare-fun array_inv!3663 (array!8856) Bool)

(assert (=> b!168834 (= e!117383 (array_inv!3663 (buf!4374 thiss!1894)))))

(assert (= (and start!37078 res!140447) b!168832))

(assert (= (and b!168832 res!140446) b!168833))

(assert (= start!37078 b!168834))

(declare-fun m!268419 () Bool)

(assert (=> start!37078 m!268419))

(declare-fun m!268421 () Bool)

(assert (=> b!168832 m!268421))

(declare-fun m!268423 () Bool)

(assert (=> b!168834 m!268423))

(push 1)

(assert (not b!168834))

(assert (not start!37078))

(assert (not b!168832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59643 () Bool)

(assert (=> d!59643 (= (array_inv!3663 (buf!4374 thiss!1894)) (bvsge (size!3922 (buf!4374 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168834 d!59643))

(declare-fun d!59647 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59647 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8323 thiss!1894) (currentByte!8328 thiss!1894) (size!3922 (buf!4374 thiss!1894))))))

(declare-fun bs!14787 () Bool)

(assert (= bs!14787 d!59647))

(declare-fun m!268437 () Bool)

(assert (=> bs!14787 m!268437))

(assert (=> start!37078 d!59647))

(declare-fun d!59649 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59649 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3922 (buf!4374 thiss!1894))) ((_ sign_extend 32) (currentByte!8328 thiss!1894)) ((_ sign_extend 32) (currentBit!8323 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3922 (buf!4374 thiss!1894))) ((_ sign_extend 32) (currentByte!8328 thiss!1894)) ((_ sign_extend 32) (currentBit!8323 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14789 () Bool)

(assert (= bs!14789 d!59649))

(declare-fun m!268441 () Bool)

(assert (=> bs!14789 m!268441))

(assert (=> b!168832 d!59649))

(push 1)

(assert (not d!59647))

(assert (not d!59649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59661 () Bool)

(assert (=> d!59661 (= (invariant!0 (currentBit!8323 thiss!1894) (currentByte!8328 thiss!1894) (size!3922 (buf!4374 thiss!1894))) (and (bvsge (currentBit!8323 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8323 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8328 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8328 thiss!1894) (size!3922 (buf!4374 thiss!1894))) (and (= (currentBit!8323 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8328 thiss!1894) (size!3922 (buf!4374 thiss!1894)))))))))

(assert (=> d!59647 d!59661))

(declare-fun d!59665 () Bool)

(assert (=> d!59665 (= (remainingBits!0 ((_ sign_extend 32) (size!3922 (buf!4374 thiss!1894))) ((_ sign_extend 32) (currentByte!8328 thiss!1894)) ((_ sign_extend 32) (currentBit!8323 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3922 (buf!4374 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8328 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8323 thiss!1894)))))))

(assert (=> d!59649 d!59665))

(push 1)

(check-sat)

