; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35012 () Bool)

(assert start!35012)

(declare-fun res!137434 () Bool)

(declare-fun e!114083 () Bool)

(assert (=> start!35012 (=> (not res!137434) (not e!114083))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35012 (= res!137434 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35012 e!114083))

(assert (=> start!35012 true))

(declare-datatypes ((array!8319 0))(
  ( (array!8320 (arr!4642 (Array (_ BitVec 32) (_ BitVec 8))) (size!3721 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6598 0))(
  ( (BitStream!6599 (buf!4173 array!8319) (currentByte!7783 (_ BitVec 32)) (currentBit!7778 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6598)

(declare-fun e!114082 () Bool)

(declare-fun inv!12 (BitStream!6598) Bool)

(assert (=> start!35012 (and (inv!12 thiss!1577) e!114082)))

(declare-fun b!164965 () Bool)

(declare-fun res!137435 () Bool)

(assert (=> b!164965 (=> (not res!137435) (not e!114083))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164965 (= res!137435 (validate_offset_bits!1 ((_ sign_extend 32) (size!3721 (buf!4173 thiss!1577))) ((_ sign_extend 32) (currentByte!7783 thiss!1577)) ((_ sign_extend 32) (currentBit!7778 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164966 () Bool)

(assert (=> b!164966 (= e!114083 (and (bvsle (bvadd (currentBit!7778 thiss!1577) nBits!511) #b00000000000000000000000000001000) (not (= #b00000000000000000000000000000000 (bvand (bvadd (currentBit!7778 thiss!1577) nBits!511) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7778 thiss!1577) nBits!511)) #b10000000000000000000000000000000)))))))

(declare-fun b!164967 () Bool)

(declare-fun array_inv!3462 (array!8319) Bool)

(assert (=> b!164967 (= e!114082 (array_inv!3462 (buf!4173 thiss!1577)))))

(assert (= (and start!35012 res!137434) b!164965))

(assert (= (and b!164965 res!137435) b!164966))

(assert (= start!35012 b!164967))

(declare-fun m!262309 () Bool)

(assert (=> start!35012 m!262309))

(declare-fun m!262311 () Bool)

(assert (=> b!164965 m!262311))

(declare-fun m!262313 () Bool)

(assert (=> b!164967 m!262313))

(push 1)

(assert (not b!164967))

(assert (not start!35012))

(assert (not b!164965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57023 () Bool)

(assert (=> d!57023 (= (array_inv!3462 (buf!4173 thiss!1577)) (bvsge (size!3721 (buf!4173 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164967 d!57023))

(declare-fun d!57025 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57025 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7778 thiss!1577) (currentByte!7783 thiss!1577) (size!3721 (buf!4173 thiss!1577))))))

(declare-fun bs!14150 () Bool)

(assert (= bs!14150 d!57025))

(declare-fun m!262331 () Bool)

(assert (=> bs!14150 m!262331))

(assert (=> start!35012 d!57025))

(declare-fun d!57027 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57027 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3721 (buf!4173 thiss!1577))) ((_ sign_extend 32) (currentByte!7783 thiss!1577)) ((_ sign_extend 32) (currentBit!7778 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3721 (buf!4173 thiss!1577))) ((_ sign_extend 32) (currentByte!7783 thiss!1577)) ((_ sign_extend 32) (currentBit!7778 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14151 () Bool)

(assert (= bs!14151 d!57027))

(declare-fun m!262333 () Bool)

(assert (=> bs!14151 m!262333))

(assert (=> b!164965 d!57027))

(push 1)

(assert (not d!57027))

(assert (not d!57025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57039 () Bool)

(assert (=> d!57039 (= (remainingBits!0 ((_ sign_extend 32) (size!3721 (buf!4173 thiss!1577))) ((_ sign_extend 32) (currentByte!7783 thiss!1577)) ((_ sign_extend 32) (currentBit!7778 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3721 (buf!4173 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7783 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7778 thiss!1577)))))))

(assert (=> d!57027 d!57039))

(declare-fun d!57041 () Bool)

(assert (=> d!57041 (= (invariant!0 (currentBit!7778 thiss!1577) (currentByte!7783 thiss!1577) (size!3721 (buf!4173 thiss!1577))) (and (bvsge (currentBit!7778 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7778 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7783 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7783 thiss!1577) (size!3721 (buf!4173 thiss!1577))) (and (= (currentBit!7778 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7783 thiss!1577) (size!3721 (buf!4173 thiss!1577)))))))))

(assert (=> d!57025 d!57041))

(push 1)

(check-sat)

