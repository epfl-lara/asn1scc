; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51222 () Bool)

(assert start!51222)

(declare-datatypes ((array!12809 0))(
  ( (array!12810 (arr!6615 (Array (_ BitVec 32) (_ BitVec 8))) (size!5628 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10178 0))(
  ( (BitStream!10179 (buf!6082 array!12809) (currentByte!11274 (_ BitVec 32)) (currentBit!11269 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10178)

(assert (=> start!51222 (and (bvsle ((_ sign_extend 32) (size!5628 (buf!6082 thiss!1857))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11274 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11269 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5628 (buf!6082 thiss!1857))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11274 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11269 thiss!1857)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!165292 () Bool)

(declare-fun inv!12 (BitStream!10178) Bool)

(assert (=> start!51222 (and (inv!12 thiss!1857) e!165292)))

(declare-fun b!239111 () Bool)

(declare-fun array_inv!5369 (array!12809) Bool)

(assert (=> b!239111 (= e!165292 (array_inv!5369 (buf!6082 thiss!1857)))))

(assert (= start!51222 b!239111))

(declare-fun m!361133 () Bool)

(assert (=> start!51222 m!361133))

(declare-fun m!361135 () Bool)

(assert (=> b!239111 m!361135))

(push 1)

(assert (not start!51222))

(assert (not b!239111))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

