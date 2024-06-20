; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50838 () Bool)

(assert start!50838)

(declare-fun b!238029 () Bool)

(declare-fun res!198954 () Bool)

(declare-fun e!164438 () Bool)

(assert (=> b!238029 (=> (not res!198954) (not e!164438))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238029 (= res!198954 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238030 () Bool)

(declare-fun res!198956 () Bool)

(assert (=> b!238030 (=> (not res!198956) (not e!164438))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238030 (= res!198956 (not (= nBits!581 i!752)))))

(declare-fun b!238031 () Bool)

(declare-fun e!164437 () Bool)

(declare-datatypes ((array!12683 0))(
  ( (array!12684 (arr!6558 (Array (_ BitVec 32) (_ BitVec 8))) (size!5571 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10106 0))(
  ( (BitStream!10107 (buf!6046 array!12683) (currentByte!11226 (_ BitVec 32)) (currentBit!11221 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10106)

(declare-fun array_inv!5312 (array!12683) Bool)

(assert (=> b!238031 (= e!164437 (array_inv!5312 (buf!6046 thiss!1830)))))

(declare-fun res!198955 () Bool)

(assert (=> start!50838 (=> (not res!198955) (not e!164438))))

(assert (=> start!50838 (= res!198955 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50838 e!164438))

(assert (=> start!50838 true))

(declare-fun inv!12 (BitStream!10106) Bool)

(assert (=> start!50838 (and (inv!12 thiss!1830) e!164437)))

(declare-fun b!238032 () Bool)

(declare-fun res!198953 () Bool)

(assert (=> b!238032 (=> (not res!198953) (not e!164438))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238032 (= res!198953 (validate_offset_bits!1 ((_ sign_extend 32) (size!5571 (buf!6046 thiss!1830))) ((_ sign_extend 32) (currentByte!11226 thiss!1830)) ((_ sign_extend 32) (currentBit!11221 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!238033 () Bool)

(declare-fun res!198957 () Bool)

(assert (=> b!238033 (=> (not res!198957) (not e!164438))))

(assert (=> b!238033 (= res!198957 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238034 () Bool)

(assert (=> b!238034 (= e!164438 (bvsge (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) (bvsub nBits!581 i!752)))))

(declare-datatypes ((tuple2!20068 0))(
  ( (tuple2!20069 (_1!10938 Bool) (_2!10938 BitStream!10106)) )
))
(declare-fun lt!372939 () tuple2!20068)

(declare-fun readBit!0 (BitStream!10106) tuple2!20068)

(assert (=> b!238034 (= lt!372939 (readBit!0 thiss!1830))))

(assert (= (and start!50838 res!198955) b!238032))

(assert (= (and b!238032 res!198953) b!238033))

(assert (= (and b!238033 res!198957) b!238029))

(assert (= (and b!238029 res!198954) b!238030))

(assert (= (and b!238030 res!198956) b!238034))

(assert (= start!50838 b!238031))

(declare-fun m!360267 () Bool)

(assert (=> b!238031 m!360267))

(declare-fun m!360269 () Bool)

(assert (=> b!238033 m!360269))

(declare-fun m!360271 () Bool)

(assert (=> b!238034 m!360271))

(declare-fun m!360273 () Bool)

(assert (=> b!238029 m!360273))

(declare-fun m!360275 () Bool)

(assert (=> start!50838 m!360275))

(declare-fun m!360277 () Bool)

(assert (=> b!238032 m!360277))

(push 1)

(assert (not b!238032))

(assert (not start!50838))

(assert (not b!238033))

(assert (not b!238034))

(assert (not b!238029))

(assert (not b!238031))

(check-sat)

(pop 1)

(push 1)

(check-sat)

