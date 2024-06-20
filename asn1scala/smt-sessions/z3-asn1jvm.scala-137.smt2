; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3254 () Bool)

(assert start!3254)

(declare-fun nBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!827 0))(
  ( (array!828 (arr!782 (Array (_ BitVec 32) (_ BitVec 8))) (size!353 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!666 0))(
  ( (BitStream!667 (buf!704 array!827) (currentByte!1845 (_ BitVec 32)) (currentBit!1840 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!666)

(assert (=> start!3254 (and (bvsge nBytes!1 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!353 (buf!704 thiss!1862))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1845 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1840 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!353 (buf!704 thiss!1862))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1845 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1840 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3254 true))

(declare-fun e!9074 () Bool)

(declare-fun inv!12 (BitStream!666) Bool)

(assert (=> start!3254 (and (inv!12 thiss!1862) e!9074)))

(declare-fun b!14594 () Bool)

(declare-fun array_inv!342 (array!827) Bool)

(assert (=> b!14594 (= e!9074 (array_inv!342 (buf!704 thiss!1862)))))

(assert (= start!3254 b!14594))

(declare-fun m!21023 () Bool)

(assert (=> start!3254 m!21023))

(declare-fun m!21025 () Bool)

(assert (=> b!14594 m!21025))

(check-sat (not start!3254) (not b!14594))
(check-sat)
(get-model)

(declare-fun d!4770 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4770 (= (inv!12 thiss!1862) (invariant!0 (currentBit!1840 thiss!1862) (currentByte!1845 thiss!1862) (size!353 (buf!704 thiss!1862))))))

(declare-fun bs!1313 () Bool)

(assert (= bs!1313 d!4770))

(declare-fun m!21031 () Bool)

(assert (=> bs!1313 m!21031))

(assert (=> start!3254 d!4770))

(declare-fun d!4772 () Bool)

(assert (=> d!4772 (= (array_inv!342 (buf!704 thiss!1862)) (bvsge (size!353 (buf!704 thiss!1862)) #b00000000000000000000000000000000))))

(assert (=> b!14594 d!4772))

(check-sat (not d!4770))
(check-sat)
(get-model)

(declare-fun d!4778 () Bool)

(assert (=> d!4778 (= (invariant!0 (currentBit!1840 thiss!1862) (currentByte!1845 thiss!1862) (size!353 (buf!704 thiss!1862))) (and (bvsge (currentBit!1840 thiss!1862) #b00000000000000000000000000000000) (bvslt (currentBit!1840 thiss!1862) #b00000000000000000000000000001000) (bvsge (currentByte!1845 thiss!1862) #b00000000000000000000000000000000) (or (bvslt (currentByte!1845 thiss!1862) (size!353 (buf!704 thiss!1862))) (and (= (currentBit!1840 thiss!1862) #b00000000000000000000000000000000) (= (currentByte!1845 thiss!1862) (size!353 (buf!704 thiss!1862)))))))))

(assert (=> d!4770 d!4778))

(check-sat)
