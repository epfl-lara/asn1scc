; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35894 () Bool)

(assert start!35894)

(declare-fun res!138677 () Bool)

(declare-fun e!115415 () Bool)

(assert (=> start!35894 (=> (not res!138677) (not e!115415))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35894 (= res!138677 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35894 e!115415))

(assert (=> start!35894 true))

(declare-datatypes ((array!8547 0))(
  ( (array!8548 (arr!4726 (Array (_ BitVec 32) (_ BitVec 8))) (size!3805 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6766 0))(
  ( (BitStream!6767 (buf!4257 array!8547) (currentByte!8031 (_ BitVec 32)) (currentBit!8026 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6766)

(declare-fun e!115414 () Bool)

(declare-fun inv!12 (BitStream!6766) Bool)

(assert (=> start!35894 (and (inv!12 thiss!1577) e!115414)))

(declare-fun b!166564 () Bool)

(declare-fun res!138676 () Bool)

(assert (=> b!166564 (=> (not res!138676) (not e!115415))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166564 (= res!138676 (validate_offset_bits!1 ((_ sign_extend 32) (size!3805 (buf!4257 thiss!1577))) ((_ sign_extend 32) (currentByte!8031 thiss!1577)) ((_ sign_extend 32) (currentBit!8026 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166565 () Bool)

(assert (=> b!166565 (= e!115415 (and (bvsgt (bvadd (currentBit!8026 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10021 (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8031 thiss!1577)) #b10000000000000000000000000000000))) (and (not (= bdg!10021 #b00000000000000000000000000000000)) (not (= bdg!10021 (bvand (currentByte!8031 thiss!1577) #b10000000000000000000000000000000)))))))))

(declare-fun b!166566 () Bool)

(declare-fun array_inv!3546 (array!8547) Bool)

(assert (=> b!166566 (= e!115414 (array_inv!3546 (buf!4257 thiss!1577)))))

(assert (= (and start!35894 res!138677) b!166564))

(assert (= (and b!166564 res!138676) b!166565))

(assert (= start!35894 b!166566))

(declare-fun m!264583 () Bool)

(assert (=> start!35894 m!264583))

(declare-fun m!264585 () Bool)

(assert (=> b!166564 m!264585))

(declare-fun m!264587 () Bool)

(assert (=> b!166566 m!264587))

(push 1)

(assert (not start!35894))

(assert (not b!166566))

(assert (not b!166564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58143 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58143 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8026 thiss!1577) (currentByte!8031 thiss!1577) (size!3805 (buf!4257 thiss!1577))))))

(declare-fun bs!14430 () Bool)

(assert (= bs!14430 d!58143))

(declare-fun m!264605 () Bool)

(assert (=> bs!14430 m!264605))

(assert (=> start!35894 d!58143))

(declare-fun d!58145 () Bool)

(assert (=> d!58145 (= (array_inv!3546 (buf!4257 thiss!1577)) (bvsge (size!3805 (buf!4257 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166566 d!58145))

(declare-fun d!58147 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58147 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3805 (buf!4257 thiss!1577))) ((_ sign_extend 32) (currentByte!8031 thiss!1577)) ((_ sign_extend 32) (currentBit!8026 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3805 (buf!4257 thiss!1577))) ((_ sign_extend 32) (currentByte!8031 thiss!1577)) ((_ sign_extend 32) (currentBit!8026 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14431 () Bool)

(assert (= bs!14431 d!58147))

(declare-fun m!264607 () Bool)

(assert (=> bs!14431 m!264607))

(assert (=> b!166564 d!58147))

(push 1)

(assert (not d!58147))

(assert (not d!58143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58159 () Bool)

(assert (=> d!58159 (= (remainingBits!0 ((_ sign_extend 32) (size!3805 (buf!4257 thiss!1577))) ((_ sign_extend 32) (currentByte!8031 thiss!1577)) ((_ sign_extend 32) (currentBit!8026 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3805 (buf!4257 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8031 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8026 thiss!1577)))))))

(assert (=> d!58147 d!58159))

(declare-fun d!58161 () Bool)

(assert (=> d!58161 (= (invariant!0 (currentBit!8026 thiss!1577) (currentByte!8031 thiss!1577) (size!3805 (buf!4257 thiss!1577))) (and (bvsge (currentBit!8026 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8026 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8031 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8031 thiss!1577) (size!3805 (buf!4257 thiss!1577))) (and (= (currentBit!8026 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8031 thiss!1577) (size!3805 (buf!4257 thiss!1577)))))))))

(assert (=> d!58143 d!58161))

(push 1)

(check-sat)

