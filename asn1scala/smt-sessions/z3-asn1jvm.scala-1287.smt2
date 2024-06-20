; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36636 () Bool)

(assert start!36636)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8728 0))(
  ( (array!8729 (arr!4796 (Array (_ BitVec 32) (_ BitVec 8))) (size!3875 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6906 0))(
  ( (BitStream!6907 (buf!4327 array!8728) (currentByte!8187 (_ BitVec 32)) (currentBit!8182 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6906)

(assert (=> start!36636 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3875 (buf!4327 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8187 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8182 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3875 (buf!4327 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8187 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8182 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36636 true))

(declare-fun e!116861 () Bool)

(declare-fun inv!12 (BitStream!6906) Bool)

(assert (=> start!36636 (and (inv!12 thiss!1894) e!116861)))

(declare-fun b!168252 () Bool)

(declare-fun array_inv!3616 (array!8728) Bool)

(assert (=> b!168252 (= e!116861 (array_inv!3616 (buf!4327 thiss!1894)))))

(assert (= start!36636 b!168252))

(declare-fun m!267889 () Bool)

(assert (=> start!36636 m!267889))

(declare-fun m!267891 () Bool)

(assert (=> b!168252 m!267891))

(check-sat (not start!36636) (not b!168252))
(check-sat)
(get-model)

(declare-fun d!59225 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59225 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8182 thiss!1894) (currentByte!8187 thiss!1894) (size!3875 (buf!4327 thiss!1894))))))

(declare-fun bs!14673 () Bool)

(assert (= bs!14673 d!59225))

(declare-fun m!267897 () Bool)

(assert (=> bs!14673 m!267897))

(assert (=> start!36636 d!59225))

(declare-fun d!59231 () Bool)

(assert (=> d!59231 (= (array_inv!3616 (buf!4327 thiss!1894)) (bvsge (size!3875 (buf!4327 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168252 d!59231))

(check-sat (not d!59225))
(check-sat)
(get-model)

(declare-fun d!59235 () Bool)

(assert (=> d!59235 (= (invariant!0 (currentBit!8182 thiss!1894) (currentByte!8187 thiss!1894) (size!3875 (buf!4327 thiss!1894))) (and (bvsge (currentBit!8182 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8182 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8187 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8187 thiss!1894) (size!3875 (buf!4327 thiss!1894))) (and (= (currentBit!8182 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8187 thiss!1894) (size!3875 (buf!4327 thiss!1894)))))))))

(assert (=> d!59225 d!59235))

(check-sat)
