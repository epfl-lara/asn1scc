; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35928 () Bool)

(assert start!35928)

(declare-fun res!138701 () Bool)

(declare-fun e!115451 () Bool)

(assert (=> start!35928 (=> (not res!138701) (not e!115451))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35928 (= res!138701 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35928 e!115451))

(assert (=> start!35928 true))

(declare-datatypes ((array!8558 0))(
  ( (array!8559 (arr!4730 (Array (_ BitVec 32) (_ BitVec 8))) (size!3809 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6774 0))(
  ( (BitStream!6775 (buf!4261 array!8558) (currentByte!8042 (_ BitVec 32)) (currentBit!8037 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6774)

(declare-fun e!115452 () Bool)

(declare-fun inv!12 (BitStream!6774) Bool)

(assert (=> start!35928 (and (inv!12 thiss!1577) e!115452)))

(declare-fun b!166600 () Bool)

(declare-fun res!138700 () Bool)

(assert (=> b!166600 (=> (not res!138700) (not e!115451))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166600 (= res!138700 (validate_offset_bits!1 ((_ sign_extend 32) (size!3809 (buf!4261 thiss!1577))) ((_ sign_extend 32) (currentByte!8042 thiss!1577)) ((_ sign_extend 32) (currentBit!8037 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166601 () Bool)

(assert (=> b!166601 (= e!115451 (and (bvsgt (bvadd (currentBit!8037 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10022 (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8042 thiss!1577)) #b10000000000000000000000000000000))) (and (not (= bdg!10022 #b00000000000000000000000000000000)) (not (= bdg!10022 (bvand (currentByte!8042 thiss!1577) #b10000000000000000000000000000000)))))))))

(declare-fun b!166602 () Bool)

(declare-fun array_inv!3550 (array!8558) Bool)

(assert (=> b!166602 (= e!115452 (array_inv!3550 (buf!4261 thiss!1577)))))

(assert (= (and start!35928 res!138701) b!166600))

(assert (= (and b!166600 res!138700) b!166601))

(assert (= start!35928 b!166602))

(declare-fun m!264619 () Bool)

(assert (=> start!35928 m!264619))

(declare-fun m!264621 () Bool)

(assert (=> b!166600 m!264621))

(declare-fun m!264623 () Bool)

(assert (=> b!166602 m!264623))

(check-sat (not b!166602) (not b!166600) (not start!35928))
(check-sat)
(get-model)

(declare-fun d!58165 () Bool)

(assert (=> d!58165 (= (array_inv!3550 (buf!4261 thiss!1577)) (bvsge (size!3809 (buf!4261 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166602 d!58165))

(declare-fun d!58167 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58167 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3809 (buf!4261 thiss!1577))) ((_ sign_extend 32) (currentByte!8042 thiss!1577)) ((_ sign_extend 32) (currentBit!8037 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3809 (buf!4261 thiss!1577))) ((_ sign_extend 32) (currentByte!8042 thiss!1577)) ((_ sign_extend 32) (currentBit!8037 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14437 () Bool)

(assert (= bs!14437 d!58167))

(declare-fun m!264631 () Bool)

(assert (=> bs!14437 m!264631))

(assert (=> b!166600 d!58167))

(declare-fun d!58169 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58169 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8037 thiss!1577) (currentByte!8042 thiss!1577) (size!3809 (buf!4261 thiss!1577))))))

(declare-fun bs!14438 () Bool)

(assert (= bs!14438 d!58169))

(declare-fun m!264633 () Bool)

(assert (=> bs!14438 m!264633))

(assert (=> start!35928 d!58169))

(check-sat (not d!58167) (not d!58169))
(check-sat)
(get-model)

(declare-fun d!58183 () Bool)

(assert (=> d!58183 (= (remainingBits!0 ((_ sign_extend 32) (size!3809 (buf!4261 thiss!1577))) ((_ sign_extend 32) (currentByte!8042 thiss!1577)) ((_ sign_extend 32) (currentBit!8037 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3809 (buf!4261 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8042 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8037 thiss!1577)))))))

(assert (=> d!58167 d!58183))

(declare-fun d!58185 () Bool)

(assert (=> d!58185 (= (invariant!0 (currentBit!8037 thiss!1577) (currentByte!8042 thiss!1577) (size!3809 (buf!4261 thiss!1577))) (and (bvsge (currentBit!8037 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8037 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8042 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8042 thiss!1577) (size!3809 (buf!4261 thiss!1577))) (and (= (currentBit!8037 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8042 thiss!1577) (size!3809 (buf!4261 thiss!1577)))))))))

(assert (=> d!58169 d!58185))

(check-sat)
