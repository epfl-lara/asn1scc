; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51220 () Bool)

(assert start!51220)

(declare-datatypes ((array!12807 0))(
  ( (array!12808 (arr!6614 (Array (_ BitVec 32) (_ BitVec 8))) (size!5627 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10176 0))(
  ( (BitStream!10177 (buf!6081 array!12807) (currentByte!11273 (_ BitVec 32)) (currentBit!11268 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10176)

(assert (=> start!51220 (and (bvsle ((_ sign_extend 32) (size!5627 (buf!6081 thiss!1857))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11273 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11268 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5627 (buf!6081 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11273 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11268 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!165286 () Bool)

(declare-fun inv!12 (BitStream!10176) Bool)

(assert (=> start!51220 (and (inv!12 thiss!1857) e!165286)))

(declare-fun b!239108 () Bool)

(declare-fun array_inv!5368 (array!12807) Bool)

(assert (=> b!239108 (= e!165286 (array_inv!5368 (buf!6081 thiss!1857)))))

(assert (= start!51220 b!239108))

(declare-fun m!361129 () Bool)

(assert (=> start!51220 m!361129))

(declare-fun m!361131 () Bool)

(assert (=> b!239108 m!361131))

(check-sat (not start!51220) (not b!239108))
(check-sat)
(get-model)

(declare-fun d!80406 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80406 (= (inv!12 thiss!1857) (invariant!0 (currentBit!11268 thiss!1857) (currentByte!11273 thiss!1857) (size!5627 (buf!6081 thiss!1857))))))

(declare-fun bs!20201 () Bool)

(assert (= bs!20201 d!80406))

(declare-fun m!361137 () Bool)

(assert (=> bs!20201 m!361137))

(assert (=> start!51220 d!80406))

(declare-fun d!80408 () Bool)

(assert (=> d!80408 (= (array_inv!5368 (buf!6081 thiss!1857)) (bvsge (size!5627 (buf!6081 thiss!1857)) #b00000000000000000000000000000000))))

(assert (=> b!239108 d!80408))

(check-sat (not d!80406))
(check-sat)
(get-model)

(declare-fun d!80414 () Bool)

(assert (=> d!80414 (= (invariant!0 (currentBit!11268 thiss!1857) (currentByte!11273 thiss!1857) (size!5627 (buf!6081 thiss!1857))) (and (bvsge (currentBit!11268 thiss!1857) #b00000000000000000000000000000000) (bvslt (currentBit!11268 thiss!1857) #b00000000000000000000000000001000) (bvsge (currentByte!11273 thiss!1857) #b00000000000000000000000000000000) (or (bvslt (currentByte!11273 thiss!1857) (size!5627 (buf!6081 thiss!1857))) (and (= (currentBit!11268 thiss!1857) #b00000000000000000000000000000000) (= (currentByte!11273 thiss!1857) (size!5627 (buf!6081 thiss!1857)))))))))

(assert (=> d!80406 d!80414))

(check-sat)
