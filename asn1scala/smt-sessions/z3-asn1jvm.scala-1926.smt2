; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50266 () Bool)

(assert start!50266)

(declare-fun res!197138 () Bool)

(declare-fun e!163106 () Bool)

(assert (=> start!50266 (=> (not res!197138) (not e!163106))))

(declare-datatypes ((array!12462 0))(
  ( (array!12463 (arr!6461 (Array (_ BitVec 32) (_ BitVec 8))) (size!5474 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9912 0))(
  ( (BitStream!9913 (buf!5949 array!12462) (currentByte!11060 (_ BitVec 32)) (currentBit!11055 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9912)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50266 (= res!197138 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5474 (buf!5949 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11060 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11055 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5474 (buf!5949 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11060 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11055 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50266 e!163106))

(assert (=> start!50266 true))

(declare-fun e!163104 () Bool)

(declare-fun inv!12 (BitStream!9912) Bool)

(assert (=> start!50266 (and (inv!12 thiss!1830) e!163104)))

(declare-fun b!235863 () Bool)

(declare-fun res!197139 () Bool)

(assert (=> b!235863 (=> (not res!197139) (not e!163106))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235863 (= res!197139 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11055 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11060 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (size!5474 (buf!5949 thiss!1830))))))))

(declare-fun b!235864 () Bool)

(assert (=> b!235864 (= e!163106 (bvslt ((_ sign_extend 32) (bvsub nBits!581 i!752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235865 () Bool)

(declare-fun array_inv!5215 (array!12462) Bool)

(assert (=> b!235865 (= e!163104 (array_inv!5215 (buf!5949 thiss!1830)))))

(assert (= (and start!50266 res!197138) b!235863))

(assert (= (and b!235863 res!197139) b!235864))

(assert (= start!50266 b!235865))

(declare-fun m!358527 () Bool)

(assert (=> start!50266 m!358527))

(declare-fun m!358529 () Bool)

(assert (=> b!235863 m!358529))

(declare-fun m!358531 () Bool)

(assert (=> b!235865 m!358531))

(check-sat (not start!50266) (not b!235863) (not b!235865))
(check-sat)
