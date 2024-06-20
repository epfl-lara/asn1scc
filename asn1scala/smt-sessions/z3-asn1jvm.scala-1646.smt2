; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46056 () Bool)

(assert start!46056)

(declare-datatypes ((array!10812 0))(
  ( (array!10813 (arr!5678 (Array (_ BitVec 32) (_ BitVec 8))) (size!4748 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8604 0))(
  ( (BitStream!8605 (buf!5295 array!10812) (currentByte!9946 (_ BitVec 32)) (currentBit!9941 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8604)

(assert (=> start!46056 (and (bvsle ((_ sign_extend 32) (size!4748 (buf!5295 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9946 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9941 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4748 (buf!5295 thiss!1933))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9946 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9941 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!151072 () Bool)

(declare-fun inv!12 (BitStream!8604) Bool)

(assert (=> start!46056 (and (inv!12 thiss!1933) e!151072)))

(declare-fun b!222432 () Bool)

(declare-fun array_inv!4489 (array!10812) Bool)

(assert (=> b!222432 (= e!151072 (array_inv!4489 (buf!5295 thiss!1933)))))

(assert (= start!46056 b!222432))

(declare-fun m!340657 () Bool)

(assert (=> start!46056 m!340657))

(declare-fun m!340659 () Bool)

(assert (=> b!222432 m!340659))

(check-sat (not start!46056) (not b!222432))
(check-sat)
(get-model)

(declare-fun d!75215 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75215 (= (inv!12 thiss!1933) (invariant!0 (currentBit!9941 thiss!1933) (currentByte!9946 thiss!1933) (size!4748 (buf!5295 thiss!1933))))))

(declare-fun bs!18324 () Bool)

(assert (= bs!18324 d!75215))

(declare-fun m!340667 () Bool)

(assert (=> bs!18324 m!340667))

(assert (=> start!46056 d!75215))

(declare-fun d!75221 () Bool)

(assert (=> d!75221 (= (array_inv!4489 (buf!5295 thiss!1933)) (bvsge (size!4748 (buf!5295 thiss!1933)) #b00000000000000000000000000000000))))

(assert (=> b!222432 d!75221))

(check-sat (not d!75215))
(check-sat)
(get-model)

(declare-fun d!75229 () Bool)

(assert (=> d!75229 (= (invariant!0 (currentBit!9941 thiss!1933) (currentByte!9946 thiss!1933) (size!4748 (buf!5295 thiss!1933))) (and (bvsge (currentBit!9941 thiss!1933) #b00000000000000000000000000000000) (bvslt (currentBit!9941 thiss!1933) #b00000000000000000000000000001000) (bvsge (currentByte!9946 thiss!1933) #b00000000000000000000000000000000) (or (bvslt (currentByte!9946 thiss!1933) (size!4748 (buf!5295 thiss!1933))) (and (= (currentBit!9941 thiss!1933) #b00000000000000000000000000000000) (= (currentByte!9946 thiss!1933) (size!4748 (buf!5295 thiss!1933)))))))))

(assert (=> d!75215 d!75229))

(check-sat)
