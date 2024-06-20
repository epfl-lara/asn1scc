; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34914 () Bool)

(assert start!34914)

(declare-fun res!137315 () Bool)

(declare-fun e!113902 () Bool)

(assert (=> start!34914 (=> (not res!137315) (not e!113902))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34914 (= res!137315 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34914 e!113902))

(assert (=> start!34914 true))

(declare-datatypes ((array!8273 0))(
  ( (array!8274 (arr!4622 (Array (_ BitVec 32) (_ BitVec 8))) (size!3701 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6558 0))(
  ( (BitStream!6559 (buf!4153 array!8273) (currentByte!7746 (_ BitVec 32)) (currentBit!7741 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6558)

(declare-fun e!113903 () Bool)

(declare-fun inv!12 (BitStream!6558) Bool)

(assert (=> start!34914 (and (inv!12 thiss!1577) e!113903)))

(declare-fun b!164785 () Bool)

(declare-fun res!137314 () Bool)

(assert (=> b!164785 (=> (not res!137314) (not e!113902))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164785 (= res!137314 (validate_offset_bits!1 ((_ sign_extend 32) (size!3701 (buf!4153 thiss!1577))) ((_ sign_extend 32) (currentByte!7746 thiss!1577)) ((_ sign_extend 32) (currentBit!7741 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164786 () Bool)

(assert (=> b!164786 (= e!113902 (and (not (= #b00000000000000000000000000000000 (bvand (currentBit!7741 thiss!1577) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (currentBit!7741 thiss!1577)) #b10000000000000000000000000000000)))))))

(declare-fun b!164787 () Bool)

(declare-fun array_inv!3442 (array!8273) Bool)

(assert (=> b!164787 (= e!113903 (array_inv!3442 (buf!4153 thiss!1577)))))

(assert (= (and start!34914 res!137315) b!164785))

(assert (= (and b!164785 res!137314) b!164786))

(assert (= start!34914 b!164787))

(declare-fun m!262141 () Bool)

(assert (=> start!34914 m!262141))

(declare-fun m!262143 () Bool)

(assert (=> b!164785 m!262143))

(declare-fun m!262145 () Bool)

(assert (=> b!164787 m!262145))

(check-sat (not b!164785) (not start!34914) (not b!164787))
(check-sat)
(get-model)

(declare-fun d!56945 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56945 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3701 (buf!4153 thiss!1577))) ((_ sign_extend 32) (currentByte!7746 thiss!1577)) ((_ sign_extend 32) (currentBit!7741 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3701 (buf!4153 thiss!1577))) ((_ sign_extend 32) (currentByte!7746 thiss!1577)) ((_ sign_extend 32) (currentBit!7741 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14115 () Bool)

(assert (= bs!14115 d!56945))

(declare-fun m!262153 () Bool)

(assert (=> bs!14115 m!262153))

(assert (=> b!164785 d!56945))

(declare-fun d!56947 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56947 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7741 thiss!1577) (currentByte!7746 thiss!1577) (size!3701 (buf!4153 thiss!1577))))))

(declare-fun bs!14116 () Bool)

(assert (= bs!14116 d!56947))

(declare-fun m!262155 () Bool)

(assert (=> bs!14116 m!262155))

(assert (=> start!34914 d!56947))

(declare-fun d!56949 () Bool)

(assert (=> d!56949 (= (array_inv!3442 (buf!4153 thiss!1577)) (bvsge (size!3701 (buf!4153 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164787 d!56949))

(check-sat (not d!56947) (not d!56945))
(check-sat)
(get-model)

(declare-fun d!56963 () Bool)

(assert (=> d!56963 (= (invariant!0 (currentBit!7741 thiss!1577) (currentByte!7746 thiss!1577) (size!3701 (buf!4153 thiss!1577))) (and (bvsge (currentBit!7741 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7741 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7746 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7746 thiss!1577) (size!3701 (buf!4153 thiss!1577))) (and (= (currentBit!7741 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7746 thiss!1577) (size!3701 (buf!4153 thiss!1577)))))))))

(assert (=> d!56947 d!56963))

(declare-fun d!56965 () Bool)

(assert (=> d!56965 (= (remainingBits!0 ((_ sign_extend 32) (size!3701 (buf!4153 thiss!1577))) ((_ sign_extend 32) (currentByte!7746 thiss!1577)) ((_ sign_extend 32) (currentBit!7741 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3701 (buf!4153 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7746 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7741 thiss!1577)))))))

(assert (=> d!56945 d!56965))

(check-sat)
