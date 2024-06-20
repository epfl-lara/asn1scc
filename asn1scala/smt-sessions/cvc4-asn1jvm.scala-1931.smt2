; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50358 () Bool)

(assert start!50358)

(declare-fun b!236094 () Bool)

(declare-fun res!197321 () Bool)

(declare-fun e!163256 () Bool)

(assert (=> b!236094 (=> (not res!197321) (not e!163256))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236094 (= res!197321 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236095 () Bool)

(declare-fun lt!371559 () (_ BitVec 64))

(declare-fun lt!371558 () (_ BitVec 64))

(assert (=> b!236095 (= e!163256 (and (= lt!371558 (bvadd lt!371558 lt!371559)) (bvsgt #b00000000000000000000000000000000 nBits!581)))))

(declare-datatypes ((array!12500 0))(
  ( (array!12501 (arr!6477 (Array (_ BitVec 32) (_ BitVec 8))) (size!5490 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9944 0))(
  ( (BitStream!9945 (buf!5965 array!12500) (currentByte!11088 (_ BitVec 32)) (currentBit!11083 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9944)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236095 (= lt!371558 (bitIndex!0 (size!5490 (buf!5965 thiss!1830)) (currentByte!11088 thiss!1830) (currentBit!11083 thiss!1830)))))

(declare-fun b!236096 () Bool)

(declare-fun res!197324 () Bool)

(assert (=> b!236096 (=> (not res!197324) (not e!163256))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236096 (= res!197324 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236097 () Bool)

(declare-fun e!163258 () Bool)

(assert (=> b!236097 (= e!163258 e!163256)))

(declare-fun res!197323 () Bool)

(assert (=> b!236097 (=> (not res!197323) (not e!163256))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236097 (= res!197323 (validate_offset_bits!1 ((_ sign_extend 32) (size!5490 (buf!5965 thiss!1830))) ((_ sign_extend 32) (currentByte!11088 thiss!1830)) ((_ sign_extend 32) (currentBit!11083 thiss!1830)) lt!371559))))

(assert (=> b!236097 (= lt!371559 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!236098 () Bool)

(declare-fun res!197322 () Bool)

(assert (=> b!236098 (=> (not res!197322) (not e!163256))))

(assert (=> b!236098 (= res!197322 (= nBits!581 i!752))))

(declare-fun res!197325 () Bool)

(assert (=> start!50358 (=> (not res!197325) (not e!163258))))

(assert (=> start!50358 (= res!197325 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50358 e!163258))

(assert (=> start!50358 true))

(declare-fun e!163259 () Bool)

(declare-fun inv!12 (BitStream!9944) Bool)

(assert (=> start!50358 (and (inv!12 thiss!1830) e!163259)))

(declare-fun b!236099 () Bool)

(declare-fun array_inv!5231 (array!12500) Bool)

(assert (=> b!236099 (= e!163259 (array_inv!5231 (buf!5965 thiss!1830)))))

(assert (= (and start!50358 res!197325) b!236097))

(assert (= (and b!236097 res!197323) b!236096))

(assert (= (and b!236096 res!197324) b!236094))

(assert (= (and b!236094 res!197321) b!236098))

(assert (= (and b!236098 res!197322) b!236095))

(assert (= start!50358 b!236099))

(declare-fun m!358689 () Bool)

(assert (=> b!236095 m!358689))

(declare-fun m!358691 () Bool)

(assert (=> start!50358 m!358691))

(declare-fun m!358693 () Bool)

(assert (=> b!236094 m!358693))

(declare-fun m!358695 () Bool)

(assert (=> b!236097 m!358695))

(declare-fun m!358697 () Bool)

(assert (=> b!236096 m!358697))

(declare-fun m!358699 () Bool)

(assert (=> b!236099 m!358699))

(push 1)

(assert (not b!236097))

(assert (not b!236099))

(assert (not b!236096))

(assert (not b!236094))

(assert (not b!236095))

(assert (not start!50358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

