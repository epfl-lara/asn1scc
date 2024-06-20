; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50228 () Bool)

(assert start!50228)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-datatypes ((array!12440 0))(
  ( (array!12441 (arr!6452 (Array (_ BitVec 32) (_ BitVec 8))) (size!5465 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9894 0))(
  ( (BitStream!9895 (buf!5940 array!12440) (currentByte!11049 (_ BitVec 32)) (currentBit!11044 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9894)

(assert (=> start!50228 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!5465 (buf!5940 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11049 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11044 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!50228 true))

(declare-fun e!163036 () Bool)

(declare-fun inv!12 (BitStream!9894) Bool)

(assert (=> start!50228 (and (inv!12 thiss!1830) e!163036)))

(declare-fun b!235817 () Bool)

(declare-fun array_inv!5206 (array!12440) Bool)

(assert (=> b!235817 (= e!163036 (array_inv!5206 (buf!5940 thiss!1830)))))

(assert (= start!50228 b!235817))

(declare-fun m!358477 () Bool)

(assert (=> start!50228 m!358477))

(declare-fun m!358479 () Bool)

(assert (=> b!235817 m!358479))

(check-sat (not b!235817) (not start!50228))
(check-sat)
