; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50234 () Bool)

(assert start!50234)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-datatypes ((array!12446 0))(
  ( (array!12447 (arr!6455 (Array (_ BitVec 32) (_ BitVec 8))) (size!5468 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9900 0))(
  ( (BitStream!9901 (buf!5943 array!12446) (currentByte!11052 (_ BitVec 32)) (currentBit!11047 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9900)

(assert (=> start!50234 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5468 (buf!5943 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11052 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11047 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5468 (buf!5943 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11052 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11047 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50234 true))

(declare-fun e!163054 () Bool)

(declare-fun inv!12 (BitStream!9900) Bool)

(assert (=> start!50234 (and (inv!12 thiss!1830) e!163054)))

(declare-fun b!235826 () Bool)

(declare-fun array_inv!5209 (array!12446) Bool)

(assert (=> b!235826 (= e!163054 (array_inv!5209 (buf!5943 thiss!1830)))))

(assert (= start!50234 b!235826))

(declare-fun m!358489 () Bool)

(assert (=> start!50234 m!358489))

(declare-fun m!358491 () Bool)

(assert (=> b!235826 m!358491))

(check-sat (not b!235826) (not start!50234))
(check-sat)
(get-model)

(declare-fun d!79576 () Bool)

(assert (=> d!79576 (= (array_inv!5209 (buf!5943 thiss!1830)) (bvsge (size!5468 (buf!5943 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!235826 d!79576))

(declare-fun d!79578 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79578 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11047 thiss!1830) (currentByte!11052 thiss!1830) (size!5468 (buf!5943 thiss!1830))))))

(declare-fun bs!19856 () Bool)

(assert (= bs!19856 d!79578))

(declare-fun m!358497 () Bool)

(assert (=> bs!19856 m!358497))

(assert (=> start!50234 d!79578))

(check-sat (not d!79578))
(check-sat)
(get-model)

(declare-fun d!79580 () Bool)

(assert (=> d!79580 (= (invariant!0 (currentBit!11047 thiss!1830) (currentByte!11052 thiss!1830) (size!5468 (buf!5943 thiss!1830))) (and (bvsge (currentBit!11047 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11047 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11052 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11052 thiss!1830) (size!5468 (buf!5943 thiss!1830))) (and (= (currentBit!11047 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11052 thiss!1830) (size!5468 (buf!5943 thiss!1830)))))))))

(assert (=> d!79578 d!79580))

(check-sat)
