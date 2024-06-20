; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71384 () Bool)

(assert start!71384)

(declare-fun res!263947 () Bool)

(declare-fun e!231526 () Bool)

(assert (=> start!71384 (=> (not res!263947) (not e!231526))))

(declare-datatypes ((array!20390 0))(
  ( (array!20391 (arr!9971 (Array (_ BitVec 32) (_ BitVec 8))) (size!8879 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13920 0))(
  ( (BitStream!13921 (buf!8021 array!20390) (currentByte!14794 (_ BitVec 32)) (currentBit!14789 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13920)

(assert (=> start!71384 (= res!263947 (and (bvsle ((_ sign_extend 32) (size!8879 (buf!8021 thiss!1701))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14794 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14789 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8879 (buf!8021 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14794 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14789 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71384 e!231526))

(declare-fun e!231527 () Bool)

(declare-fun inv!12 (BitStream!13920) Bool)

(assert (=> start!71384 (and (inv!12 thiss!1701) e!231527)))

(declare-fun b!321462 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321462 (= e!231526 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14789 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14794 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (size!8879 (buf!8021 thiss!1701)))))))))

(declare-fun b!321463 () Bool)

(declare-fun array_inv!8431 (array!20390) Bool)

(assert (=> b!321463 (= e!231527 (array_inv!8431 (buf!8021 thiss!1701)))))

(assert (= (and start!71384 res!263947) b!321462))

(assert (= start!71384 b!321463))

(declare-fun m!459793 () Bool)

(assert (=> start!71384 m!459793))

(declare-fun m!459795 () Bool)

(assert (=> b!321462 m!459795))

(declare-fun m!459797 () Bool)

(assert (=> b!321463 m!459797))

(check-sat (not start!71384) (not b!321462) (not b!321463))
(check-sat)
(get-model)

(declare-fun d!105386 () Bool)

(assert (=> d!105386 (= (inv!12 thiss!1701) (invariant!0 (currentBit!14789 thiss!1701) (currentByte!14794 thiss!1701) (size!8879 (buf!8021 thiss!1701))))))

(declare-fun bs!27722 () Bool)

(assert (= bs!27722 d!105386))

(declare-fun m!459805 () Bool)

(assert (=> bs!27722 m!459805))

(assert (=> start!71384 d!105386))

(declare-fun d!105388 () Bool)

(assert (=> d!105388 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14789 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14794 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (size!8879 (buf!8021 thiss!1701))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14789 thiss!1701))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14789 thiss!1701))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14794 thiss!1701))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14794 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (size!8879 (buf!8021 thiss!1701))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14789 thiss!1701))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14794 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (size!8879 (buf!8021 thiss!1701)))))))))))

(assert (=> b!321462 d!105388))

(declare-fun d!105390 () Bool)

(assert (=> d!105390 (= (array_inv!8431 (buf!8021 thiss!1701)) (bvsge (size!8879 (buf!8021 thiss!1701)) #b00000000000000000000000000000000))))

(assert (=> b!321463 d!105390))

(check-sat (not d!105386))
(check-sat)
