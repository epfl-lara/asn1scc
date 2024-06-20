; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50676 () Bool)

(assert start!50676)

(declare-fun b!236951 () Bool)

(declare-fun e!163811 () Bool)

(declare-fun e!163809 () Bool)

(assert (=> b!236951 (= e!163811 e!163809)))

(declare-fun res!198060 () Bool)

(assert (=> b!236951 (=> (not res!198060) (not e!163809))))

(declare-datatypes ((array!12572 0))(
  ( (array!12573 (arr!6504 (Array (_ BitVec 32) (_ BitVec 8))) (size!5517 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9998 0))(
  ( (BitStream!9999 (buf!5992 array!12572) (currentByte!11163 (_ BitVec 32)) (currentBit!11158 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9998)

(declare-fun lt!372496 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236951 (= res!198060 (validate_offset_bits!1 ((_ sign_extend 32) (size!5517 (buf!5992 thiss!1830))) ((_ sign_extend 32) (currentByte!11163 thiss!1830)) ((_ sign_extend 32) (currentBit!11158 thiss!1830)) lt!372496))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236951 (= lt!372496 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!236952 () Bool)

(declare-fun e!163810 () Bool)

(declare-fun array_inv!5258 (array!12572) Bool)

(assert (=> b!236952 (= e!163810 (array_inv!5258 (buf!5992 thiss!1830)))))

(declare-fun b!236953 () Bool)

(declare-fun res!198055 () Bool)

(declare-fun e!163807 () Bool)

(assert (=> b!236953 (=> (not res!198055) (not e!163807))))

(declare-datatypes ((tuple2!20016 0))(
  ( (tuple2!20017 (_1!10912 (_ BitVec 64)) (_2!10912 BitStream!9998)) )
))
(declare-fun lt!372497 () tuple2!20016)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236953 (= res!198055 (= (bitIndex!0 (size!5517 (buf!5992 (_2!10912 lt!372497))) (currentByte!11163 (_2!10912 lt!372497)) (currentBit!11158 (_2!10912 lt!372497))) (bvadd (bitIndex!0 (size!5517 (buf!5992 thiss!1830)) (currentByte!11163 thiss!1830) (currentBit!11158 thiss!1830)) lt!372496)))))

(declare-fun b!236954 () Bool)

(declare-fun res!198057 () Bool)

(assert (=> b!236954 (=> (not res!198057) (not e!163809))))

(assert (=> b!236954 (= res!198057 (not (= nBits!581 i!752)))))

(declare-fun b!236955 () Bool)

(declare-fun acc!170 () (_ BitVec 64))

(assert (=> b!236955 (= e!163807 (and (= (bvlshr (_1!10912 lt!372497) lt!372496) (bvlshr acc!170 lt!372496)) (bvsgt #b00000000000000000000000000000000 nBits!581)))))

(declare-fun b!236950 () Bool)

(declare-fun res!198054 () Bool)

(assert (=> b!236950 (=> (not res!198054) (not e!163809))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236950 (= res!198054 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198058 () Bool)

(assert (=> start!50676 (=> (not res!198058) (not e!163811))))

(assert (=> start!50676 (= res!198058 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50676 e!163811))

(assert (=> start!50676 true))

(declare-fun inv!12 (BitStream!9998) Bool)

(assert (=> start!50676 (and (inv!12 thiss!1830) e!163810)))

(declare-fun b!236956 () Bool)

(declare-fun res!198056 () Bool)

(assert (=> b!236956 (=> (not res!198056) (not e!163809))))

(assert (=> b!236956 (= res!198056 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236957 () Bool)

(assert (=> b!236957 (= e!163809 e!163807)))

(declare-fun res!198059 () Bool)

(assert (=> b!236957 (=> (not res!198059) (not e!163807))))

(assert (=> b!236957 (= res!198059 (= (buf!5992 (_2!10912 lt!372497)) (buf!5992 thiss!1830)))))

(declare-datatypes ((tuple2!20018 0))(
  ( (tuple2!20019 (_1!10913 Bool) (_2!10913 BitStream!9998)) )
))
(declare-fun lt!372498 () tuple2!20018)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20016)

(assert (=> b!236957 (= lt!372497 (readNLeastSignificantBitsLoop!0 (_2!10913 lt!372498) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10913 lt!372498) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!9998) tuple2!20018)

(assert (=> b!236957 (= lt!372498 (readBit!0 thiss!1830))))

(assert (= (and start!50676 res!198058) b!236951))

(assert (= (and b!236951 res!198060) b!236950))

(assert (= (and b!236950 res!198054) b!236956))

(assert (= (and b!236956 res!198056) b!236954))

(assert (= (and b!236954 res!198057) b!236957))

(assert (= (and b!236957 res!198059) b!236953))

(assert (= (and b!236953 res!198055) b!236955))

(assert (= start!50676 b!236952))

(declare-fun m!359535 () Bool)

(assert (=> start!50676 m!359535))

(declare-fun m!359537 () Bool)

(assert (=> b!236950 m!359537))

(declare-fun m!359539 () Bool)

(assert (=> b!236957 m!359539))

(declare-fun m!359541 () Bool)

(assert (=> b!236957 m!359541))

(declare-fun m!359543 () Bool)

(assert (=> b!236956 m!359543))

(declare-fun m!359545 () Bool)

(assert (=> b!236952 m!359545))

(declare-fun m!359547 () Bool)

(assert (=> b!236953 m!359547))

(declare-fun m!359549 () Bool)

(assert (=> b!236953 m!359549))

(declare-fun m!359551 () Bool)

(assert (=> b!236951 m!359551))

(push 1)

(assert (not b!236956))

(assert (not b!236957))

(assert (not start!50676))

(assert (not b!236951))

(assert (not b!236952))

(assert (not b!236950))

(assert (not b!236953))

(check-sat)

(pop 1)

(push 1)

(check-sat)

