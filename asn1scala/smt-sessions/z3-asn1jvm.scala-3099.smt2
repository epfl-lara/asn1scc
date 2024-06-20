; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71364 () Bool)

(assert start!71364)

(declare-datatypes ((array!20381 0))(
  ( (array!20382 (arr!9968 (Array (_ BitVec 32) (_ BitVec 8))) (size!8876 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13914 0))(
  ( (BitStream!13915 (buf!8018 array!20381) (currentByte!14789 (_ BitVec 32)) (currentBit!14784 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13914)

(assert (=> start!71364 (and (bvsle ((_ sign_extend 32) (size!8876 (buf!8018 thiss!1701))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14789 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14784 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8876 (buf!8018 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14789 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14784 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!231503 () Bool)

(declare-fun inv!12 (BitStream!13914) Bool)

(assert (=> start!71364 (and (inv!12 thiss!1701) e!231503)))

(declare-fun b!321448 () Bool)

(declare-fun array_inv!8428 (array!20381) Bool)

(assert (=> b!321448 (= e!231503 (array_inv!8428 (buf!8018 thiss!1701)))))

(assert (= start!71364 b!321448))

(declare-fun m!459775 () Bool)

(assert (=> start!71364 m!459775))

(declare-fun m!459777 () Bool)

(assert (=> b!321448 m!459777))

(check-sat (not start!71364) (not b!321448))
(check-sat)
(get-model)

(declare-fun d!105370 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105370 (= (inv!12 thiss!1701) (invariant!0 (currentBit!14784 thiss!1701) (currentByte!14789 thiss!1701) (size!8876 (buf!8018 thiss!1701))))))

(declare-fun bs!27717 () Bool)

(assert (= bs!27717 d!105370))

(declare-fun m!459783 () Bool)

(assert (=> bs!27717 m!459783))

(assert (=> start!71364 d!105370))

(declare-fun d!105372 () Bool)

(assert (=> d!105372 (= (array_inv!8428 (buf!8018 thiss!1701)) (bvsge (size!8876 (buf!8018 thiss!1701)) #b00000000000000000000000000000000))))

(assert (=> b!321448 d!105372))

(check-sat (not d!105370))
(check-sat)
(get-model)

(declare-fun d!105378 () Bool)

(assert (=> d!105378 (= (invariant!0 (currentBit!14784 thiss!1701) (currentByte!14789 thiss!1701) (size!8876 (buf!8018 thiss!1701))) (and (bvsge (currentBit!14784 thiss!1701) #b00000000000000000000000000000000) (bvslt (currentBit!14784 thiss!1701) #b00000000000000000000000000001000) (bvsge (currentByte!14789 thiss!1701) #b00000000000000000000000000000000) (or (bvslt (currentByte!14789 thiss!1701) (size!8876 (buf!8018 thiss!1701))) (and (= (currentBit!14784 thiss!1701) #b00000000000000000000000000000000) (= (currentByte!14789 thiss!1701) (size!8876 (buf!8018 thiss!1701)))))))))

(assert (=> d!105370 d!105378))

(check-sat)
