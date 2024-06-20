; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50356 () Bool)

(assert start!50356)

(declare-fun b!236076 () Bool)

(declare-fun res!197309 () Bool)

(declare-fun e!163247 () Bool)

(assert (=> b!236076 (=> (not res!197309) (not e!163247))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236076 (= res!197309 (= nBits!581 i!752))))

(declare-fun res!197306 () Bool)

(declare-fun e!163246 () Bool)

(assert (=> start!50356 (=> (not res!197306) (not e!163246))))

(assert (=> start!50356 (= res!197306 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50356 e!163246))

(assert (=> start!50356 true))

(declare-datatypes ((array!12498 0))(
  ( (array!12499 (arr!6476 (Array (_ BitVec 32) (_ BitVec 8))) (size!5489 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9942 0))(
  ( (BitStream!9943 (buf!5964 array!12498) (currentByte!11087 (_ BitVec 32)) (currentBit!11082 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9942)

(declare-fun e!163245 () Bool)

(declare-fun inv!12 (BitStream!9942) Bool)

(assert (=> start!50356 (and (inv!12 thiss!1830) e!163245)))

(declare-fun lt!371553 () (_ BitVec 64))

(declare-fun b!236077 () Bool)

(declare-fun lt!371552 () (_ BitVec 64))

(assert (=> b!236077 (= e!163247 (and (= lt!371553 (bvadd lt!371553 lt!371552)) (bvsgt #b00000000000000000000000000000000 nBits!581)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236077 (= lt!371553 (bitIndex!0 (size!5489 (buf!5964 thiss!1830)) (currentByte!11087 thiss!1830) (currentBit!11082 thiss!1830)))))

(declare-fun b!236078 () Bool)

(declare-fun res!197307 () Bool)

(assert (=> b!236078 (=> (not res!197307) (not e!163247))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236078 (= res!197307 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236079 () Bool)

(assert (=> b!236079 (= e!163246 e!163247)))

(declare-fun res!197310 () Bool)

(assert (=> b!236079 (=> (not res!197310) (not e!163247))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236079 (= res!197310 (validate_offset_bits!1 ((_ sign_extend 32) (size!5489 (buf!5964 thiss!1830))) ((_ sign_extend 32) (currentByte!11087 thiss!1830)) ((_ sign_extend 32) (currentBit!11082 thiss!1830)) lt!371552))))

(assert (=> b!236079 (= lt!371552 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!236080 () Bool)

(declare-fun res!197308 () Bool)

(assert (=> b!236080 (=> (not res!197308) (not e!163247))))

(assert (=> b!236080 (= res!197308 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236081 () Bool)

(declare-fun array_inv!5230 (array!12498) Bool)

(assert (=> b!236081 (= e!163245 (array_inv!5230 (buf!5964 thiss!1830)))))

(assert (= (and start!50356 res!197306) b!236079))

(assert (= (and b!236079 res!197310) b!236078))

(assert (= (and b!236078 res!197307) b!236080))

(assert (= (and b!236080 res!197308) b!236076))

(assert (= (and b!236076 res!197309) b!236077))

(assert (= start!50356 b!236081))

(declare-fun m!358677 () Bool)

(assert (=> b!236077 m!358677))

(declare-fun m!358679 () Bool)

(assert (=> b!236080 m!358679))

(declare-fun m!358681 () Bool)

(assert (=> b!236081 m!358681))

(declare-fun m!358683 () Bool)

(assert (=> b!236078 m!358683))

(declare-fun m!358685 () Bool)

(assert (=> start!50356 m!358685))

(declare-fun m!358687 () Bool)

(assert (=> b!236079 m!358687))

(check-sat (not b!236080) (not start!50356) (not b!236079) (not b!236081) (not b!236078) (not b!236077))
(check-sat)
