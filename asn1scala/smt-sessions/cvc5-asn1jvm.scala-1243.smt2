; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35180 () Bool)

(assert start!35180)

(declare-fun res!137569 () Bool)

(declare-fun e!114273 () Bool)

(assert (=> start!35180 (=> (not res!137569) (not e!114273))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35180 (= res!137569 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35180 e!114273))

(assert (=> start!35180 true))

(declare-datatypes ((array!8374 0))(
  ( (array!8375 (arr!4663 (Array (_ BitVec 32) (_ BitVec 8))) (size!3742 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6640 0))(
  ( (BitStream!6641 (buf!4194 array!8374) (currentByte!7841 (_ BitVec 32)) (currentBit!7836 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6640)

(declare-fun e!114271 () Bool)

(declare-fun inv!12 (BitStream!6640) Bool)

(assert (=> start!35180 (and (inv!12 thiss!1577) e!114271)))

(declare-fun b!165163 () Bool)

(declare-fun res!137570 () Bool)

(assert (=> b!165163 (=> (not res!137570) (not e!114273))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165163 (= res!137570 (validate_offset_bits!1 ((_ sign_extend 32) (size!3742 (buf!4194 thiss!1577))) ((_ sign_extend 32) (currentByte!7841 thiss!1577)) ((_ sign_extend 32) (currentBit!7836 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165164 () Bool)

(assert (=> b!165164 (= e!114273 (and (bvsle (bvadd (currentBit!7836 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7841 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7841 thiss!1577) (size!3742 (buf!4194 thiss!1577))))))))

(declare-fun b!165165 () Bool)

(declare-fun array_inv!3483 (array!8374) Bool)

(assert (=> b!165165 (= e!114271 (array_inv!3483 (buf!4194 thiss!1577)))))

(assert (= (and start!35180 res!137569) b!165163))

(assert (= (and b!165163 res!137570) b!165164))

(assert (= start!35180 b!165165))

(declare-fun m!262549 () Bool)

(assert (=> start!35180 m!262549))

(declare-fun m!262551 () Bool)

(assert (=> b!165163 m!262551))

(declare-fun m!262553 () Bool)

(assert (=> b!165165 m!262553))

(push 1)

(assert (not b!165163))

(assert (not start!35180))

(assert (not b!165165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57165 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57165 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3742 (buf!4194 thiss!1577))) ((_ sign_extend 32) (currentByte!7841 thiss!1577)) ((_ sign_extend 32) (currentBit!7836 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3742 (buf!4194 thiss!1577))) ((_ sign_extend 32) (currentByte!7841 thiss!1577)) ((_ sign_extend 32) (currentBit!7836 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14198 () Bool)

(assert (= bs!14198 d!57165))

(declare-fun m!262571 () Bool)

(assert (=> bs!14198 m!262571))

(assert (=> b!165163 d!57165))

(declare-fun d!57167 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57167 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7836 thiss!1577) (currentByte!7841 thiss!1577) (size!3742 (buf!4194 thiss!1577))))))

(declare-fun bs!14199 () Bool)

(assert (= bs!14199 d!57167))

(declare-fun m!262573 () Bool)

(assert (=> bs!14199 m!262573))

(assert (=> start!35180 d!57167))

(declare-fun d!57169 () Bool)

(assert (=> d!57169 (= (array_inv!3483 (buf!4194 thiss!1577)) (bvsge (size!3742 (buf!4194 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165165 d!57169))

(push 1)

(assert (not d!57167))

(assert (not d!57165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57181 () Bool)

(assert (=> d!57181 (= (invariant!0 (currentBit!7836 thiss!1577) (currentByte!7841 thiss!1577) (size!3742 (buf!4194 thiss!1577))) (and (bvsge (currentBit!7836 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7836 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7841 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7841 thiss!1577) (size!3742 (buf!4194 thiss!1577))) (and (= (currentBit!7836 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7841 thiss!1577) (size!3742 (buf!4194 thiss!1577)))))))))

(assert (=> d!57167 d!57181))

(declare-fun d!57183 () Bool)

(assert (=> d!57183 (= (remainingBits!0 ((_ sign_extend 32) (size!3742 (buf!4194 thiss!1577))) ((_ sign_extend 32) (currentByte!7841 thiss!1577)) ((_ sign_extend 32) (currentBit!7836 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3742 (buf!4194 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7841 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7836 thiss!1577)))))))

(assert (=> d!57165 d!57183))

(push 1)

(check-sat)

(pop 1)

