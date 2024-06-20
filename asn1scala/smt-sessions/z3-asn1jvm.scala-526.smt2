; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15270 () Bool)

(assert start!15270)

(declare-fun res!64339 () Bool)

(declare-fun e!51112 () Bool)

(assert (=> start!15270 (=> (not res!64339) (not e!51112))))

(declare-fun bitNr!1 () (_ BitVec 32))

(declare-datatypes ((array!3310 0))(
  ( (array!3311 (arr!2137 (Array (_ BitVec 32) (_ BitVec 8))) (size!1536 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2634 0))(
  ( (BitStream!2635 (buf!1926 array!3310) (currentByte!3744 (_ BitVec 32)) (currentBit!3739 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2634)

(assert (=> start!15270 (= res!64339 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!1536 (buf!1926 thiss!1107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3744 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3739 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1536 (buf!1926 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3744 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3739 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15270 e!51112))

(assert (=> start!15270 true))

(declare-fun e!51113 () Bool)

(declare-fun inv!12 (BitStream!2634) Bool)

(assert (=> start!15270 (and (inv!12 thiss!1107) e!51113)))

(declare-fun b!77909 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!77909 (= e!51112 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3739 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3744 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (size!1536 (buf!1926 thiss!1107)))))))))

(declare-fun b!77910 () Bool)

(declare-fun array_inv!1382 (array!3310) Bool)

(assert (=> b!77910 (= e!51113 (array_inv!1382 (buf!1926 thiss!1107)))))

(assert (= (and start!15270 res!64339) b!77909))

(assert (= start!15270 b!77910))

(declare-fun m!123539 () Bool)

(assert (=> start!15270 m!123539))

(declare-fun m!123541 () Bool)

(assert (=> b!77909 m!123541))

(declare-fun m!123543 () Bool)

(assert (=> b!77910 m!123543))

(check-sat (not b!77909) (not b!77910) (not start!15270))
(check-sat)
(get-model)

(declare-fun d!24564 () Bool)

(assert (=> d!24564 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3739 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3744 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (size!1536 (buf!1926 thiss!1107))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3739 thiss!1107))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3739 thiss!1107))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3744 thiss!1107))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3744 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (size!1536 (buf!1926 thiss!1107))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3739 thiss!1107))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3744 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (size!1536 (buf!1926 thiss!1107)))))))))))

(assert (=> b!77909 d!24564))

(declare-fun d!24566 () Bool)

(assert (=> d!24566 (= (array_inv!1382 (buf!1926 thiss!1107)) (bvsge (size!1536 (buf!1926 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!77910 d!24566))

(declare-fun d!24568 () Bool)

(assert (=> d!24568 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3739 thiss!1107) (currentByte!3744 thiss!1107) (size!1536 (buf!1926 thiss!1107))))))

(declare-fun bs!5971 () Bool)

(assert (= bs!5971 d!24568))

(declare-fun m!123551 () Bool)

(assert (=> bs!5971 m!123551))

(assert (=> start!15270 d!24568))

(check-sat (not d!24568))
(check-sat)
