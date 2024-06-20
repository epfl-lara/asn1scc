; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50354 () Bool)

(assert start!50354)

(declare-fun b!236058 () Bool)

(declare-fun res!197291 () Bool)

(declare-fun e!163232 () Bool)

(assert (=> b!236058 (=> (not res!197291) (not e!163232))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236058 (= res!197291 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236059 () Bool)

(declare-fun res!197292 () Bool)

(assert (=> b!236059 (=> (not res!197292) (not e!163232))))

(assert (=> b!236059 (= res!197292 (= nBits!581 i!752))))

(declare-fun b!236060 () Bool)

(declare-fun res!197294 () Bool)

(assert (=> b!236060 (=> (not res!197294) (not e!163232))))

(assert (=> b!236060 (= res!197294 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun lt!371546 () (_ BitVec 64))

(declare-fun b!236061 () Bool)

(declare-fun lt!371547 () (_ BitVec 64))

(assert (=> b!236061 (= e!163232 (and (= lt!371547 (bvadd lt!371547 lt!371546)) (bvsgt #b00000000000000000000000000000000 nBits!581)))))

(declare-datatypes ((array!12496 0))(
  ( (array!12497 (arr!6475 (Array (_ BitVec 32) (_ BitVec 8))) (size!5488 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9940 0))(
  ( (BitStream!9941 (buf!5963 array!12496) (currentByte!11086 (_ BitVec 32)) (currentBit!11081 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9940)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236061 (= lt!371547 (bitIndex!0 (size!5488 (buf!5963 thiss!1830)) (currentByte!11086 thiss!1830) (currentBit!11081 thiss!1830)))))

(declare-fun b!236062 () Bool)

(declare-fun e!163235 () Bool)

(assert (=> b!236062 (= e!163235 e!163232)))

(declare-fun res!197293 () Bool)

(assert (=> b!236062 (=> (not res!197293) (not e!163232))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236062 (= res!197293 (validate_offset_bits!1 ((_ sign_extend 32) (size!5488 (buf!5963 thiss!1830))) ((_ sign_extend 32) (currentByte!11086 thiss!1830)) ((_ sign_extend 32) (currentBit!11081 thiss!1830)) lt!371546))))

(assert (=> b!236062 (= lt!371546 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!236063 () Bool)

(declare-fun e!163234 () Bool)

(declare-fun array_inv!5229 (array!12496) Bool)

(assert (=> b!236063 (= e!163234 (array_inv!5229 (buf!5963 thiss!1830)))))

(declare-fun res!197295 () Bool)

(assert (=> start!50354 (=> (not res!197295) (not e!163235))))

(assert (=> start!50354 (= res!197295 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50354 e!163235))

(assert (=> start!50354 true))

(declare-fun inv!12 (BitStream!9940) Bool)

(assert (=> start!50354 (and (inv!12 thiss!1830) e!163234)))

(assert (= (and start!50354 res!197295) b!236062))

(assert (= (and b!236062 res!197293) b!236058))

(assert (= (and b!236058 res!197291) b!236060))

(assert (= (and b!236060 res!197294) b!236059))

(assert (= (and b!236059 res!197292) b!236061))

(assert (= start!50354 b!236063))

(declare-fun m!358665 () Bool)

(assert (=> start!50354 m!358665))

(declare-fun m!358667 () Bool)

(assert (=> b!236058 m!358667))

(declare-fun m!358669 () Bool)

(assert (=> b!236061 m!358669))

(declare-fun m!358671 () Bool)

(assert (=> b!236063 m!358671))

(declare-fun m!358673 () Bool)

(assert (=> b!236060 m!358673))

(declare-fun m!358675 () Bool)

(assert (=> b!236062 m!358675))

(push 1)

(assert (not b!236061))

(assert (not b!236058))

(assert (not start!50354))

(assert (not b!236063))

(assert (not b!236062))

(assert (not b!236060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

