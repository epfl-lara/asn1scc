; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50252 () Bool)

(assert start!50252)

(declare-fun res!197127 () Bool)

(declare-fun e!163086 () Bool)

(assert (=> start!50252 (=> (not res!197127) (not e!163086))))

(declare-datatypes ((array!12456 0))(
  ( (array!12457 (arr!6459 (Array (_ BitVec 32) (_ BitVec 8))) (size!5472 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9908 0))(
  ( (BitStream!9909 (buf!5947 array!12456) (currentByte!11057 (_ BitVec 32)) (currentBit!11052 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9908)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50252 (= res!197127 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5472 (buf!5947 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11057 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11052 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5472 (buf!5947 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11057 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11052 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50252 e!163086))

(assert (=> start!50252 true))

(declare-fun e!163087 () Bool)

(declare-fun inv!12 (BitStream!9908) Bool)

(assert (=> start!50252 (and (inv!12 thiss!1830) e!163087)))

(declare-fun b!235846 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235846 (= e!163086 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11052 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11057 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (size!5472 (buf!5947 thiss!1830)))))))))

(declare-fun b!235847 () Bool)

(declare-fun array_inv!5213 (array!12456) Bool)

(assert (=> b!235847 (= e!163087 (array_inv!5213 (buf!5947 thiss!1830)))))

(assert (= (and start!50252 res!197127) b!235846))

(assert (= start!50252 b!235847))

(declare-fun m!358513 () Bool)

(assert (=> start!50252 m!358513))

(declare-fun m!358515 () Bool)

(assert (=> b!235846 m!358515))

(declare-fun m!358517 () Bool)

(assert (=> b!235847 m!358517))

(push 1)

(assert (not start!50252))

(assert (not b!235846))

(assert (not b!235847))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

