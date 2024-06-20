; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14876 () Bool)

(assert start!14876)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((array!3168 0))(
  ( (array!3169 (arr!2077 (Array (_ BitVec 32) (_ BitVec 8))) (size!1476 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2526 0))(
  ( (BitStream!2527 (buf!1860 array!3168) (currentByte!3657 (_ BitVec 32)) (currentBit!3652 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2526)

(assert (=> start!14876 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1476 (buf!1860 thiss!1090))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3657 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3652 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1476 (buf!1860 thiss!1090))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3657 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3652 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!14876 true))

(declare-fun e!50222 () Bool)

(declare-fun inv!12 (BitStream!2526) Bool)

(assert (=> start!14876 (and (inv!12 thiss!1090) e!50222)))

(declare-fun b!76539 () Bool)

(declare-fun array_inv!1322 (array!3168) Bool)

(assert (=> b!76539 (= e!50222 (array_inv!1322 (buf!1860 thiss!1090)))))

(assert (= start!14876 b!76539))

(declare-fun m!121779 () Bool)

(assert (=> start!14876 m!121779))

(declare-fun m!121781 () Bool)

(assert (=> b!76539 m!121781))

(check-sat (not start!14876) (not b!76539))
(check-sat)
(get-model)

(declare-fun d!24196 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24196 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3652 thiss!1090) (currentByte!3657 thiss!1090) (size!1476 (buf!1860 thiss!1090))))))

(declare-fun bs!5839 () Bool)

(assert (= bs!5839 d!24196))

(declare-fun m!121787 () Bool)

(assert (=> bs!5839 m!121787))

(assert (=> start!14876 d!24196))

(declare-fun d!24198 () Bool)

(assert (=> d!24198 (= (array_inv!1322 (buf!1860 thiss!1090)) (bvsge (size!1476 (buf!1860 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!76539 d!24198))

(check-sat (not d!24196))
(check-sat)
(get-model)

(declare-fun d!24200 () Bool)

(assert (=> d!24200 (= (invariant!0 (currentBit!3652 thiss!1090) (currentByte!3657 thiss!1090) (size!1476 (buf!1860 thiss!1090))) (and (bvsge (currentBit!3652 thiss!1090) #b00000000000000000000000000000000) (bvslt (currentBit!3652 thiss!1090) #b00000000000000000000000000001000) (bvsge (currentByte!3657 thiss!1090) #b00000000000000000000000000000000) (or (bvslt (currentByte!3657 thiss!1090) (size!1476 (buf!1860 thiss!1090))) (and (= (currentBit!3652 thiss!1090) #b00000000000000000000000000000000) (= (currentByte!3657 thiss!1090) (size!1476 (buf!1860 thiss!1090)))))))))

(assert (=> d!24196 d!24200))

(check-sat)
