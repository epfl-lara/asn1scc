; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50406 () Bool)

(assert start!50406)

(declare-fun b!236256 () Bool)

(declare-fun e!163339 () Bool)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> b!236256 (= e!163339 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsgt (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-datatypes ((array!12521 0))(
  ( (array!12522 (arr!6486 (Array (_ BitVec 32) (_ BitVec 8))) (size!5499 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9962 0))(
  ( (BitStream!9963 (buf!5974 array!12521) (currentByte!11103 (_ BitVec 32)) (currentBit!11098 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19926 0))(
  ( (tuple2!19927 (_1!10867 Bool) (_2!10867 BitStream!9962)) )
))
(declare-fun lt!371577 () tuple2!19926)

(declare-fun thiss!1830 () BitStream!9962)

(declare-fun readBit!0 (BitStream!9962) tuple2!19926)

(assert (=> b!236256 (= lt!371577 (readBit!0 thiss!1830))))

(declare-fun b!236257 () Bool)

(declare-fun res!197460 () Bool)

(assert (=> b!236257 (=> (not res!197460) (not e!163339))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236257 (= res!197460 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236259 () Bool)

(declare-fun res!197456 () Bool)

(assert (=> b!236259 (=> (not res!197456) (not e!163339))))

(assert (=> b!236259 (= res!197456 (not (= nBits!581 i!752)))))

(declare-fun b!236260 () Bool)

(declare-fun e!163338 () Bool)

(declare-fun array_inv!5240 (array!12521) Bool)

(assert (=> b!236260 (= e!163338 (array_inv!5240 (buf!5974 thiss!1830)))))

(declare-fun b!236261 () Bool)

(declare-fun res!197457 () Bool)

(assert (=> b!236261 (=> (not res!197457) (not e!163339))))

(assert (=> b!236261 (= res!197457 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236258 () Bool)

(declare-fun res!197459 () Bool)

(assert (=> b!236258 (=> (not res!197459) (not e!163339))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236258 (= res!197459 (validate_offset_bits!1 ((_ sign_extend 32) (size!5499 (buf!5974 thiss!1830))) ((_ sign_extend 32) (currentByte!11103 thiss!1830)) ((_ sign_extend 32) (currentBit!11098 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun res!197458 () Bool)

(assert (=> start!50406 (=> (not res!197458) (not e!163339))))

(assert (=> start!50406 (= res!197458 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50406 e!163339))

(assert (=> start!50406 true))

(declare-fun inv!12 (BitStream!9962) Bool)

(assert (=> start!50406 (and (inv!12 thiss!1830) e!163338)))

(assert (= (and start!50406 res!197458) b!236258))

(assert (= (and b!236258 res!197459) b!236257))

(assert (= (and b!236257 res!197460) b!236261))

(assert (= (and b!236261 res!197457) b!236259))

(assert (= (and b!236259 res!197456) b!236256))

(assert (= start!50406 b!236260))

(declare-fun m!358809 () Bool)

(assert (=> b!236256 m!358809))

(declare-fun m!358811 () Bool)

(assert (=> b!236258 m!358811))

(declare-fun m!358813 () Bool)

(assert (=> start!50406 m!358813))

(declare-fun m!358815 () Bool)

(assert (=> b!236257 m!358815))

(declare-fun m!358817 () Bool)

(assert (=> b!236261 m!358817))

(declare-fun m!358819 () Bool)

(assert (=> b!236260 m!358819))

(push 1)

(assert (not b!236261))

(assert (not b!236258))

(assert (not b!236260))

(assert (not start!50406))

(assert (not b!236257))

(assert (not b!236256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

