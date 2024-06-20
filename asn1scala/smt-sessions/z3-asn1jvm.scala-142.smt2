; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3330 () Bool)

(assert start!3330)

(declare-fun res!13721 () Bool)

(declare-fun e!9187 () Bool)

(assert (=> start!3330 (=> (not res!13721) (not e!9187))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((array!866 0))(
  ( (array!867 (arr!797 (Array (_ BitVec 32) (_ BitVec 8))) (size!368 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!696 0))(
  ( (BitStream!697 (buf!719 array!866) (currentByte!1867 (_ BitVec 32)) (currentBit!1862 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!696)

(assert (=> start!3330 (= res!13721 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!368 (buf!719 thiss!1073))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1867 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1862 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!368 (buf!719 thiss!1073))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1867 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1862 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3330 e!9187))

(assert (=> start!3330 true))

(declare-fun e!9188 () Bool)

(declare-fun inv!12 (BitStream!696) Bool)

(assert (=> start!3330 (and (inv!12 thiss!1073) e!9188)))

(declare-fun b!14671 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14671 (= e!9187 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1862 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1867 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!368 (buf!719 thiss!1073)))))))))

(declare-fun b!14672 () Bool)

(declare-fun array_inv!357 (array!866) Bool)

(assert (=> b!14672 (= e!9188 (array_inv!357 (buf!719 thiss!1073)))))

(assert (= (and start!3330 res!13721) b!14671))

(assert (= start!3330 b!14672))

(declare-fun m!21111 () Bool)

(assert (=> start!3330 m!21111))

(declare-fun m!21113 () Bool)

(assert (=> b!14671 m!21113))

(declare-fun m!21115 () Bool)

(assert (=> b!14672 m!21115))

(check-sat (not b!14671) (not start!3330) (not b!14672))
(check-sat)
(get-model)

(declare-fun d!4830 () Bool)

(assert (=> d!4830 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1862 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1867 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!368 (buf!719 thiss!1073))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1862 thiss!1073))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1862 thiss!1073))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1867 thiss!1073))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1867 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!368 (buf!719 thiss!1073))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1862 thiss!1073))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1867 thiss!1073))) ((_ extract 31 0) ((_ sign_extend 32) (size!368 (buf!719 thiss!1073)))))))))))

