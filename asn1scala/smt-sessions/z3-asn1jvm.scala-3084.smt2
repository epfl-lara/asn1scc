; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71010 () Bool)

(assert start!71010)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20260 0))(
  ( (array!20261 (arr!9923 (Array (_ BitVec 32) (_ BitVec 8))) (size!8831 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13824 0))(
  ( (BitStream!13825 (buf!7973 array!20260) (currentByte!14704 (_ BitVec 32)) (currentBit!14699 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13824)

(assert (=> start!71010 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8831 (buf!7973 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14704 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14699 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8831 (buf!7973 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14704 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14699 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71010 true))

(declare-fun e!230954 () Bool)

(declare-fun inv!12 (BitStream!13824) Bool)

(assert (=> start!71010 (and (inv!12 thiss!1780) e!230954)))

(declare-fun b!320776 () Bool)

(declare-fun array_inv!8383 (array!20260) Bool)

(assert (=> b!320776 (= e!230954 (array_inv!8383 (buf!7973 thiss!1780)))))

(assert (= start!71010 b!320776))

(declare-fun m!459145 () Bool)

(assert (=> start!71010 m!459145))

(declare-fun m!459147 () Bool)

(assert (=> b!320776 m!459147))

(check-sat (not start!71010) (not b!320776))
(check-sat)
(get-model)

(declare-fun d!105034 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105034 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14699 thiss!1780) (currentByte!14704 thiss!1780) (size!8831 (buf!7973 thiss!1780))))))

(declare-fun bs!27624 () Bool)

(assert (= bs!27624 d!105034))

(declare-fun m!459153 () Bool)

(assert (=> bs!27624 m!459153))

(assert (=> start!71010 d!105034))

(declare-fun d!105036 () Bool)

(assert (=> d!105036 (= (array_inv!8383 (buf!7973 thiss!1780)) (bvsge (size!8831 (buf!7973 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!320776 d!105036))

(check-sat (not d!105034))
(check-sat)
(get-model)

(declare-fun d!105038 () Bool)

(assert (=> d!105038 (= (invariant!0 (currentBit!14699 thiss!1780) (currentByte!14704 thiss!1780) (size!8831 (buf!7973 thiss!1780))) (and (bvsge (currentBit!14699 thiss!1780) #b00000000000000000000000000000000) (bvslt (currentBit!14699 thiss!1780) #b00000000000000000000000000001000) (bvsge (currentByte!14704 thiss!1780) #b00000000000000000000000000000000) (or (bvslt (currentByte!14704 thiss!1780) (size!8831 (buf!7973 thiss!1780))) (and (= (currentBit!14699 thiss!1780) #b00000000000000000000000000000000) (= (currentByte!14704 thiss!1780) (size!8831 (buf!7973 thiss!1780)))))))))

(assert (=> d!105034 d!105038))

(check-sat)
