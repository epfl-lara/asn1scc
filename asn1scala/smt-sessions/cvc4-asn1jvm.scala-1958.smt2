; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50832 () Bool)

(assert start!50832)

(declare-fun b!237975 () Bool)

(declare-fun res!198912 () Bool)

(declare-fun e!164411 () Bool)

(assert (=> b!237975 (=> (not res!198912) (not e!164411))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237975 (= res!198912 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun res!198908 () Bool)

(assert (=> start!50832 (=> (not res!198908) (not e!164411))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> start!50832 (= res!198908 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50832 e!164411))

(assert (=> start!50832 true))

(declare-datatypes ((array!12677 0))(
  ( (array!12678 (arr!6555 (Array (_ BitVec 32) (_ BitVec 8))) (size!5568 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10100 0))(
  ( (BitStream!10101 (buf!6043 array!12677) (currentByte!11223 (_ BitVec 32)) (currentBit!11218 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10100)

(declare-fun e!164410 () Bool)

(declare-fun inv!12 (BitStream!10100) Bool)

(assert (=> start!50832 (and (inv!12 thiss!1830) e!164410)))

(declare-fun b!237976 () Bool)

(declare-fun res!198910 () Bool)

(assert (=> b!237976 (=> (not res!198910) (not e!164411))))

(assert (=> b!237976 (= res!198910 (not (= nBits!581 i!752)))))

(declare-fun b!237977 () Bool)

(declare-fun res!198909 () Bool)

(assert (=> b!237977 (=> (not res!198909) (not e!164411))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237977 (= res!198909 (validate_offset_bits!1 ((_ sign_extend 32) (size!5568 (buf!6043 thiss!1830))) ((_ sign_extend 32) (currentByte!11223 thiss!1830)) ((_ sign_extend 32) (currentBit!11218 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237978 () Bool)

(assert (=> b!237978 (= e!164411 (and (= (bvand i!752 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!752 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!20062 0))(
  ( (tuple2!20063 (_1!10935 Bool) (_2!10935 BitStream!10100)) )
))
(declare-fun lt!372930 () tuple2!20062)

(declare-fun readBit!0 (BitStream!10100) tuple2!20062)

(assert (=> b!237978 (= lt!372930 (readBit!0 thiss!1830))))

(declare-fun b!237979 () Bool)

(declare-fun array_inv!5309 (array!12677) Bool)

(assert (=> b!237979 (= e!164410 (array_inv!5309 (buf!6043 thiss!1830)))))

(declare-fun b!237980 () Bool)

(declare-fun res!198911 () Bool)

(assert (=> b!237980 (=> (not res!198911) (not e!164411))))

(assert (=> b!237980 (= res!198911 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50832 res!198908) b!237977))

(assert (= (and b!237977 res!198909) b!237980))

(assert (= (and b!237980 res!198911) b!237975))

(assert (= (and b!237975 res!198912) b!237976))

(assert (= (and b!237976 res!198910) b!237978))

(assert (= start!50832 b!237979))

(declare-fun m!360231 () Bool)

(assert (=> start!50832 m!360231))

(declare-fun m!360233 () Bool)

(assert (=> b!237980 m!360233))

(declare-fun m!360235 () Bool)

(assert (=> b!237979 m!360235))

(declare-fun m!360237 () Bool)

(assert (=> b!237977 m!360237))

(declare-fun m!360239 () Bool)

(assert (=> b!237978 m!360239))

(declare-fun m!360241 () Bool)

(assert (=> b!237975 m!360241))

(push 1)

(assert (not b!237979))

(assert (not start!50832))

(assert (not b!237978))

(assert (not b!237977))

(assert (not b!237975))

(assert (not b!237980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

