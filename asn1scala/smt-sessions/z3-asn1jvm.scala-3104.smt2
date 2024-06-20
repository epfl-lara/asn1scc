; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71484 () Bool)

(assert start!71484)

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20422 0))(
  ( (array!20423 (arr!9983 (Array (_ BitVec 32) (_ BitVec 8))) (size!8891 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13944 0))(
  ( (BitStream!13945 (buf!8033 array!20422) (currentByte!14827 (_ BitVec 32)) (currentBit!14822 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13944)

(assert (=> start!71484 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8891 (buf!8033 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14827 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14822 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8891 (buf!8033 thiss!1811))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14827 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14822 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71484 true))

(declare-fun e!231620 () Bool)

(declare-fun inv!12 (BitStream!13944) Bool)

(assert (=> start!71484 (and (inv!12 thiss!1811) e!231620)))

(declare-fun b!321520 () Bool)

(declare-fun array_inv!8443 (array!20422) Bool)

(assert (=> b!321520 (= e!231620 (array_inv!8443 (buf!8033 thiss!1811)))))

(assert (= start!71484 b!321520))

(declare-fun m!459887 () Bool)

(assert (=> start!71484 m!459887))

(declare-fun m!459889 () Bool)

(assert (=> b!321520 m!459889))

(check-sat (not b!321520) (not start!71484))
(check-sat)
(get-model)

(declare-fun d!105470 () Bool)

(assert (=> d!105470 (= (array_inv!8443 (buf!8033 thiss!1811)) (bvsge (size!8891 (buf!8033 thiss!1811)) #b00000000000000000000000000000000))))

(assert (=> b!321520 d!105470))

(declare-fun d!105472 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105472 (= (inv!12 thiss!1811) (invariant!0 (currentBit!14822 thiss!1811) (currentByte!14827 thiss!1811) (size!8891 (buf!8033 thiss!1811))))))

(declare-fun bs!27749 () Bool)

(assert (= bs!27749 d!105472))

(declare-fun m!459895 () Bool)

(assert (=> bs!27749 m!459895))

(assert (=> start!71484 d!105472))

(check-sat (not d!105472))
(check-sat)
(get-model)

(declare-fun d!105474 () Bool)

(assert (=> d!105474 (= (invariant!0 (currentBit!14822 thiss!1811) (currentByte!14827 thiss!1811) (size!8891 (buf!8033 thiss!1811))) (and (bvsge (currentBit!14822 thiss!1811) #b00000000000000000000000000000000) (bvslt (currentBit!14822 thiss!1811) #b00000000000000000000000000001000) (bvsge (currentByte!14827 thiss!1811) #b00000000000000000000000000000000) (or (bvslt (currentByte!14827 thiss!1811) (size!8891 (buf!8033 thiss!1811))) (and (= (currentBit!14822 thiss!1811) #b00000000000000000000000000000000) (= (currentByte!14827 thiss!1811) (size!8891 (buf!8033 thiss!1811)))))))))

(assert (=> d!105472 d!105474))

(check-sat)
