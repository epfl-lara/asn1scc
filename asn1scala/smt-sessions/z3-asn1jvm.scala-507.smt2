; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14894 () Bool)

(assert start!14894)

(declare-fun res!63244 () Bool)

(declare-fun e!50245 () Bool)

(assert (=> start!14894 (=> (not res!63244) (not e!50245))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((array!3176 0))(
  ( (array!3177 (arr!2080 (Array (_ BitVec 32) (_ BitVec 8))) (size!1479 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2532 0))(
  ( (BitStream!2533 (buf!1863 array!3176) (currentByte!3661 (_ BitVec 32)) (currentBit!3656 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2532)

(assert (=> start!14894 (= res!63244 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1479 (buf!1863 thiss!1090))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3661 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3656 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1479 (buf!1863 thiss!1090))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3661 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3656 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!14894 e!50245))

(assert (=> start!14894 true))

(declare-fun e!50246 () Bool)

(declare-fun inv!12 (BitStream!2532) Bool)

(assert (=> start!14894 (and (inv!12 thiss!1090) e!50246)))

(declare-fun b!76553 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76553 (= e!50245 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3656 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3661 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (size!1479 (buf!1863 thiss!1090)))))))))

(declare-fun b!76554 () Bool)

(declare-fun array_inv!1325 (array!3176) Bool)

(assert (=> b!76554 (= e!50246 (array_inv!1325 (buf!1863 thiss!1090)))))

(assert (= (and start!14894 res!63244) b!76553))

(assert (= start!14894 b!76554))

(declare-fun m!121797 () Bool)

(assert (=> start!14894 m!121797))

(declare-fun m!121799 () Bool)

(assert (=> b!76553 m!121799))

(declare-fun m!121801 () Bool)

(assert (=> b!76554 m!121801))

(check-sat (not start!14894) (not b!76554) (not b!76553))
(check-sat)
(get-model)

(declare-fun d!24210 () Bool)

(assert (=> d!24210 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3656 thiss!1090) (currentByte!3661 thiss!1090) (size!1479 (buf!1863 thiss!1090))))))

(declare-fun bs!5844 () Bool)

(assert (= bs!5844 d!24210))

(declare-fun m!121809 () Bool)

(assert (=> bs!5844 m!121809))

(assert (=> start!14894 d!24210))

(declare-fun d!24212 () Bool)

(assert (=> d!24212 (= (array_inv!1325 (buf!1863 thiss!1090)) (bvsge (size!1479 (buf!1863 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!76554 d!24212))

(declare-fun d!24214 () Bool)

(assert (=> d!24214 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3656 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3661 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (size!1479 (buf!1863 thiss!1090))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3656 thiss!1090))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3656 thiss!1090))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3661 thiss!1090))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3661 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (size!1479 (buf!1863 thiss!1090))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3656 thiss!1090))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3661 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (size!1479 (buf!1863 thiss!1090)))))))))))

(assert (=> b!76553 d!24214))

(check-sat (not d!24210))
(check-sat)
