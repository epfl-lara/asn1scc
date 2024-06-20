; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51240 () Bool)

(assert start!51240)

(declare-fun res!199821 () Bool)

(declare-fun e!165300 () Bool)

(assert (=> start!51240 (=> (not res!199821) (not e!165300))))

(declare-datatypes ((array!12814 0))(
  ( (array!12815 (arr!6616 (Array (_ BitVec 32) (_ BitVec 8))) (size!5629 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10180 0))(
  ( (BitStream!10181 (buf!6083 array!12814) (currentByte!11277 (_ BitVec 32)) (currentBit!11272 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10180)

(assert (=> start!51240 (= res!199821 (and (bvsle ((_ sign_extend 32) (size!5629 (buf!6083 thiss!1857))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11277 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11272 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5629 (buf!6083 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11277 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11272 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51240 e!165300))

(declare-fun e!165301 () Bool)

(declare-fun inv!12 (BitStream!10180) Bool)

(assert (=> start!51240 (and (inv!12 thiss!1857) e!165301)))

(declare-fun b!239116 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239116 (= e!165300 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11272 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11277 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5629 (buf!6083 thiss!1857)))))))))

(declare-fun b!239117 () Bool)

(declare-fun array_inv!5370 (array!12814) Bool)

(assert (=> b!239117 (= e!165301 (array_inv!5370 (buf!6083 thiss!1857)))))

(assert (= (and start!51240 res!199821) b!239116))

(assert (= start!51240 b!239117))

(declare-fun m!361143 () Bool)

(assert (=> start!51240 m!361143))

(declare-fun m!361145 () Bool)

(assert (=> b!239116 m!361145))

(declare-fun m!361147 () Bool)

(assert (=> b!239117 m!361147))

(push 1)

(assert (not start!51240))

(assert (not b!239117))

(assert (not b!239116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80426 () Bool)

(assert (=> d!80426 (= (inv!12 thiss!1857) (invariant!0 (currentBit!11272 thiss!1857) (currentByte!11277 thiss!1857) (size!5629 (buf!6083 thiss!1857))))))

(declare-fun bs!20207 () Bool)

(assert (= bs!20207 d!80426))

(declare-fun m!361161 () Bool)

(assert (=> bs!20207 m!361161))

(assert (=> start!51240 d!80426))

(declare-fun d!80430 () Bool)

(assert (=> d!80430 (= (array_inv!5370 (buf!6083 thiss!1857)) (bvsge (size!5629 (buf!6083 thiss!1857)) #b00000000000000000000000000000000))))

(assert (=> b!239117 d!80430))

(declare-fun d!80432 () Bool)

(assert (=> d!80432 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11272 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11277 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5629 (buf!6083 thiss!1857))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11272 thiss!1857))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11272 thiss!1857))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11277 thiss!1857))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11277 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5629 (buf!6083 thiss!1857))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11272 thiss!1857))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11277 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5629 (buf!6083 thiss!1857)))))))))))

(assert (=> b!239116 d!80432))

(push 1)

(assert (not d!80426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

