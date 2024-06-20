; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71028 () Bool)

(assert start!71028)

(declare-fun res!263497 () Bool)

(declare-fun e!230977 () Bool)

(assert (=> start!71028 (=> (not res!263497) (not e!230977))))

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20268 0))(
  ( (array!20269 (arr!9926 (Array (_ BitVec 32) (_ BitVec 8))) (size!8834 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13830 0))(
  ( (BitStream!13831 (buf!7976 array!20268) (currentByte!14708 (_ BitVec 32)) (currentBit!14703 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13830)

(assert (=> start!71028 (= res!263497 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8834 (buf!7976 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14708 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14703 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8834 (buf!7976 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14708 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14703 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71028 e!230977))

(assert (=> start!71028 true))

(declare-fun e!230978 () Bool)

(declare-fun inv!12 (BitStream!13830) Bool)

(assert (=> start!71028 (and (inv!12 thiss!1780) e!230978)))

(declare-fun b!320790 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320790 (= e!230977 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14703 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14708 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (size!8834 (buf!7976 thiss!1780)))))))))

(declare-fun b!320791 () Bool)

(declare-fun array_inv!8386 (array!20268) Bool)

(assert (=> b!320791 (= e!230978 (array_inv!8386 (buf!7976 thiss!1780)))))

(assert (= (and start!71028 res!263497) b!320790))

(assert (= start!71028 b!320791))

(declare-fun m!459163 () Bool)

(assert (=> start!71028 m!459163))

(declare-fun m!459165 () Bool)

(assert (=> b!320790 m!459165))

(declare-fun m!459167 () Bool)

(assert (=> b!320791 m!459167))

(check-sat (not start!71028) (not b!320791) (not b!320790))
(check-sat)
(get-model)

(declare-fun d!105048 () Bool)

(assert (=> d!105048 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14703 thiss!1780) (currentByte!14708 thiss!1780) (size!8834 (buf!7976 thiss!1780))))))

(declare-fun bs!27629 () Bool)

(assert (= bs!27629 d!105048))

(declare-fun m!459175 () Bool)

(assert (=> bs!27629 m!459175))

(assert (=> start!71028 d!105048))

(declare-fun d!105050 () Bool)

(assert (=> d!105050 (= (array_inv!8386 (buf!7976 thiss!1780)) (bvsge (size!8834 (buf!7976 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!320791 d!105050))

(declare-fun d!105052 () Bool)

(assert (=> d!105052 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14703 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14708 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (size!8834 (buf!7976 thiss!1780))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14703 thiss!1780))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14703 thiss!1780))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14708 thiss!1780))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14708 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (size!8834 (buf!7976 thiss!1780))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14703 thiss!1780))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14708 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (size!8834 (buf!7976 thiss!1780)))))))))))

(assert (=> b!320790 d!105052))

(check-sat (not d!105048))
(check-sat)
