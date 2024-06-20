; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51244 () Bool)

(assert start!51244)

(declare-fun res!199827 () Bool)

(declare-fun e!165318 () Bool)

(assert (=> start!51244 (=> (not res!199827) (not e!165318))))

(declare-datatypes ((array!12818 0))(
  ( (array!12819 (arr!6618 (Array (_ BitVec 32) (_ BitVec 8))) (size!5631 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10184 0))(
  ( (BitStream!10185 (buf!6085 array!12818) (currentByte!11279 (_ BitVec 32)) (currentBit!11274 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10184)

(assert (=> start!51244 (= res!199827 (and (bvsle ((_ sign_extend 32) (size!5631 (buf!6085 thiss!1857))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11279 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11274 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5631 (buf!6085 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11279 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11274 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51244 e!165318))

(declare-fun e!165319 () Bool)

(declare-fun inv!12 (BitStream!10184) Bool)

(assert (=> start!51244 (and (inv!12 thiss!1857) e!165319)))

(declare-fun b!239128 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239128 (= e!165318 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11274 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11279 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5631 (buf!6085 thiss!1857)))))))))

(declare-fun b!239129 () Bool)

(declare-fun array_inv!5372 (array!12818) Bool)

(assert (=> b!239129 (= e!165319 (array_inv!5372 (buf!6085 thiss!1857)))))

(assert (= (and start!51244 res!199827) b!239128))

(assert (= start!51244 b!239129))

(declare-fun m!361155 () Bool)

(assert (=> start!51244 m!361155))

(declare-fun m!361157 () Bool)

(assert (=> b!239128 m!361157))

(declare-fun m!361159 () Bool)

(assert (=> b!239129 m!361159))

(push 1)

(assert (not b!239129))

(assert (not b!239128))

(assert (not start!51244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80428 () Bool)

(assert (=> d!80428 (= (array_inv!5372 (buf!6085 thiss!1857)) (bvsge (size!5631 (buf!6085 thiss!1857)) #b00000000000000000000000000000000))))

(assert (=> b!239129 d!80428))

(declare-fun d!80434 () Bool)

(assert (=> d!80434 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11274 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11279 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5631 (buf!6085 thiss!1857))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11274 thiss!1857))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11274 thiss!1857))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11279 thiss!1857))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11279 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5631 (buf!6085 thiss!1857))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11274 thiss!1857))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11279 thiss!1857))) ((_ extract 31 0) ((_ sign_extend 32) (size!5631 (buf!6085 thiss!1857)))))))))))

(assert (=> b!239128 d!80434))

(declare-fun d!80438 () Bool)

(assert (=> d!80438 (= (inv!12 thiss!1857) (invariant!0 (currentBit!11274 thiss!1857) (currentByte!11279 thiss!1857) (size!5631 (buf!6085 thiss!1857))))))

