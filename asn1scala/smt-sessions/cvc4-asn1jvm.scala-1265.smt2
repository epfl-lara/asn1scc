; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35930 () Bool)

(assert start!35930)

(declare-fun res!138707 () Bool)

(declare-fun e!115459 () Bool)

(assert (=> start!35930 (=> (not res!138707) (not e!115459))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35930 (= res!138707 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35930 e!115459))

(assert (=> start!35930 true))

(declare-datatypes ((array!8560 0))(
  ( (array!8561 (arr!4731 (Array (_ BitVec 32) (_ BitVec 8))) (size!3810 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6776 0))(
  ( (BitStream!6777 (buf!4262 array!8560) (currentByte!8043 (_ BitVec 32)) (currentBit!8038 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6776)

(declare-fun e!115460 () Bool)

(declare-fun inv!12 (BitStream!6776) Bool)

(assert (=> start!35930 (and (inv!12 thiss!1577) e!115460)))

(declare-fun b!166609 () Bool)

(declare-fun res!138706 () Bool)

(assert (=> b!166609 (=> (not res!138706) (not e!115459))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166609 (= res!138706 (validate_offset_bits!1 ((_ sign_extend 32) (size!3810 (buf!4262 thiss!1577))) ((_ sign_extend 32) (currentByte!8043 thiss!1577)) ((_ sign_extend 32) (currentBit!8038 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166610 () Bool)

(assert (=> b!166610 (= e!115459 (and (bvsgt (bvadd (currentBit!8038 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10022 (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8043 thiss!1577)) #b10000000000000000000000000000000))) (and (not (= bdg!10022 #b00000000000000000000000000000000)) (not (= bdg!10022 (bvand (currentByte!8043 thiss!1577) #b10000000000000000000000000000000)))))))))

(declare-fun b!166611 () Bool)

(declare-fun array_inv!3551 (array!8560) Bool)

(assert (=> b!166611 (= e!115460 (array_inv!3551 (buf!4262 thiss!1577)))))

(assert (= (and start!35930 res!138707) b!166609))

(assert (= (and b!166609 res!138706) b!166610))

(assert (= start!35930 b!166611))

(declare-fun m!264625 () Bool)

(assert (=> start!35930 m!264625))

(declare-fun m!264627 () Bool)

(assert (=> b!166609 m!264627))

(declare-fun m!264629 () Bool)

(assert (=> b!166611 m!264629))

(push 1)

(assert (not b!166611))

(assert (not b!166609))

(assert (not start!35930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58177 () Bool)

(assert (=> d!58177 (= (array_inv!3551 (buf!4262 thiss!1577)) (bvsge (size!3810 (buf!4262 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166611 d!58177))

(declare-fun d!58179 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58179 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3810 (buf!4262 thiss!1577))) ((_ sign_extend 32) (currentByte!8043 thiss!1577)) ((_ sign_extend 32) (currentBit!8038 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3810 (buf!4262 thiss!1577))) ((_ sign_extend 32) (currentByte!8043 thiss!1577)) ((_ sign_extend 32) (currentBit!8038 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14441 () Bool)

(assert (= bs!14441 d!58179))

(declare-fun m!264639 () Bool)

(assert (=> bs!14441 m!264639))

(assert (=> b!166609 d!58179))

(declare-fun d!58181 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58181 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8038 thiss!1577) (currentByte!8043 thiss!1577) (size!3810 (buf!4262 thiss!1577))))))

(declare-fun bs!14442 () Bool)

(assert (= bs!14442 d!58181))

(declare-fun m!264641 () Bool)

(assert (=> bs!14442 m!264641))

(assert (=> start!35930 d!58181))

(push 1)

(assert (not d!58179))

(assert (not d!58181))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58191 () Bool)

(assert (=> d!58191 (= (remainingBits!0 ((_ sign_extend 32) (size!3810 (buf!4262 thiss!1577))) ((_ sign_extend 32) (currentByte!8043 thiss!1577)) ((_ sign_extend 32) (currentBit!8038 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3810 (buf!4262 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8043 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8038 thiss!1577)))))))

(assert (=> d!58179 d!58191))

(declare-fun d!58193 () Bool)

(assert (=> d!58193 (= (invariant!0 (currentBit!8038 thiss!1577) (currentByte!8043 thiss!1577) (size!3810 (buf!4262 thiss!1577))) (and (bvsge (currentBit!8038 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8038 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8043 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8043 thiss!1577) (size!3810 (buf!4262 thiss!1577))) (and (= (currentBit!8038 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8043 thiss!1577) (size!3810 (buf!4262 thiss!1577)))))))))

