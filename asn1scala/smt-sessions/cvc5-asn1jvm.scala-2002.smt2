; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51218 () Bool)

(assert start!51218)

(declare-datatypes ((array!12805 0))(
  ( (array!12806 (arr!6613 (Array (_ BitVec 32) (_ BitVec 8))) (size!5626 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10174 0))(
  ( (BitStream!10175 (buf!6080 array!12805) (currentByte!11272 (_ BitVec 32)) (currentBit!11267 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10174)

(assert (=> start!51218 (and (bvsle ((_ sign_extend 32) (size!5626 (buf!6080 thiss!1857))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11272 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11267 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5626 (buf!6080 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11272 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11267 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!165280 () Bool)

(declare-fun inv!12 (BitStream!10174) Bool)

(assert (=> start!51218 (and (inv!12 thiss!1857) e!165280)))

(declare-fun b!239105 () Bool)

(declare-fun array_inv!5367 (array!12805) Bool)

(assert (=> b!239105 (= e!165280 (array_inv!5367 (buf!6080 thiss!1857)))))

(assert (= start!51218 b!239105))

(declare-fun m!361125 () Bool)

(assert (=> start!51218 m!361125))

(declare-fun m!361127 () Bool)

(assert (=> b!239105 m!361127))

(push 1)

(assert (not b!239105))

(assert (not start!51218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80410 () Bool)

(assert (=> d!80410 (= (array_inv!5367 (buf!6080 thiss!1857)) (bvsge (size!5626 (buf!6080 thiss!1857)) #b00000000000000000000000000000000))))

(assert (=> b!239105 d!80410))

(declare-fun d!80412 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80412 (= (inv!12 thiss!1857) (invariant!0 (currentBit!11267 thiss!1857) (currentByte!11272 thiss!1857) (size!5626 (buf!6080 thiss!1857))))))

(declare-fun bs!20202 () Bool)

(assert (= bs!20202 d!80412))

(declare-fun m!361139 () Bool)

(assert (=> bs!20202 m!361139))

(assert (=> start!51218 d!80412))

(push 1)

(assert (not d!80412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

