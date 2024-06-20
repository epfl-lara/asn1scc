; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3310 () Bool)

(assert start!3310)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((array!857 0))(
  ( (array!858 (arr!794 (Array (_ BitVec 32) (_ BitVec 8))) (size!365 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!690 0))(
  ( (BitStream!691 (buf!716 array!857) (currentByte!1862 (_ BitVec 32)) (currentBit!1857 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!690)

(assert (=> start!3310 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!365 (buf!716 thiss!1073))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1862 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1857 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!365 (buf!716 thiss!1073))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1862 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1857 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3310 true))

(declare-fun e!9164 () Bool)

(declare-fun inv!12 (BitStream!690) Bool)

(assert (=> start!3310 (and (inv!12 thiss!1073) e!9164)))

(declare-fun b!14657 () Bool)

(declare-fun array_inv!354 (array!857) Bool)

(assert (=> b!14657 (= e!9164 (array_inv!354 (buf!716 thiss!1073)))))

(assert (= start!3310 b!14657))

(declare-fun m!21093 () Bool)

(assert (=> start!3310 m!21093))

(declare-fun m!21095 () Bool)

(assert (=> b!14657 m!21095))

(check-sat (not start!3310) (not b!14657))
(check-sat)
(get-model)

(declare-fun d!4810 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4810 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1857 thiss!1073) (currentByte!1862 thiss!1073) (size!365 (buf!716 thiss!1073))))))

(declare-fun bs!1330 () Bool)

(assert (= bs!1330 d!4810))

(declare-fun m!21101 () Bool)

(assert (=> bs!1330 m!21101))

(assert (=> start!3310 d!4810))

(declare-fun d!4812 () Bool)

(assert (=> d!4812 (= (array_inv!354 (buf!716 thiss!1073)) (bvsge (size!365 (buf!716 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14657 d!4812))

(check-sat (not d!4810))
(check-sat)
(get-model)

(declare-fun d!4818 () Bool)

(assert (=> d!4818 (= (invariant!0 (currentBit!1857 thiss!1073) (currentByte!1862 thiss!1073) (size!365 (buf!716 thiss!1073))) (and (bvsge (currentBit!1857 thiss!1073) #b00000000000000000000000000000000) (bvslt (currentBit!1857 thiss!1073) #b00000000000000000000000000001000) (bvsge (currentByte!1862 thiss!1073) #b00000000000000000000000000000000) (or (bvslt (currentByte!1862 thiss!1073) (size!365 (buf!716 thiss!1073))) (and (= (currentBit!1857 thiss!1073) #b00000000000000000000000000000000) (= (currentByte!1862 thiss!1073) (size!365 (buf!716 thiss!1073)))))))))

(assert (=> d!4810 d!4818))

(check-sat)
