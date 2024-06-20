; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36936 () Bool)

(assert start!36936)

(declare-fun res!140354 () Bool)

(declare-fun e!117257 () Bool)

(assert (=> start!36936 (=> (not res!140354) (not e!117257))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36936 (= res!140354 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36936 e!117257))

(assert (=> start!36936 true))

(declare-datatypes ((array!8816 0))(
  ( (array!8817 (arr!4829 (Array (_ BitVec 32) (_ BitVec 8))) (size!3908 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6972 0))(
  ( (BitStream!6973 (buf!4360 array!8816) (currentByte!8281 (_ BitVec 32)) (currentBit!8276 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6972)

(declare-fun e!117258 () Bool)

(declare-fun inv!12 (BitStream!6972) Bool)

(assert (=> start!36936 (and (inv!12 thiss!1894) e!117258)))

(declare-fun b!168697 () Bool)

(declare-fun res!140353 () Bool)

(assert (=> b!168697 (=> (not res!140353) (not e!117257))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168697 (= res!140353 (validate_offset_bits!1 ((_ sign_extend 32) (size!3908 (buf!4360 thiss!1894))) ((_ sign_extend 32) (currentByte!8281 thiss!1894)) ((_ sign_extend 32) (currentBit!8276 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168698 () Bool)

(assert (=> b!168698 (= e!117257 (and (bvsgt (bvadd (currentBit!8276 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsgt (bvsub (bvadd (currentBit!8276 thiss!1894) nBits!600) #b00000000000000000000000000001000) #b00000000000000000000000000100000)))))

(declare-fun b!168699 () Bool)

(declare-fun array_inv!3649 (array!8816) Bool)

(assert (=> b!168699 (= e!117258 (array_inv!3649 (buf!4360 thiss!1894)))))

(assert (= (and start!36936 res!140354) b!168697))

(assert (= (and b!168697 res!140353) b!168698))

(assert (= start!36936 b!168699))

(declare-fun m!268275 () Bool)

(assert (=> start!36936 m!268275))

(declare-fun m!268277 () Bool)

(assert (=> b!168697 m!268277))

(declare-fun m!268279 () Bool)

(assert (=> b!168699 m!268279))

(check-sat (not start!36936) (not b!168697) (not b!168699))
(check-sat)
(get-model)

(declare-fun d!59505 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59505 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8276 thiss!1894) (currentByte!8281 thiss!1894) (size!3908 (buf!4360 thiss!1894))))))

(declare-fun bs!14745 () Bool)

(assert (= bs!14745 d!59505))

(declare-fun m!268287 () Bool)

(assert (=> bs!14745 m!268287))

(assert (=> start!36936 d!59505))

(declare-fun d!59507 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59507 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3908 (buf!4360 thiss!1894))) ((_ sign_extend 32) (currentByte!8281 thiss!1894)) ((_ sign_extend 32) (currentBit!8276 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3908 (buf!4360 thiss!1894))) ((_ sign_extend 32) (currentByte!8281 thiss!1894)) ((_ sign_extend 32) (currentBit!8276 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14746 () Bool)

(assert (= bs!14746 d!59507))

(declare-fun m!268289 () Bool)

(assert (=> bs!14746 m!268289))

(assert (=> b!168697 d!59507))

(declare-fun d!59511 () Bool)

(assert (=> d!59511 (= (array_inv!3649 (buf!4360 thiss!1894)) (bvsge (size!3908 (buf!4360 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168699 d!59511))

(check-sat (not d!59507) (not d!59505))
(check-sat)
(get-model)

(declare-fun d!59523 () Bool)

(assert (=> d!59523 (= (remainingBits!0 ((_ sign_extend 32) (size!3908 (buf!4360 thiss!1894))) ((_ sign_extend 32) (currentByte!8281 thiss!1894)) ((_ sign_extend 32) (currentBit!8276 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3908 (buf!4360 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8281 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8276 thiss!1894)))))))

(assert (=> d!59507 d!59523))

(declare-fun d!59525 () Bool)

(assert (=> d!59525 (= (invariant!0 (currentBit!8276 thiss!1894) (currentByte!8281 thiss!1894) (size!3908 (buf!4360 thiss!1894))) (and (bvsge (currentBit!8276 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8276 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8281 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8281 thiss!1894) (size!3908 (buf!4360 thiss!1894))) (and (= (currentBit!8276 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8281 thiss!1894) (size!3908 (buf!4360 thiss!1894)))))))))

(assert (=> d!59505 d!59525))

(check-sat)
