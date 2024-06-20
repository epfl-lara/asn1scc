; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71500 () Bool)

(assert start!71500)

(declare-fun res!263974 () Bool)

(declare-fun e!231643 () Bool)

(assert (=> start!71500 (=> (not res!263974) (not e!231643))))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20430 0))(
  ( (array!20431 (arr!9986 (Array (_ BitVec 32) (_ BitVec 8))) (size!8894 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13950 0))(
  ( (BitStream!13951 (buf!8036 array!20430) (currentByte!14831 (_ BitVec 32)) (currentBit!14826 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13950)

(declare-fun i!747 () (_ BitVec 32))

(assert (=> start!71500 (= res!263974 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8894 (buf!8036 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14831 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14826 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8894 (buf!8036 thiss!1811))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14831 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14826 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71500 e!231643))

(assert (=> start!71500 true))

(declare-fun e!231644 () Bool)

(declare-fun inv!12 (BitStream!13950) Bool)

(assert (=> start!71500 (and (inv!12 thiss!1811) e!231644)))

(declare-fun b!321534 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321534 (= e!231643 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14826 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14831 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (size!8894 (buf!8036 thiss!1811)))))))))

(declare-fun b!321535 () Bool)

(declare-fun array_inv!8446 (array!20430) Bool)

(assert (=> b!321535 (= e!231644 (array_inv!8446 (buf!8036 thiss!1811)))))

(assert (= (and start!71500 res!263974) b!321534))

(assert (= start!71500 b!321535))

(declare-fun m!459905 () Bool)

(assert (=> start!71500 m!459905))

(declare-fun m!459907 () Bool)

(assert (=> b!321534 m!459907))

(declare-fun m!459909 () Bool)

(assert (=> b!321535 m!459909))

(check-sat (not b!321534) (not b!321535) (not start!71500))
(check-sat)
(get-model)

(declare-fun d!105482 () Bool)

(assert (=> d!105482 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14826 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14831 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (size!8894 (buf!8036 thiss!1811))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14826 thiss!1811))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14826 thiss!1811))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14831 thiss!1811))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14831 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (size!8894 (buf!8036 thiss!1811))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14826 thiss!1811))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14831 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (size!8894 (buf!8036 thiss!1811)))))))))))

(assert (=> b!321534 d!105482))

(declare-fun d!105484 () Bool)

(assert (=> d!105484 (= (array_inv!8446 (buf!8036 thiss!1811)) (bvsge (size!8894 (buf!8036 thiss!1811)) #b00000000000000000000000000000000))))

(assert (=> b!321535 d!105484))

(declare-fun d!105486 () Bool)

(assert (=> d!105486 (= (inv!12 thiss!1811) (invariant!0 (currentBit!14826 thiss!1811) (currentByte!14831 thiss!1811) (size!8894 (buf!8036 thiss!1811))))))

(declare-fun bs!27754 () Bool)

(assert (= bs!27754 d!105486))

(declare-fun m!459917 () Bool)

(assert (=> bs!27754 m!459917))

(assert (=> start!71500 d!105486))

(check-sat (not d!105486))
(check-sat)
