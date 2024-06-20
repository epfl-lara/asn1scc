; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35216 () Bool)

(assert start!35216)

(declare-fun res!137587 () Bool)

(declare-fun e!114300 () Bool)

(assert (=> start!35216 (=> (not res!137587) (not e!114300))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35216 (= res!137587 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35216 e!114300))

(assert (=> start!35216 true))

(declare-datatypes ((array!8383 0))(
  ( (array!8384 (arr!4666 (Array (_ BitVec 32) (_ BitVec 8))) (size!3745 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6646 0))(
  ( (BitStream!6647 (buf!4197 array!8383) (currentByte!7853 (_ BitVec 32)) (currentBit!7848 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6646)

(declare-fun e!114298 () Bool)

(declare-fun inv!12 (BitStream!6646) Bool)

(assert (=> start!35216 (and (inv!12 thiss!1577) e!114298)))

(declare-fun b!165190 () Bool)

(declare-fun res!137588 () Bool)

(assert (=> b!165190 (=> (not res!137588) (not e!114300))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165190 (= res!137588 (validate_offset_bits!1 ((_ sign_extend 32) (size!3745 (buf!4197 thiss!1577))) ((_ sign_extend 32) (currentByte!7853 thiss!1577)) ((_ sign_extend 32) (currentBit!7848 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165191 () Bool)

(assert (=> b!165191 (= e!114300 (and (bvsle (bvadd (currentBit!7848 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7853 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7853 thiss!1577) (size!3745 (buf!4197 thiss!1577))))))))

(declare-fun b!165192 () Bool)

(declare-fun array_inv!3486 (array!8383) Bool)

(assert (=> b!165192 (= e!114298 (array_inv!3486 (buf!4197 thiss!1577)))))

(assert (= (and start!35216 res!137587) b!165190))

(assert (= (and b!165190 res!137588) b!165191))

(assert (= start!35216 b!165192))

(declare-fun m!262579 () Bool)

(assert (=> start!35216 m!262579))

(declare-fun m!262581 () Bool)

(assert (=> b!165190 m!262581))

(declare-fun m!262583 () Bool)

(assert (=> b!165192 m!262583))

(push 1)

(assert (not start!35216))

(assert (not b!165190))

(assert (not b!165192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57197 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57197 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7848 thiss!1577) (currentByte!7853 thiss!1577) (size!3745 (buf!4197 thiss!1577))))))

(declare-fun bs!14207 () Bool)

(assert (= bs!14207 d!57197))

(declare-fun m!262601 () Bool)

(assert (=> bs!14207 m!262601))

(assert (=> start!35216 d!57197))

(declare-fun d!57199 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57199 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3745 (buf!4197 thiss!1577))) ((_ sign_extend 32) (currentByte!7853 thiss!1577)) ((_ sign_extend 32) (currentBit!7848 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3745 (buf!4197 thiss!1577))) ((_ sign_extend 32) (currentByte!7853 thiss!1577)) ((_ sign_extend 32) (currentBit!7848 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14208 () Bool)

(assert (= bs!14208 d!57199))

(declare-fun m!262603 () Bool)

(assert (=> bs!14208 m!262603))

(assert (=> b!165190 d!57199))

(declare-fun d!57203 () Bool)

(assert (=> d!57203 (= (array_inv!3486 (buf!4197 thiss!1577)) (bvsge (size!3745 (buf!4197 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165192 d!57203))

(push 1)

(assert (not d!57197))

(assert (not d!57199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57213 () Bool)

(assert (=> d!57213 (= (invariant!0 (currentBit!7848 thiss!1577) (currentByte!7853 thiss!1577) (size!3745 (buf!4197 thiss!1577))) (and (bvsge (currentBit!7848 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7848 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7853 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7853 thiss!1577) (size!3745 (buf!4197 thiss!1577))) (and (= (currentBit!7848 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7853 thiss!1577) (size!3745 (buf!4197 thiss!1577)))))))))

(assert (=> d!57197 d!57213))

(declare-fun d!57215 () Bool)

(assert (=> d!57215 (= (remainingBits!0 ((_ sign_extend 32) (size!3745 (buf!4197 thiss!1577))) ((_ sign_extend 32) (currentByte!7853 thiss!1577)) ((_ sign_extend 32) (currentBit!7848 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3745 (buf!4197 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7853 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7848 thiss!1577)))))))

(assert (=> d!57199 d!57215))

(push 1)

(check-sat)

(pop 1)

