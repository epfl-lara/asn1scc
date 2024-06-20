; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50226 () Bool)

(assert start!50226)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-datatypes ((array!12438 0))(
  ( (array!12439 (arr!6451 (Array (_ BitVec 32) (_ BitVec 8))) (size!5464 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9892 0))(
  ( (BitStream!9893 (buf!5939 array!12438) (currentByte!11048 (_ BitVec 32)) (currentBit!11043 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9892)

(assert (=> start!50226 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!5464 (buf!5939 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11048 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11043 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!50226 true))

(declare-fun e!163030 () Bool)

(declare-fun inv!12 (BitStream!9892) Bool)

(assert (=> start!50226 (and (inv!12 thiss!1830) e!163030)))

(declare-fun b!235814 () Bool)

(declare-fun array_inv!5205 (array!12438) Bool)

(assert (=> b!235814 (= e!163030 (array_inv!5205 (buf!5939 thiss!1830)))))

(assert (= start!50226 b!235814))

(declare-fun m!358473 () Bool)

(assert (=> start!50226 m!358473))

(declare-fun m!358475 () Bool)

(assert (=> b!235814 m!358475))

(push 1)

(assert (not b!235814))

(assert (not start!50226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

