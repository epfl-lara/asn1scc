; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50250 () Bool)

(assert start!50250)

(declare-fun res!197124 () Bool)

(declare-fun e!163077 () Bool)

(assert (=> start!50250 (=> (not res!197124) (not e!163077))))

(declare-datatypes ((array!12454 0))(
  ( (array!12455 (arr!6458 (Array (_ BitVec 32) (_ BitVec 8))) (size!5471 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9906 0))(
  ( (BitStream!9907 (buf!5946 array!12454) (currentByte!11056 (_ BitVec 32)) (currentBit!11051 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9906)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50250 (= res!197124 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5471 (buf!5946 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11056 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11051 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5471 (buf!5946 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11056 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11051 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50250 e!163077))

(assert (=> start!50250 true))

(declare-fun e!163078 () Bool)

(declare-fun inv!12 (BitStream!9906) Bool)

(assert (=> start!50250 (and (inv!12 thiss!1830) e!163078)))

(declare-fun b!235840 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235840 (= e!163077 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11051 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11056 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (size!5471 (buf!5946 thiss!1830)))))))))

(declare-fun b!235841 () Bool)

(declare-fun array_inv!5212 (array!12454) Bool)

(assert (=> b!235841 (= e!163078 (array_inv!5212 (buf!5946 thiss!1830)))))

(assert (= (and start!50250 res!197124) b!235840))

(assert (= start!50250 b!235841))

(declare-fun m!358507 () Bool)

(assert (=> start!50250 m!358507))

(declare-fun m!358509 () Bool)

(assert (=> b!235840 m!358509))

(declare-fun m!358511 () Bool)

(assert (=> b!235841 m!358511))

(check-sat (not start!50250) (not b!235840) (not b!235841))
(check-sat)
(get-model)

(declare-fun d!79588 () Bool)

(assert (=> d!79588 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11051 thiss!1830) (currentByte!11056 thiss!1830) (size!5471 (buf!5946 thiss!1830))))))

(declare-fun bs!19861 () Bool)

(assert (= bs!19861 d!79588))

(declare-fun m!358519 () Bool)

(assert (=> bs!19861 m!358519))

(assert (=> start!50250 d!79588))

(declare-fun d!79590 () Bool)

(assert (=> d!79590 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11051 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11056 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (size!5471 (buf!5946 thiss!1830))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11051 thiss!1830))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11051 thiss!1830))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11056 thiss!1830))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11056 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (size!5471 (buf!5946 thiss!1830))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11051 thiss!1830))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11056 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (size!5471 (buf!5946 thiss!1830)))))))))))

(assert (=> b!235840 d!79590))

(declare-fun d!79592 () Bool)

(assert (=> d!79592 (= (array_inv!5212 (buf!5946 thiss!1830)) (bvsge (size!5471 (buf!5946 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!235841 d!79592))

(check-sat (not d!79588))
(check-sat)
