; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50900 () Bool)

(assert start!50900)

(declare-fun b!238339 () Bool)

(declare-fun res!199221 () Bool)

(declare-fun e!164636 () Bool)

(assert (=> b!238339 (=> (not res!199221) (not e!164636))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238339 (= res!199221 (not (= nBits!581 i!752)))))

(declare-fun b!238340 () Bool)

(declare-fun res!199215 () Bool)

(declare-fun e!164635 () Bool)

(assert (=> b!238340 (=> (not res!199215) (not e!164635))))

(declare-datatypes ((array!12706 0))(
  ( (array!12707 (arr!6568 (Array (_ BitVec 32) (_ BitVec 8))) (size!5581 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10126 0))(
  ( (BitStream!10127 (buf!6056 array!12706) (currentByte!11242 (_ BitVec 32)) (currentBit!11237 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10126)

(declare-fun lt!373227 () (_ BitVec 64))

(declare-datatypes ((tuple2!20118 0))(
  ( (tuple2!20119 (_1!10963 (_ BitVec 64)) (_2!10963 BitStream!10126)) )
))
(declare-fun lt!373226 () tuple2!20118)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238340 (= res!199215 (= (bitIndex!0 (size!5581 (buf!6056 (_2!10963 lt!373226))) (currentByte!11242 (_2!10963 lt!373226)) (currentBit!11237 (_2!10963 lt!373226))) (bvadd (bitIndex!0 (size!5581 (buf!6056 thiss!1830)) (currentByte!11242 thiss!1830) (currentBit!11237 thiss!1830)) lt!373227)))))

(declare-fun res!199217 () Bool)

(declare-fun e!164632 () Bool)

(assert (=> start!50900 (=> (not res!199217) (not e!164632))))

(assert (=> start!50900 (= res!199217 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50900 e!164632))

(assert (=> start!50900 true))

(declare-fun e!164634 () Bool)

(declare-fun inv!12 (BitStream!10126) Bool)

(assert (=> start!50900 (and (inv!12 thiss!1830) e!164634)))

(declare-fun b!238341 () Bool)

(assert (=> b!238341 (= e!164636 e!164635)))

(declare-fun res!199216 () Bool)

(assert (=> b!238341 (=> (not res!199216) (not e!164635))))

(assert (=> b!238341 (= res!199216 (= (buf!6056 (_2!10963 lt!373226)) (buf!6056 thiss!1830)))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20120 0))(
  ( (tuple2!20121 (_1!10964 Bool) (_2!10964 BitStream!10126)) )
))
(declare-fun lt!373225 () tuple2!20120)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10126 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20118)

(assert (=> b!238341 (= lt!373226 (readNLeastSignificantBitsLoop!0 (_2!10964 lt!373225) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10964 lt!373225) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10126) tuple2!20120)

(assert (=> b!238341 (= lt!373225 (readBit!0 thiss!1830))))

(declare-fun b!238342 () Bool)

(declare-fun array_inv!5322 (array!12706) Bool)

(assert (=> b!238342 (= e!164634 (array_inv!5322 (buf!6056 thiss!1830)))))

(declare-fun b!238343 () Bool)

(assert (=> b!238343 (= e!164635 (or (bvslt lt!373227 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!373227 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun b!238344 () Bool)

(declare-fun res!199219 () Bool)

(assert (=> b!238344 (=> (not res!199219) (not e!164636))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238344 (= res!199219 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238345 () Bool)

(declare-fun res!199220 () Bool)

(assert (=> b!238345 (=> (not res!199220) (not e!164636))))

(assert (=> b!238345 (= res!199220 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238346 () Bool)

(assert (=> b!238346 (= e!164632 e!164636)))

(declare-fun res!199218 () Bool)

(assert (=> b!238346 (=> (not res!199218) (not e!164636))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238346 (= res!199218 (validate_offset_bits!1 ((_ sign_extend 32) (size!5581 (buf!6056 thiss!1830))) ((_ sign_extend 32) (currentByte!11242 thiss!1830)) ((_ sign_extend 32) (currentBit!11237 thiss!1830)) lt!373227))))

(assert (=> b!238346 (= lt!373227 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(assert (= (and start!50900 res!199217) b!238346))

(assert (= (and b!238346 res!199218) b!238344))

(assert (= (and b!238344 res!199219) b!238345))

(assert (= (and b!238345 res!199220) b!238339))

(assert (= (and b!238339 res!199221) b!238341))

(assert (= (and b!238341 res!199216) b!238340))

(assert (= (and b!238340 res!199215) b!238343))

(assert (= start!50900 b!238342))

(declare-fun m!360501 () Bool)

(assert (=> b!238345 m!360501))

(declare-fun m!360503 () Bool)

(assert (=> b!238341 m!360503))

(declare-fun m!360505 () Bool)

(assert (=> b!238341 m!360505))

(declare-fun m!360507 () Bool)

(assert (=> b!238340 m!360507))

(declare-fun m!360509 () Bool)

(assert (=> b!238340 m!360509))

(declare-fun m!360511 () Bool)

(assert (=> b!238346 m!360511))

(declare-fun m!360513 () Bool)

(assert (=> b!238344 m!360513))

(declare-fun m!360515 () Bool)

(assert (=> b!238342 m!360515))

(declare-fun m!360517 () Bool)

(assert (=> start!50900 m!360517))

(push 1)

(assert (not b!238345))

(assert (not b!238340))

(assert (not start!50900))

(assert (not b!238346))

(assert (not b!238341))

(assert (not b!238344))

(assert (not b!238342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

