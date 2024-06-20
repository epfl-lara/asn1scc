; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50402 () Bool)

(assert start!50402)

(declare-fun res!197426 () Bool)

(declare-fun e!163321 () Bool)

(assert (=> start!50402 (=> (not res!197426) (not e!163321))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50402 (= res!197426 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50402 e!163321))

(assert (=> start!50402 true))

(declare-datatypes ((array!12517 0))(
  ( (array!12518 (arr!6484 (Array (_ BitVec 32) (_ BitVec 8))) (size!5497 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9958 0))(
  ( (BitStream!9959 (buf!5972 array!12517) (currentByte!11101 (_ BitVec 32)) (currentBit!11096 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9958)

(declare-fun e!163320 () Bool)

(declare-fun inv!12 (BitStream!9958) Bool)

(assert (=> start!50402 (and (inv!12 thiss!1830) e!163320)))

(declare-fun b!236220 () Bool)

(declare-fun res!197427 () Bool)

(assert (=> b!236220 (=> (not res!197427) (not e!163321))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236220 (= res!197427 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236221 () Bool)

(declare-fun array_inv!5238 (array!12517) Bool)

(assert (=> b!236221 (= e!163320 (array_inv!5238 (buf!5972 thiss!1830)))))

(declare-fun b!236222 () Bool)

(declare-fun res!197429 () Bool)

(assert (=> b!236222 (=> (not res!197429) (not e!163321))))

(assert (=> b!236222 (= res!197429 (not (= nBits!581 i!752)))))

(declare-fun b!236223 () Bool)

(declare-fun res!197430 () Bool)

(assert (=> b!236223 (=> (not res!197430) (not e!163321))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236223 (= res!197430 (validate_offset_bits!1 ((_ sign_extend 32) (size!5497 (buf!5972 thiss!1830))) ((_ sign_extend 32) (currentByte!11101 thiss!1830)) ((_ sign_extend 32) (currentBit!11096 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236224 () Bool)

(declare-fun res!197428 () Bool)

(assert (=> b!236224 (=> (not res!197428) (not e!163321))))

(assert (=> b!236224 (= res!197428 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236225 () Bool)

(assert (=> b!236225 (= e!163321 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsgt (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-datatypes ((tuple2!19922 0))(
  ( (tuple2!19923 (_1!10865 Bool) (_2!10865 BitStream!9958)) )
))
(declare-fun lt!371571 () tuple2!19922)

(declare-fun readBit!0 (BitStream!9958) tuple2!19922)

(assert (=> b!236225 (= lt!371571 (readBit!0 thiss!1830))))

(assert (= (and start!50402 res!197426) b!236223))

(assert (= (and b!236223 res!197430) b!236220))

(assert (= (and b!236220 res!197427) b!236224))

(assert (= (and b!236224 res!197428) b!236222))

(assert (= (and b!236222 res!197429) b!236225))

(assert (= start!50402 b!236221))

(declare-fun m!358785 () Bool)

(assert (=> b!236223 m!358785))

(declare-fun m!358787 () Bool)

(assert (=> start!50402 m!358787))

(declare-fun m!358789 () Bool)

(assert (=> b!236224 m!358789))

(declare-fun m!358791 () Bool)

(assert (=> b!236220 m!358791))

(declare-fun m!358793 () Bool)

(assert (=> b!236221 m!358793))

(declare-fun m!358795 () Bool)

(assert (=> b!236225 m!358795))

(push 1)

(assert (not start!50402))

(assert (not b!236223))

(assert (not b!236225))

(assert (not b!236224))

(assert (not b!236221))

(assert (not b!236220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

