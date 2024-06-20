; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70978 () Bool)

(assert start!70978)

(declare-fun res!263470 () Bool)

(declare-fun e!230887 () Bool)

(assert (=> start!70978 (=> (not res!263470) (not e!230887))))

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20240 0))(
  ( (array!20241 (arr!9914 (Array (_ BitVec 32) (_ BitVec 8))) (size!8822 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13806 0))(
  ( (BitStream!13807 (buf!7964 array!20240) (currentByte!14693 (_ BitVec 32)) (currentBit!14688 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13806)

(assert (=> start!70978 (= res!263470 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8822 (buf!7964 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14693 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14688 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8822 (buf!7964 thiss!1788))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14693 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14688 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!70978 e!230887))

(assert (=> start!70978 true))

(declare-fun e!230888 () Bool)

(declare-fun inv!12 (BitStream!13806) Bool)

(assert (=> start!70978 (and (inv!12 thiss!1788) e!230888)))

(declare-fun b!320727 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320727 (= e!230887 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14688 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14693 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (size!8822 (buf!7964 thiss!1788)))))))))

(declare-fun b!320728 () Bool)

(declare-fun array_inv!8374 (array!20240) Bool)

(assert (=> b!320728 (= e!230888 (array_inv!8374 (buf!7964 thiss!1788)))))

(assert (= (and start!70978 res!263470) b!320727))

(assert (= start!70978 b!320728))

(declare-fun m!459095 () Bool)

(assert (=> start!70978 m!459095))

(declare-fun m!459097 () Bool)

(assert (=> b!320727 m!459097))

(declare-fun m!459099 () Bool)

(assert (=> b!320728 m!459099))

(check-sat (not b!320727) (not b!320728) (not start!70978))
(check-sat)
(get-model)

(declare-fun d!105014 () Bool)

(assert (=> d!105014 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14688 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14693 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (size!8822 (buf!7964 thiss!1788))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14688 thiss!1788))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14688 thiss!1788))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14693 thiss!1788))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14693 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (size!8822 (buf!7964 thiss!1788))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14688 thiss!1788))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14693 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (size!8822 (buf!7964 thiss!1788)))))))))))

(assert (=> b!320727 d!105014))

(declare-fun d!105016 () Bool)

(assert (=> d!105016 (= (array_inv!8374 (buf!7964 thiss!1788)) (bvsge (size!8822 (buf!7964 thiss!1788)) #b00000000000000000000000000000000))))

(assert (=> b!320728 d!105016))

(declare-fun d!105018 () Bool)

(assert (=> d!105018 (= (inv!12 thiss!1788) (invariant!0 (currentBit!14688 thiss!1788) (currentByte!14693 thiss!1788) (size!8822 (buf!7964 thiss!1788))))))

(declare-fun bs!27613 () Bool)

(assert (= bs!27613 d!105018))

(declare-fun m!459107 () Bool)

(assert (=> bs!27613 m!459107))

(assert (=> start!70978 d!105018))

(check-sat (not d!105018))
(check-sat)
