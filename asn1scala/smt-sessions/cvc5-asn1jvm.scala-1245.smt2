; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35252 () Bool)

(assert start!35252)

(declare-fun res!137605 () Bool)

(declare-fun e!114327 () Bool)

(assert (=> start!35252 (=> (not res!137605) (not e!114327))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35252 (= res!137605 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35252 e!114327))

(assert (=> start!35252 true))

(declare-datatypes ((array!8392 0))(
  ( (array!8393 (arr!4669 (Array (_ BitVec 32) (_ BitVec 8))) (size!3748 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6652 0))(
  ( (BitStream!6653 (buf!4200 array!8392) (currentByte!7865 (_ BitVec 32)) (currentBit!7860 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6652)

(declare-fun e!114325 () Bool)

(declare-fun inv!12 (BitStream!6652) Bool)

(assert (=> start!35252 (and (inv!12 thiss!1577) e!114325)))

(declare-fun b!165217 () Bool)

(declare-fun res!137606 () Bool)

(assert (=> b!165217 (=> (not res!137606) (not e!114327))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165217 (= res!137606 (validate_offset_bits!1 ((_ sign_extend 32) (size!3748 (buf!4200 thiss!1577))) ((_ sign_extend 32) (currentByte!7865 thiss!1577)) ((_ sign_extend 32) (currentBit!7860 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165218 () Bool)

(assert (=> b!165218 (= e!114327 (and (bvsle (bvadd (currentBit!7860 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvsgt #b00000000000000000000000000000000 (currentByte!7865 thiss!1577)) (bvsge (currentByte!7865 thiss!1577) (size!3748 (buf!4200 thiss!1577))))))))

(declare-fun b!165219 () Bool)

(declare-fun array_inv!3489 (array!8392) Bool)

(assert (=> b!165219 (= e!114325 (array_inv!3489 (buf!4200 thiss!1577)))))

(assert (= (and start!35252 res!137605) b!165217))

(assert (= (and b!165217 res!137606) b!165218))

(assert (= start!35252 b!165219))

(declare-fun m!262609 () Bool)

(assert (=> start!35252 m!262609))

(declare-fun m!262611 () Bool)

(assert (=> b!165217 m!262611))

(declare-fun m!262613 () Bool)

(assert (=> b!165219 m!262613))

(push 1)

(assert (not b!165217))

(assert (not start!35252))

(assert (not b!165219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57229 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57229 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3748 (buf!4200 thiss!1577))) ((_ sign_extend 32) (currentByte!7865 thiss!1577)) ((_ sign_extend 32) (currentBit!7860 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3748 (buf!4200 thiss!1577))) ((_ sign_extend 32) (currentByte!7865 thiss!1577)) ((_ sign_extend 32) (currentBit!7860 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14216 () Bool)

(assert (= bs!14216 d!57229))

(declare-fun m!262631 () Bool)

(assert (=> bs!14216 m!262631))

(assert (=> b!165217 d!57229))

(declare-fun d!57231 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57231 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7860 thiss!1577) (currentByte!7865 thiss!1577) (size!3748 (buf!4200 thiss!1577))))))

(declare-fun bs!14217 () Bool)

(assert (= bs!14217 d!57231))

(declare-fun m!262633 () Bool)

(assert (=> bs!14217 m!262633))

(assert (=> start!35252 d!57231))

(declare-fun d!57233 () Bool)

(assert (=> d!57233 (= (array_inv!3489 (buf!4200 thiss!1577)) (bvsge (size!3748 (buf!4200 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165219 d!57233))

(push 1)

(assert (not d!57229))

(assert (not d!57231))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57245 () Bool)

(assert (=> d!57245 (= (remainingBits!0 ((_ sign_extend 32) (size!3748 (buf!4200 thiss!1577))) ((_ sign_extend 32) (currentByte!7865 thiss!1577)) ((_ sign_extend 32) (currentBit!7860 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3748 (buf!4200 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7865 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7860 thiss!1577)))))))

(assert (=> d!57229 d!57245))

(declare-fun d!57247 () Bool)

(assert (=> d!57247 (= (invariant!0 (currentBit!7860 thiss!1577) (currentByte!7865 thiss!1577) (size!3748 (buf!4200 thiss!1577))) (and (bvsge (currentBit!7860 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7860 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7865 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7865 thiss!1577) (size!3748 (buf!4200 thiss!1577))) (and (= (currentBit!7860 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7865 thiss!1577) (size!3748 (buf!4200 thiss!1577)))))))))

(assert (=> d!57231 d!57247))

(push 1)

(check-sat)

