; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50362 () Bool)

(assert start!50362)

(declare-fun b!236130 () Bool)

(declare-fun res!197351 () Bool)

(declare-fun e!163276 () Bool)

(assert (=> b!236130 (=> (not res!197351) (not e!163276))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236130 (= res!197351 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236131 () Bool)

(assert (=> b!236131 (= e!163276 false)))

(declare-fun lt!371565 () (_ BitVec 64))

(declare-datatypes ((array!12504 0))(
  ( (array!12505 (arr!6479 (Array (_ BitVec 32) (_ BitVec 8))) (size!5492 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9948 0))(
  ( (BitStream!9949 (buf!5967 array!12504) (currentByte!11090 (_ BitVec 32)) (currentBit!11085 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9948)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236131 (= lt!371565 (bitIndex!0 (size!5492 (buf!5967 thiss!1830)) (currentByte!11090 thiss!1830) (currentBit!11085 thiss!1830)))))

(declare-fun res!197353 () Bool)

(assert (=> start!50362 (=> (not res!197353) (not e!163276))))

(assert (=> start!50362 (= res!197353 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50362 e!163276))

(assert (=> start!50362 true))

(declare-fun e!163277 () Bool)

(declare-fun inv!12 (BitStream!9948) Bool)

(assert (=> start!50362 (and (inv!12 thiss!1830) e!163277)))

(declare-fun b!236132 () Bool)

(declare-fun res!197355 () Bool)

(assert (=> b!236132 (=> (not res!197355) (not e!163276))))

(assert (=> b!236132 (= res!197355 (= nBits!581 i!752))))

(declare-fun b!236133 () Bool)

(declare-fun array_inv!5233 (array!12504) Bool)

(assert (=> b!236133 (= e!163277 (array_inv!5233 (buf!5967 thiss!1830)))))

(declare-fun b!236134 () Bool)

(declare-fun res!197354 () Bool)

(assert (=> b!236134 (=> (not res!197354) (not e!163276))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236134 (= res!197354 (validate_offset_bits!1 ((_ sign_extend 32) (size!5492 (buf!5967 thiss!1830))) ((_ sign_extend 32) (currentByte!11090 thiss!1830)) ((_ sign_extend 32) (currentBit!11085 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236135 () Bool)

(declare-fun res!197352 () Bool)

(assert (=> b!236135 (=> (not res!197352) (not e!163276))))

(assert (=> b!236135 (= res!197352 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50362 res!197353) b!236134))

(assert (= (and b!236134 res!197354) b!236130))

(assert (= (and b!236130 res!197351) b!236135))

(assert (= (and b!236135 res!197352) b!236132))

(assert (= (and b!236132 res!197355) b!236131))

(assert (= start!50362 b!236133))

(declare-fun m!358713 () Bool)

(assert (=> b!236134 m!358713))

(declare-fun m!358715 () Bool)

(assert (=> b!236130 m!358715))

(declare-fun m!358717 () Bool)

(assert (=> b!236131 m!358717))

(declare-fun m!358719 () Bool)

(assert (=> b!236133 m!358719))

(declare-fun m!358721 () Bool)

(assert (=> b!236135 m!358721))

(declare-fun m!358723 () Bool)

(assert (=> start!50362 m!358723))

(check-sat (not start!50362) (not b!236134) (not b!236130) (not b!236133) (not b!236131) (not b!236135))
