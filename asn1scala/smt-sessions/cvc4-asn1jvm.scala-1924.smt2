; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50236 () Bool)

(assert start!50236)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-datatypes ((array!12448 0))(
  ( (array!12449 (arr!6456 (Array (_ BitVec 32) (_ BitVec 8))) (size!5469 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9902 0))(
  ( (BitStream!9903 (buf!5944 array!12448) (currentByte!11053 (_ BitVec 32)) (currentBit!11048 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9902)

(assert (=> start!50236 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5469 (buf!5944 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11053 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11048 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5469 (buf!5944 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11053 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11048 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50236 true))

(declare-fun e!163060 () Bool)

(declare-fun inv!12 (BitStream!9902) Bool)

(assert (=> start!50236 (and (inv!12 thiss!1830) e!163060)))

(declare-fun b!235829 () Bool)

(declare-fun array_inv!5210 (array!12448) Bool)

(assert (=> b!235829 (= e!163060 (array_inv!5210 (buf!5944 thiss!1830)))))

(assert (= start!50236 b!235829))

(declare-fun m!358493 () Bool)

(assert (=> start!50236 m!358493))

(declare-fun m!358495 () Bool)

(assert (=> b!235829 m!358495))

(push 1)

(assert (not start!50236))

(assert (not b!235829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

