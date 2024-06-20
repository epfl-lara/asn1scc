; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50766 () Bool)

(assert start!50766)

(declare-fun b!237354 () Bool)

(declare-fun res!198390 () Bool)

(declare-fun e!164075 () Bool)

(assert (=> b!237354 (=> (not res!198390) (not e!164075))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237354 (= res!198390 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237355 () Bool)

(declare-fun res!198387 () Bool)

(assert (=> b!237355 (=> (not res!198387) (not e!164075))))

(assert (=> b!237355 (= res!198387 (= nBits!581 i!752))))

(declare-fun b!237356 () Bool)

(declare-fun lt!372803 () (_ BitVec 64))

(declare-fun lt!372804 () (_ BitVec 64))

(assert (=> b!237356 (= e!164075 (and (= lt!372803 (bvadd lt!372803 lt!372804)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-datatypes ((array!12611 0))(
  ( (array!12612 (arr!6522 (Array (_ BitVec 32) (_ BitVec 8))) (size!5535 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10034 0))(
  ( (BitStream!10035 (buf!6010 array!12611) (currentByte!11190 (_ BitVec 32)) (currentBit!11185 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10034)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237356 (= lt!372803 (bitIndex!0 (size!5535 (buf!6010 thiss!1830)) (currentByte!11190 thiss!1830) (currentBit!11185 thiss!1830)))))

(declare-fun res!198386 () Bool)

(declare-fun e!164077 () Bool)

(assert (=> start!50766 (=> (not res!198386) (not e!164077))))

(assert (=> start!50766 (= res!198386 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50766 e!164077))

(assert (=> start!50766 true))

(declare-fun e!164078 () Bool)

(declare-fun inv!12 (BitStream!10034) Bool)

(assert (=> start!50766 (and (inv!12 thiss!1830) e!164078)))

(declare-fun b!237357 () Bool)

(assert (=> b!237357 (= e!164077 e!164075)))

(declare-fun res!198389 () Bool)

(assert (=> b!237357 (=> (not res!198389) (not e!164075))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237357 (= res!198389 (validate_offset_bits!1 ((_ sign_extend 32) (size!5535 (buf!6010 thiss!1830))) ((_ sign_extend 32) (currentByte!11190 thiss!1830)) ((_ sign_extend 32) (currentBit!11185 thiss!1830)) lt!372804))))

(assert (=> b!237357 (= lt!372804 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237358 () Bool)

(declare-fun array_inv!5276 (array!12611) Bool)

(assert (=> b!237358 (= e!164078 (array_inv!5276 (buf!6010 thiss!1830)))))

(declare-fun b!237359 () Bool)

(declare-fun res!198388 () Bool)

(assert (=> b!237359 (=> (not res!198388) (not e!164075))))

(assert (=> b!237359 (= res!198388 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50766 res!198386) b!237357))

(assert (= (and b!237357 res!198389) b!237354))

(assert (= (and b!237354 res!198390) b!237359))

(assert (= (and b!237359 res!198388) b!237355))

(assert (= (and b!237355 res!198387) b!237356))

(assert (= start!50766 b!237358))

(declare-fun m!359835 () Bool)

(assert (=> b!237357 m!359835))

(declare-fun m!359837 () Bool)

(assert (=> b!237354 m!359837))

(declare-fun m!359839 () Bool)

(assert (=> start!50766 m!359839))

(declare-fun m!359841 () Bool)

(assert (=> b!237359 m!359841))

(declare-fun m!359843 () Bool)

(assert (=> b!237356 m!359843))

(declare-fun m!359845 () Bool)

(assert (=> b!237358 m!359845))

(push 1)

