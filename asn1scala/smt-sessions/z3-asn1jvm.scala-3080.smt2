; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70960 () Bool)

(assert start!70960)

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20231 0))(
  ( (array!20232 (arr!9911 (Array (_ BitVec 32) (_ BitVec 8))) (size!8819 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13800 0))(
  ( (BitStream!13801 (buf!7961 array!20231) (currentByte!14689 (_ BitVec 32)) (currentBit!14684 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13800)

(assert (=> start!70960 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8819 (buf!7961 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14689 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14684 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8819 (buf!7961 thiss!1788))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14689 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14684 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!70960 true))

(declare-fun e!230864 () Bool)

(declare-fun inv!12 (BitStream!13800) Bool)

(assert (=> start!70960 (and (inv!12 thiss!1788) e!230864)))

(declare-fun b!320713 () Bool)

(declare-fun array_inv!8371 (array!20231) Bool)

(assert (=> b!320713 (= e!230864 (array_inv!8371 (buf!7961 thiss!1788)))))

(assert (= start!70960 b!320713))

(declare-fun m!459077 () Bool)

(assert (=> start!70960 m!459077))

(declare-fun m!459079 () Bool)

(assert (=> b!320713 m!459079))

(check-sat (not b!320713) (not start!70960))
(check-sat)
(get-model)

(declare-fun d!105000 () Bool)

(assert (=> d!105000 (= (array_inv!8371 (buf!7961 thiss!1788)) (bvsge (size!8819 (buf!7961 thiss!1788)) #b00000000000000000000000000000000))))

(assert (=> b!320713 d!105000))

(declare-fun d!105002 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105002 (= (inv!12 thiss!1788) (invariant!0 (currentBit!14684 thiss!1788) (currentByte!14689 thiss!1788) (size!8819 (buf!7961 thiss!1788))))))

(declare-fun bs!27608 () Bool)

(assert (= bs!27608 d!105002))

(declare-fun m!459085 () Bool)

(assert (=> bs!27608 m!459085))

(assert (=> start!70960 d!105002))

(check-sat (not d!105002))
(check-sat)
(get-model)

(declare-fun d!105008 () Bool)

(assert (=> d!105008 (= (invariant!0 (currentBit!14684 thiss!1788) (currentByte!14689 thiss!1788) (size!8819 (buf!7961 thiss!1788))) (and (bvsge (currentBit!14684 thiss!1788) #b00000000000000000000000000000000) (bvslt (currentBit!14684 thiss!1788) #b00000000000000000000000000001000) (bvsge (currentByte!14689 thiss!1788) #b00000000000000000000000000000000) (or (bvslt (currentByte!14689 thiss!1788) (size!8819 (buf!7961 thiss!1788))) (and (= (currentBit!14684 thiss!1788) #b00000000000000000000000000000000) (= (currentByte!14689 thiss!1788) (size!8819 (buf!7961 thiss!1788)))))))))

(assert (=> d!105002 d!105008))

(check-sat)
