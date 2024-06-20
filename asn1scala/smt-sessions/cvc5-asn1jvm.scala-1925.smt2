; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50248 () Bool)

(assert start!50248)

(declare-fun res!197121 () Bool)

(declare-fun e!163068 () Bool)

(assert (=> start!50248 (=> (not res!197121) (not e!163068))))

(declare-datatypes ((array!12452 0))(
  ( (array!12453 (arr!6457 (Array (_ BitVec 32) (_ BitVec 8))) (size!5470 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9904 0))(
  ( (BitStream!9905 (buf!5945 array!12452) (currentByte!11055 (_ BitVec 32)) (currentBit!11050 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9904)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50248 (= res!197121 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5470 (buf!5945 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11055 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11050 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5470 (buf!5945 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11055 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11050 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50248 e!163068))

(assert (=> start!50248 true))

(declare-fun e!163069 () Bool)

(declare-fun inv!12 (BitStream!9904) Bool)

(assert (=> start!50248 (and (inv!12 thiss!1830) e!163069)))

(declare-fun b!235834 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235834 (= e!163068 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11050 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11055 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (size!5470 (buf!5945 thiss!1830)))))))))

(declare-fun b!235835 () Bool)

(declare-fun array_inv!5211 (array!12452) Bool)

(assert (=> b!235835 (= e!163069 (array_inv!5211 (buf!5945 thiss!1830)))))

(assert (= (and start!50248 res!197121) b!235834))

(assert (= start!50248 b!235835))

(declare-fun m!358501 () Bool)

(assert (=> start!50248 m!358501))

(declare-fun m!358503 () Bool)

(assert (=> b!235834 m!358503))

(declare-fun m!358505 () Bool)

(assert (=> b!235835 m!358505))

(push 1)

(assert (not b!235835))

(assert (not start!50248))

(assert (not b!235834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

