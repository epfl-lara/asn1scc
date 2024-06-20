; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35896 () Bool)

(assert start!35896)

(declare-fun res!138682 () Bool)

(declare-fun e!115423 () Bool)

(assert (=> start!35896 (=> (not res!138682) (not e!115423))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35896 (= res!138682 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35896 e!115423))

(assert (=> start!35896 true))

(declare-datatypes ((array!8549 0))(
  ( (array!8550 (arr!4727 (Array (_ BitVec 32) (_ BitVec 8))) (size!3806 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6768 0))(
  ( (BitStream!6769 (buf!4258 array!8549) (currentByte!8032 (_ BitVec 32)) (currentBit!8027 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6768)

(declare-fun e!115425 () Bool)

(declare-fun inv!12 (BitStream!6768) Bool)

(assert (=> start!35896 (and (inv!12 thiss!1577) e!115425)))

(declare-fun b!166573 () Bool)

(declare-fun res!138683 () Bool)

(assert (=> b!166573 (=> (not res!138683) (not e!115423))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166573 (= res!138683 (validate_offset_bits!1 ((_ sign_extend 32) (size!3806 (buf!4258 thiss!1577))) ((_ sign_extend 32) (currentByte!8032 thiss!1577)) ((_ sign_extend 32) (currentBit!8027 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166574 () Bool)

(assert (=> b!166574 (= e!115423 (and (bvsgt (bvadd (currentBit!8027 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10021 (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8032 thiss!1577)) #b10000000000000000000000000000000))) (and (not (= bdg!10021 #b00000000000000000000000000000000)) (not (= bdg!10021 (bvand (currentByte!8032 thiss!1577) #b10000000000000000000000000000000)))))))))

(declare-fun b!166575 () Bool)

(declare-fun array_inv!3547 (array!8549) Bool)

(assert (=> b!166575 (= e!115425 (array_inv!3547 (buf!4258 thiss!1577)))))

(assert (= (and start!35896 res!138682) b!166573))

(assert (= (and b!166573 res!138683) b!166574))

(assert (= start!35896 b!166575))

(declare-fun m!264589 () Bool)

(assert (=> start!35896 m!264589))

(declare-fun m!264591 () Bool)

(assert (=> b!166573 m!264591))

(declare-fun m!264593 () Bool)

(assert (=> b!166575 m!264593))

(check-sat (not b!166573) (not start!35896) (not b!166575))
(check-sat)
(get-model)

(declare-fun d!58137 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58137 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3806 (buf!4258 thiss!1577))) ((_ sign_extend 32) (currentByte!8032 thiss!1577)) ((_ sign_extend 32) (currentBit!8027 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3806 (buf!4258 thiss!1577))) ((_ sign_extend 32) (currentByte!8032 thiss!1577)) ((_ sign_extend 32) (currentBit!8027 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14428 () Bool)

(assert (= bs!14428 d!58137))

(declare-fun m!264601 () Bool)

(assert (=> bs!14428 m!264601))

(assert (=> b!166573 d!58137))

(declare-fun d!58139 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58139 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8027 thiss!1577) (currentByte!8032 thiss!1577) (size!3806 (buf!4258 thiss!1577))))))

(declare-fun bs!14429 () Bool)

(assert (= bs!14429 d!58139))

(declare-fun m!264603 () Bool)

(assert (=> bs!14429 m!264603))

(assert (=> start!35896 d!58139))

(declare-fun d!58141 () Bool)

(assert (=> d!58141 (= (array_inv!3547 (buf!4258 thiss!1577)) (bvsge (size!3806 (buf!4258 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166575 d!58141))

(check-sat (not d!58139) (not d!58137))
(check-sat)
(get-model)

(declare-fun d!58151 () Bool)

(assert (=> d!58151 (= (invariant!0 (currentBit!8027 thiss!1577) (currentByte!8032 thiss!1577) (size!3806 (buf!4258 thiss!1577))) (and (bvsge (currentBit!8027 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8027 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8032 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8032 thiss!1577) (size!3806 (buf!4258 thiss!1577))) (and (= (currentBit!8027 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8032 thiss!1577) (size!3806 (buf!4258 thiss!1577)))))))))

(assert (=> d!58139 d!58151))

(declare-fun d!58155 () Bool)

(assert (=> d!58155 (= (remainingBits!0 ((_ sign_extend 32) (size!3806 (buf!4258 thiss!1577))) ((_ sign_extend 32) (currentByte!8032 thiss!1577)) ((_ sign_extend 32) (currentBit!8027 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3806 (buf!4258 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8032 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8027 thiss!1577)))))))

(assert (=> d!58137 d!58155))

(check-sat)
