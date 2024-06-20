; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35636 () Bool)

(assert start!35636)

(declare-fun res!138502 () Bool)

(declare-fun e!115182 () Bool)

(assert (=> start!35636 (=> (not res!138502) (not e!115182))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35636 (= res!138502 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35636 e!115182))

(assert (=> start!35636 true))

(declare-datatypes ((array!8474 0))(
  ( (array!8475 (arr!4700 (Array (_ BitVec 32) (_ BitVec 8))) (size!3779 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6714 0))(
  ( (BitStream!6715 (buf!4231 array!8474) (currentByte!7944 (_ BitVec 32)) (currentBit!7939 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6714)

(declare-fun e!115181 () Bool)

(declare-fun inv!12 (BitStream!6714) Bool)

(assert (=> start!35636 (and (inv!12 thiss!1577) e!115181)))

(declare-fun b!166312 () Bool)

(declare-fun res!138503 () Bool)

(assert (=> b!166312 (=> (not res!138503) (not e!115182))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166312 (= res!138503 (validate_offset_bits!1 ((_ sign_extend 32) (size!3779 (buf!4231 thiss!1577))) ((_ sign_extend 32) (currentByte!7944 thiss!1577)) ((_ sign_extend 32) (currentBit!7939 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166313 () Bool)

(assert (=> b!166313 (= e!115182 (and (bvsgt (bvadd (currentBit!7939 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7944 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7944 thiss!1577) (size!3779 (buf!4231 thiss!1577))))))))

(declare-fun b!166314 () Bool)

(declare-fun array_inv!3520 (array!8474) Bool)

(assert (=> b!166314 (= e!115181 (array_inv!3520 (buf!4231 thiss!1577)))))

(assert (= (and start!35636 res!138502) b!166312))

(assert (= (and b!166312 res!138503) b!166313))

(assert (= start!35636 b!166314))

(declare-fun m!264253 () Bool)

(assert (=> start!35636 m!264253))

(declare-fun m!264255 () Bool)

(assert (=> b!166312 m!264255))

(declare-fun m!264257 () Bool)

(assert (=> b!166314 m!264257))

(check-sat (not start!35636) (not b!166312) (not b!166314))
(check-sat)
(get-model)

(declare-fun d!57891 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57891 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7939 thiss!1577) (currentByte!7944 thiss!1577) (size!3779 (buf!4231 thiss!1577))))))

(declare-fun bs!14355 () Bool)

(assert (= bs!14355 d!57891))

(declare-fun m!264269 () Bool)

(assert (=> bs!14355 m!264269))

(assert (=> start!35636 d!57891))

(declare-fun d!57897 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57897 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3779 (buf!4231 thiss!1577))) ((_ sign_extend 32) (currentByte!7944 thiss!1577)) ((_ sign_extend 32) (currentBit!7939 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3779 (buf!4231 thiss!1577))) ((_ sign_extend 32) (currentByte!7944 thiss!1577)) ((_ sign_extend 32) (currentBit!7939 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14356 () Bool)

(assert (= bs!14356 d!57897))

(declare-fun m!264271 () Bool)

(assert (=> bs!14356 m!264271))

(assert (=> b!166312 d!57897))

(declare-fun d!57899 () Bool)

(assert (=> d!57899 (= (array_inv!3520 (buf!4231 thiss!1577)) (bvsge (size!3779 (buf!4231 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166314 d!57899))

(check-sat (not d!57891) (not d!57897))
(check-sat)
(get-model)

(declare-fun d!57907 () Bool)

(assert (=> d!57907 (= (invariant!0 (currentBit!7939 thiss!1577) (currentByte!7944 thiss!1577) (size!3779 (buf!4231 thiss!1577))) (and (bvsge (currentBit!7939 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7939 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7944 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7944 thiss!1577) (size!3779 (buf!4231 thiss!1577))) (and (= (currentBit!7939 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7944 thiss!1577) (size!3779 (buf!4231 thiss!1577)))))))))

(assert (=> d!57891 d!57907))

(declare-fun d!57911 () Bool)

(assert (=> d!57911 (= (remainingBits!0 ((_ sign_extend 32) (size!3779 (buf!4231 thiss!1577))) ((_ sign_extend 32) (currentByte!7944 thiss!1577)) ((_ sign_extend 32) (currentBit!7939 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3779 (buf!4231 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7944 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7939 thiss!1577)))))))

(assert (=> d!57897 d!57911))

(check-sat)
