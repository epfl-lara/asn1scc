; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50404 () Bool)

(assert start!50404)

(declare-fun res!197443 () Bool)

(declare-fun e!163330 () Bool)

(assert (=> start!50404 (=> (not res!197443) (not e!163330))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50404 (= res!197443 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50404 e!163330))

(assert (=> start!50404 true))

(declare-datatypes ((array!12519 0))(
  ( (array!12520 (arr!6485 (Array (_ BitVec 32) (_ BitVec 8))) (size!5498 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9960 0))(
  ( (BitStream!9961 (buf!5973 array!12519) (currentByte!11102 (_ BitVec 32)) (currentBit!11097 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9960)

(declare-fun e!163331 () Bool)

(declare-fun inv!12 (BitStream!9960) Bool)

(assert (=> start!50404 (and (inv!12 thiss!1830) e!163331)))

(declare-fun b!236238 () Bool)

(declare-fun res!197445 () Bool)

(assert (=> b!236238 (=> (not res!197445) (not e!163330))))

(assert (=> b!236238 (= res!197445 (not (= nBits!581 i!752)))))

(declare-fun b!236239 () Bool)

(declare-fun res!197442 () Bool)

(assert (=> b!236239 (=> (not res!197442) (not e!163330))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236239 (= res!197442 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236240 () Bool)

(assert (=> b!236240 (= e!163330 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsgt (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-datatypes ((tuple2!19924 0))(
  ( (tuple2!19925 (_1!10866 Bool) (_2!10866 BitStream!9960)) )
))
(declare-fun lt!371574 () tuple2!19924)

(declare-fun readBit!0 (BitStream!9960) tuple2!19924)

(assert (=> b!236240 (= lt!371574 (readBit!0 thiss!1830))))

(declare-fun b!236241 () Bool)

(declare-fun res!197441 () Bool)

(assert (=> b!236241 (=> (not res!197441) (not e!163330))))

(assert (=> b!236241 (= res!197441 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236242 () Bool)

(declare-fun array_inv!5239 (array!12519) Bool)

(assert (=> b!236242 (= e!163331 (array_inv!5239 (buf!5973 thiss!1830)))))

(declare-fun b!236243 () Bool)

(declare-fun res!197444 () Bool)

(assert (=> b!236243 (=> (not res!197444) (not e!163330))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236243 (= res!197444 (validate_offset_bits!1 ((_ sign_extend 32) (size!5498 (buf!5973 thiss!1830))) ((_ sign_extend 32) (currentByte!11102 thiss!1830)) ((_ sign_extend 32) (currentBit!11097 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(assert (= (and start!50404 res!197443) b!236243))

(assert (= (and b!236243 res!197444) b!236239))

(assert (= (and b!236239 res!197442) b!236241))

(assert (= (and b!236241 res!197441) b!236238))

(assert (= (and b!236238 res!197445) b!236240))

(assert (= start!50404 b!236242))

(declare-fun m!358797 () Bool)

(assert (=> b!236241 m!358797))

(declare-fun m!358799 () Bool)

(assert (=> b!236243 m!358799))

(declare-fun m!358801 () Bool)

(assert (=> b!236240 m!358801))

(declare-fun m!358803 () Bool)

(assert (=> b!236239 m!358803))

(declare-fun m!358805 () Bool)

(assert (=> b!236242 m!358805))

(declare-fun m!358807 () Bool)

(assert (=> start!50404 m!358807))

(check-sat (not b!236243) (not b!236240) (not b!236239) (not b!236242) (not start!50404) (not b!236241))
(check-sat)
