; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35566 () Bool)

(assert start!35566)

(declare-fun res!138460 () Bool)

(declare-fun e!115119 () Bool)

(assert (=> start!35566 (=> (not res!138460) (not e!115119))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35566 (= res!138460 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35566 e!115119))

(assert (=> start!35566 true))

(declare-datatypes ((array!8454 0))(
  ( (array!8455 (arr!4693 (Array (_ BitVec 32) (_ BitVec 8))) (size!3772 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6700 0))(
  ( (BitStream!6701 (buf!4224 array!8454) (currentByte!7921 (_ BitVec 32)) (currentBit!7916 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6700)

(declare-fun e!115118 () Bool)

(declare-fun inv!12 (BitStream!6700) Bool)

(assert (=> start!35566 (and (inv!12 thiss!1577) e!115118)))

(declare-fun b!166249 () Bool)

(declare-fun res!138461 () Bool)

(assert (=> b!166249 (=> (not res!138461) (not e!115119))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166249 (= res!138461 (validate_offset_bits!1 ((_ sign_extend 32) (size!3772 (buf!4224 thiss!1577))) ((_ sign_extend 32) (currentByte!7921 thiss!1577)) ((_ sign_extend 32) (currentBit!7916 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166250 () Bool)

(assert (=> b!166250 (= e!115119 (and (bvsgt (bvadd (currentBit!7916 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7921 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7921 thiss!1577) (size!3772 (buf!4224 thiss!1577))))))))

(declare-fun b!166251 () Bool)

(declare-fun array_inv!3513 (array!8454) Bool)

(assert (=> b!166251 (= e!115118 (array_inv!3513 (buf!4224 thiss!1577)))))

(assert (= (and start!35566 res!138460) b!166249))

(assert (= (and b!166249 res!138461) b!166250))

(assert (= start!35566 b!166251))

(declare-fun m!264187 () Bool)

(assert (=> start!35566 m!264187))

(declare-fun m!264189 () Bool)

(assert (=> b!166249 m!264189))

(declare-fun m!264191 () Bool)

(assert (=> b!166251 m!264191))

(push 1)

(assert (not b!166249))

(assert (not start!35566))

(assert (not b!166251))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57835 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57835 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3772 (buf!4224 thiss!1577))) ((_ sign_extend 32) (currentByte!7921 thiss!1577)) ((_ sign_extend 32) (currentBit!7916 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3772 (buf!4224 thiss!1577))) ((_ sign_extend 32) (currentByte!7921 thiss!1577)) ((_ sign_extend 32) (currentBit!7916 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14337 () Bool)

(assert (= bs!14337 d!57835))

(declare-fun m!264209 () Bool)

(assert (=> bs!14337 m!264209))

(assert (=> b!166249 d!57835))

(declare-fun d!57837 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57837 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7916 thiss!1577) (currentByte!7921 thiss!1577) (size!3772 (buf!4224 thiss!1577))))))

(declare-fun bs!14338 () Bool)

(assert (= bs!14338 d!57837))

(declare-fun m!264211 () Bool)

(assert (=> bs!14338 m!264211))

(assert (=> start!35566 d!57837))

(declare-fun d!57839 () Bool)

(assert (=> d!57839 (= (array_inv!3513 (buf!4224 thiss!1577)) (bvsge (size!3772 (buf!4224 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166251 d!57839))

(push 1)

(assert (not d!57835))

(assert (not d!57837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57849 () Bool)

(assert (=> d!57849 (= (remainingBits!0 ((_ sign_extend 32) (size!3772 (buf!4224 thiss!1577))) ((_ sign_extend 32) (currentByte!7921 thiss!1577)) ((_ sign_extend 32) (currentBit!7916 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3772 (buf!4224 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7921 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7916 thiss!1577)))))))

(assert (=> d!57835 d!57849))

(declare-fun d!57853 () Bool)

(assert (=> d!57853 (= (invariant!0 (currentBit!7916 thiss!1577) (currentByte!7921 thiss!1577) (size!3772 (buf!4224 thiss!1577))) (and (bvsge (currentBit!7916 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7916 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7921 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7921 thiss!1577) (size!3772 (buf!4224 thiss!1577))) (and (= (currentBit!7916 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7921 thiss!1577) (size!3772 (buf!4224 thiss!1577)))))))))

(assert (=> d!57837 d!57853))

(push 1)

(check-sat)

