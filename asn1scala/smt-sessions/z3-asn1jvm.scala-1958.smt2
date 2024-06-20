; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50830 () Bool)

(assert start!50830)

(declare-fun b!237957 () Bool)

(declare-fun res!198897 () Bool)

(declare-fun e!164402 () Bool)

(assert (=> b!237957 (=> (not res!198897) (not e!164402))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237957 (= res!198897 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun res!198894 () Bool)

(assert (=> start!50830 (=> (not res!198894) (not e!164402))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> start!50830 (= res!198894 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50830 e!164402))

(assert (=> start!50830 true))

(declare-datatypes ((array!12675 0))(
  ( (array!12676 (arr!6554 (Array (_ BitVec 32) (_ BitVec 8))) (size!5567 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10098 0))(
  ( (BitStream!10099 (buf!6042 array!12675) (currentByte!11222 (_ BitVec 32)) (currentBit!11217 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10098)

(declare-fun e!164400 () Bool)

(declare-fun inv!12 (BitStream!10098) Bool)

(assert (=> start!50830 (and (inv!12 thiss!1830) e!164400)))

(declare-fun b!237958 () Bool)

(declare-fun res!198893 () Bool)

(assert (=> b!237958 (=> (not res!198893) (not e!164402))))

(assert (=> b!237958 (= res!198893 (not (= nBits!581 i!752)))))

(declare-fun b!237959 () Bool)

(assert (=> b!237959 (= e!164402 (and (= (bvand i!752 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!752 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!20060 0))(
  ( (tuple2!20061 (_1!10934 Bool) (_2!10934 BitStream!10098)) )
))
(declare-fun lt!372927 () tuple2!20060)

(declare-fun readBit!0 (BitStream!10098) tuple2!20060)

(assert (=> b!237959 (= lt!372927 (readBit!0 thiss!1830))))

(declare-fun b!237960 () Bool)

(declare-fun res!198896 () Bool)

(assert (=> b!237960 (=> (not res!198896) (not e!164402))))

(assert (=> b!237960 (= res!198896 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237961 () Bool)

(declare-fun array_inv!5308 (array!12675) Bool)

(assert (=> b!237961 (= e!164400 (array_inv!5308 (buf!6042 thiss!1830)))))

(declare-fun b!237962 () Bool)

(declare-fun res!198895 () Bool)

(assert (=> b!237962 (=> (not res!198895) (not e!164402))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237962 (= res!198895 (validate_offset_bits!1 ((_ sign_extend 32) (size!5567 (buf!6042 thiss!1830))) ((_ sign_extend 32) (currentByte!11222 thiss!1830)) ((_ sign_extend 32) (currentBit!11217 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(assert (= (and start!50830 res!198894) b!237962))

(assert (= (and b!237962 res!198895) b!237960))

(assert (= (and b!237960 res!198896) b!237957))

(assert (= (and b!237957 res!198897) b!237958))

(assert (= (and b!237958 res!198893) b!237959))

(assert (= start!50830 b!237961))

(declare-fun m!360219 () Bool)

(assert (=> b!237960 m!360219))

(declare-fun m!360221 () Bool)

(assert (=> b!237962 m!360221))

(declare-fun m!360223 () Bool)

(assert (=> b!237959 m!360223))

(declare-fun m!360225 () Bool)

(assert (=> b!237957 m!360225))

(declare-fun m!360227 () Bool)

(assert (=> start!50830 m!360227))

(declare-fun m!360229 () Bool)

(assert (=> b!237961 m!360229))

(check-sat (not b!237957) (not b!237960) (not b!237959) (not b!237961) (not start!50830) (not b!237962))
(check-sat)
