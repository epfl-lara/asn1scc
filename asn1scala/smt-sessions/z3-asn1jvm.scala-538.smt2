; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15722 () Bool)

(assert start!15722)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((array!3405 0))(
  ( (array!3406 (arr!2173 (Array (_ BitVec 32) (_ BitVec 8))) (size!1572 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2706 0))(
  ( (BitStream!2707 (buf!1962 array!3405) (currentByte!3839 (_ BitVec 32)) (currentBit!3834 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2706)

(assert (=> start!15722 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1572 (buf!1962 thiss!1716))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3839 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3834 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1572 (buf!1962 thiss!1716))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3839 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3834 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15722 true))

(declare-fun e!52211 () Bool)

(declare-fun inv!12 (BitStream!2706) Bool)

(assert (=> start!15722 (and (inv!12 thiss!1716) e!52211)))

(declare-fun b!79503 () Bool)

(declare-fun array_inv!1418 (array!3405) Bool)

(assert (=> b!79503 (= e!52211 (array_inv!1418 (buf!1962 thiss!1716)))))

(assert (= start!15722 b!79503))

(declare-fun m!124915 () Bool)

(assert (=> start!15722 m!124915))

(declare-fun m!124917 () Bool)

(assert (=> b!79503 m!124917))

(check-sat (not b!79503) (not start!15722))
(check-sat)
(get-model)

(declare-fun d!25070 () Bool)

(assert (=> d!25070 (= (array_inv!1418 (buf!1962 thiss!1716)) (bvsge (size!1572 (buf!1962 thiss!1716)) #b00000000000000000000000000000000))))

(assert (=> b!79503 d!25070))

(declare-fun d!25072 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25072 (= (inv!12 thiss!1716) (invariant!0 (currentBit!3834 thiss!1716) (currentByte!3839 thiss!1716) (size!1572 (buf!1962 thiss!1716))))))

(declare-fun bs!6081 () Bool)

(assert (= bs!6081 d!25072))

(declare-fun m!124923 () Bool)

(assert (=> bs!6081 m!124923))

(assert (=> start!15722 d!25072))

(check-sat (not d!25072))
(check-sat)
(get-model)

(declare-fun d!25074 () Bool)

(assert (=> d!25074 (= (invariant!0 (currentBit!3834 thiss!1716) (currentByte!3839 thiss!1716) (size!1572 (buf!1962 thiss!1716))) (and (bvsge (currentBit!3834 thiss!1716) #b00000000000000000000000000000000) (bvslt (currentBit!3834 thiss!1716) #b00000000000000000000000000001000) (bvsge (currentByte!3839 thiss!1716) #b00000000000000000000000000000000) (or (bvslt (currentByte!3839 thiss!1716) (size!1572 (buf!1962 thiss!1716))) (and (= (currentBit!3834 thiss!1716) #b00000000000000000000000000000000) (= (currentByte!3839 thiss!1716) (size!1572 (buf!1962 thiss!1716)))))))))

(assert (=> d!25072 d!25074))

(check-sat)
