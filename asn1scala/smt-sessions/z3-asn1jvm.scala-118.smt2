; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2752 () Bool)

(assert start!2752)

(declare-datatypes ((array!725 0))(
  ( (array!726 (arr!746 (Array (_ BitVec 32) (_ BitVec 8))) (size!317 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!594 0))(
  ( (BitStream!595 (buf!668 array!725) (currentByte!1752 (_ BitVec 32)) (currentBit!1747 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!594)

(assert (=> start!2752 (and (bvsle ((_ sign_extend 32) (size!317 (buf!668 thiss!957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1752 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1747 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!317 (buf!668 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1752 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1747 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!7984 () Bool)

(declare-fun inv!12 (BitStream!594) Bool)

(assert (=> start!2752 (and (inv!12 thiss!957) e!7984)))

(declare-fun b!13125 () Bool)

(declare-fun array_inv!306 (array!725) Bool)

(assert (=> b!13125 (= e!7984 (array_inv!306 (buf!668 thiss!957)))))

(assert (= start!2752 b!13125))

(declare-fun m!19779 () Bool)

(assert (=> start!2752 m!19779))

(declare-fun m!19781 () Bool)

(assert (=> b!13125 m!19781))

(check-sat (not b!13125) (not start!2752))
(check-sat)
(get-model)

(declare-fun d!4194 () Bool)

(assert (=> d!4194 (= (array_inv!306 (buf!668 thiss!957)) (bvsge (size!317 (buf!668 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13125 d!4194))

(declare-fun d!4198 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4198 (= (inv!12 thiss!957) (invariant!0 (currentBit!1747 thiss!957) (currentByte!1752 thiss!957) (size!317 (buf!668 thiss!957))))))

(declare-fun bs!1183 () Bool)

(assert (= bs!1183 d!4198))

(declare-fun m!19791 () Bool)

(assert (=> bs!1183 m!19791))

(assert (=> start!2752 d!4198))

(check-sat (not d!4198))
(check-sat)
(get-model)

