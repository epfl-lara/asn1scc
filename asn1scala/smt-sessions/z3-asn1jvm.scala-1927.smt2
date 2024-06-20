; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50272 () Bool)

(assert start!50272)

(declare-fun res!197157 () Bool)

(declare-fun e!163131 () Bool)

(assert (=> start!50272 (=> (not res!197157) (not e!163131))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50272 (= res!197157 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50272 e!163131))

(assert (=> start!50272 true))

(declare-datatypes ((array!12468 0))(
  ( (array!12469 (arr!6464 (Array (_ BitVec 32) (_ BitVec 8))) (size!5477 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9918 0))(
  ( (BitStream!9919 (buf!5952 array!12468) (currentByte!11063 (_ BitVec 32)) (currentBit!11058 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9918)

(declare-fun e!163132 () Bool)

(declare-fun inv!12 (BitStream!9918) Bool)

(assert (=> start!50272 (and (inv!12 thiss!1830) e!163132)))

(declare-fun b!235890 () Bool)

(declare-fun res!197156 () Bool)

(assert (=> b!235890 (=> (not res!197156) (not e!163131))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235890 (= res!197156 (validate_offset_bits!1 ((_ sign_extend 32) (size!5477 (buf!5952 thiss!1830))) ((_ sign_extend 32) (currentByte!11063 thiss!1830)) ((_ sign_extend 32) (currentBit!11058 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!235891 () Bool)

(assert (=> b!235891 (= e!163131 (bvsgt (bvsub nBits!581 i!752) #b00000000000000000000000001000000))))

(declare-fun b!235892 () Bool)

(declare-fun array_inv!5218 (array!12468) Bool)

(assert (=> b!235892 (= e!163132 (array_inv!5218 (buf!5952 thiss!1830)))))

(assert (= (and start!50272 res!197157) b!235890))

(assert (= (and b!235890 res!197156) b!235891))

(assert (= start!50272 b!235892))

(declare-fun m!358545 () Bool)

(assert (=> start!50272 m!358545))

(declare-fun m!358547 () Bool)

(assert (=> b!235890 m!358547))

(declare-fun m!358549 () Bool)

(assert (=> b!235892 m!358549))

(check-sat (not b!235890) (not b!235892) (not start!50272))
(check-sat)
