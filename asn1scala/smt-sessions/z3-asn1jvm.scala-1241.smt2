; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35110 () Bool)

(assert start!35110)

(declare-fun res!137539 () Bool)

(declare-fun e!114228 () Bool)

(assert (=> start!35110 (=> (not res!137539) (not e!114228))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35110 (= res!137539 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35110 e!114228))

(assert (=> start!35110 true))

(declare-datatypes ((array!8358 0))(
  ( (array!8359 (arr!4658 (Array (_ BitVec 32) (_ BitVec 8))) (size!3737 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6630 0))(
  ( (BitStream!6631 (buf!4189 array!8358) (currentByte!7818 (_ BitVec 32)) (currentBit!7813 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6630)

(declare-fun e!114226 () Bool)

(declare-fun inv!12 (BitStream!6630) Bool)

(assert (=> start!35110 (and (inv!12 thiss!1577) e!114226)))

(declare-fun b!165118 () Bool)

(declare-fun res!137540 () Bool)

(assert (=> b!165118 (=> (not res!137540) (not e!114228))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165118 (= res!137540 (validate_offset_bits!1 ((_ sign_extend 32) (size!3737 (buf!4189 thiss!1577))) ((_ sign_extend 32) (currentByte!7818 thiss!1577)) ((_ sign_extend 32) (currentBit!7813 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165119 () Bool)

(assert (=> b!165119 (= e!114228 (and (bvsle (bvadd (currentBit!7813 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7818 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7818 thiss!1577) (size!3737 (buf!4189 thiss!1577))))))))

(declare-fun b!165120 () Bool)

(declare-fun array_inv!3478 (array!8358) Bool)

(assert (=> b!165120 (= e!114226 (array_inv!3478 (buf!4189 thiss!1577)))))

(assert (= (and start!35110 res!137539) b!165118))

(assert (= (and b!165118 res!137540) b!165119))

(assert (= start!35110 b!165120))

(declare-fun m!262495 () Bool)

(assert (=> start!35110 m!262495))

(declare-fun m!262497 () Bool)

(assert (=> b!165118 m!262497))

(declare-fun m!262499 () Bool)

(assert (=> b!165120 m!262499))

(check-sat (not start!35110) (not b!165118) (not b!165120))
(check-sat)
(get-model)

(declare-fun d!57095 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57095 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7813 thiss!1577) (currentByte!7818 thiss!1577) (size!3737 (buf!4189 thiss!1577))))))

(declare-fun bs!14178 () Bool)

(assert (= bs!14178 d!57095))

(declare-fun m!262507 () Bool)

(assert (=> bs!14178 m!262507))

(assert (=> start!35110 d!57095))

(declare-fun d!57097 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57097 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3737 (buf!4189 thiss!1577))) ((_ sign_extend 32) (currentByte!7818 thiss!1577)) ((_ sign_extend 32) (currentBit!7813 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3737 (buf!4189 thiss!1577))) ((_ sign_extend 32) (currentByte!7818 thiss!1577)) ((_ sign_extend 32) (currentBit!7813 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14179 () Bool)

(assert (= bs!14179 d!57097))

(declare-fun m!262509 () Bool)

(assert (=> bs!14179 m!262509))

(assert (=> b!165118 d!57097))

(declare-fun d!57099 () Bool)

(assert (=> d!57099 (= (array_inv!3478 (buf!4189 thiss!1577)) (bvsge (size!3737 (buf!4189 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165120 d!57099))

(check-sat (not d!57095) (not d!57097))
(check-sat)
(get-model)

(declare-fun d!57113 () Bool)

(assert (=> d!57113 (= (invariant!0 (currentBit!7813 thiss!1577) (currentByte!7818 thiss!1577) (size!3737 (buf!4189 thiss!1577))) (and (bvsge (currentBit!7813 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7813 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7818 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7818 thiss!1577) (size!3737 (buf!4189 thiss!1577))) (and (= (currentBit!7813 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7818 thiss!1577) (size!3737 (buf!4189 thiss!1577)))))))))

(assert (=> d!57095 d!57113))

(declare-fun d!57115 () Bool)

(assert (=> d!57115 (= (remainingBits!0 ((_ sign_extend 32) (size!3737 (buf!4189 thiss!1577))) ((_ sign_extend 32) (currentByte!7818 thiss!1577)) ((_ sign_extend 32) (currentBit!7813 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3737 (buf!4189 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7818 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7813 thiss!1577)))))))

(assert (=> d!57097 d!57115))

(check-sat)
