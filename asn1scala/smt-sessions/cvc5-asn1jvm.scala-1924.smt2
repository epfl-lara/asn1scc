; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50232 () Bool)

(assert start!50232)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-datatypes ((array!12444 0))(
  ( (array!12445 (arr!6454 (Array (_ BitVec 32) (_ BitVec 8))) (size!5467 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9898 0))(
  ( (BitStream!9899 (buf!5942 array!12444) (currentByte!11051 (_ BitVec 32)) (currentBit!11046 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9898)

(assert (=> start!50232 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5467 (buf!5942 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11051 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11046 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5467 (buf!5942 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11051 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11046 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50232 true))

(declare-fun e!163048 () Bool)

(declare-fun inv!12 (BitStream!9898) Bool)

(assert (=> start!50232 (and (inv!12 thiss!1830) e!163048)))

(declare-fun b!235823 () Bool)

(declare-fun array_inv!5208 (array!12444) Bool)

(assert (=> b!235823 (= e!163048 (array_inv!5208 (buf!5942 thiss!1830)))))

(assert (= start!50232 b!235823))

(declare-fun m!358485 () Bool)

(assert (=> start!50232 m!358485))

(declare-fun m!358487 () Bool)

(assert (=> b!235823 m!358487))

(push 1)

(assert (not b!235823))

(assert (not start!50232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79582 () Bool)

(assert (=> d!79582 (= (array_inv!5208 (buf!5942 thiss!1830)) (bvsge (size!5467 (buf!5942 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!235823 d!79582))

(declare-fun d!79584 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79584 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11046 thiss!1830) (currentByte!11051 thiss!1830) (size!5467 (buf!5942 thiss!1830))))))

(declare-fun bs!19857 () Bool)

