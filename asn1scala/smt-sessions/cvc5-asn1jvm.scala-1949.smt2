; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50774 () Bool)

(assert start!50774)

(declare-fun b!237426 () Bool)

(declare-fun e!164124 () Bool)

(declare-datatypes ((array!12619 0))(
  ( (array!12620 (arr!6526 (Array (_ BitVec 32) (_ BitVec 8))) (size!5539 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10042 0))(
  ( (BitStream!10043 (buf!6014 array!12619) (currentByte!11194 (_ BitVec 32)) (currentBit!11189 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10042)

(declare-fun array_inv!5280 (array!12619) Bool)

(assert (=> b!237426 (= e!164124 (array_inv!5280 (buf!6014 thiss!1830)))))

(declare-fun b!237427 () Bool)

(declare-fun res!198449 () Bool)

(declare-fun e!164123 () Bool)

(assert (=> b!237427 (=> (not res!198449) (not e!164123))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237427 (= res!198449 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun res!198448 () Bool)

(declare-fun e!164125 () Bool)

(assert (=> start!50774 (=> (not res!198448) (not e!164125))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> start!50774 (= res!198448 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50774 e!164125))

(assert (=> start!50774 true))

(declare-fun inv!12 (BitStream!10042) Bool)

(assert (=> start!50774 (and (inv!12 thiss!1830) e!164124)))

(declare-fun b!237428 () Bool)

(declare-fun res!198450 () Bool)

(assert (=> b!237428 (=> (not res!198450) (not e!164123))))

(assert (=> b!237428 (= res!198450 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!372827 () (_ BitVec 64))

(declare-fun lt!372828 () (_ BitVec 64))

(declare-fun b!237429 () Bool)

(assert (=> b!237429 (= e!164123 (and (= lt!372827 (bvadd lt!372827 lt!372828)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237429 (= lt!372827 (bitIndex!0 (size!5539 (buf!6014 thiss!1830)) (currentByte!11194 thiss!1830) (currentBit!11189 thiss!1830)))))

(declare-fun b!237430 () Bool)

(assert (=> b!237430 (= e!164125 e!164123)))

(declare-fun res!198447 () Bool)

(assert (=> b!237430 (=> (not res!198447) (not e!164123))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237430 (= res!198447 (validate_offset_bits!1 ((_ sign_extend 32) (size!5539 (buf!6014 thiss!1830))) ((_ sign_extend 32) (currentByte!11194 thiss!1830)) ((_ sign_extend 32) (currentBit!11189 thiss!1830)) lt!372828))))

(assert (=> b!237430 (= lt!372828 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237431 () Bool)

(declare-fun res!198446 () Bool)

(assert (=> b!237431 (=> (not res!198446) (not e!164123))))

(assert (=> b!237431 (= res!198446 (= nBits!581 i!752))))

(assert (= (and start!50774 res!198448) b!237430))

(assert (= (and b!237430 res!198447) b!237428))

(assert (= (and b!237428 res!198450) b!237427))

(assert (= (and b!237427 res!198449) b!237431))

(assert (= (and b!237431 res!198446) b!237429))

(assert (= start!50774 b!237426))

(declare-fun m!359883 () Bool)

(assert (=> b!237430 m!359883))

(declare-fun m!359885 () Bool)

(assert (=> b!237428 m!359885))

(declare-fun m!359887 () Bool)

(assert (=> start!50774 m!359887))

(declare-fun m!359889 () Bool)

(assert (=> b!237426 m!359889))

(declare-fun m!359891 () Bool)

(assert (=> b!237429 m!359891))

(declare-fun m!359893 () Bool)

(assert (=> b!237427 m!359893))

(push 1)

(assert (not b!237426))

(assert (not b!237430))

(assert (not b!237429))

(assert (not start!50774))

(assert (not b!237428))

(assert (not b!237427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

