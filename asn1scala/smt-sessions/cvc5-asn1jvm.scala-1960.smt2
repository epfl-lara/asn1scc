; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50840 () Bool)

(assert start!50840)

(declare-fun b!238049 () Bool)

(declare-fun res!198973 () Bool)

(declare-fun e!164449 () Bool)

(assert (=> b!238049 (=> (not res!198973) (not e!164449))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238049 (= res!198973 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238050 () Bool)

(declare-fun e!164447 () Bool)

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238050 (= e!164447 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun lt!372944 () (_ BitVec 64))

(declare-datatypes ((array!12685 0))(
  ( (array!12686 (arr!6559 (Array (_ BitVec 32) (_ BitVec 8))) (size!5572 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10108 0))(
  ( (BitStream!10109 (buf!6047 array!12685) (currentByte!11227 (_ BitVec 32)) (currentBit!11222 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10108)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238050 (= lt!372944 (bitIndex!0 (size!5572 (buf!6047 thiss!1830)) (currentByte!11227 thiss!1830) (currentBit!11222 thiss!1830)))))

(declare-fun b!238051 () Bool)

(declare-fun res!198971 () Bool)

(assert (=> b!238051 (=> (not res!198971) (not e!164449))))

(assert (=> b!238051 (= res!198971 (not (= nBits!581 i!752)))))

(declare-fun res!198975 () Bool)

(assert (=> start!50840 (=> (not res!198975) (not e!164449))))

(assert (=> start!50840 (= res!198975 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50840 e!164449))

(assert (=> start!50840 true))

(declare-fun e!164448 () Bool)

(declare-fun inv!12 (BitStream!10108) Bool)

(assert (=> start!50840 (and (inv!12 thiss!1830) e!164448)))

(declare-fun b!238052 () Bool)

(declare-fun res!198974 () Bool)

(assert (=> b!238052 (=> (not res!198974) (not e!164449))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238052 (= res!198974 (validate_offset_bits!1 ((_ sign_extend 32) (size!5572 (buf!6047 thiss!1830))) ((_ sign_extend 32) (currentByte!11227 thiss!1830)) ((_ sign_extend 32) (currentBit!11222 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!238053 () Bool)

(assert (=> b!238053 (= e!164449 e!164447)))

(declare-fun res!198970 () Bool)

(assert (=> b!238053 (=> (not res!198970) (not e!164447))))

(declare-datatypes ((tuple2!20070 0))(
  ( (tuple2!20071 (_1!10939 Bool) (_2!10939 BitStream!10108)) )
))
(declare-fun lt!372945 () tuple2!20070)

(declare-datatypes ((tuple2!20072 0))(
  ( (tuple2!20073 (_1!10940 (_ BitVec 64)) (_2!10940 BitStream!10108)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20072)

(assert (=> b!238053 (= res!198970 (= (buf!6047 (_2!10940 (readNLeastSignificantBitsLoop!0 (_2!10939 lt!372945) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10939 lt!372945) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!6047 thiss!1830)))))

(declare-fun readBit!0 (BitStream!10108) tuple2!20070)

(assert (=> b!238053 (= lt!372945 (readBit!0 thiss!1830))))

(declare-fun b!238054 () Bool)

(declare-fun res!198972 () Bool)

(assert (=> b!238054 (=> (not res!198972) (not e!164449))))

(assert (=> b!238054 (= res!198972 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238055 () Bool)

(declare-fun array_inv!5313 (array!12685) Bool)

(assert (=> b!238055 (= e!164448 (array_inv!5313 (buf!6047 thiss!1830)))))

(assert (= (and start!50840 res!198975) b!238052))

(assert (= (and b!238052 res!198974) b!238054))

(assert (= (and b!238054 res!198972) b!238049))

(assert (= (and b!238049 res!198973) b!238051))

(assert (= (and b!238051 res!198971) b!238053))

(assert (= (and b!238053 res!198970) b!238050))

(assert (= start!50840 b!238055))

(declare-fun m!360279 () Bool)

(assert (=> b!238050 m!360279))

(declare-fun m!360281 () Bool)

(assert (=> start!50840 m!360281))

(declare-fun m!360283 () Bool)

(assert (=> b!238055 m!360283))

(declare-fun m!360285 () Bool)

(assert (=> b!238054 m!360285))

(declare-fun m!360287 () Bool)

(assert (=> b!238052 m!360287))

(declare-fun m!360289 () Bool)

(assert (=> b!238053 m!360289))

(declare-fun m!360291 () Bool)

(assert (=> b!238053 m!360291))

(declare-fun m!360293 () Bool)

(assert (=> b!238049 m!360293))

(push 1)

(assert (not start!50840))

(assert (not b!238052))

(assert (not b!238050))

(assert (not b!238053))

(assert (not b!238054))

(assert (not b!238049))

(assert (not b!238055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

