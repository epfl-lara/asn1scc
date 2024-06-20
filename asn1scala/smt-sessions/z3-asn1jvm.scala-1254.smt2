; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35600 () Bool)

(assert start!35600)

(declare-fun res!138485 () Bool)

(declare-fun e!115155 () Bool)

(assert (=> start!35600 (=> (not res!138485) (not e!115155))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35600 (= res!138485 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35600 e!115155))

(assert (=> start!35600 true))

(declare-datatypes ((array!8465 0))(
  ( (array!8466 (arr!4697 (Array (_ BitVec 32) (_ BitVec 8))) (size!3776 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6708 0))(
  ( (BitStream!6709 (buf!4228 array!8465) (currentByte!7932 (_ BitVec 32)) (currentBit!7927 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6708)

(declare-fun e!115154 () Bool)

(declare-fun inv!12 (BitStream!6708) Bool)

(assert (=> start!35600 (and (inv!12 thiss!1577) e!115154)))

(declare-fun b!166285 () Bool)

(declare-fun res!138484 () Bool)

(assert (=> b!166285 (=> (not res!138484) (not e!115155))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166285 (= res!138484 (validate_offset_bits!1 ((_ sign_extend 32) (size!3776 (buf!4228 thiss!1577))) ((_ sign_extend 32) (currentByte!7932 thiss!1577)) ((_ sign_extend 32) (currentBit!7927 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166286 () Bool)

(assert (=> b!166286 (= e!115155 (and (bvsgt (bvadd (currentBit!7927 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsgt (bvsub (bvadd (currentBit!7927 thiss!1577) nBits!511) #b00000000000000000000000000001000) #b00000000000000000000000000100000)))))

(declare-fun b!166287 () Bool)

(declare-fun array_inv!3517 (array!8465) Bool)

(assert (=> b!166287 (= e!115154 (array_inv!3517 (buf!4228 thiss!1577)))))

(assert (= (and start!35600 res!138485) b!166285))

(assert (= (and b!166285 res!138484) b!166286))

(assert (= start!35600 b!166287))

(declare-fun m!264223 () Bool)

(assert (=> start!35600 m!264223))

(declare-fun m!264225 () Bool)

(assert (=> b!166285 m!264225))

(declare-fun m!264227 () Bool)

(assert (=> b!166287 m!264227))

(check-sat (not start!35600) (not b!166285) (not b!166287))
(check-sat)
(get-model)

(declare-fun d!57861 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57861 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7927 thiss!1577) (currentByte!7932 thiss!1577) (size!3776 (buf!4228 thiss!1577))))))

(declare-fun bs!14346 () Bool)

(assert (= bs!14346 d!57861))

(declare-fun m!264239 () Bool)

(assert (=> bs!14346 m!264239))

(assert (=> start!35600 d!57861))

(declare-fun d!57865 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57865 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3776 (buf!4228 thiss!1577))) ((_ sign_extend 32) (currentByte!7932 thiss!1577)) ((_ sign_extend 32) (currentBit!7927 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3776 (buf!4228 thiss!1577))) ((_ sign_extend 32) (currentByte!7932 thiss!1577)) ((_ sign_extend 32) (currentBit!7927 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14347 () Bool)

(assert (= bs!14347 d!57865))

(declare-fun m!264241 () Bool)

(assert (=> bs!14347 m!264241))

(assert (=> b!166285 d!57865))

(declare-fun d!57867 () Bool)

(assert (=> d!57867 (= (array_inv!3517 (buf!4228 thiss!1577)) (bvsge (size!3776 (buf!4228 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166287 d!57867))

(check-sat (not d!57861) (not d!57865))
(check-sat)
(get-model)

(declare-fun d!57879 () Bool)

(assert (=> d!57879 (= (invariant!0 (currentBit!7927 thiss!1577) (currentByte!7932 thiss!1577) (size!3776 (buf!4228 thiss!1577))) (and (bvsge (currentBit!7927 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7927 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7932 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7932 thiss!1577) (size!3776 (buf!4228 thiss!1577))) (and (= (currentBit!7927 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7932 thiss!1577) (size!3776 (buf!4228 thiss!1577)))))))))

(assert (=> d!57861 d!57879))

(declare-fun d!57881 () Bool)

(assert (=> d!57881 (= (remainingBits!0 ((_ sign_extend 32) (size!3776 (buf!4228 thiss!1577))) ((_ sign_extend 32) (currentByte!7932 thiss!1577)) ((_ sign_extend 32) (currentBit!7927 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3776 (buf!4228 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7932 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7927 thiss!1577)))))))

(assert (=> d!57865 d!57881))

(check-sat)
