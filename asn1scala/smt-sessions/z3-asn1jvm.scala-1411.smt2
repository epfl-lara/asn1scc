; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38874 () Bool)

(assert start!38874)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9402 0))(
  ( (array!9403 (arr!5078 (Array (_ BitVec 32) (_ BitVec 8))) (size!4148 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7404 0))(
  ( (BitStream!7405 (buf!4585 array!9402) (currentByte!8705 (_ BitVec 32)) (currentBit!8700 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7404)

(assert (=> start!38874 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle ((_ sign_extend 32) (size!4148 (buf!4585 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8705 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8700 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4148 (buf!4585 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8705 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8700 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38874 true))

(declare-fun e!122025 () Bool)

(declare-fun inv!12 (BitStream!7404) Bool)

(assert (=> start!38874 (and (inv!12 thiss!1204) e!122025)))

(declare-fun b!175032 () Bool)

(declare-fun array_inv!3889 (array!9402) Bool)

(assert (=> b!175032 (= e!122025 (array_inv!3889 (buf!4585 thiss!1204)))))

(assert (= start!38874 b!175032))

(declare-fun m!275277 () Bool)

(assert (=> start!38874 m!275277))

(declare-fun m!275279 () Bool)

(assert (=> b!175032 m!275279))

(check-sat (not b!175032) (not start!38874))
(check-sat)
(get-model)

(declare-fun d!61879 () Bool)

(assert (=> d!61879 (= (array_inv!3889 (buf!4585 thiss!1204)) (bvsge (size!4148 (buf!4585 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175032 d!61879))

(declare-fun d!61881 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61881 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8700 thiss!1204) (currentByte!8705 thiss!1204) (size!4148 (buf!4585 thiss!1204))))))

(declare-fun bs!15411 () Bool)

(assert (= bs!15411 d!61881))

(declare-fun m!275285 () Bool)

(assert (=> bs!15411 m!275285))

(assert (=> start!38874 d!61881))

(check-sat (not d!61881))
(check-sat)
(get-model)

(declare-fun d!61887 () Bool)

(assert (=> d!61887 (= (invariant!0 (currentBit!8700 thiss!1204) (currentByte!8705 thiss!1204) (size!4148 (buf!4585 thiss!1204))) (and (bvsge (currentBit!8700 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8700 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8705 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8705 thiss!1204) (size!4148 (buf!4585 thiss!1204))) (and (= (currentBit!8700 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8705 thiss!1204) (size!4148 (buf!4585 thiss!1204)))))))))

(assert (=> d!61881 d!61887))

(check-sat)
