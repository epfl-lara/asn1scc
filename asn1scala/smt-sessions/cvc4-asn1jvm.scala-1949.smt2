; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50778 () Bool)

(assert start!50778)

(declare-fun res!198480 () Bool)

(declare-fun e!164148 () Bool)

(assert (=> start!50778 (=> (not res!198480) (not e!164148))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50778 (= res!198480 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50778 e!164148))

(assert (=> start!50778 true))

(declare-datatypes ((array!12623 0))(
  ( (array!12624 (arr!6528 (Array (_ BitVec 32) (_ BitVec 8))) (size!5541 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10046 0))(
  ( (BitStream!10047 (buf!6016 array!12623) (currentByte!11196 (_ BitVec 32)) (currentBit!11191 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10046)

(declare-fun e!164147 () Bool)

(declare-fun inv!12 (BitStream!10046) Bool)

(assert (=> start!50778 (and (inv!12 thiss!1830) e!164147)))

(declare-fun b!237462 () Bool)

(declare-fun array_inv!5282 (array!12623) Bool)

(assert (=> b!237462 (= e!164147 (array_inv!5282 (buf!6016 thiss!1830)))))

(declare-fun b!237463 () Bool)

(declare-fun res!198476 () Bool)

(declare-fun e!164149 () Bool)

(assert (=> b!237463 (=> (not res!198476) (not e!164149))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237463 (= res!198476 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!372839 () (_ BitVec 64))

(declare-fun lt!372840 () (_ BitVec 64))

(declare-fun b!237464 () Bool)

(assert (=> b!237464 (= e!164149 (and (= lt!372839 (bvadd lt!372839 lt!372840)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237464 (= lt!372839 (bitIndex!0 (size!5541 (buf!6016 thiss!1830)) (currentByte!11196 thiss!1830) (currentBit!11191 thiss!1830)))))

(declare-fun b!237465 () Bool)

(assert (=> b!237465 (= e!164148 e!164149)))

(declare-fun res!198477 () Bool)

(assert (=> b!237465 (=> (not res!198477) (not e!164149))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237465 (= res!198477 (validate_offset_bits!1 ((_ sign_extend 32) (size!5541 (buf!6016 thiss!1830))) ((_ sign_extend 32) (currentByte!11196 thiss!1830)) ((_ sign_extend 32) (currentBit!11191 thiss!1830)) lt!372840))))

(assert (=> b!237465 (= lt!372840 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237466 () Bool)

(declare-fun res!198478 () Bool)

(assert (=> b!237466 (=> (not res!198478) (not e!164149))))

(assert (=> b!237466 (= res!198478 (= nBits!581 i!752))))

(declare-fun b!237467 () Bool)

(declare-fun res!198479 () Bool)

(assert (=> b!237467 (=> (not res!198479) (not e!164149))))

(assert (=> b!237467 (= res!198479 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50778 res!198480) b!237465))

(assert (= (and b!237465 res!198477) b!237463))

(assert (= (and b!237463 res!198476) b!237467))

(assert (= (and b!237467 res!198479) b!237466))

(assert (= (and b!237466 res!198478) b!237464))

(assert (= start!50778 b!237462))

(declare-fun m!359907 () Bool)

(assert (=> b!237463 m!359907))

(declare-fun m!359909 () Bool)

(assert (=> start!50778 m!359909))

(declare-fun m!359911 () Bool)

(assert (=> b!237465 m!359911))

(declare-fun m!359913 () Bool)

(assert (=> b!237464 m!359913))

(declare-fun m!359915 () Bool)

(assert (=> b!237462 m!359915))

(declare-fun m!359917 () Bool)

(assert (=> b!237467 m!359917))

(push 1)

(assert (not b!237464))

(assert (not b!237463))

(assert (not b!237465))

(assert (not b!237467))

(assert (not start!50778))

(assert (not b!237462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

